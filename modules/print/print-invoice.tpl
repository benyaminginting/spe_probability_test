<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="{$baseurl}/assets/css/print.css" />
<link rel="stylesheet" href="{$baseurl}/assets/css/print.css" media="print" />
<link rel="shortcut icon" href="{str_replace('[baseurlroot]', $baseurlroot, $allsettings.favico)}" />
<link rel="stylesheet" href="{$baseurl}/assets/fonts/font-PT-Sans.css" />
<link rel="icon" type="image/png" href="{str_replace('[baseurlroot]', $baseurlroot, $allsettings.favico)}" />
<link rel='shortcut icon' type='image/vnd.microsoft.icon' href='{str_replace('[baseurlroot]', $baseurlroot, $allsettings.favico)}'/>
<link rel="icon" href='{str_replace('[baseurlroot]', $baseurlroot, $allsettings.favico)}' type="image/x-icon" />
<link rel="shortcut icon" href='{str_replace('[baseurlroot]', $baseurlroot, $allsettings.favico)}' type="image/x-icon" />
<link rel="stylesheet" href="{$baseurl}/assets/bootstrap/css/bootstrap.min.css">
<title>Invoice Pengiriman Barang</title>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-xs-8">
      <div class="row">
        <div class="col-xs-3" style="padding-top:20px;"><img src="{str_replace('[baseurlroot]', $baseurlroot, $allsettings.logo)}" class="img-responsive" /></div>
        <div class="col-xs-9">
          <h3>{$allsettings.nama}</h3>
          <div><em>{$setting.alamat}</em></div>
          <div><em>Telp/fax. {$setting.telpon}</em></div>
          <div><em>HP. {$setting.hp}</em></div>
          <div><em>Email. {$setting.email}</em></div>
        </div>
      </div>
    </div>
    <div class="col-xs-4" align="center">
      <h3>Invoice Pengiriman</h3>
    </div>
  </div>
  
  <div class="clearfix"><hr></div>

  <div class="row">
  	<div class="col-xs-6">
      <div class="baris">
      	<div class="kolom1">Perima</div>
        <div class="kolom2">: Parlin Htb</div>
      </div>
      <div class="baris">
      	<div class="kolom1">Alamat</div>
        <div class="kolom2">: Jakarta</div>
      </div>
    
          
    </div>
    <div class="col-xs-6">
      <div class="baris">
      	<div class="kolom1">Surat Jalan</div>
        <div class="kolom2">: SJ.16/01/001</div>
      </div>
      <div class="baris">
      	<div class="kolom1">Tanggal</div>
        <div class="kolom2">: Senin, 25-01-2015</div>
      </div>
    </div>
  </div> 
 
  <div class="row">
    <div class="col-xs-12">
      <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th width="10">No.</th>
            <th>Ref.</th>
            <th>Pengirim</th>
            <th>Jlh.Koli</th>
            <th>Nama Barang</th>
            <th>Berat(Kg)</th>
            <th>Jumlah.Ongkos</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1.</td>
            <td>SP-16/01/001</td>
            <td>Toko Asun</td>
            <td class="text-right">3</td>
            <td>Ikan Asin</td>
            <td class="text-right">3.5</td>
            <td class="text-right">Rp. 500,000</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="6" class="text-right">Total</td>
            <td class="text-right">Rp. 500,000</td>
          </tr>
        </tfoot>
      </table>
      
      </div>
    </div>
  </div>
  
<div class="row">
<div class="col-xs-6" align="">
	<div>Penerima, ................</div>
     <br><br><br>
    <div>(_________________)</div>
</div>

<div class="col-xs-6" align="center">
<!--	<div>Hormat Kami,</div>
     <br><br><br>
    <div>(_________________)</div>
--></div>
</div>


</div>
</body>
</html>
