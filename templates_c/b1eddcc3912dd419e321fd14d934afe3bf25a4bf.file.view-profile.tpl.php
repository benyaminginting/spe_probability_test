<?php /* Smarty version Smarty-3.0.8, created on 2020-08-31 06:58:04
         compiled from "C:\xampp\htdocs\spe\super/modules/profile/view-profile.tpl" */ ?>
<?php /*%%SmartyHeaderCode:176665f4c3d0c81eb25-07243324%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b1eddcc3912dd419e321fd14d934afe3bf25a4bf' => 
    array (
      0 => 'C:\\xampp\\htdocs\\spe\\super/modules/profile/view-profile.tpl',
      1 => 1598830375,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '176665f4c3d0c81eb25-07243324',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
   <div class="page-header">
     <h3>EDIT PROFILE</h3>
   </div>

<form class="form-horizontal" id="inputform" name="inputform" method="post" action="<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/user/validate">
<input type="hidden" id="id" name="id" value="<?php echo $_smarty_tpl->getVariable('data')->value['id'];?>
" />
  <div class="row">
    <div class="col-md-6">
        <div class="form-group">
          <label for="username" class="col-md-4 control-label">Username</label>
          <div class="col-md-8">
            <input type="text" id="username" name="username" class="validate[required] form-control" value="<?php echo $_smarty_tpl->getVariable('data')->value['username'];?>
" />
          </div>
        </div>

        <div class="form-group">
          <label for="password" class="col-md-4 control-label">Password</label>
          <div class="col-md-8">
            <input type="password" id="password" name="password" class="validate[required, minSize[6]] form-control" value="<?php echo $_smarty_tpl->getVariable('data')->value['password'];?>
" />
          </div>
        </div>
        
        <div class="form-group">
          <label for="password2" class="col-md-4 control-label">Re-type Password</label>
          <div class="col-md-8">
            <input type="password" id="password2" name="password2" class="validate[required, equals[password]] form-control" value="<?php echo $_smarty_tpl->getVariable('data')->value['password'];?>
" />
          </div>
        </div>

        <div class="form-group">
          <label for="nama" class="col-md-4 control-label">Nama</label>
          <div class="col-md-8">
            <input type="text" id="nama" name="nama" class="validate[] form-control" value="<?php echo $_smarty_tpl->getVariable('data')->value['nama'];?>
" />
          </div>
        </div>
        
        <div class="form-group">
          <label for="telp" class="col-md-4 control-label">Telp</label>
          <div class="col-md-8">
            <input type="text" id="telp" name="telp" class="validate[] form-control" value="<?php echo $_smarty_tpl->getVariable('data')->value['telp'];?>
" />
          </div>
        </div>

      <div class="box-footer">
          <button type="submit" class="btn btn-primary pull-right" name="btnSubmit">Simpan</button>
          
      </div>
   
    </div>
    <div class="col-md-6">
    
    </div>
  </div>
</form>
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
  //$('#berat').number(true, 2);
  //$('#disc').number(true, 2);
});

function submitForm(formElm){
  var konfirm = confirm('Yakin simpan data ini?');
  if(!konfirm){
    return false;
  }  
  $.ajax({
    url : '<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/profile/query-update',	
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

