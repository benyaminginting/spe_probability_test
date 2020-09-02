var jqxhr = null;
var baseurl = decodeURIComponent(getCookie('baseurl'));
var baseurlroot = decodeURIComponent(getCookie('baseurlroot'));


function resetShoppingCart(){
  var konfirm = confirm('Are you sure to reset your cart ?');
  if (konfirm) {	
	console.log("pass this");
	$.ajax({
	    type : 'POST',
		url : baseurl + '/cart/reset',
		beforeSend : function(){
		  $('#loader').show();
		},
		complete : function(){
		  $('#loader').hide();
		},
		error : function(){},
		success : function(){
			window.location.reload();
		}
	 });
  }	
}

function updateItemCart(id,qty){
	$.ajax({
    type : 'POST',
	url : baseurl + '/cart/update',
	data : {
		'id' : id,
		'qty' : qty
	},
	beforeSend : function(){
	  $('#loader').show();
	},
	complete : function(){
	  $('#loader').hide();
	},
	error : function(){},
	success : function(response){
		var result = $.parseJSON(response);
		var barang = {};
		$.each(result.detailcart, function(key,value){
			if (value.product_id==id) {
				barang=value;
			};
		});

		$('#jlhbarang').removeClass('animated bounceInUp', function(){});
		$('#jlhbarang').addClass('animated bounceInUp');
		$('#jlhbarang').html(result.headcart.jumlah_item);
		$('#headcart_subtotal').html(numeral(result.headcart.subtotal).format('0,0'));
		$('#headcart_jumlah_item').html(result.headcart.jumlah_item);
		$('#headcart_totalberat_cart').html(result.headcart.totalberat_cart);
	    $('#detailcart_totalharga_item_'+id).html(numeral(barang.totalharga_item).format('0,0'));
		
		toastr["success"]("Anda memiliki " + result.headcart.jumlah_item + " item di keranjang anda. Cek keranjang belanja / cart anda di sebelah kanan atas.");
	}
  });	
}

function addItemToCart(id){
  $.ajax({
    type : 'POST',
	url : baseurl + '/cart/add',
	data : {
		'id' : id,
		'nama_atribut' : $('#nama_attribut').val(),
		'nama_atribut2' : $('#nama_attribut2').val(),
		'value_atribut' : $('#dd_attribut').val(),
		'value_atribut2' : $('#dd_attribut2').val(),
	},
	beforeSend : function(){
	  $('#loader').show();
	},
	complete : function(){
	  $('#loader').hide();
	},
	error : function(){},
	success : function(response){
		var result = $.parseJSON(response);
		$('#jlhbarang').removeClass('animated bounceInUp', function(){});
		$('#jlhbarang').addClass('animated bounceInUp');
		$('#jlhbarang').html(result.headcart.jumlah_item);
		toastr["success"]("Anda memiliki " + result.headcart.jumlah_item + " item di keranjang anda. Cek keranjang belanja / cart anda di sebelah kanan atas.");
	}
  });	
}

function deleteCart(product_id){
  var id = product_id;	
  var konfirm = confirm('Yakin hapus data ini ?');
  if(!konfirm){
    return;
  }
  $.ajax({
    type : 'POST',
	url : baseurl + '/cart/delete',
	data : {
		'product_id' : product_id,
	},
	beforeSend : function(){
	  $('#loader').show();
	},
	complete : function(){
	  $('#loader').hide();
	},
	error : function(){},
	success : function(response){
			var result = $.parseJSON(response);
			if(result.detailcart.length == 0){
			  window.location.reload();
			}
			
			$('#jlhbarang').removeClass('animated bounceInUp', function(){});
			$('#jlhbarang').addClass('animated bounceInUp');
			$('#jlhbarang').html(result.headcart.jumlah_item);
			if(result.status == 'berhasil'){
			var barang = {};
			$.each(result.detailcart, function(key,value){
				if (value.product_id==id) {
					barang=value;
				};
			});
			$('#row_cart_'+product_id).slideUp();
			$('#row_cart_'+product_id).remove();
	
	
			$('#jlhbarang').removeClass('animated bounceInUp', function(){});
			$('#jlhbarang').addClass('animated bounceInUp');
			$('#jlhbarang').html(result.headcart.jumlah_item);
			$('#headcart_subtotal').html(numeral(result.headcart.subtotal).format('0,0'));
			$('#headcart_jumlah_item').html(result.headcart.jumlah_item);
			$('#headcart_totalberat_cart').html(result.headcart.totalberat_cart);
			$('#detailcart_totalharga_item_'+id).html(numeral(barang.totalharga_item).format('0,0'));
			toastr["success"]("Item keranjang anda berhasil dihapus.");
		}else{
			toastr["error"](result.status);
		}
	}
  });	
}

function getPriceLocation(idkurir){
  $.ajax({
    type : 'POST',
	url : baseurl + '/cart/data-price-location',
	data : {
		'idkurir' : idkurir,
	},
	beforeSend : function(){
	  $('#loader').show();
	},
	complete : function(){
	  $('#loader').hide();
	},
	error : function(){},
	success : function(response){
		var result = $.parseJSON(response);
		sessionStorage['selected_tarifkurir'] = JSON.stringify(result);
		loadPriceLocation();//-- ada di tpl nya, tergantung karakteristik
	}
  });	
}