<?php
function initApp(){
	$app = \Slim\Slim::getInstance();
	$rooturi = $app->request->getRootUri();

	//-- batasi penggunaan index.php
	if (in_array('index.php', explode('/', $_SERVER['REQUEST_URI']))) {
		$app->redirect(baseurl.'/');
	}

	$headers = $app->request->headers;
	if ($headers['Php-Auth-User']!=null && $headers['Php-Auth-User']!="") {
		loginHeader($headers['Php-Auth-User'], $headers['Php-Auth-Pw']);
	}

	//-- cek halaman root jika sudah/belum login
	$pathinfo = $app->request()->getResourceUri();
	if ($pathinfo == '/') {
		if (!isset($_SESSION['login_admin'])) {
			$app->redirect(baseurl . '/login');
		} else {
			$app->redirect(baseurl . '/dashboard');
		}
	}

	//-- cek hanya modul login yang bisa diakses jika belum login
	if (!in_array('login', explode('/', $pathinfo))) {
		if (!isset($_SESSION['login_admin'])) {
			$app->redirect(baseurl . '/login');
		}else{
			cekSessionLoginUser();
		}
	}
}

function authLoginUser(){
	$app = \Slim\Slim::getInstance();
	$modulePack = $app->router->getCurrentRoute()->name;
	$modulename = explode('-', $modulePack)[0];
	$moduleType = explode('-', $modulePack)[1];
	$moduleQuery = (explode('-', $modulePack)[2] == 'query')? true : false;


	if($modulename == 'novalidate' || $_SESSION['mode'] == 'development'){
		return;
	}

	//var_dump($app->request->getMethod());

	$otorisasiModul = izy::getRow("SELECT A.*, B.single_module
		FROM tb_otorisasi_admin A INNER JOIN tb_otorisasi_module_item B ON A.idmodul = B.id
		WHERE B.module = ? AND A.idgrupuser = ? ",
		array($modulename, $_SESSION['login_admin']['idgrupuser']));

	if(!$modulename){
		//die('Unknown module');
		$app->halt(500, 'Unknown module. <a href="'.$app->request->getRootUri().'">Visit the Home Page</a>');
	}

	if(!$otorisasiModul && $modulename != 'novalidate'){
		//die('Module not registered.');
		$app->halt(500, 'Module not registered. <a href="'.$app->request->getRootUri().'">Visit the Home Page</a>');
	}

	if($otorisasiModul['single_module'] == 1){
		$moduleType = 'view';
	}

	if($otorisasiModul['is_can_'.$moduleType] == 0){
		if(strtolower($app->request->getMethod()) == 'get'){
			showAccessDenied1();
		}else{
			showAccessDenied2();
		}
		
		$app->stop();
	}
}

function showAccessDenied2(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();
	$smarty->display(basepath.'/modules/denied-template1.tpl');
}

function showAccessDenied1(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();
	$smarty->assign('content', basepath.'/modules/denied-template1.tpl');
	$smarty->display(basepath.'/modules/main.tpl');
}

function getMenuAdmin(){
	$datamenu = array();
	$db = mysqliConnection();
	$sql = "SELECT A.id, B.groupmenu, C.icon, B.menu, B.module
		FROM tb_otorisasi_admin A INNER JOIN tb_otorisasi_module_item B ON A.idmodul = B.id INNER JOIN tb_otorisasi_groupmenu C ON B.groupmenu = C.nama
		WHERE B.is_menu = 1 AND A.idgrupuser = ?
		ORDER BY C.urut ASC, B.urut ASC";

	$dataresult = izy::getAll($sql, array($_SESSION['login_admin']['idgrupuser']));

	foreach ($dataresult as $row) {
		//-- jika modul folder tidak ada maka gak usah di tampilkan, walau terdaftar di database.
		$modulefolder = basepath.'/modules/'.$row['module'];
		if(!is_dir($modulefolder)){
			continue;
		}

		$datamenu[$row['groupmenu']]['nama'] = $row['groupmenu'];
		$datamenu[$row['groupmenu']]['icon'] = $row['icon'];
		$datamenu[$row['groupmenu']]['datamodul'][$row['id']]['menu'] = $row['menu'];
		$datamenu[$row['groupmenu']]['datamodul'][$row['id']]['module'] = $row['module'];
	}
	
	$dataresult = null;
	return $datamenu;
}


function cekSessionLoginUser(){
	$loginuser = izy::load('tb_user', $_SESSION['login_admin']['id']);
	if($loginuser->sessid != $_SESSION['login_admin']['sessid']){
		unset($_SESSION['login_admin']);
		$app = \Slim\Slim::getInstance();
		$app->redirect(baseurl . '/login');
	}
}

function validatesessionform($sessionform){
	if($sessionform != $_SESSION['sessionform']){
		exit('No direct access allowed');
	}
}

function createsessionform(){
	$string = str_replace('==', '', base64_encode(session_id()));
	$_SESSION['sessionform'] = substr($string, strlen($string)-4);
	return $sessionform  = $_SESSION['sessionform'];
}

function Smarty(){
	$smarty = new Smarty;
	$smarty->caching = FALSE;
	
	if(isset($_SESSION['login_admin'])){
		$smarty->assign('login_admin', $_SESSION['login_admin']);
	}
	$setting = izy::getRow('SELECT * FROM tb_setting');
	$allsettings = json_decode($setting['allsettings'], true);
	$smarty->assign("allsettings", $allsettings);	
	$smarty->assign('sessionform', createsessionform());
	$smarty->assign('waktu_server', date("F d, Y H:i:s", time()));
	$smarty->assign('basepath', basepath);
	$smarty->assign('baseurl', baseurl);
	$smarty->assign('baseurlroot', baseurlroot);
	$smarty->assign('datamenu', $_SESSION[session_id()]['datamenu']);
	
	return $smarty;
}

function newSmarty(){
	return smarty();
}

function friendlyString($str){
    $alias = preg_replace('/[^A-Za-z0-9\']/', '-', $str);
    $alias = str_replace(' ', '-', $alias);
    $alias = str_replace('---', '-', $alias);
    $alias = str_replace('--', '-', $alias);

    return $alias;
}

function loginHeader($username, $password){
	$user = izy::findOne('tb_user', 'username=? AND password=?', array($username, $password));
	
	if($user->username == $username){
		$user->sessid = session_id();
		izy::store($user);
		$grupuser = izy::findOne('tb_grupuser', 'grupuser=?', array($user->grupuser));
		$_SESSION['login_admin'] = $user->export();
		$_SESSION['login_admin']['session_id'] = session_id();
		$_SESSION['login_admin']['idgrupuser'] = $grupuser->id;
		$_SESSION[session_id()]['datamenu'] = getMenuAdmin();
		$_SESSION['login_status'] = TRUE;
		$_SESSION['login_admin']['gudang'] = json_decode($user->gudang);
	}else{
		unset($_COOKIE);
		unset($_SESSION['login_admin']);
		unset($_SESSION['login_status']);
		session_regenerate_id();
	}
}

?>