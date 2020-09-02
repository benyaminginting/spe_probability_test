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
<title>Laporan Komisi</title>
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
    <div class="col-xs-4">
      <h3>Lap. Komisi</h3>
      <div class="baris">
      	<div class="kolom1">Pengirim</div>
        <div class="kolom2">: Toko Rel</div>
      </div>
      <div class="baris">
      	<div class="kolom1">Periode</div>
        <div class="kolom2">: {date('F Y', strtotime('2015-11-01'))}</div>
      </div>
    </div>
  </div>
  
  <div class="clearfix"><hr></div>

 
  <div class="row">
    <div class="col-xs-12">
      <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th width="10">No.</th>
            <th>Ref</th>
            <th>Tanggal</th>
            <th>Penerima</th>
            <th>Daerah Tujuan</th>
            <th>Nama Barang</th>
            <th>Jlh.Koli</th>
            <th>Total Ongkos</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1.</td>
            <td>SP.15/11/001</td>
            <td>2015-11-01</td>
            <td>Tuan A</td>
            <td>Jakarta</td>
            <td>Ikan Asin</td>
            <td class="text-right">6</td>
            <td class="text-right">150,000</td>
          </tr>
          <tr>
            <td>2.</td>
            <td>SP.15/11/004</td>
            <td>2015-11-13</td>
            <td>Tuan A</td>
            <td>Jakarta</td>
            <td>Ikan Asin</td>
            <td class="text-right">2</td>
            <td class="text-right">150,000</td>
          </tr>
          <tr>
            <td>3.</td>
            <td>SP.15/11/014</td>
            <td>2015-11-14</td>
            <td>Tuan A</td>
            <td>Jakarta</td>
            <td>Ikan Asin</td>
            <td class="text-right">1</td>
            <td class="text-right">150,000</td>
          </tr>
          <tr>
            <td>4.</td>
            <td>SP.15/11/021</td>
            <td>2015-11-18</td>
            <td>Tuan A</td>
            <td>Jakarta</td>
            <td>Ikan Asin</td>
            <td class="text-right">3</td>
            <td class="text-right">150,000</td>
          </tr>
          <tr>
            <td>5.</td>
            <td>SP.15/11/032</td>
            <td>2015-11-20</td>
            <td>Tuan A</td>
            <td>Jakarta</td>
            <td>Ikan Asin</td>
            <td class="text-right">2</td>
            <td class="text-right">150,000</td>
          </tr>
          <tr>
            <td>6.</td>
            <td>SP.15/11/056</td>
            <td>2015-11-25</td>
            <td>Tuan A</td>
            <td>Jakarta</td>
            <td>Ikan Asin</td>
            <td class="text-right">5</td>
            <td class="text-right">150,000</td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="6" class="text-right">Jumlah</td>
            <td class="text-right">15</td>
            <td class="text-right">Rp. 1,327,000</td>
          </tr>      
        </tfoot>
      </table>
      
      </div>
    </div>
  </div>
  


<br>
<div class="text-right" style="font-size:9px;font-style:italic;">Dicetak pada : {date('Y-m-d H:i:s')}</div>
</div>
</body>
</html>
