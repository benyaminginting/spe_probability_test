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
initRegistrationForm();
initLoginForm();
initForgetPassForm();
});

function initRegistrationForm(){
  var insertCustomer = function(){
	  $.ajax({
	  	url : '{$baseurl}/customer/insert',
		type: 'POST',
		data : $('#frmregister').serialize(),
		beforeSend:function(){
			disableThisForm($('#frmregister'));
		},
		complete : function(){
			activateThisForm($('#frmregister'));
		},
		error : function(respon){
		  toastr["error"](respon);
		},
		success: function(response){
			var result = $.trim(response);
			if(result == 'OK'){
				toastr["success"]('Akun anda berhasil didaftarkan.');
				$("#frmregister").css("display", "none");
				$("#registrasiSukses").css("display", "block");
			}else{
				toastr["error"](result);
			}
		}
	  
	  });  
  }
  $("#frmregister").validationEngine({
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
		  return insertCustomer();
      	/*
		toastr["success"]('Akun anda berhasil didaftarkan.');
      	$("#frmregister").css("display", "none");
      	$("#registrasiSukses").css("display", "block");
		*/
		// window.location = baseurl;
	  }
	}
  });
}
function initLoginForm(){
  $("#frmlogin").validationEngine({
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
	    toastr["success"]('Anda berhasil login.');
		window.location = baseurl;
	  }
	}
  });
 }
function initForgetPassForm(){
  $("#frm-forgot").validationEngine({
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
	    toastr["success"]('Silahkan cek email anda.');
	  }
	}
  });
}

</script>

<div class="container">
  <div class="row">
    <div class="col-md-3"> {include file = "templates/$path_user/common/side-body-left.tpl"} </div>
    <div class="col-md-9">
       
      <div class="row animated content-page bounceInUp" style="">
        <div class="col-sm-4 col-sm-offset-1">
          <div class="login-form"><!--login form-->
            <h2>Login to your account</h2>
            <form method="post" name="frmlogin" id="frmlogin" action="{$baseurl}/customer/signin">
              <input type="text" placeholder="Email Address / Username" id="login_username" name="login_username" class="validate[required, custom[email]]">
              <input type="password" placeholder="Password" name="login_password" id="login_password" class="form-control validate[required]">
              <button class="btn btn-default" type="submit">Login</button>
            </form>
          </div>
          <!--/login form-->
          
          <div style="padding-top:50px;" class="login-form">
            <h2>Forgot Password</h2>
            <form method="post" name="frm-forgot" id="frm-forgot" action="{$baseurl}/customer/forgotpassword">
              <input type="text" placeholder="Enter your email address" id="forgot_username" name="forgot_username" class="form-control validate[required, custom[email]]">
              <button class="btn btn-default" type="submit">Submit</button>
            </form>
          </div>
        </div>
        <div class="col-sm-1">
          <h2 class="or">OR</h2>
        </div>
        <div class="col-sm-4">
          <div class="signup-form"><!--sign up form-->
            <h2>New User Signup!</h2>
            <form name="frmregister" style="display:block;" id="frmregister" action="{$baseurl}/customer/validate">
              <input type="text" placeholder="Full Name" class="validate[required] txtinput" id="nama" name="nama">
              <input type="text" placeholder="Email address" class="validate[required, custom[email]] txtinput" id="username" name="username">
              <input type="text" placeholder="Address" class="validate[required] txtinput" id="alamat" name="alamat">
              <input type="text" placeholder="Town" class="validate[required] txtinput" id="kota" name="kota">
              <input type="text" placeholder="Postal Code" class="validate[required] txtinput" id="kodepos" name="kodepos">
              <input type="text" placeholder="Telephone" class="validate[required] txtinput" id="phone" name="phone">
              <input type="password" placeholder="Password" class="validate[required, minSize[6]] txtinput" id="password" name="password">
              <input type="password" placeholder="Confirm Password" class="validate[required] txtinput" id="password2" name="password2">
              <button id="simpan" class="btn btn-default" type="submit">Signup</button>
            </form>
            <fieldset style="display:none;" class="robotoCondensed" id="registrasiSukses">
              <strong>Thank you,</strong> your registration successfully. Our systems have been sent notification to your email address.
            </fieldset>
          </div>
          <!--/sign up form--> 
        </div>
      </div>
      
    </div>
  </div>
</div>
{include file = "templates/$path_user/common/bottom-body.tpl"}
</body>
</html>


