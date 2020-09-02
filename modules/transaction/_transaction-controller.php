<?php
//-- router
$app->get('/transaction', 'getview')->name('transaction-view');
$app->post('/transaction', 'postview')->name('transaction-view');

$app->post('/transaction/data', 'fetchdata')->name('transaction-view-query');

$app->post('/transaction/query-delete', 'deletedata')->name('transaction-delete-query');
$app->post('/transaction/query-delete-selected-items', 'deleteSelectedItems')->name('transaction-delete-query');


//request get maupun post untuk transaksi
$app->map('/transaction/receive','receive')->via('POST','GET')->name('novalidate');


//-- controller

function receive(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$response = [];
	try {
		$response['transaction_id'] = $request->params('transaction_id');
		$response['customer_id'] = $request->params('customer_id');
		$response['amount'] = $request->params('amount');
		$response['datetime'] = $request->params('datetime');
		
		$customer = izy::findOne('tb_customer', 'id=?', array($response['customer_id']));
		if($customer == null  ){
			$app->halt(500, 'Customer not registered.');
		}

		$response = probCheck($response['amount'], $response['transaction_id'],$response['datetime'], $response, $app);

	} catch (\Throwable $th) {
		//throw $th;
	}

	echo json_encode($response,JSON_PRETTY_PRINT);

}

function probCheck($amount, $id, $datetime, $response, $app){

	$return = [];
	//select catagories of tier base on amount
	$tier = izy::getAll('SELECT * FROM tb_tier WHERE :min >= min and :max <= max ORDER BY disc_rate desc ',
		[':min' => $amount, ':max' => $amount ]
	);

	$tempTier = null;
	foreach ($tier as $perTier) {
		# code...
		$trx = izy::getAll( 'SELECT * FROM tb_transaction WHERE ( DATE(:date) or 1=1) AND defunct_ind = 0',
			[':date' => $datetime ]
		);

		$tierNow = 0;
		$tierOther = 0;
		$countTrx = count($trx);
		foreach ($trx as $val) {
			if ($val['tier_id'] == $perTier['id']) {
				$tierNow++;
			}
		}

		$realProbData = ($tierNow==0) ? 0 : $tierNow/$countTrx*100; 



		if ($realProbData <= $perTier['prob']) {
			if ($tempTier!=null) {
				if ($tempTier['disc_rate']<$perTier['disc_rate']) {
					$tempTier = $perTier;
				}
			}else{
				$tempTier= $perTier;
			}
		}
	}

	if($tempTier!=null){
		$response['discount_bool'] = true;
		$response['tier_id'] = $tempTier['id'];
		$response['discount_rate'] = $tempTier['disc_rate'];
		$response['discount_amount'] = $tempTier['disc_rate']*$response['amount']/100;
		$response['payment_amount'] = $response['amount']-$response['discount_amount'];
		$response['discount_probability'] = $tempTier['prob'];
	}else{
		$response['discount_bool'] = false;
	}

	//lakukan insert data
	insertTrxAndLog($response, $app);
	
	// balikan response
	return $response;

}

function insertTrxAndLog($response, $app){

	$obj = izy::dispense('tb_transaction');
	$obj->transaction_id = $response['transaction_id'];
	$obj->customer_id = $response['customer_id'];
	$obj->amount = $response['amount'];
	$obj->datetime = $response['datetime'];
	$obj->is_disc = $response['discount_bool'];
	$obj->defunct_ind = 0;

	if ($response['discount_bool']) {
		$obj->tier_id = $response['tier_id'];
		$obj->disc_rate = $response['discount_rate'];
		$obj->disc_amount = $response['discount_amount'];
		$obj->pay_amount = $response['payment_amount'];
		$obj->disc_prob = $response['discount_probability'];
	}

	//log
	$log = izy::dispense('tb_log');
	$log->remote_addr = $_SERVER['REMOTE_ADDR'];
	$log->server_info = json_encode($_SERVER,JSON_PRETTY_PRINT);
	$log->data = json_encode($response,JSON_PRETTY_PRINT);
	$log->request_time = 0;


	$result = "";
	izy::begin();
	try {
		$data_trx = izy::store($obj);
		$data_log = izy::store($log);

		izy::commit();
		$result = 'berhasil';
	} catch(Exception $e) {
		izy::rollback();
		$result = $e->getMessage();
	}

}

function deletedata(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$dataid = $request->params('id');
	
	$result = "";
	izy::begin();
	try {
		izy::exec('delete from tb_transaction where id=?', array($dataid));	
		
		izy::commit();
		$result = 'berhasil';
	} catch(Exception $e) {
		izy::rollback();
		$result = $e->getMessage();
	}
	echo $result;
}



function deleteSelectedItems(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();
	izy::begin();
	try {
		$dataid = $request->params('dataid');
		foreach ($dataid as $key => $value) {
			izy::exec('delete from tb_transaction where id=?', array($value));
		}
		
		izy::commit();
		$result = 'berhasil';
	} catch(Exception $e) {
		izy::rollback();
		$result = $e->getMessage();
	}
	echo $result;
}

function fetchdata(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$barisdiinginkan = $request->params('jumlahbaris');
	$filterdata = $request->params('pilihfilter');
	$halaman = $request->params('halaman');
	$cari = $request->params('cari');

	$catid = $request->params('category');
	$filter_kategory = "";
	if($catid != ''){
		$filter_kategory = " AND grupuser = '$catid' ";
	}

	$limitmulai = ($halaman == 1) ? 0 : ($halaman * $barisdiinginkan) - $barisdiinginkan;
	$limit_query = "LIMIT $limitmulai," . $barisdiinginkan;
	$filter_query = ($filterdata != "") ? " AND $filterdata  LIKE  '%$cari%' " : "";

	$db = mysqliConnection();
	$sql = "SELECT A.*, C.nama as customer_name
	FROM tb_transaction A
	inner join tb_customer C on A.customer_id = C.id 
	WHERE A.id IS NOT NULL $filter_query $filter_kategory
	ORDER BY A.id DESC ";
	$rs = $db->query($sql) or die($db->error);

	$jumlahdata = $rs->num_rows;
	$jumlahhalaman = ceil($jumlahdata / $barisdiinginkan);

	$databody = izy::getAll($sql.$limit_query);
	$datasetting["jumlahdata"] = $jumlahdata;
	$datasetting["jumlahhalaman"] = $jumlahhalaman;

	$result = array();
	$result['datahead'] = array();
	$result['databody'] = $databody;
	$result['datasetting'] = $datasetting;
	echo json_encode($result);
}

function postview(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();
	$smarty->display(basepath.'/modules/transaction/view-transaction.tpl');
}

function getview(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();

	$smarty->assign('content', basepath.'/modules/transaction/view-transaction.tpl');
	$smarty->display(basepath."/modules/main.tpl");
}


?>