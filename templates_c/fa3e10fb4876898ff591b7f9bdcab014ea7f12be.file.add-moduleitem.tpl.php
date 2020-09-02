<?php /* Smarty version Smarty-3.0.8, created on 2020-09-02 04:35:08
         compiled from "C:\xampp\htdocs\spe/modules/moduleitem/add-moduleitem.tpl" */ ?>
<?php /*%%SmartyHeaderCode:124425f4ebe8cd759e7-04154437%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fa3e10fb4876898ff591b7f9bdcab014ea7f12be' => 
    array (
      0 => 'C:\\xampp\\htdocs\\spe/modules/moduleitem/add-moduleitem.tpl',
      1 => 1598830372,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '124425f4ebe8cd759e7-04154437',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<div class="page-header">
  <h3>Add Modulte Item</h3>
</div>

<form class="form-horizontal" id="inputform" name="inputform" method="post" action="<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/moduleitem/validate">
  <div class="row">
    <div class="col-md-6">

      <div class="form-group">
        <label class="col-md-4 control-label" for="groupmenu">Group Menu</label>
        <div class="col-md-8">
          <select id="groupmenu" name="groupmenu" class="form-control">
          <?php  $_smarty_tpl->tpl_vars['obj'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('datagroupmenu')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['obj']->key => $_smarty_tpl->tpl_vars['obj']->value){
?>
            <option value="<?php echo $_smarty_tpl->tpl_vars['obj']->value['nama'];?>
"><?php echo $_smarty_tpl->tpl_vars['obj']->value['nama'];?>
</option>
          <?php }} ?>  
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 control-label" for="module">Module</label>
        <div class="col-md-8">
          <input type="text" name="module" id="module" placeholder="" class="form-control validate[required]" />
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 control-label" for="menu">Nama Menu</label>
        <div class="col-md-8">
          <input type="text" name="menu" id="menu" placeholder="" class="form-control validate[required]" />
        </div>
      </div>

      <div class="form-group">
        <label class="col-md-4 control-label" for="single_module">Modul Tunggal ?</label>
        <div class="col-md-8">
          <select name="single_module" id="single_module" class="form-control">
            <option value="1" <?php if ($_smarty_tpl->getVariable('data')->value['single_module']==0){?> selected="selected" <?php }?>>Ya</option>
            <option value="0" <?php if ($_smarty_tpl->getVariable('data')->value['single_module']==0){?> selected="selected" <?php }?>>Tidak, ada sub (view-add-edit-delete)</option>
          </select>
        </div>
      </div>

    </div>

    <div class="col-md-6">

       <div class="form-group">
        <label class="col-md-4 control-label" for="is_menu">Tampilkan sbg menu</label>
        <div class="col-md-8">
          <select name="is_menu" id="is_menu" class="form-control">
            <option value="1">Ya</option> 
            <option value="0">Tidak</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 control-label" for="urut">Urutan</label>
        <div class="col-md-8">
          <input type="text" name="urut" id="urut" placeholder="" class="form-control validate[required] angka" />
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 control-label" for="deskripsi">Deskripsi</label>
        <div class="col-md-8">
          <textarea id="deskripsi" name="deskripsi" class="form-control"></textarea>
        </div>
      </div>

    </div>

  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="box-footer" align="right">
          <button type="submit" class="btn btn-primary" name="btnSubmit">Simpan</button>
          <button type="button" class="btn btn-default" onclick="ajaxpage('<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/moduleitem', 'Data module item')" title="View Data"><i class="fa fa-list"></i></button>
      </div>
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
});

function submitForm(formElm){
  var konfirm = confirm('Yakin simpan data ini?');
  if(!konfirm){
    return;
  }  
  $.ajax({
    url : '<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/moduleitem/query-insert',	
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
		$(formElm)[0].reset();
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

