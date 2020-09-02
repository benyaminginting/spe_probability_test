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
<title>Surat Jalan Pengiriman Barang</title>
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
      <h3>Surat Jalan Pengiriman</h3>
      <div class="baris">
      	<div class="kolom1">Kode</div>
        <div class="kolom2">: TJK.16/01/001</div>
      </div>
    </div>
  </div>
  
  <div class="clearfix"><hr></div>

  <div class="row">
  	<div class="col-xs-6">
      <div class="baris">
      	<div class="kolom1">Kode</div>
        <div class="kolom2">: TJK.16/01/001</div>
      </div>
      <div class="baris">
      	<div class="kolom1">Tanggal</div>
        <div class="kolom2">: Senin, 25-01-2015</div>
      </div>      
      <div class="baris">
      	<div class="kolom1">Jns.Pengiriman</div>
        <div class="kolom2">: Truk</div>
      </div>      
    </div>
    <div class="col-xs-6">
      <div class="baris">
      	<div class="kolom1">No. Plat</div>
        <div class="kolom2">: BK 1212 QR</div>
      </div>
      <div class="baris">
      	<div class="kolom1">Nama Supir</div>
        <div class="kolom2">: Anto</div>
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
            <th>Jlh.Koli</th>
            <th>Nama Barang</th>
            <th>Berat</th>
            <th>Harga</th>
            <th>Pembayaran</th>
            <th>Ket.</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1.</td>
            <td>SP-16/01/001</td>
            <td class="text-right">3</td>
            <td>Ikan Asin</td>
            <td class="text-right">3.5 Kg</td>
            <td class="text-right">Rp. 500,000</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>2.</td>
            <td>SP-16/01/002</td>
            <td class="text-right">3</td>
            <td>Ikan Asin</td>
            <td class="text-right">3.5 Kg</td>
            <td class="text-right">Rp. 500,000</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>3.</td>
            <td>SP-16/01/005</td>
            <td class="text-right">3</td>
            <td>Ikan Asin</td>
            <td class="text-right">3.5 Kg</td>
            <td class="text-right">Rp. 500,000</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>4.</td>
            <td>SP-16/01/007</td>
            <td class="text-right">3</td>
            <td>Ikan Asin</td>
            <td class="text-right">3.5 Kg</td>
            <td class="text-right">Rp. 500,000</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
          	<td class="text-right" colspan="2">Jumlah</td>
            <td class="text-right">6</td>
            <td>&nbsp;</td>
            <td class="text-right">8.5 Kg</td>
            <td class="text-right">Rp. 8,000,000</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </tfoot>
      </table>
      
      </div>
    </div>
  </div>
  
  <div class="row">
  	<div class="alert">
    	<h4>PERHATIAN !</h4>
        <div>Barang-barang sudah diterima dengan cukup.</div>
    </div>
  </div>
  
<div class="row">
<div class="col-xs-6" align="center">
	<div>Tanda terima,</div>
     <br><br><br>
    <div>(_________________)</div>
</div>

<div class="col-xs-6" align="center">
	<div>Hormat Kami,</div>
     <br><br><br>
    <div>(_________________)</div>
</div>
</div>

<br>
<div class="text-right" style="font-size:9px;font-style:italic;">Dicetak pada : {date('Y-m-d H:i:s')}</div>
</div>
</body>
</html>
