<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    
    <link rel="icon" type="image/png" href="{str_replace('[baseurlroot]', $baseurlroot, $allsettings.favico)}" />
    <link rel='shortcut icon' type='image/vnd.microsoft.icon' href='{str_replace('[baseurlroot]', $baseurlroot, $allsettings.favico)}'/>
    <link rel="icon" href='{str_replace('[baseurlroot]', $baseurlroot, $allsettings.favico)}' type="image/x-icon" />
    <link rel="shortcut icon" href='{str_replace('[baseurlroot]', $baseurlroot, $allsettings.favico)}' type="image/x-icon" />

    <title>IZYSTORE | ADMIN PAGE</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="{$baseurl}/assets/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">-->
    <link rel="stylesheet" href="{$baseurl}/assets/font-awesome/css/font-awesome.min.css">
    
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="{$baseurl}/assets/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="{$baseurl}/assets/dist/css/skins/_all-skins.min.css">
    
    <!-- jQuery 2.1.4 -->
    <script src="{$baseurl}/assets/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="{$baseurl}/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="{$baseurl}/assets/bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="{$baseurl}/assets/plugins/jQuery-Validation-Engine-master/css/validationEngine.jquery.css" type="text/css"/>
    <script src="{$baseurl}/assets/plugins/jQuery-Validation-Engine-master/js/jquery.validationEngine.js" type="text/javascript"></script>
    <script src="{$baseurl}/assets/plugins/jQuery-Validation-Engine-master/js/languages/jquery.validationEngine-en.js" type="text/javascript"></script>


    <!-- toastr notification -->
    <link rel="stylesheet" type="text/css" href="{$baseurl}/assets/plugins/toastr/toastr.min.css">
    <script src="{$baseurl}/assets/plugins/toastr/toastr.min.js"></script>

        <!-- SlimScroll -->
        <script src="{$baseurl}/assets/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="{$baseurl}/assets/plugins/fastclick/fastclick.min.js"></script>

    <script src="{$baseurl}/assets/js/jquery.number.js"></script>
    <script src="{$baseurl}/assets/js/numeral.min.js"></script>

    <script src="{$baseurl}/assets/plugins/summernote-master/dist/summernote.custom.js"></script>
    <link href="{$baseurl}/assets/plugins/summernote-master/dist/summernote.css" type="text/css" rel="stylesheet" />
    <link href="{$baseurl}/assets/lib/font-awesome-4.4.0/css/font-awesome.min.css" type="text/css" rel="stylesheet" />

    <link rel="stylesheet" href="{$baseurl}/assets/plugins/jquery-ui/css/Aristo/Aristo.css" />
    <script src="{$baseurl}/assets/plugins/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>

    <script src="{$baseurl}/assets/plugins/chosen/chosen.jquery.min.js"></script>
    <link rel="stylesheet" href="{$baseurl}/assets/plugins/chosen/chosen.css" type="text/css"/>

    <style>
      .table thead th {
          background-color: #eaf5f8 !important;
      }
      .input-150{
      width:150px;
      display:inline-block;
      }
      .input-100{
      width:100px;
      display:inline-block;
      }
    </style>

  </head>

  <body class="hold-transition skin-blue sidebar-mini">
    
    <section class="content">

      <!-- Default box -->
      <div class="box container">
        <div class="box-body" id="contentpage" style="min-height:565px;">
          
            <div class="page-header">
              <h3>CUSTOMERS</h3>
            </div>
            <form name="frmpage" id="frmpage"  method="post" action="javascript:return false;" >

              <div class="row">
                <div class="col-md-6">
                  <select name="jumlahbaris" id="jumlahbaris" class="form-control">
                    <option value="25" selected="selected">25</option>
                    <option value="50">50</option>
                    <option value="150">150</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <div class="row">
                    <div class="col-md-4">
                  <select name="pilihfilter" class="form-control" id="pilihfilter">
                    <option value="" selected="selected">--Pilih Filter--</option>
                    <option value="username">Username</option>
                    <option value="nama">Nama</option>
                    <option value="kota">Kota</option>
                  </select>
                    </div>
                    <div class="col-md-8">
                  <div class="input-group">
                  <input name="cari" type="text" id="cari" class="form-control" placeholder="Pilih lalu ketik disini...">
                  <span class="input-group-btn">
                    <button type="submit" class="btn btn-default" title="Search" onclick="izydata(1);return false"><i class="fa fa-search"></i></button>
                    <button type="button" class="btn btn-info" title="Refresh" onclick="$('#pilihfilter').val('');$('#cari').val('');izydata(1);return false;" ><i class="fa fa-refresh"></i></button>
                  </span>
                  </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="table-responsive">
                <table class="table table-striped table-bordered tabelview table-hover table-condensed" id="tabeldata">
                  <thead id="head1">
                    <tr>
                        <th width="1"><input id="checkall-baris" type="checkbox" onchange="$('.check-baris').prop('checked', $(this).prop('checked'));"></th>
                        <th>Username</th>
                        <th>Nama</th>
                        <th>Kota</th>
                        <th style="width:100px;" >Action</th>
                    </tr>
                  </thead>
                  <tbody id="barisnomor1">
                  </tbody>
                </table>
              </div>
              <div class="row">
                <div class="col-md-6"><div class="form-control">Total : <span id="jumlahdata">0</span> records</div></div>
                <div class="col-md-6" align="right">
                  <button class="btn btn-gebo" name="butfirst" id="butfirst">First</button>
                  <button name="butprev" id="butprev" class="btn btn-gebo">Previous</button>
                  Page
                  <input type="text" name="halaman" id="halaman" class="input-100 form-control" value="1" />
                  / <span class="jumlahhalaman">1</span>
                  <button class="btn btn-gebo" name="butnext" id="butnext">Next</button>
                  <button name="butlast" id="butlast" class="btn btn-gebo">Last</button>
                </div>
              </div>
            </form>



        </div><!-- /.box-body -->
        <div class="overlay" id="loader-form" style="display:none;"><i class="fa fa-refresh fa-spin"></i></div>
        <div class="overlay" id="loader" style="display:none;"><i class="fa fa-refresh fa-spin"></i></div>
      </div><!-- /.box -->
    </section>

<script type="text/javascript">
$(document).ready(function() {
$('#category').trigger('chosen:update');
$('#category').change(izydata);
	izydata(0);
	$("#butnext").click(function() {
		jumlahhalaman = parseInt($(".jumlahhalaman").text());
		tambahhalaman = parseInt($("#halaman").val()) + 1;
		$("#halaman").val(tambahhalaman);

		if (jumlahhalaman == tambahhalaman) {
			$("#butnext").attr("disabled", "disabled");
			$("#butlast").attr("disabled", "disabled");
			$("#butprev").removeAttr("disabled", "disabled");
			$("#butfirst").removeAttr("disabled", "disabled");
		} else {
			$("#butprev").removeAttr("disabled", "disabled");
			$("#butfirst").removeAttr("disabled", "disabled");
		}
		izydata(1);
		return false;
	});

	$("#butprev").click(function() {
		jumlahhalaman = parseInt($(".jumlahhalaman").text());
		kuranghalaman = parseInt($("#halaman").val()) - 1;
		$("#halaman").val(kuranghalaman);

		if (kuranghalaman == 1) {
			$("#butprev").attr("disabled", "disabled");
			$("#butfirst").attr("disabled", "disabled");
			$("#butnext").removeAttr("disabled", "disabled");
			$("#butlast").removeAttr("disabled", "disabled");
		} else {
			$("#butnext").removeAttr("disabled", "disabled");
			$("#butlast").removeAttr("disabled", "disabled");
		}
		izydata(1);
		return false;
	});

	$("#butfirst").click(function() {
		$("#halaman").val("1");
		$("#butfirst").attr("disabled", "disabled");
		$("#butprev").attr("disabled", "disabled");
		$("#butnext").removeAttr("disabled", "disabled");
		$("#butlast").removeAttr("disabled", "disabled");
		izydata(1);
		return false;
	});

	$("#butlast").click(function() {
		jumlahhalaman = parseInt($(".jumlahhalaman").text());
		$("#halaman").val(jumlahhalaman);
		$("#butnext").attr("disabled", "disabled");
		$("#butlast").attr("disabled", "disabled");
		$("#butfirst").removeAttr("disabled", "disabled");
		$("#butprev").removeAttr("disabled", "disabled");
		izydata(1);
		return false;
	});

	$("#jumlahbaris").change(function() {
		no = $("#jumlahbaris").val();
		izydata(0);
		return false;
	});

});

function izydata(id) {
	var myData = $('#frmpage').serialize();
	
	$.ajax({
		type : "POST",
		url : "{$baseurl}/customer/data",
		data : myData,
		datatype : "json",
		beforeSend : function(){
		  $("#loader").fadeIn("fast");
		},
		complete : function(){
		  $("#loader").fadeOut("fast");
		},
		success : function(r) {	
			

			var json = jQuery.parseJSON(r);

			// Heading -- no need heading

			// Data
			$("#tabeldata tbody").html("");
			no = 1;

			if (json.databody != null) {
				$.each(json.databody, function(m, item) {
					var action = '';
					action += ' <a title="pilih" href="javascript:pilihCustomer(\''+item.id+'\',\''+item.username+'\')" class="btn btn-default">Pilih</a> ';

					var tr1 = '<tr id="baris_'+item.id+'">';
					var field = "";
					field += '<td><input id="check-baris_'+item.id+'" class="check-baris" type="checkbox" value="'+item.id+'"></td>';
					field += '<td>'+item.username+'</td>';
					field += '<td>'+item.nama+'</td>';
					field += '<td>'+item.kota+'</td>';
					field += '<td style="text-align:right;">'+action+'</td>';
					var tr2 = "</tr>";

					$("#tabeldata tbody").append(tr1 + field + tr2);
					no++;
				});
			}

			if (json.databody == "") {
				$("#tabeldata tbody").append('<tr><td colspan="5" style="text-align:center;">No available data.</td></tr>');
			}

			// Pagination
			$(".jumlahhalaman").html(json.datasetting.jumlahhalaman);
			$("#jumlahdata").html(json.datasetting.jumlahdata);
			if (parseInt(json.datasetting.jumlahhalaman) <= 1 || parseInt(json.datasetting.jumlahhalaman) == parseInt($("#halaman").val())) {
				$("#butnext").attr("disabled", "disabled");
				$("#butlast").attr("disabled", "disabled");
			} else {
				$("#butnext").removeAttr("disabled");
				$("#butlast").removeAttr("disabled");
			}
			if (parseInt($("#halaman").val()) == 1) {
				$("#butprev").attr("disabled", "disabled");
				$("#butfirst").attr("disabled", "disabled");
			} else {
				$("#butprev").removeAttr("disabled");
				$("#butfirst").removeAttr("disabled");
			}
		}
	});
}
</script>



</body>
</html>
