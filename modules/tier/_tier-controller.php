<?php
//-- router
$app->get('/tier', 'getview')->name('tier-view');
$app->post('/tier', 'postview')->name('tier-view');

$app->get('/tier/add', 'getadd')->name('tier-insert');
$app->post('/tier/add', 'postadd')->name('tier-insert');

$app->get('/tier/edit/:id', 'getedit')->name('tier-update');
$app->post('/tier/edit/:id', 'postedit')->name('tier-update');

$app->post('/tier/data', 'fetchdata')->name('tier-view-query');
$app->post('/tier/validate', 'validate')->name('novalidate');
$app->post('/tier/query-insert', 'insertdata')->name('tier-insert-query');
$app->post('/tier/query-update', 'updatedata')->name('tier-update-query');
$app->post('/tier/query-delete', 'deletedata')->name('tier-delete-query');
$app->post('/tier/query-delete-selected-items', 'deleteSelectedItems')->name('tier-delete-query');


//-- controller
function postedit($id){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();

	$data = izy::load('tb_tier', $id);
	
	
	$smarty->assign('data', $data);
	$smarty->display(basepath.'/modules/tier/edit-tier.tpl');
}

function getedit($id){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();

	$data = izy::load('tb_tier', $id);
	
	
	$smarty->assign('data', $data);
	$smarty->assign('content', basepath.'/modules/tier/edit-tier.tpl');
	$smarty->display(basepath."/modules/main.tpl");
}

function deletedata(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$dataid = $request->params('id');
	
	$result = "";
	izy::begin();
	try {
		izy::exec('delete from tb_tier where id=?', array($dataid));	
		
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
			izy::exec('delete from tb_tier where id=?', array($value));
		}
		
		izy::commit();
		$result = 'berhasil';
	} catch(Exception $e) {
		izy::rollback();
		$result = $e->getMessage();
	}
	echo $result;
}
function insertdata(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$obj = izy::dispense('tb_tier');
	$obj->min = $request->params('min');
	$obj->max = $request->params('max');
	$obj->prob = $request->params('prob');
	$obj->disc_rate = $request->params('disc_rate');

	$result = "";
	izy::begin();
	try {
		$data_id = izy::store($obj);

		izy::commit();
		$result = 'berhasil';
	} catch(Exception $e) {
		izy::rollback();
		$result = $e->getMessage();
	}
	echo $result;
}

function updatedata(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$obj = izy::load('tb_tier', $request->params('id'));
	$obj->min = $request->params('min');
	$obj->max = $request->params('max');
	$obj->prob = $request->params('prob');
	$obj->disc_rate = $request->params('disc_rate');

	$result = "";
	izy::begin();
	try {
		$data_id = izy::store($obj);

		izy::commit();
		$result = 'berhasil';
	} catch(Exception $e) {
		izy::rollback();
		$result = $e->getMessage();
	}
	echo $result;
}

function validate(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$id = $request->params('id');


	$arrayToJs = array();
	$i = 0;
	
	// $row = izy::findOne('tb_tier', 'email=?', array($request->params('username')));
	// if($row->id >0 && $row->id != $id){
	// 	$arrayToJs[$i][0] = 'username';
	// 	$arrayToJs[$i][1] = false;
	// 	$arrayToJs[$i][2] = "This name is already taken.!";
	// }else{
	// 	$arrayToJs[$i][0] = 'username';
	// 	$arrayToJs[$i][1] = true;
	// }
	
	echo json_encode($arrayToJs);	
};

function postadd(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();
	$smarty->display(basepath.'/modules/tier/add-tier.tpl');
}

function getadd(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();

	$smarty->assign('content', basepath.'/modules/tier/add-tier.tpl');
	$smarty->display(basepath."/modules/main.tpl");
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
	$sql = "SELECT A.*
	FROM tb_tier A 
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

	
	$smarty->display(basepath.'/modules/tier/view-tier.tpl');
}

function getview(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();

	$smarty->assign('content', basepath.'/modules/tier/view-tier.tpl');
	$smarty->display(basepath."/modules/main.tpl");
}


?>