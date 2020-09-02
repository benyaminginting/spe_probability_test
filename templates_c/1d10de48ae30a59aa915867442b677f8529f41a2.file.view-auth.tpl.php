<?php /* Smarty version Smarty-3.0.8, created on 2020-08-31 06:55:03
         compiled from "C:\xampp\htdocs\spe\super/modules/auth/view-auth.tpl" */ ?>
<?php /*%%SmartyHeaderCode:168685f4c3c57805e12-11889688%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1d10de48ae30a59aa915867442b677f8529f41a2' => 
    array (
      0 => 'C:\\xampp\\htdocs\\spe\\super/modules/auth/view-auth.tpl',
      1 => 1598830370,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '168685f4c3c57805e12-11889688',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<div class="page-header">
  <h3>Otorisasi</h3>
</div>

<form class="form-horizontal" id="inputform" name="inputform" method="post" action="<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/auth/validate">
<div class="row">
    <div class="col-md-6">
      
      <div class="form-group">
        <label class="control-label col-md-4" for="idgrupuser">Pilih Grup User</label>
        <div class="col-md-8">
          <select id="idgrupuser" name="idgrupuser" onchange="loadModulAdmin()" class="form-control">
          <?php  $_smarty_tpl->tpl_vars['obj'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('datagrupuser')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['obj']->key => $_smarty_tpl->tpl_vars['obj']->value){
?>
            <option value="<?php echo $_smarty_tpl->tpl_vars['obj']->value['id'];?>
" <?php if ($_smarty_tpl->tpl_vars['obj']->value['id']==$_smarty_tpl->getVariable('selectedgrup')->value['id']){?> selected="selected" <?php }?> ><?php echo $_smarty_tpl->tpl_vars['obj']->value['grupuser'];?>
</option>
          <?php }} ?>  
          </select>
        </div>
      </div>

      <div class="box-footer" align="right">
          <button type="submit" class="btn btn-primary" name="btnSubmit">Simpan</button>
      </div>
    </div>
    <div class="col-md-6">
      
      
      
    </div>
  </div>
 
 
  
  
  <div class="row">
    <div class="table-responsive">
      <table id="view-auth-table" class="table table-hover table-bordered table-condensed">
        <thead>
          <tr>
            <th width="25">
              <label class="" title="Pilih Semua">
                <input type="checkbox" onchange="$('#view-auth-table input[type=checkbox]').prop('checked', $(this).prop('checked'));" id="checkall" title="Pilih Semua" />
              </label>
            </th>
            <th>Grup</th>
            <th>Module</th>
            <th width="85">
              <label class="" title="Pilih Semua - View">
                <input type="checkbox" onchange="$('.kolom-view').prop('checked', $(this).prop('checked'));">
				<b>View</b>
			  </label>
			</th>
            <th width="85">
              <label class="" title="Pilih Semua - Add">
                <input type="checkbox" onchange="$('.kolom-add').prop('checked', $(this).prop('checked'));">
				<b>Add</b>
			  </label>
			</th>
            <th width="85">
              <label class=""  title="Pilih Semua - Edit">
                <input type="checkbox" onchange="$('.kolom-edit').prop('checked', $(this).prop('checked'));">
				<b>Edit</b>
			  </label>
			</th>
            <th width="85">
              <label class=""  title="Pilih Semua - Delete">
                <input type="checkbox"  onchange="$('.kolom-delete').prop('checked', $(this).prop('checked'));">
				<b>Delete</b>
			  </label>
			</th>
          </tr>
        </thead>
        <tbody>
        <?php $_smarty_tpl->tpl_vars['urutbaris'] = new Smarty_variable(1, null, null);?>
        <?php  $_smarty_tpl->tpl_vars['modul'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('datamodule')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['modul']->key => $_smarty_tpl->tpl_vars['modul']->value){
?>
          <tr id="baris-<?php echo $_smarty_tpl->getVariable('urutbaris')->value;?>
">
            <td>
              <label class=""><input type="checkbox" class="check-baris" onchange="$('.kolom-baris-<?php echo $_smarty_tpl->getVariable('urutbaris')->value;?>
').prop('checked', $(this).prop('checked'));" /></label>
              <input type="hidden" name="idmodul[<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
]" id="idmodul_<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
" value="<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
" />
            </td>
            <td><?php echo $_smarty_tpl->tpl_vars['modul']->value['groupmenu'];?>
</td>
            <td><?php echo $_smarty_tpl->tpl_vars['modul']->value['menu'];?>
</td>
            <td>
              <label class="checkbox" title="View - <?php echo $_smarty_tpl->tpl_vars['modul']->value['menu'];?>
">
                <input type="checkbox" class="kolom-baris-<?php echo $_smarty_tpl->getVariable('urutbaris')->value;?>
 kolom-view" value="1" name="is_can_view[<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
]" id="is_can_view_<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
" />
              </label>
            </td>
            <td>
              <label class="checkbox" title="Add - <?php echo $_smarty_tpl->tpl_vars['modul']->value['menu'];?>
">
                <input type="checkbox" class="kolom-baris-<?php echo $_smarty_tpl->getVariable('urutbaris')->value;?>
 kolom-add single_module-<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
" value="1" name="is_can_insert[<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
]" id="is_can_insert_<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
" />
              </label>
            </td>
            <td>
              <label class="checkbox"  title="Edit - <?php echo $_smarty_tpl->tpl_vars['modul']->value['menu'];?>
">
                <input type="checkbox" class="kolom-baris-<?php echo $_smarty_tpl->getVariable('urutbaris')->value;?>
 kolom-edit single_module-<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
" value="1" name="is_can_update[<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
]" id="is_can_update_<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
" />
              </label>
            </td>
            <td>
              <label class="checkbox"  title="Delete - <?php echo $_smarty_tpl->tpl_vars['modul']->value['menu'];?>
">
                <input type="checkbox" class="kolom-baris-<?php echo $_smarty_tpl->getVariable('urutbaris')->value;?>
 kolom-delete single_module-<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
" value="1" name="is_can_delete[<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
]" id="is_can_delete_<?php echo $_smarty_tpl->tpl_vars['modul']->value['id'];?>
" />
              </label>
            </td>
          </tr>
          <?php $_smarty_tpl->tpl_vars['urutbaris'] = new Smarty_variable($_smarty_tpl->getVariable('urutbaris')->value+1, null, null);?>
        <?php }} ?>
        </tbody>
      </table>
    </div>
  </div>
</form>

<style>
#inputform input[type="checkbox"]{
margin:0;
padding:0;
}
#inputform label{
margin-bottom:0;
}
</style>
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
  $('#checkall').change(function(){
	//console.log($(this).prop('checked')); 
  });
  loadModulAdmin();
});

function loadModulAdmin(){
  var formElm = $('#inputform');
  $.ajax({
	type : 'POST',
	url : '<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/auth/data',
	data : {
	  'idgrupuser' : $('#idgrupuser').val()
	},
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
	  var result = $.parseJSON(response);
	  $('#view-auth-table input[type=checkbox]').prop('checked', false);
	  $.each(result.data, function(key, value){
		  $('#is_can_view_'+value.idmodul).prop('checked', (value.is_can_view == 1)? true : false);
		  $('#is_can_insert_'+value.idmodul).prop('checked', (value.is_can_insert == 1)? true : false);
		  $('#is_can_update_'+value.idmodul).prop('checked', (value.is_can_update == 1)? true : false);
		  $('#is_can_delete_'+value.idmodul).prop('checked', (value.is_can_delete == 1)? true : false);
		  
		  $('.single_module-'+value.idmodul).removeAttr('disabled', 'disabled');
		  $('.single_module-'+value.idmodul).show();
		  if(value.single_module == 1){	
		    $('.single_module-'+value.idmodul).attr('disabled', 'disabled');
			$('.single_module-'+value.idmodul).hide();
		  }
	  });
	}
  });	
}


function submitForm(formElm){
  var konfirm = confirm('Yakin simpan data ini?');
  if(!konfirm){
    return;
  }  
  $.ajax({
    url : '<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/auth/query-update',	
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

