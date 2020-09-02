function showNoty(text) {
	noty({
		text : text,
		layout : "topLeft",
		type : "success",
		easing : 'swing',
		timeout : 3000,
	});
}

function modalLoad(isOpen, text) {
	if (isOpen == true) {
		noty({
			text : text,
			layout : "center",
			type : "alert",
			easing : 'swing',
			modal : true,
			timeout : 0,
			closable : false,
			closeOnSelfClick : false
		});
	} else
		$.noty.close()
}