<div class="page-header">
  <h3>Add User</h3>
</div>
<form class="form-horizontal" id="inputform" name="inputform" method="post" action="{$baseurl}/user/validate">

<div class="row">

  <div class="col-md-6">
    
    <div class="form-group">
      <label class="control-label col-md-4" for="grupuser">Grup user</label>
      <div class="col-md-8">
        <select name="grupuser" id="grupuser" class="validate[required] form-control">
          <option value="">--Pilih Grup user</option>
          {foreach from=$datagrupuser item=grup}  
            <option value="{$grup.grupuser}">{$grup.grupuser}</option>
          {/foreach}
        </select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-md-4" for="username">Username</label>
      <div class="col-md-8">
        <input type="text" id="username" name="username" class="validate[required] form-control" />
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-md-4" for="password">Password</label>
      <div class="col-md-8">
        <input type="password" id="password" name="password" class="validate[required, minSize[6]] form-control"/>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-4" for="password2">Re-type Password</label>
      <div class="col-md-8">
        <input type="password" id="password2" name="password2" class="validate[required, equals[password]] form-control"/>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-4" for="nama">Nama</label>
      <div class="col-md-8">
        <input type="text" id="nama" name="nama" class="validate[] form-control"/>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-4" for="telp">Telp</label>
      <div class="col-md-8">
        <input type="text" id="telp" name="telp" class="validate[] form-control"/>
      </div>
    </div>
    
    <div class="box-footer" align="right">
        <button type="submit" class="btn btn-primary" name="btnSubmit">Simpan</button>
        <button type="button" class="btn btn-default" onclick="ajaxpage('{$baseurl}/user', 'Data User')" title="View Data"><i class="fa fa-list"></i></button>
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
    url : '{$baseurl}/user/query-insert', 
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

<!-- ============================================================================================================= -->