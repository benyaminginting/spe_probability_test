<?php
//-- router
$app->get('/menu', 'getview')->name('menu-view');
$app->post('/menu', 'postview')->name('menu-view');

$app->get('/menu/add', 'getadd')->name('menu-insert');
$app->post('/menu/add', 'postadd')->name('menu-insert');

$app->get('/menu/edit/:id', 'getedit')->name('menu-update');
$app->post('/menu/edit/:id', 'postedit')->name('menu-update');

$app->post('/menu/data', 'fetchdata')->name('menu-view-query');
$app->post('/menu/validate', 'validate')->name('novalidate');
$app->post('/menu/query-insert', 'insertdata')->name('menu-insert-query');
$app->post('/menu/query-update', 'updatedata')->name('menu-update-query');
$app->post('/menu/query-delete', 'deletedata')->name('menu-delete-query');
$app->post('/menu/query-delete-selected-items', 'deleteSelectedItems')->name('menu-delete-query');

//-- controller
function deleteSelectedItems(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();
	izy::begin();
	try {
		$dataid = $request->params('dataid');
		foreach ($dataid as $key => $value) {
			izy::exec('delete from tb_menu_top where id=?', array($value));
		}
		
		izy::commit();
		$result = 'berhasil';
	} catch(Exception $e) {
		izy::rollback();
		$result = $e->getMessage();
	}
	echo $result;
}
function postedit($id){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();

	$data = izy::load('tb_menu_top', $id);
	
	$smarty->assign('dataparentmenu', fetchParentmenu());
	$smarty->assign('data', $data);
	$smarty->display(basepath.'/modules/menu/edit-menu.tpl');
}

function getedit($id){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();

	$data = izy::load('tb_menu_top', $id);
	
	$smarty->assign('dataparentmenu', fetchParentmenu());
	$smarty->assign('data', $data);
	// d($data['urut']);
	$smarty->assign('content', basepath.'/modules/menu/edit-menu.tpl');
	$smarty->display(basepath."/modules/main.tpl");
}

function deletedata(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$dataid = $request->params('id');
	
	$result = "";
	izy::begin();
	try {
		izy::exec('delete from tb_menu_top where id=?', array($dataid));	
		
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

	$obj = izy::dispense('tb_menu_top');
	$obj->parent_id = $request->params('parentid');
	$obj->name = $request->params('name');
	$obj->url = $request->params('url');
	$obj->urut = $request->params('urutan');
	$obj->status = $request->params('status');

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

	$obj = izy::load('tb_menu_top', $request->params('id'));
	$obj->parent_id = $request->params('parentid');
	$obj->name = $request->params('name');
	$obj->url = $request->params('url');
	$obj->urut = $request->params('urutan');
	$obj->status = $request->params('status');

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
	
	$row = izy::findOne('tb_menu_top', 'urut=?', array($request->params('urutan')));
	if($row->id >0 && $row->id != $id){
		$arrayToJs[$i][0] = 'urutan';
		$arrayToJs[$i][1] = false;
		$arrayToJs[$i][2] = "urutan ".$request->params('urutan')." sudah ada sebelumnya .!";
	}else{
		$arrayToJs[$i][0] = 'urutan';
		$arrayToJs[$i][1] = true;
	}
	
	echo json_encode($arrayToJs);	
};

function postadd(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();
	
	$smarty->assign('dataparentmenu', fetchParentmenu());
	$smarty->display(basepath.'/modules/menu/add-menu.tpl');
}

function getadd(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();

	$smarty->assign('dataparentmenu', fetchParentmenu());
	$smarty->assign('content', basepath.'/modules/menu/add-menu.tpl');
	$smarty->display(basepath."/modules/main.tpl");
}

function fetchdata(){
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$barisdiinginkan = $request->params('jumlahbaris');
	$filterdata = $request->params('pilihfilter');
	$halaman = $request->params('halaman');
	$cari = $request->params('cari');

	$catid = $request->params('parent');
	$filter_kategory = "";
	if($catid != ''){
		$filter_kategory = " AND A.parent_id = '$catid' ";
	}

	$limitmulai = ($halaman == 1) ? 0 : ($halaman * $barisdiinginkan) - $barisdiinginkan;
	$limit_query = "LIMIT $limitmulai," . $barisdiinginkan;
	$filter_query = ($filterdata != "") ? " AND $filterdata  LIKE  '%$cari%' " : "";

	$db = mysqliConnection();
	$sql = "SELECT B.name as parent, A.*
	FROM tb_menu_top A LEFT JOIN tb_menu_top B ON B.id = A.parent_id
	WHERE A.id IS NOT NULL $filter_query $filter_kategory
	ORDER BY A.urut ASC ";
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


	$selectedgrup = $_REQUEST['parent'];
	$smarty->assign('selectedparent', $selectedgrup);

	$smarty->assign('dataparentmenu', fetchParentmenu());
	$smarty->display(basepath.'/modules/menu/view-menu.tpl');
}

function getview(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();

	$selectedgrup = $_REQUEST['grup'];
	$smarty->assign('selectedgrup', $selectedgrup);
	// die("hahahha");

	$smarty->assign('dataparentmenu', fetchParentmenu());

	$smarty->assign('content', basepath.'/modules/menu/view-menu.tpl');
	$smarty->display(basepath."/modules/main.tpl");
}

function fetchParentmenu(){
	return izy::getAll("SELECT A.id,A.name
		FROM tb_menu_top A
		ORDER BY A.urut ASC");
}
?>