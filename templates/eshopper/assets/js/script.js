$(document).ready(function(){
	initAnimate();
	header_stay_top();	
	activateCurrentMenu();
	//$.validationEngine.defaults.promptPosition = 'topLeft';
});

function initAnimate(){
	$('.logo').addClass('animated bounce');
	$('.shop-menu').addClass('animated lightSpeedIn');
	$('.mainmenu').addClass('animated lightSpeedIn');
	$('#slider-carousel').addClass('animated zoomIn');
}

function header_stay_top(){
	$(window).scroll(function(e){
		var headerHeight = $('header').height();
		if(headerHeight < $(window).scrollTop()){
			$('#nav-cart').addClass('stay_on_top');
		}else{
			$('#nav-cart').removeClass('stay_on_top');
		}
	});
}

function scrollToMain(){
	$('body, html').animate({scrollTop: $('.navbar-wrapper').offset().top},1000);
}

function backToTop(){
	$('body, html').animate({scrollTop: 0},800);
}

function initContactForm(){
  $("#frmcontact").validationEngine({
    ajaxFormValidation : true,
	ajaxFormValidationMethod : 'POST',
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
}
function submitForm(formElm){
  $.ajax({
    url : '{$baseurl}/query/submit-contact-form',	
    type:'POST',
	data : $(formElm).serialize(),
	beforeSend : function(){
	  disableThisForm(formElm);
	},
	complete : function(){
	  activateThisForm(formElm);
	},
	error : function(response){
	  alert(response.statusText);
	},
	success: function(response){
	  var result = $.trim(response);
	  if(result == 'berhasil'){
	    $('#frmcontact').slideUp();
		$('#frm-success').fadeIn();
	  }else{
	  	alert(response);
	  }
	}
  });
}
function disableThisForm(formElm){
	var btnsave = $(formElm).find("[type=submit]");
	btnsave.attr('disabled', 'disabled');
	$('#loader').show();
}
function activateThisForm(formElm){
	var btnsave = $(formElm).find("[type=submit]");
	btnsave.removeAttr('disabled', 'disabled');
	$('#loader').hide();
}

function activateCurrentMenu(){
	//-- aktifkan link page menu saat ini
	$.each($('.nav li a'), function(key, value){
	   $(this).parent().removeClass('active');
	   if($(this).attr('href') == document.location.href){
	     $(this).parent().addClass('active');
	   }
	});
}
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}

function checkCookie() {
    var user = getCookie("username");
    if (user != "") {
        alert("Welcome again " + user);
    } else {
        user = prompt("Please enter your name:", "");
        if (user != "" && user != null) {
            setCookie("username", user, 365);
        }
    }
}
