<div class="page-header">
  <h3>Add Modulte Item</h3>
</div>

<form class="form-horizontal" id="inputform" name="inputform" method="post" action="{$baseurl}/moduleitem/validate">
  <div class="row">
    <div class="col-md-6">

      <div class="form-group">
        <label class="col-md-4 control-label" for="groupmenu">Group Menu</label>
        <div class="col-md-8">
          <select id="groupmenu" name="groupmenu" class="form-control">
          {foreach from=$datagroupmenu item=obj}
            <option value="{$obj.nama}">{$obj.nama}</option>
          {/foreach}  
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
            <option value="1" {if $data.single_module == 0} selected="selected" {/if}>Ya</option>
            <option value="0" {if $data.single_module == 0} selected="selected" {/if}>Tidak, ada sub (view-add-edit-delete)</option>
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
          <button type="button" class="btn btn-default" onclick="ajaxpage('{$baseurl}/moduleitem', 'Data module item')" title="View Data"><i class="fa fa-list"></i></button>
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
    url : '{$baseurl}/moduleitem/query-insert',	
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

