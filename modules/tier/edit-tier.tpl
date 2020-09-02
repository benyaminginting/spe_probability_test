<div class="page-header">
  <h3>Edit Tier</h3>
</div>
<form class="form-horizontal" id="inputform" name="inputform" method="post" action="{$baseurl}/tier/validate">
<input type="hidden" name="id" id="id" value="{$data.id}" />

<div class="row">

  <div class="col-md-6">

    {* asdasdasdasdasdas *}

    <div class="form-group">
      <label class="control-label col-md-4" for="min">Minimum price</label>
      <div class="col-md-8">
        <input type="text" id="min" name="min" class="validate[required] form-control angka" value="{$data.min}" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-4" for="max">Maximum price</label>
      <div class="col-md-8">
        <input type="text" id="max" name="max" class="validate[required] form-control angka" value="{$data.max}" />
      </div>
    </div>

    
    <div class="form-group">
      <label class="control-label col-md-4" for="prob">Probability</label>
      <div class="col-md-8">
        <input type="text" id="prob" name="prob" class="validate[required] form-control angka" value="{$data.prob}" />
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-4" for="disc_rate">Disc. Rate</label>
      <div class="col-md-8">
        <input type="text" id="disc_rate" name="disc_rate" class="validate[required] form-control angka" value="{$data.disc_rate}" />
      </div>
    </div>
    
    <div class="box-footer" align="right">
        <button type="submit" class="btn btn-primary" name="btnSubmit">Simpan</button>
        <button type="button" class="btn btn-default" onclick="ajaxpage('{$baseurl}/tier', 'Data Tier')" title="View Data"><i class="fa fa-list"></i></button>
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
    url : '{$baseurl}/tier/query-update', 
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