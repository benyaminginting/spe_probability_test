  <form class="form-horizontal" id="inputform_popup" name="inputform" method="post" onsubmit="submitForm_popup()">
    <div class="row">

      <div class="col-md-12">
        
        <div class="form-group">
            <label class="col-md-4">Username</label>
            <div class="col-md-8">
              {$user.username}
              <input type="hidden" name="id" value="{$user.id}">
            </div>
        </div>
      </div>

    </div>

    <div class="row">
      <div class="col-md-12" align="center">
        <div class="box-footer" align="center">
            <button type="submit" class="btn btn-primary" >Submit</button>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-12">
        
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
                <tr>
                  <th>Kode Company</th>
                  <th>Nama Company</th>
                  <th><input id="checkall-gudang" type="checkbox" onchange="$('.check-gudang').prop('checked', $(this).prop('checked'));"></th>
                  </tr>
              </thead>
              <tbody>
              {foreach from=$data item=datagudang}
                <tr id="baris_{$gudang.id}">
                  <td>{$datagudang.kodegudang}</td>
                  <td>{$datagudang.namagudang}</td>
                  <td>
                    <input type="checkbox" class="check-gudang" name="gudang[{$datagudang.id}]" id="gudang_{$datagudang.id}" value="{$datagudang.kodegudang}"
                    {foreach from=$gudang item=gduser}
                        {if $gduser == $datagudang.kodegudang} checked="checked" {/if}
                    {/foreach}/>
                  </td>
                </tr>
              {/foreach}    
              </tbody>
          </table>

        </div>

      </div>

    </div>

  </form>


<script>
$(document).ready(function(){
  $("#inputform_popup").validationEngine({
    ajaxFormValidation : true,
  onBeforeAjaxFormValidation : function(formElm){
    disableThisForm(formElm);
  },
  onAjaxFormComplete : function(status, form, json, options){
    activateThisForm(form);
    if(status === true){
      submitForm_popup(form);
    }
  }
  });
});

function submitForm_popup(){
  var formElm = $('#inputform_popup');
  $.ajax({
    url : '{$baseurl}/user/setautorisasi', 
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
      //pesan di pop up
      toastr["success"]("berhasil di update");

    }else{
      toastr["error"](response);
    }
    $("#modal").modal("hide");
    izydata(0);
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
