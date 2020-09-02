<?php /* Smarty version Smarty-3.0.8, created on 2020-08-31 06:39:31
         compiled from "C:\xampp\htdocs\spe\super/modules/setting/post-setting.tpl" */ ?>
<?php /*%%SmartyHeaderCode:315165f4c38b3e2afc0-56778189%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ed02f317ba11f254f54a5c16331f188a68acee86' => 
    array (
      0 => 'C:\\xampp\\htdocs\\spe\\super/modules/setting/post-setting.tpl',
      1 => 1598830375,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '315165f4c38b3e2afc0-56778189',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<?php $_smarty_tpl->tpl_vars['allsettings'] = new Smarty_variable(json_decode($_smarty_tpl->getVariable('setting')->value['allsettings'],true), null, null);?>

   <div class="page-header">
     <h3>SETTINGS</h3>
   </div>

<form action="javascript:submitForm()" method="post" id="frmsetting" class="form-horizontal">
  <div class="nav-tabs-custom">  
    <ul class="nav nav-tabs" id="myTab">
      <li class="active"><a href="#tab-utama">Umum</a></li>
      <li><a href="#tab-kontak">Kontak</a></li>
      <li><a href="#tab-lainnya">Lainnya</a></li>
    </ul>
    
    <div class="tab-content">
      <div class="tab-pane active" id="tab-utama">
        <div class="row">
          <div class="col-md-6">
        <div class="form-group">
          <label for="nama" class="col-md-4 control-label">Nama</label>
          <div class="col-md-8">
            <input type="text" class="validate[required] form-control" value="<?php echo $_smarty_tpl->getVariable('setting')->value['nama'];?>
" id="nama" name="nama">
          </div>
        </div>
        <div class="form-group">
          <label for="pengumuman" class="col-md-4 control-label">Pengumuman</label>
          <div class="col-md-8">
            <textarea id="pengumuman" class="form-control" name="pengumuman"><?php echo $_smarty_tpl->getVariable('setting')->value['pengumuman'];?>
</textarea>
          </div>
        </div>
        <div class="form-group">
          <label for="maintenance" class="col-md-4 control-label">Status Website</label>
          <div class="col-md-8">
            <select id="maintenance" name="maintenance" class="form-control">
              <option value="online" <?php if ($_smarty_tpl->getVariable('setting')->value['maintenance']=="online"){?> selected="selected" <?php }?>>Website Online</option>
              <option value="offline" <?php if ($_smarty_tpl->getVariable('setting')->value['maintenance']=="offline"){?> selected="selected" <?php }?>>Maintenance</option>
            </select>
          </div>
        </div>        
        <div class="form-group">
          <label for="favico" class="col-md-4 control-label">Favico</label>
          <div class="col-md-8">
            <div class="input-group">
              <input type="text" value="<?php echo str_replace('[baseurlroot]',$_smarty_tpl->getVariable('baseurlroot')->value,$_smarty_tpl->getVariable('setting')->value['favico']);?>
"  class="favico form-control" id="favico" name="favico">
              <span class="input-group-btn">
              	<a href="javascript:browseImage('favico');" class="btn btn-default" title="browse"><i class="fa fa-folder-open"></i></a>
              </span>
            </div>
          </div>
        </div>
                        
        <div class="form-group">
          <label for="logo" class="col-md-4 control-label">Logo</label>
          <div class="col-md-8">
          <div class="input-group">
          <input type="text" value="<?php echo str_replace('[baseurlroot]',$_smarty_tpl->getVariable('baseurlroot')->value,$_smarty_tpl->getVariable('setting')->value['logo']);?>
" class="logo form-control" id="logo" name="logo">
          <span class="input-group-btn">
          <a href="javascript:browseImage('logo');" class="btn btn-default" title="browse"><i class="fa fa-folder-open"></i></a>
          </span>
          </div>
          </div>
        </div>
          
          </div>
          <div class="col-md-6">
        <div class="form-group">
          <label for="metatitle" class="col-md-4 control-label">Meta Title</label>
          <div class="col-md-8">
            <textarea id="metatitle" class="validate[required] form-control" name="metatitle"><?php echo $_smarty_tpl->getVariable('setting')->value['metatitle'];?>
</textarea>
          </div>
        </div>
        <div class="form-group">
          <label for="metakey" class="col-md-4 control-label">Meta Keyword</label>
          <div class="col-md-8">
            <textarea id="metakey" class="validate[] form-control" name="metakey"><?php echo $_smarty_tpl->getVariable('setting')->value['metakey'];?>
</textarea>
          </div>
        </div>
        <div class="form-group">
          <label for="metadesc" class="col-md-4 control-label">Meta Description</label>
          <div class="col-md-8">
            <textarea id="metadesc" class="validate[] form-control" name="metadesc"><?php echo $_smarty_tpl->getVariable('setting')->value['metadesc'];?>
</textarea>
          </div>
        </div>
        <div class="form-group">
          <label for="setadd" class="col-md-4 control-label">Additional Image</label>
          <div class="col-md-8">
            <div class="radio">
              <label><input type="radio" name="setadd" id="setadd_1" value="1" <?php if ($_smarty_tpl->getVariable('setting')->value['setadd']==1){?> checked="checked" <?php }?> /> Ya</label>
            </div>
            <div class="radio">
              <label><input type="radio" name="setadd" id="setadd_0" value="0" <?php if ($_smarty_tpl->getVariable('setting')->value['setadd']==0){?> checked="checked" <?php }?> /> Tidak</label>
            </div>
          </div>
        </div>
          </div>
        </div>
      </div>
      <div class="tab-pane" id="tab-kontak">
        <div class="row">
          <div class="col-md-6">
        <div class="form-group">
          <label for="alamat" class="col-md-4 control-label">Alamat</label>
          <div class="col-md-8">
            <textarea id="alamat" name="alamat" class=" form-control"><?php echo $_smarty_tpl->getVariable('setting')->value['alamat'];?>
</textarea>
          </div>
        </div>
        <div class="form-group">
          <label for="kota" class="col-md-4 control-label">Kota</label>
          <div class="col-md-8">
            <input type="text" value="<?php echo $_smarty_tpl->getVariable('setting')->value['kota'];?>
" id="kota" name="kota" class="validate[] form-control">
          </div>
        </div>
        <div class="form-group">
          <label for="email" class="col-md-4 control-label">Email</label>
          <div class="col-md-8">
            <input type="text" value="<?php echo $_smarty_tpl->getVariable('setting')->value['email'];?>
" id="email" name="email" class="validate[custom[email]] form-control">
          </div>
        </div>
        <div class="form-group">
          <label for="telpon" class="col-md-4 control-label">Telpon</label>
          <div class="col-md-8">
            <input type="text" value="<?php echo $_smarty_tpl->getVariable('setting')->value['telpon'];?>
" class="validate[required] form-control" id="telpon" name="telpon">
          </div>
        </div>
        
          </div>
          <div class="col-md-6">
        <div class="form-group">
          <label for="facebook" class="col-md-4 control-label">Facebook</label>
          <div class="col-md-8">
            <input type="text" value="<?php echo $_smarty_tpl->getVariable('setting')->value['facebook'];?>
" class="validate[] form-control" id="facebook" name="facebook">
          </div>
        </div>
        <div class="form-group">
          <label for="twitter" class="col-md-4 control-label">Twitter</label>
          <div class="col-md-8">
            <input type="text" value="<?php echo $_smarty_tpl->getVariable('setting')->value['twitter'];?>
" class=" form-control" id="twitter" name="twitter">
          </div>
        </div>
          </div>
        </div>
      </div>
      
      
      <div class="tab-pane" id="tab-lainnya">
        <div class="row">
          <div class="col-md-6">
        <div class="form-group">
          <label for="" class="col-md-4 control-label">Ukuran gambar produk</label>
          <div class="col-md-8">
          <div class="row">
           <div class="col-xs-6">
            <input type="text" class="validate[required] form-control" name="image_product_width" id="image_product_width" placeholder="Lebar" value="<?php echo $_smarty_tpl->getVariable('allsettings')->value['image_product_width'];?>
" />
           </div>
           <div class="col-xs-6"> 
            <input type="text" class="validate[required] form-control" name="image_product_height" id="image_product_height" placeholder="Tinggi" value="<?php echo $_smarty_tpl->getVariable('allsettings')->value['image_product_height'];?>
" />
           </div> 
          </div>
          </div>
        </div>
        <div class="form-group">
          <label for="alamat" class="col-md-4 control-label">Ukuran gambar banner</label>
          <div class="col-md-8">
          <div class="row">
           <div class="col-xs-6"> 
            <input type="text" class="validate[required] input-mini form-control" name="image_banner_width" id="image_banner_width" placeholder="Lebar" value="<?php echo $_smarty_tpl->getVariable('allsettings')->value['image_banner_width'];?>
" />
           </div>
           <div class="col-xs-6"> 
            <input type="text" class="validate[required] input-mini form-control" name="image_banner_height" id="image_banner_height" placeholder="Tinggi" value="<?php echo $_smarty_tpl->getVariable('allsettings')->value['image_banner_height'];?>
" />
           </div>
          </div>
          </div>
        </div>
        <div class="form-group">
          <label for="path_user" class="col-md-4 control-label">Pilih template</label>
          <div class="col-md-8">
            <select name="path_user" id="path_user" class="form-control">
            <?php  $_smarty_tpl->tpl_vars['namatemplate'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('datatemplate')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if ($_smarty_tpl->_count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['namatemplate']->key => $_smarty_tpl->tpl_vars['namatemplate']->value){
?>
              <option value="<?php echo $_smarty_tpl->tpl_vars['namatemplate']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['namatemplate']->value;?>
</option>
            <?php }} ?>  
            </select>
          </div>
        </div>
        <div class="form-group">
          <label for="gratisongkir" class="col-md-4 control-label">Gratis Ongkir Belanja Minimum</label>
          <div class="col-md-3">
            <div class="radio">
              <label><input type="radio" name="gratisongkir" id="gratisongkir_1" value="1" <?php if ($_smarty_tpl->getVariable('allsettings')->value['gratisongkir']==1){?> checked="checked" <?php }?> /> Ya</label>
            </div>
            <div class="radio">
              <label><input type="radio" name="gratisongkir" id="gratisongkir_0" value="0" <?php if ($_smarty_tpl->getVariable('allsettings')->value['gratisongkir']==0){?> checked="checked" <?php }?> /> Tidak</label>
            </div>
          </div>
          <div class="col-md-5">
            <div class="input-group">
              <div class="input-group-addon">Rp</div>
              <input type="text" value="<?php echo $_smarty_tpl->getVariable('allsettings')->value['belanjaminimum'];?>
" class="validate[] form-control angka" id="belanjaminimum" name="belanjaminimum">
            </div>
          </div>

        </div>
         
          </div>
          
          <div class="col-md-6">
        <div class="form-group">
          <label for="script_head" class="col-md-4 control-label">Script &lt;head&gt;</label>
          <div class="col-md-8">
            <textarea id="script_head" name="script_head" placeholder="Sisip skrip html di dalam tag head" class=" form-control"><?php echo $_smarty_tpl->getVariable('allsettings')->value['script_head'];?>
</textarea>
          </div>
        </div>
        <div class="form-group">
          <label for="script_body" class="col-md-4 control-label">Script &lt;body&gt;</label>
          <div class="col-md-8">
            <textarea id="script_body" name="script_body"  placeholder="Sisip skrip html di dalam tag body" class=" form-control"><?php echo $_smarty_tpl->getVariable('allsettings')->value['script_body'];?>
</textarea>
          </div>
        </div>
          </div>
        </div>
      </div>
    
    </div>
  </div>  
   
   <div class="box-footer">
    <div class="form-group">
      <div class="controls">
        <button class="btn btn-primary pull-right" type="submit">Simpan</button>
      </div>
    </div>        
   </div>
</form>

<style>
.tab-content{
overflow:hidden;
}
.nav-tabs{
border:1px thin #000;;
}
</style>
<script>
  $('#myTab a').click(function(e) {
	e.preventDefault();
	$(this).tab('show');
  });
</script>

<script>
function browseImage(field_id){
	var url = "<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/assets/responsive_filemanager/filemanager/dialog.php?type=1&popup=1&field_id=" + field_id;
	var browseWindow = window.open(url, 'Browse Gambar','toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=900,height=500');
	browseWindow.focus();
}
</script>
<script>
$(document).ready(function(){
  $('#frmsetting').validationEngine();
  $('#gratisongkir_0').click(function(){
    $('#belanjaminimum').attr('readonly', true);
    $('#belanjaminimum').val('');
  })
  $('#gratisongkir_1').click(function(){
    $('#belanjaminimum').attr('readonly', false);
  })
  
});
function submitForm(){
  var formElm = $('#frmsetting');
  $.ajax({	
    type:'POST',
	url : '<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/setting/query-update',
	data : formElm.serialize(),
	beforeSend : function(){
	  disableForm(formElm);
	},
	complete : function(){
	  activateForm(formElm);
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
function disableForm(formElm){
	var btnsave = $(formElm).find("[type=submit]");
	btnsave.attr('disabled', 'disabled');
	$('#loader-form').show();
}
function activateForm(formElm){
	var btnsave = $(formElm).find("[type=submit]");
	btnsave.removeAttr('disabled', 'disabled');
	$('#loader-form').hide();
}
</script>