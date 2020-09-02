<?php
//-- router
$app->get('/setting', 'viewsetting')->name('setting-view');
$app->post('/setting', 'postsetting')->name('setting-view');
$app->post('/setting/query-update', 'updatesetting')->name('setting-view');

//-- controller
function updatesetting(){
	include basepath.'/libraries/class/json.php';
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$allsettings = new stdClass;
	$setting = izy::load('tb_setting', 1);
	$setting->alamat = $request->params('alamat');
	$setting->email = $request->params('email');
	$setting->facebook = $request->params('facebook');
	$setting->favico = str_replace(baseurlroot, '[baseurlroot]', $request->params('favico'));
	$setting->kota = $request->params('kota');
	$setting->logo = str_replace(baseurlroot, '[baseurlroot]', $request->params('logo'));
	$setting->maintenance = $request->params('maintenance');
	$setting->metadesc = $request->params('metadesc');
	$setting->metakey = $request->params('metakey');
	$setting->metatitle = $request->params('metatitle');
	$setting->nama = $request->params('nama');
	$setting->pengumuman = $request->params('pengumuman');
	$setting->setadd = $request->params('setadd');
	$setting->telpon = $request->params('telpon');
	$setting->twitter = $request->params('twitter');
	$setting->path_user = $request->params('path_user');

	//-- deklarasi sisa kolom setting yang gak di deklarasi
	$temp_setting = $setting->export();
	unset($temp_setting['allsettings']);
	$allsettings = $temp_setting;
	$allsettings['allsettings'] = "";
	$allsettings['image_product_width'] = $request->params('image_product_width');;
	$allsettings['image_product_height'] = $request->params('image_product_height');;
	$allsettings['image_banner_width'] = $request->params('image_banner_width');;
	$allsettings['image_banner_height'] = $request->params('image_banner_height');;
	$allsettings['script_head'] = $request->params('script_head');
	$allsettings['script_body'] = $request->params('script_body');
	$allsettings['gratisongkir'] = $request->params('gratisongkir');
	$allsettings['belanjaminimum'] = $request->params('belanjaminimum');

	$setting->allsettings = "";
	$setting->allsettings = json_encode($allsettings);


	$result = "";
	izy::begin();
	try {
		izy::store($setting);

		izy::commit();
		$result = 'berhasil';
	} catch(Exception $e) {
		izy::rollback();
		$result = $e->getMessage();
	}
	echo $result;
}
function updatesetting_old(){
	include basepath.'/libraries/class/json.php';
	$app = \Slim\Slim::getInstance();
	$request = $app->request();

	$allsettings = new stdClass;
	$setting = izy::load('tb_setting', 1);
	$setting->alamat = $request->params('alamat');
	$setting->email = $request->params('email');
	$setting->facebook = $request->params('facebook');
	$setting->favico = $request->params('favico');
	$setting->kota = $request->params('kota');
	$setting->logo = $request->params('logo');
	$setting->maintenance = $request->params('maintenance');
	$setting->metadesc = $request->params('metadesc');
	$setting->metakey = $request->params('metakey');
	$setting->metatitle = $request->params('metatitle');
	$setting->nama = $request->params('nama');
	$setting->pengumuman = $request->params('pengumuman');
	$setting->setadd = $request->params('setadd');
	$setting->telpon = $request->params('telpon');
	$setting->twitter = $request->params('twitter');
	$setting->path_user = $request->params('path_user');

	//-- deklarasi sisa kolom setting yang gak di deklarasi
	$allsettings = $setting->export();
	$allsettings['image_product_width'] = $request->params('image_product_width');;
	$allsettings['image_product_height'] = $request->params('image_product_height');;
	$allsettings['image_banner_width'] = $request->params('image_banner_width');;
	$allsettings['image_banner_height'] = $request->params('image_banner_height');;
	$allsettings['script_head'] = $request->params('script_head');
	$allsettings['script_body'] = $request->params('script_body');

	$setting->allsettings = "";
	//$setting->allsettings = json_encode($allsettings);


	$result = "";
	izy::begin();
	try {
		izy::store($setting);

		//-- setting disimpan sebagai json file
		$rootfolder = realpath(basepath.'/..');
		$settingfile = $rootfolder.DIRECTORY_SEPARATOR.'setting.json';
		//-- jika file setting belum ada, maka create dulu
		if(!is_file($settingfile)){
			fopen($settingfile, 'w');
		}
		$handleFile = fopen($settingfile, "w");
		fwrite($handleFile, json_encode($allsettings));
		fclose($handleFile);



		//-- setting disimpan sebagai json file
		$rootfolder = realpath(basepath.'/..');
		$settingfile = $rootfolder.DIRECTORY_SEPARATOR.'setting.xml';
		//-- jika file setting belum ada, maka create dulu
		if(!is_file($settingfile)){
			$handleFile = fopen($settingfile, 'w');
			fclose($handleFile);
		}
		$settingXml = new SimpleXMLElement('<setting/>');
		foreach ($allsettings as $key => $value) {
			$settingXml->$key = $value;
		}
		$settingXml->saveXML($settingfile);  

		

		
		izy::commit();
		$result = 'berhasil';
	} catch(Exception $e) {
		izy::rollback();
		$result = $e->getMessage();
	}
	echo $result;
}
function postsetting(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();
	$setting = izy::load('tb_setting', 1);
	$datasetting = $setting->export();
	//$datasetting['allsettings'] = json_decode($datasetting['allsettings'], true);

	$smarty->assign('datatemplate', dataTemplate());

	$smarty->assign('setting', $datasetting);
	$smarty->display(basepath.'/modules/setting/post-setting.tpl');
}

function viewsetting(){
	require_once basepath.'/libraries/smarty/Smarty.class.php';
	
	$smarty = newSmarty();
	$setting = izy::load('tb_setting', 1);

	$array = $setting->export();
	foreach ($setting as $key => $value) {
		//echo $key . ' -- ' . $value;
	}

	$smarty->assign('datatemplate', dataTemplate());
	$smarty->assign('setting', $setting);
	$smarty->assign('content', basepath.'/modules/setting/post-setting.tpl');
	$smarty->display(basepath."/modules/main.tpl");
}

function dataTemplate(){
	$template = array();
	$rootfolder =  realpath(basepath);
	$templatePath = $rootfolder.'/template';
	if(!is_dir($templatePath)){
		$templatePath = $rootfolder.'/templates';
	}

	$templateFolder = scandir($templatePath);
	foreach ($templateFolder as $content) {
		if ($content != "." && $content != "..") {
			$template[] = $content;
		}
	}
	return $template;
}

?>