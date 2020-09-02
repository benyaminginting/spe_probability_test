<div class="page-header">
  <h3>Edit Menu</h3>
</div>

<form class="form-horizontal" id="inputform" name="inputform" method="post" action="{$baseurl}/menu/validate">
  <input type="hidden" id="id" name="id" value="{$data.id}" />
  <div class="row">
    <div class="col-md-6">

      <div class="form-group">
        <label for="parentid" class="col-md-4 control-label">Sub-menu</label>
        <div class="col-md-8">
          <select name="parentid" id="parentid" class="form-control">
            <option value="">--Pilih Submenu</option>
          {foreach from=$dataparentmenu item=data_menu}  
            <option  {if $data.parent_id == $data_menu.id} selected="selected" {/if} value="{$data_menu.id}">{$data_menu.name}</option>
          {/foreach}
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <label for="name" class="col-md-4 control-label">Nama Menu</label>
        <div class="col-md-8">
          <input type="text" id="name" name="name" value="{$data.name}" class="form-control validate[required]" />
        </div>
      </div>

      <div class="form-group">
        <label for="url" class="col-md-4 control-label">url</label>
        <div class="col-md-8">
          <input type="text" id="url" name="url" value="{$data.url}" class="form-control" />
        </div>
      </div>

      <div class="form-group">
        <label for="urutan" class="col-md-4 control-label">Urutan</label>
        <div class="col-md-8">
          <input type="text" id="urutan" name="urutan" value="{$data.urut}" class="form-control" />
        </div>
      </div>
      
      <div class="form-group">
        <label for="status" class="col-md-4 control-label">Status</label>
        <div class="col-md-8">
          <select name="status" id="status" class="form-control validate[required]">
            <option {if $data.status == 1} selected="selected" {/if} value="1">Aktif</option>
            <option {if $data.status == 0} selected="selected" {/if} value="0">Tidak Aktif</option>
          </select>
        </div>
      </div>
      
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="box-footer" align="right">
          <button type="submit" class="btn btn-primary" name="btnSubmit">Simpan</button>
          <button type="button" class="btn btn-default" onclick="ajaxpage('{$baseurl}/menu', 'Data Menu')" title="View Data"><i class="fa fa-list"></i></button>
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
  //$('#berat').number(true, 2);
  //$('#disc').number(true, 2);
});

function submitForm(formElm){
  var konfirm = confirm('Yakin simpan data ini?');
  if(!konfirm){
    return false;
  }  
  $.ajax({
    url : '{$baseurl}/menu/query-update',	
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

