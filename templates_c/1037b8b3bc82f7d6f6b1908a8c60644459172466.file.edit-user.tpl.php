<?php /* Smarty version Smarty-3.0.8, created on 2020-09-02 04:34:28
         compiled from "C:\xampp\htdocs\spe/modules/user/edit-user.tpl" */ ?>
<?php /*%%SmartyHeaderCode:280925f4ebe648b0489-04859071%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1037b8b3bc82f7d6f6b1908a8c60644459172466' => 
    array (
      0 => 'C:\\xampp\\htdocs\\spe/modules/user/edit-user.tpl',
      1 => 1598830376,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '280925f4ebe648b0489-04859071',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<div class="page-header">
  <h3>Edit User</h3>
</div>
<form class="form-horizontal" id="inputform" name="inputform" method="post" action="<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/user/validate">
<input type="hidden" name="id" id="id" value="<?php echo $_smarty_tpl->getVariable('data')->value['id'];?>
" />

<div class="row">

  <div class="col-md-6">
    
    <div class="form-group">
      <label class="control-label col-md-4" for="grupuser">Grup user</label>
      <div class="col-md-8">
        <select name="grupuser" id="grupuser" class="validate[required] form-control">
          <option value="">--Pilih Grup user</option>
          <?php  $_smarty_tpl->tpl_vars['grup'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('datagrupuser')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['grup']->key => $_smarty_tpl->tpl_vars['grup']->value){
?>  
            <option value="<?php echo $_smarty_tpl->tpl_vars['grup']->value['grupuser'];?>
" <?php if ($_smarty_tpl->getVariable('data')->value['grupuser']==$_smarty_tpl->tpl_vars['grup']->value['grupuser']){?> selected="selected" <?php }?>><?php echo $_smarty_tpl->tpl_vars['grup']->value['grupuser'];?>
</option>
          <?php }} ?>
        </select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-md-4" for="username">Username</label>
      <div class="col-md-8">
        <input type="text" id="username" name="username" class="validate[required] form-control" value="<?php echo $_smarty_tpl->getVariable('data')->value['username'];?>
" />
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-md-4" for="password">Password</label>
      <div class="col-md-8">
        <input type="password" id="password" name="password" class="validate[required, minSize[6]] form-control" value="<?php echo $_smarty_tpl->getVariable('data')->value['password'];?>
" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-4" for="password2">Re-type Password</label>
      <div class="col-md-8">
        <input type="password" id="password2" name="password2" class="validate[required, equals[password]] form-control" value="<?php echo $_smarty_tpl->getVariable('data')->value['password'];?>
" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-4" for="nama">Nama</label>
      <div class="col-md-8">
        <input type="text" id="nama" name="nama" class="validate[] form-control" value="<?php echo $_smarty_tpl->getVariable('data')->value['nama'];?>
" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-4" for="telp">Telp</label>
      <div class="col-md-8">
        <input type="text" id="telp" name="telp" class="validate[] form-control" value="<?php echo $_smarty_tpl->getVariable('data')->value['telp'];?>
" />
      </div>
    </div>
    
    <div class="box-footer" align="right">
        <button type="submit" class="btn btn-primary" name="btnSubmit">Simpan</button>
        <button type="button" class="btn btn-default" onclick="ajaxpage('<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/user', 'Data User')" title="View Data"><i class="fa fa-list"></i></button>
    </div>

  </div>

  <div class="col-md-6">
     
  </div>

</div>

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
    url : '<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/user/query-update', 
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