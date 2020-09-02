<!DOCTYPE html>
<html lang="en">
<head>
{include file = "templates/$path_user/common/header.tpl"}
<body>
{include file = "templates/$path_user/common/top-body.tpl"}

<!-- validation engine -->
<script src="{$baseurl}/templates/{$path_user}/assets/plugins/validation/js/jquery.validationEngine.js"></script>
<script src="{$baseurl}/templates/{$path_user}/assets/plugins/validation/js/languages/jquery.validationEngine-en.js"></script>
<link rel="stylesheet" type="text/css" href="{$baseurl}/templates/{$path_user}/assets/plugins/validation/css/validationEngine.jquery.css">

<script>
$(document).ready(function(){
initUpdateForm();
});

function initUpdateForm(){
  $("#formUpdate").validationEngine({
    ajaxFormValidation : true,
	ajaxFormValidationMethod : 'POST',
	onBeforeAjaxFormValidation : function(formElm){
	  disableThisForm(formElm);
	},
	onAjaxFormComplete : function(status, form, json, options){
	  activateThisForm(form);
	  
	  //-- tampilkan pesan error nya.
	  $.each(json, function(key, value){
	  	if(value[1] == false){
		  toastr["error"](value[2]);
		}
	  });
	  
	  if(status === true){
      toastr["success"]('Akun anda berhasil didaftarkan.');
		// window.location = baseurl;
	  }
	}
  });
}


</script>

<div class="container">
  <div class="row">
    <div class="col-md-3"> 
    	{include file = "templates/$path_user/common/side-body-left.tpl"} 
    </div>
    <div class="col-md-9 padding-right">
    	<div class="blog-post-area">
		  <h2 class="title text-center">Update Your Profile</h2>

			<!-- isi konten page -->
			<div class="single-blog-post">
			  <form action="{$baseurl}/customer/update" id="formUpdate" name="formUpdate" class="form-horizontal">

			  <div class="form-group">
			    <label for="nama" class="col-sm-2 control-label">Full Name.</label>
			    <div class="col-sm-10">
			      <input type="text" name="nama" id="nama" class="validate[required] form-control" value="{$profile.nama}"/>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="username" class="col-sm-2 control-label">Email Address.</label>
			    <div class="col-sm-10">
			      <input type="text" name="username" id="username" class="validate[required, custom[email]] form-control" value="{$profile.email}" readonly="readonly" disabled="disabled"/>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="alamat" class="col-sm-2 control-label">Address.</label>
			    <div class="col-sm-10">
			      <input type="text" name="alamat" id="alamat" class="validate[required] form-control" value="{$profile.alamat}" />
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="kota" class="col-sm-2 control-label">Town.</label>
			    <div class="col-sm-10">
			      <input type="text" name="kota" id="kota" class="validate[required] form-control" value="{$profile.kota}" >
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="kodepos" class="col-sm-2 control-label">Postal Code.</label>
			    <div class="col-sm-10">
			      <input type="text" name="kodepos" id="kodepos" class="validate[required] form-control" value="{$profile.kodepos}" />
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="phone" class="col-sm-2 control-label">Phone.</label>
			    <div class="col-sm-10">
			      <input type="text" name="phone" id="phone" class="validate[required] form-control" value="{$profile.telpon}" />
			    </div>
			  </div>

			  <div class="form-group">
			    <label for="password" class="col-sm-2 control-label">Password.</label>
			    <div class="col-sm-10">
			      <input type="password" name="password" id="password" class="validate[required, minSize[6]] form-control" value="{$profile.password}" />
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">Confirm Password</label>
			    <div class="col-sm-10">
			      <input type="password" name="password2" id="password2" class="validate[required, equals[password]] form-control" value="{$profile.password}" />
			    </div>
			  </div>

			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
					<button type="submit" name="simpan" id="simpan" value="simpan" class="btn btn-primary">Submit</button>
			    </div>
			  </div>

			</form>
		</div>

	</div>


    </div>
  </div>
</div>
{include file = "templates/$path_user/common/bottom-body.tpl"}

</body>
</html>
