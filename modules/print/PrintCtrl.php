<?php

//-- router
$app->get('/print/suratjalan', 'PrintCtrl::suratjalan')->name('novalidate');
$app->get('/print/invoice', 'PrintCtrl::invoice')->name('novalidate');
$app->get('/print/rekap-komisi', 'PrintCtrl::rekapkomisi')->name('novalidate');
$app->get('/print/lap-komisi', 'PrintCtrl::lapkomisi')->name('novalidate');

//-- controller
class PrintCtrl{
    static function suratjalan(){
        require_once basepath . '/libraries/smarty/Smarty.class.php';

        $smarty = newSmarty();
        $smarty->display(basepath . '/modules/print/print-suratjalan.tpl');
    }
    static function invoice(){
        require_once basepath . '/libraries/smarty/Smarty.class.php';

        $smarty = newSmarty();
        $smarty->display(basepath . '/modules/print/print-invoice.tpl');
    }
    static function rekapkomisi(){
        require_once basepath . '/libraries/smarty/Smarty.class.php';

        $smarty = newSmarty();
        $smarty->display(basepath . '/modules/print/print-rekapkomisi.tpl');
    }
    static function lapkomisi(){
        require_once basepath . '/libraries/smarty/Smarty.class.php';

        $smarty = newSmarty();
        $smarty->display(basepath . '/modules/print/print-komisi.tpl');
    }    
}


?>