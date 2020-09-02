<?php
class Helper{
	function __construct(){
	}
	static function prevent_indexphp(){
		$app = \Slim\Slim::getInstance();
		$rooturi = str_replace('index.php', '', $app->request->getRootUri());
		
		//-- batasi penggunaan index.php
		if (in_array('index.php', explode('/', $_SERVER['REQUEST_URI']))) {
			$app->redirect($rooturi);
			//$app->redirect(baseurl.'/');
		}		
	}
	static function validate_session_form($sessionform){
		if($sessionform != $_SESSION['sessionform']){
			exit('No direct access allowed');
		}
	}
	static function create_session_form(){
		$string = str_replace('==', '', base64_encode(session_id()));
		$_SESSION['sessionform'] = substr($string, strlen($string)-4);
		return $sessionform  = $_SESSION['sessionform'];
	}
	static function create_form_token($formname){
		$token = random_string('alnum', 4);
		$_SESSION['token'][$formname] = $token;

		return $_SESSION['token'][$formname];
	}
	static function validate_form_token($token, $formname){
		if($_SESSION['token'][$formname] == $token){
			return true;
		}else{
			return false;
		}
	}
	static function init_login_customer(){	
		if($_SESSION['login_customer']['token'] !== session_id()){
			unset($_SESSION['login_customer']);
		}
		$login_customer = (!$_SESSION['login_customer'])? array() : $_SESSION['login_customer'];

		return $login_customer;
	}
	static function resize_image($source, $width, $height){
		include_once basepath.'/libraries/php-image-magician/php_image_magician.php';
		//$source = 'images/Desert.jpg';
		//$path=array(PATHINFO_DIRNAME,PATHINFO_BASENAME,PATHINFO_EXTENSION,PATHINFO_FILENAME);

		$source = str_replace('[baseurlroot]', baseurlroot, $source);

		if($source == ''){
			return $source;
		}
		
		//-- jika file di internal server, lalu file gambar tsb tidak ada ?
		//-- jika file gambar eksternal, lalu url gambar nya gak valid ?
		//-- jika source gambar tidak ada, maka keluar dari fungsi ini
		$is_file_in_localserver = (strpos($source, baseurlroot) == false) ? false : true;
		if($is_file_in_localserver){
			if(!file_exists(str_replace(baseurlroot, basepath, $source))){
				return $source;
			}
		}else{
			$file_headers = @get_headers($source);
			if($file_headers[0] == 'HTTP/1.1 404 Not Found') {
				return $source;
			}
		}


		//-- jika folder images/ temp tidak ada, maka create folder tsb dulu
		if(!is_dir(basepath.'/images/temp')){
			mkdir(basepath.'/images/temp');
		}

		//-- sesuaikan nama folder dengan ukuran gambar
		$foldername = $width.'x'.$height;
		if(!is_dir(basepath.'/images/temp/'.$foldername)){
			mkdir(basepath.'/images/temp/'.$foldername);
		}

		//-- sesuaikan nama file gambar yang baru
		$uniqmaker = substr(md5($source), 0, 8);
		$filename = $uniqmaker.'_'.friendlyString(pathinfo($source, PATHINFO_FILENAME));
		$file = $filename.'_'.$width.'x'.$height.'.'.pathinfo($source, PATHINFO_EXTENSION);

		//-- konversi gambar baru, output nya berupa url gambar
		$outputfile = basepath.'/images/temp/'.$foldername.'/'.$file;
		if(is_file($outputfile)){
			return str_replace(basepath, baseurl, $outputfile);
		}

		$magicianObj = new imageLib($source);

		$magicianObj-> resizeImage($width, $height, 'crop');
		$magicianObj-> saveImage($outputfile);
		return str_replace(basepath, baseurl, $outputfile);
	}
	static function friendlyString($str){
	    $alias = preg_replace('/[^A-Za-z0-9\']/', '-', $str);
	    $alias = str_replace(' ', '-', $alias);
	    $alias = str_replace('---', '-', $alias);
	    $alias = str_replace('--', '-', $alias);

	    return $alias;
	}
	static function Smarty(){
		$smarty = new Smarty;
		//$smarty->caching = FALSE;
		
		$smarty->assign('waktu_server', date("F d, Y H:i:s", time()));
		$smarty->assign('basepath', basepath);
		$smarty->assign('baseurl', baseurl);
		$smarty->assign('baseurlroot', baseurlroot);
		
		return $smarty;
	}
	static function newSmarty(){
		return smarty();
	}
	static function selfURL(){ 
	    $s = empty($_SERVER["HTTPS"]) ? '' : ($_SERVER["HTTPS"] == "on") ? "s" : ""; 
	    $protocol = self::strleft(strtolower($_SERVER["SERVER_PROTOCOL"]), "/").$s; 
	    $port = ($_SERVER["SERVER_PORT"] == "80") ? "" : (":".$_SERVER["SERVER_PORT"]); 
	    return $protocol."://".$_SERVER['SERVER_NAME'].$port.$_SERVER['REQUEST_URI']; 
	}
	static function strleft($s1, $s2) { 
		return substr($s1, 0, strpos($s1, $s2)); 
	}
	static function convert_string_to_integer($str){
		$str = str_replace(array('+','-'), '', $str);
		preg_match_all('!\d+!', $str, $matches);
		$result = end($matches[0]);
		$result = ltrim($result, '0');
		return (int)$result;
	}
	static function namahari_indo($yyyymmdd){
		$hari = array();
		$hari[0] = 'Unknown';
		$hari[1] = 'Senin';
		$hari[2] = 'Selasa';
		$hari[3] = 'Rabu';
		$hari[4] = 'Kamis';
		$hari[5] = 'Jumat';
		$hari[6] = 'Sabtu';
		$hari[7] = 'Minggu';

		return $hari[date('N', strtotime($yyyymmdd))];
	}
	static function namabulan_indo($yyyymmdd){
		$bulan = array();
		$bulan[0] = 'Unknown';
		$bulan[1] = 'Januari';
		$bulan[2] = 'Februari';
		$bulan[3] = 'Maret';
		$bulan[4] = 'April';
		$bulan[5] = 'Mei';
		$bulan[6] = 'Juni';
		$bulan[7] = 'Juli';
		$bulan[8] = 'Agustus';
		$bulan[9] = 'September';
		$bulan[10] = 'Oktober';
		$bulan[11] = 'November';
		$bulan[12] = 'Desember';
		return $bulan[date('n', strtotime($yyyymmdd))];
	}
	static function pembilang_waktu_jam_menit($jumlahmenit){
		$jumlahjam = floor($jumlahmenit / 60);
		$sisamenit = $jumlahmenit % 60;
		if($jumlahmenit < 60){
			return $jumlahmenit.' menit';
		}
		if($sisamenit == 0){
			return $jumlahjam.' jam';
		}else{
			return $jumlahjam." jam, ".$sisamenit." menit";
		}
	}
	static function file_get_contents_curl($url) {
		$ch = curl_init();
	 
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //Set curl to return the data instead of printing it to the browser.
		curl_setopt($ch, CURLOPT_URL, $url);
	 
		$data = curl_exec($ch);
		curl_close($ch);
	 
		return $data;
	}
	static function fix_url($url){
		/*
		* ../images/bla..bla..bla
		* [baseurlroot]/../imasdf
		* images/asd
		* http://
		*/
		$url = urldecode($url);
		$url = str_replace('../', '', $url);
		$url = str_replace('[baseurlroot]/', '',$url);
		$url = str_replace('[baseurl]/', '',$url);

		$urlpath = $url;
		if (strpos($url,'http') == false) {
		   //return $url;
		}else{
			//return baseurl.'/'.$url;
			$urlpath = baseurl.'/'.$url;
		}

		if (!preg_match("~^(?:f|ht)tps?://~i", $url)) {
        	$urlpath = baseurl .'/'. $url;
    	}


		return self::fix_filename_url($urlpath);
	}
	static function fix_content_url($content){
		$content = str_replace('../', baseurl.'/', $content);
		$content = str_replace('[baseurlroot]/', baseurl.'/', $content);
		$content = str_replace('[baseurl]/', baseurl.'/', $content);
		$content = html_entity_decode($content);

		return $content;
	}
	static function fix_filename_url($urlpath){
		$file = basename($urlpath);
		$newfilename = rawurlencode($file);
		return str_replace($file, $newfilename, $urlpath);
	}
	static function fix_path($content){
		$content = urldecode($content);
		$content = str_replace(baseurl, basepath, $content);
	
		return $content;
	}

	// ============================================== HELPER TAMBAHAN ==================================

	static function returnKode($tanggal, $type){
		switch($type){
			case 'kas':
				if ($tanggal == ''){
					$tanggal = date('Y-m-d');
				}
				$date = date('d', strtotime($tanggal));
				$bulan = date('m', strtotime($tanggal));
				$tahun = date('Y', strtotime($tanggal));
				
				$last_counter = izy::getRow("SELECT CONVERT(SUBSTRING_INDEX(kodekas,'-',-1),UNSIGNED INTEGER) as last_counter 
					FROM tb_kasbesar
					WHERE DAY(tanggal) = ? AND MONTH(tanggal) = ? AND YEAR(tanggal) = ?
					ORDER BY last_counter DESC
					LIMIT 1",array($date,$bulan,$tahun));
				
				$last = 1;
				if (count($last_counter) > 0){
					$last = (int)$last_counter['last_counter'] + 1;
				}
				
				$kode = sprintf("%s-%04d", 
					"KAS".$tahun.$bulan.$date,
					(int)$last);
				return $kode;
				break;
			case 'wo':
				break;
		}
	}
	static function terbilang($x){
		$abil = array("", " Satu", " Dua", " Tiga", " Empat", " Lima", " Enam", " Tujuh", " Delapan", " Sembilan", " Sepuluh", " Sebelas");
		if ($x < 12)
			return " " . $abil[$x];
		elseif ($x < 20)
			return Terbilang($x - 10) . " Belas";
		elseif ($x < 100)
			return Terbilang($x / 10) . " Puluh" . Terbilang($x % 10);
		elseif ($x < 200)
			return " Seratus" . Terbilang($x - 100);
		elseif ($x < 1000)
			return Terbilang($x / 100) . " Ratus" . Terbilang($x % 100);
		elseif ($x < 2000)
			return " Seribu" . Terbilang($x - 1000);
		elseif ($x < 1000000)
			return Terbilang($x / 1000) . " Ribu" . Terbilang($x % 1000);
		elseif ($x < 1000000000)
			return Terbilang($x / 1000000) . " Juta" . Terbilang($x % 1000000);
	}
	static function fetchsatuan(){
		return izy::getAll("SELECT A.*
			FROM tb_satuan A
			order BY A.satuan ASC");
	}
	static function branchatas($id){
		$temp = array();
		$dataid = array();
		$ulangi = FALSE;
		$satuan = izy::getRow('SELECT id,satuan,alias,parent,parentvalue,selfvalue FROM tb_satuan where id=?',array($id));
		if (!empty($satuan)) {
			$temp[$satuan['alias']] = $satuan;
			$dataid[$satuan['parent']] = $satuan['parent'];
			$ulangi = TRUE;
		}

		while ( $i <= 5 AND $ulangi == TRUE) {
			$ulangi = FALSE;

			$satuan = $satuans = array();
			foreach ($dataid as $id) {
				$satuans[] = izy::getAll("SELECT id,satuan,alias,parent,parentvalue,selfvalue FROM tb_satuan WHERE id = ?",array($id));
				foreach ($satuans as $satuan) {
					foreach ($satuan as $value) {
						$temp[$value['alias']] = $value;
					}
				}
			}

			if(!empty($satuans)){
				$dataid = array();
				foreach ($satuans as  $satuan) {
					foreach ($satuan as $key => $value) {
						$dataid[$value['parent']] =  $value['parent'];
					}
				}

				$ulangi = TRUE;
			}

			$i++;
		}

		return array_reverse($temp, true);
	}
	static function branchsatuan($id){
		$temp = array();
		$dataid = array();
		$ulangi = FALSE;
		$satuan = izy::getRow('SELECT id,satuan,alias,parent,parentvalue,selfvalue FROM tb_satuan where id=?',array($id));
		if (!empty($satuan)) {
			$temp[$satuan['alias']] = $satuan;
			$dataid[$satuan['id']] = $satuan['id'];
			$ulangi = TRUE;
		}

		while ( $i <= 5 AND $ulangi == TRUE) {
			$ulangi = FALSE;

			$satuan = $satuans = array();
			foreach ($dataid as $id) {
				$satuans[] = izy::getAll("SELECT id,satuan,alias,parent,parentvalue,selfvalue FROM tb_satuan WHERE parent = ?",array($id));
				foreach ($satuans as $satuan) {
					foreach ($satuan as $value) {
						$temp[$value['alias']] = $value;
					}
				}
			}

			if(!empty($satuans)){
				$dataid = array();
				foreach ($satuans as  $satuan) {
					foreach ($satuan as $key => $value) {
						$dataid[$value['id']] =  $value['id'];
					}
				}

				$ulangi = TRUE;
			}

			$i++;
		}

		return $temp;
	}
	static function treesatuan($id){
		return array_merge(self::branchatas($id),self::branchsatuan($id));
	}
	static function diffsatuan($alpa,$omega){
		$diff = 1;
		if ($alpa == $omega) return $diff;

		$get_tree = self::branchsatuan($alpa);
		$branchatas = array_reverse(self::branchatas($alpa),true);

		foreach ($get_tree as $key => $value) {
			if ($value['id'] != $alpa) {
				$diff = ($diff/$value['parentvalue'] ) * $value['selfvalue'];
				if ($value['id']==$omega) {
					return $diff;
				}
			}
		}

		$diff = 1;
		foreach ($branchatas as $key => $value) {
			if ($value['id']==$omega) {
				return $diff*-1;
			}
			$diff = ($diff* $value['selfvalue'])/$value['parentvalue'] ;
		}

		return false;
	}
	static function substract_satuan($kd_satuan,$qty,$kd_satuanmin,$qtymin){
		$diffsatuan = self::diffsatuan($kd_satuan,$kd_satuanmin);
		if ($diffsatuan>0) {
			$output_satuan = $kd_satuanmin;
			$qty_kecil = $qty * $diffsatuan;
			$qty_now = $qty_kecil - $qtymin;
			$operator = 0;
		}else{
			$diffsatuan = self::diffsatuan($kd_satuanmin,$kd_satuan);
			$output_satuan = $kd_satuan;
			$qty_kecil = $qtymin * $diffsatuan;
			$qty_now = $qty - $qty_kecil;
			$operator = 1;
		}

		$result['satuan'] = $output_satuan;
		$result['qty'] = $qty_now;
		$result['diff'] = $diffsatuan;
		$result['operator'] = $operator;
		return $result;
	}
	static function add_satuan($kd_satuan,$qty,$kd_satuanmin,$qtymin){
		$diffsatuan = self::diffsatuan($kd_satuan,$kd_satuanmin);
		if ($diffsatuan>0) {
			$output_satuan = $kd_satuanmin;
			$qty_kecil = $qty * $diffsatuan;
			$qty_now = $qty_kecil + $qtymin;
			$operator = 0;
		}else{
			$diffsatuan = self::diffsatuan($kd_satuanmin,$kd_satuan);
			$output_satuan = $kd_satuan;
			$qty_kecil = $qtymin * $diffsatuan;
			$qty_now = $qty + $qty_kecil;
			$operator = 1;
		}

		$result['satuan'] = $output_satuan;
		$result['qty'] = $qty_now;
		$result['diff'] = $diffsatuan;
		$result['operator'] = $operator;
		return $result;
	}
	static function opt_satuan($satuan,$qty){
		$data_option = $id_saved = $max_qty = array();
		$branchatas = array_reverse(self::branchatas($satuan),true);
		$branchbawah = self::branchsatuan($satuan);
		$diff = 1;

		$qty_bawah = $qty;
		foreach ($branchbawah as $key => $value) {				
			if ($satuan == $value['id']) {
				$branchbawah[$key]['max'] = $qty_bawah;
			}else{
				$qty_bawah *= $value['selfvalue']/$value['parentvalue'];
				$branchbawah[$key]['max'] = $qty_bawah;
			}
			$branchbawah[$key]['diff'] = self::diffsatuan($satuan,$value['id']);

		}		
		//masukan data branch bawah
		$data_option = $branchbawah;

		foreach ($branchatas as $key => $value) {				
			$qty = $qty/($value['selfvalue']/$value['parentvalue']);
			$branchatas[$key]['diff'] = self::diffsatuan($satuan,$value['id']);
			if (floor($qty) > 0) {
				array_push($id_saved, $value['parent']);
				array_push($max_qty, floor($qty));
			}

			foreach ($id_saved as $kunci => $push) {
				if ($push == $value['id']) {
					$branchatas[$key]['max'] = $max_qty[$kunci];
					array_unshift($data_option,$branchatas[$key]);
				}
			}
		}

		return $data_option;
	}
	static function pembulatan_satuan($satuan,$qty,$namasatuan=''){
		$branchatas = array_reverse(self::branchatas($satuan));
		#ambil satuan diatasnya jika ada yang pas dibulatkan keatas maka di return hasil nya

		$selfvalue = 1;
		$result = array('satuan'=>$satuan,'qty'=>$qty,'namasatuan'=>$namasatuan);
		foreach ($branchatas as $key => $value) {
			$selfvalue *= $value['selfvalue']/$value['parentvalue'];
			if ($qty % $selfvalue == 0 && $value['parent']!=0 && ($qty/$selfvalue)>=1) {
				$result['satuan'] = $value['parent'];
				$result['qty'] = $qty/$selfvalue;
			}

			if ($value['id']==$result['satuan']) {
				$result['namasatuan'] = $value['satuan'];
			}

		}

		return $result;
	}
	static function stockcheck($kodebarang,$kodegudang){
		$barang = izy::getRow("SELECT * FROM tb_barang WHERE kodebarang=?",array($kodebarang));
		if(empty($barang)) return false;
		$satuan = $barang['satuan'];

		$stockbarang = izy::getAll("SELECT A.kodebarang, A.qty, A.satuan
			FROM tb_stock A
			WHERE A.id IS NOT NULL AND A.kodebarang = ? AND A.kodegudang = ?
			",array($kodebarang,$kodegudang));

		$pengeluaran_temp = izy::getAll("SELECT A.qty , A.satuan FROM tb_pengeluaran_request A 
			WHERE A.isactive = 1 AND A.status = 0 AND A.kodegudang = ? AND A.kodebarang = ? AND A.isactive = ?",array($kodegudang,$kodebarang,1));		

		//penambahan
		$total_stock=self::add_satuan($satuan,0,$satuan,0);
		foreach ($stockbarang as $key => $value) $total_stock = self::add_satuan($total_stock['satuan'],$total_stock['qty'],$value['satuan'],$value['qty']);
		$pengeluaran_request=self::add_satuan($satuan,0,$satuan,0);
		foreach ($pengeluaran_temp as $key => $value) $pengeluaran_request = self::add_satuan($pengeluaran_request['satuan'],$pengeluaran_request['qty'],$value['satuan'],$value['qty']);

		$sisa = self::substract_satuan($total_stock['satuan'],$total_stock['qty'],$pengeluaran_request['satuan'],$pengeluaran_request['qty']);

		return $sisa;
	}
	static function sent_mail($to,$subject,$body,$headers = array()){
		include_once basepath."/libraries/PHPMailer-master/PHPMailerAutoload.php";

		$mail = new PHPMailer;
		//setting mail
		$mail->isSMTP();
		$mail->SMTPDebug = 0;
		$mail->Debugoutput = 'html';
		$mail->Host = $_SESSION['mail_config']['Host'];
		$mail->Port = $_SESSION['mail_config']['Port'];
		$mail->SMTPSecure = $_SESSION['mail_config']['SMTPSecure'];
		$mail->SMTPAuth = true;
		$mail->Username = $_SESSION['mail_config']['Username'];
		$mail->Password = $_SESSION['mail_config']['Password'];

		if (!empty($headers['setFrom'])) {
			$mail->setFrom($headers['setFrom']['email'],$headers['setFrom']['nama']);
		}

		if (!empty($headers['addReplyTo'])) {
			$mail->addReplyTo($headers['addReplyTo']['email'],$headers['addReplyTo']['nama']);
		}

		//create email content
		$mail->addAddress($to);
		//Set the subject line
		$mail->Subject = $subject;

		$mail->msgHTML($body);
		//Replace the plain text body with one created manually
		$mail->AltBody = 'This is a plain-text message body';

		// d($mail);

		if (!$mail->send()) {
			echo "Mailer Error: " . $mail->ErrorInfo;
		} else {
			echo "Message sent!";
		}
		$mail->clearAddresses();
		$mail->clearAttachments();
	}
	static function datasatuan($id,$nama=FALSE){
		$satuan = izy::getAll("SELECT * FROM tb_satuan");
		foreach ($satuan as $key => $value) {
			if ($value['id'] == $id) {
				if ($nama) {
					return $value['satuan'];
				}
				return $value;
			}
		}

		return false;
	}
	static function satuankeytonama(){
		$satuan = izy::getAll("SELECT * FROM tb_satuan");
		$satuan_susun = array();
		foreach ($satuan as $key => $value) {
			$satuan_susun[$value['id']] = $value['satuan'];
		}
		return $satuan_susun;
	}
	static function satuannamatokey(){
		$satuan = izy::getAll("SELECT * FROM tb_satuan");
		$satuan_susun = array();
		foreach ($satuan as $key => $value) {
			$satuan_susun[$value['satuan']] = $value['id'];
		}
		return $satuan_susun;
	}
	static function fetchgudang(){
		$query_autorisasi = self::query_autorisasi();
		return izy::getAll("SELECT * FROM tb_gudang WHERE id IS NOT NULL AND jenis = 0 $query_autorisasi ");
	}
	static function query_autorisasi($inisial = ""){
		$inisial = ($inisial == "") ? "" : $inisial.".";
		$gudang = $_SESSION['login_admin']['gudang'];

		$query = " AND ".$inisial."kodegudang = ''";

		if (count($gudang) > 0) {
			$subquery = "";
			foreach ($gudang as $key => $value) {
				if (end($gudang) != $value) {
					$subquery .= $inisial."kodegudang = '$value' OR ";
				}else{
					$subquery .= $inisial."kodegudang = '$value'";
				}
			}
			$query = " AND ( $subquery ) ";
		}
		return $query;
	}
	static function utf8ize($d) {
		//  returns probably a faulty response, some strings were probably not UTF-8
		// Here is a recursive function that can force convert to UTF-8 all the strings contained in an array
		if (is_array($d)) {
			foreach ($d as $k => $v) {
				$d[$k] = self::utf8ize($v);
			}
		} else if (is_string ($d)) {
			return utf8_encode($d);
		}
		return $d;
	}
	static function transaksi_tutupbulan($date = ''){
		
		$tanggal = ($date == '')? date('Y-m-01',strtotime(date("Y-m-d")."+1 month")) : date('Y-m-01',strtotime(date("Y-m-d", strtotime($date)) . " +1 month"));

		$data = izy::getRow("SELECT id FROM tb_stock_tutupbulan WHERE tanggal = ?",array($tanggal));
		
		if (empty($data)) {
			return false;
		}
		return true;
	}
	static function stock_product($kodebarang = ""){
		if (empty($kodebarang)) return array('qty'=>0);

		$result =  izy::getRow("SELECT  A.satuan,A.metode, 
			GROUP_CONCAT(D.satuan) as grupsatuan, 
			GROUP_CONCAT(D.qty) as grupqty 
		FROM tb_products A 
			LEFT JOIN tb_stock D ON D.kodebarang = A.kodebarang 
		WHERE A.kodebarang = ?
		GROUP BY D.kodebarang,D.kodegudang"
		,array($kodebarang));


		if (!empty($result)) {
	        $result['qty'] = 0;
	        $expsatuan = explode(',', $result['grupsatuan']);
	        $expqty = explode(',', $result['grupqty']);

	        $metode = 'FIFO';
	        if ((int)$result['metode'] == 2) {
	            $metode = "Average";
	        }elseif ((int)$result['metode'] == 3) {
	            $metode = "LIFO";
	        }

	        if (count($expsatuan)>0) {
	            $totqty = self::add_satuan($result['satuan'],0,$result['satuan'],0);
	            foreach ($expsatuan as $k => $vsatuan) {
	                $totqty = self::add_satuan($totqty['satuan'],$totqty['qty'],$vsatuan,$expqty[$k]);
	            }
	            $result['satuan'] = $totqty['satuan'];
	            $result['qty'] = $totqty['qty'];
	        }

	        $pembulatan_satuan = self::pembulatan_satuan($result['satuan'],$result['qty']);
	        $result['satuan'] = $pembulatan_satuan['satuan'];   
	        $result['qty'] = $pembulatan_satuan['qty'];
	        $result['namasatuan'] = $pembulatan_satuan['namasatuan'];
	        $result['namametode'] = $metode;
	        unset($totqty);
	    }

	    return $result;
	}
}

?>