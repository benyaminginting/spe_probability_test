<div class="page-header">
  <h3>Edit Customer</h3>
</div>

<form class="form-horizontal" id="inputform" name="inputform" method="post" action="{$baseurl}/customer/validate">
<input type="hidden" id="id" name="id" value="{$data.id}"  />
<div class="row">
    <div class="col-md-6">

      <div class="form-group">
        <label class="col-md-4 control-label" for="username">Username/Email</label>
        <div class="col-md-8">
          <input type="text" name="username" id="username" placeholder="" value="{$data.username}" class="validate[required, custom[email]] form-control" />
        </div>
      </div> 

      <div class="form-group">
        <label for="password" class="col-md-4 control-label">Password</label>
        <div class="col-md-8">
          <input type="password" id="password" name="password" value="{$data.password}" class="form-control validate[required, minSize[6]]" value="{$data.password}" />
        </div>
      </div>

      <div class="form-group">
        <label for="password2" class="col-md-4 control-label">Re-type Password</label>
        <div class="col-md-8">
          <input type="password" id="password2" name="password2" value="{$data.password}" class="validate[required, equals[password]] form-control" value="{$data.password}" />
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-4 control-label" for="nama">Nama</label>
        <div class="col-md-8">
          <input type="text" name="nama" id="nama" placeholder="" value="{$data.nama}" class="form-control validate[required]" />
        </div>
      </div> 

      <div class="form-group">
        <label class="col-md-4 control-label" for="telpon">Telp</label>
        <div class="col-md-8">
          <input type="text" name="telpon" id="telpon" value="{$data.telpon}" placeholder="" class="form-control validate[]" />
        </div>
      </div>
    </div>

    <div class="col-md-6">

      <div class="form-group">
        <label class="col-md-4 control-label" for="kota">Kota</label>
        <div class="col-md-8">
          <input type="text" name="kota" id="kota" placeholder="" value="{$data.kota}" class="form-control validate[required]" />
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-4 control-label" for="alamat">Alamat</label>
        <div class="col-md-8">
          <textarea id="alamat" name="alamat" class="form-control validate[required]">{$data.alamat}</textarea>
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-4 control-label" for="kodepos">Kode Pos</label>
        <div class="col-md-8">
          <input type="text" name="kodepos" id="kodepos" placeholder="" value="{$data.kodepos}" class="form-control validate[required]" />
        </div>
      </div>


    </div>

    <div class="row">
      <div class="col-md-12">
        <div class="box-footer" align="right">
            <button type="submit" class="btn btn-primary" name="btnSubmit">Simpan</button>
            <button type="button" class="btn btn-default" onclick="ajaxpage('{$baseurl}/customer', 'Data Kategori Item Jurnal')" title="View Data"><i class="fa fa-list"></i></button>
        </div>
      </div>
    </div>

</div>
</form>
<!-- =================================================== -->

<script>
$(document).ready(function(){
  $("#inputform").validationEngine({
    ajaxFormValidation : true,
	onBeforeAjaxFormValidation : function(formElm){
	  disableThisForm(formElm);
	},
	onAjaxFormComplete : function(status, form, json, options){
	  activateThisForm(form);
	  if(status === true){
	    submitForm(form);
	  }
	}
  });
});

function submitForm(formElm){
  var konfirm = confirm('Yakin simpan data ini?');
  if(!konfirm){
    return false;
  }  
  $.ajax({
    url : '{$baseurl}/customer/query-update',	
    type:'POST',
	data : $(formElm).serialize(),
	beforeSend : function(){
	  disableThisForm(formElm);
	},
	complete : function(){
	  activateThisForm(formElm);
	},
	error : function(response){
	  toastr["error"](response.statusText);
	},
	success: function(response){
	  var result = $.trim(response);
	  if(result == 'berhasil'){
	    toastr["success"]("Berhasil disimpan.");
		//$(formElm)[0].reset();
	  }else{
	  	toastr["error"](response);
	  }
	}
  });
}
function disableThisForm(formElm){
	var btnsave = $(formElm).find("[type=submit]");
	btnsave.attr('disabled', 'disabled');
	$('#loader-form').show();
}
function activateThisForm(formElm){
	var btnsave = $(formElm).find("[type=submit]");
	btnsave.removeAttr('disabled', 'disabled');
	$('#loader-form').hide();
}
</script>

