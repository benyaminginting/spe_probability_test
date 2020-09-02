<?php
//-- setting config server
header("Access-Control-Allow-Origin: *");
error_reporting(E_ALL ^ E_NOTICE);
date_default_timezone_set('Asia/Jakarta');
session_start();

$_SESSION['mode'] = 'development';

//-- setting variabel global 
//-- tulis nama server local = http://localhost/namafolder ; server http://namadomain.com
define('basepath', dirname(__FILE__));
define('baseurl', 'http://'.$_SERVER['SERVER_NAME'].'/spe');
define('baseurlroot', 'http://'.$_SERVER['SERVER_NAME'].'/spe');

define('dbserver', 'localhost');
define('dbname', 'db_spe');
define('dbuser', 'root');
define('dbpassword', '');


//-- koneksi izy
if ($izyredbean) {
    izy::setup('mysql:host=' . dbserver . ';dbname=' . dbname . '', '' . dbuser . '', '' . dbpassword . '');
    izy::setStrictTyping(false);
    izy::freeze(TRUE);
}

//-- koneksi mysqli
function mysqliConnection(){
    $koneksidb =  new mysqli(dbserver, dbuser, dbpassword, dbname);
    if($koneksidb->connect_errno > 0){
        die($koneksidb->connect_error);
    }
    return $koneksidb;
}

//-- PDO
function pdoConnection(){
    $dbhost = dbserver;
    $dbuser = dbuser;
    $dbpass = dbpassword;
    $dbname = dbname;
    $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $dbh;
}

function d($d,$f = FALSE){
    echo "<pre>";
        print_r($d);
    echo "</pre>";
    if ($f) {
        die();
    }
}


function logc(){
    $log  = "User: ".$_SERVER['REMOTE_ADDR'].' - '.date("F j, Y, g:i a").PHP_EOL.
        "Attempt: ".($result[0]['success']=='1'?'Success':'Failed').PHP_EOL.
        "User: ".$username.PHP_EOL.
        "-------------------------".PHP_EOL;
    //Save string to log, use FILE_APPEND to append.
    file_put_contents('./log_'.date("j.n.Y").'.log', $log, FILE_APPEND);
}

?>