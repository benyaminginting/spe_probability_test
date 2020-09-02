<?php /* Smarty version Smarty-3.0.8, created on 2020-09-02 04:54:36
         compiled from "C:\xampp\htdocs\spe/modules/tier/add-tier.tpl" */ ?>
<?php /*%%SmartyHeaderCode:173155f4ec31c8f29a0-85845221%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'db54df67562bc445a2fff0070a6ac5f80094748a' => 
    array (
      0 => 'C:\\xampp\\htdocs\\spe/modules/tier/add-tier.tpl',
      1 => 1598995823,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '173155f4ec31c8f29a0-85845221',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<div class="page-header">
  <h3>Add Tier</h3>
</div>
<form class="form-horizontal" id="inputform" name="inputform" method="post" action="<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/tier/validate">

<div class="row">

  <div class="col-md-6">
    
    <div class="form-group">
      <label class="control-label col-md-4" for="min">Minimum price</label>
      <div class="col-md-8">
        <input type="text" id="min" name="min" class="validate[required] form-control angka" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-4" for="max">Maximum price</label>
      <div class="col-md-8">
        <input type="text" id="max" name="max" class="validate[required] form-control angka" />
      </div>
    </div>

    
    <div class="form-group">
      <label class="control-label col-md-4" for="prob">Probability</label>
      <div class="col-md-8">
        <input type="text" id="prob" name="prob" class="validate[required] form-control angka" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-4" for="disc_rate">Disc. Rate</label>
      <div class="col-md-8">
        <input type="text" id="disc_rate" name="disc_rate" class="validate[required] form-control angka" />
      </div>
    </div>
    
    
    <div class="box-footer" align="right">
        <button type="submit" class="btn btn-primary" name="btnSubmit">Simpan</button>
        <button type="button" class="btn btn-default" onclick="ajaxpage('<?php echo $_smarty_tpl->getVariable('baseurl')->value;?>
/tier', 'Data Tier')" title="View Data"><i class="fa fa-list"></i></button>
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
/tier/query-insert', 
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