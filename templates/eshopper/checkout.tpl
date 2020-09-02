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


<script src="{$baseurl}/templates/{$path_user}/assets/plugins/chosen_v1.4.2/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="{$baseurl}/templates/{$path_user}/assets/plugins/chosen_v1.4.2/chosen.min.css" type="text/css"/>

<script>
$(document).ready(function(){
	getPriceLocation($('#idkurir').val());
	$('#idkurir').change(function(){
		getPriceLocation($(this).val());
	});
	
  	$('.select_chosen').chosen({
		search_contains : true
  	});
	$("#idtarif").chosen().change(function(){
		calculateCart();
	});
  
  	$("#frm1").validationEngine({
		});

});

function submitCart(){
  	var konfirm = confirm("Yakin data sudah benar ?");
	if(!konfirm){
		return;
	}
	
  $.ajax({
    type : 'POST',
	url : baseurl + '/cart/submit',
	data : $('#frm1').serialize(),
	beforeSend : function(){
	  $('#loader').show();
	},
	complete : function(){
	  $('#loader').hide();
	},
	error : function(){},
	success : function(response){
		// var result = $.parseJSON(response);
    var result = $.trim(response);
    console.log(result);
    if(result == 'berhasil'){
      $('.section_cart').slideUp();
      $('#section_success').fadeIn(); 
      $('#status_checkout').show();
    }else{
      alert('Terjadi gangguan teknis, halaman ini akan dimuat kembali');
      window.location.reload();
    }
		
	}
  });	
};
function loadPriceLocation(){
	$('#loader').show();
	$('#idtarif').html('');
	var tarifkurir = JSON.parse(sessionStorage['selected_tarifkurir']);
	$.each(tarifkurir.data_tarif, function(key, tarif){
		$('#idtarif').append('<option value="'+tarif.id+'">'+tarif.provinsi+', '+tarif.daerah+'</option>');
	});
	$('.select_chosen').trigger('chosen:updated');
  	//$('.select_chosen').trigger('chzn:updated');	
	$('#loader').hide();
	calculateCart();
};
function calculateCart(){
	var tarifkurir = JSON.parse(sessionStorage['selected_tarifkurir']);
	var tarif = {};
	var idtarif = $('#idtarif').val();
  var belanjaminimum = "{$allsettings.belanjaminimum}";

	$.each(tarifkurir.data_tarif, function(key, value){
		if(value.id == idtarif){
		  tarif = value;
		}
	});
	//-- total berat itungan harga nya 1, 1.5, 2
	var headcart_subtotal = parseInt($('#headcart_subtotal').val());
	var headcart_totalberat_cart = parseFloat($('#headcart_totalberat_cart').val());
	var headcart_tarif = tarif.hargaok;

  var headcart_ongkir = parseInt(Math.ceil(headcart_totalberat_cart) * headcart_tarif);//--perlu pembulatan gak ya ?
  var headcart_grandtotal = headcart_subtotal + headcart_ongkir;
  var headcart_ongkir_val = headcart_ongkir;
  var headcart_potongan = 0;

  $(".potongan").hide();
  console.log(headcart_subtotal);
  console.log(belanjaminimum);
  {if $allsettings.gratisongkir == 1}
    if (headcart_subtotal >= parseInt(belanjaminimum) ) {
      headcart_potongan = headcart_ongkir;
      headcart_ongkir_val = 0;
      headcart_grandtotal = headcart_subtotal;
      $(".potongan").show();
    };
  {/if}

	
	$('#headcart_tarif_display').html(numeral(headcart_tarif).format('0,0'));
  $('#headcart_ongkir_display').html(numeral(headcart_ongkir).format('0,0'));
	$('#headcart_potongan_display').html(numeral(headcart_potongan).format('0,0'));
	$('#headcart_grandtotal_display').html(numeral(headcart_grandtotal).format('0,0'));
  //-- hiden value
  $('#headcart_tarif').val(headcart_tarif);
  $('#headcart_tarif').val(headcart_tarif);
  $('#headcart_ongkir').val(headcart_ongkir_val);
  $('#headcart_grandtotal').val(headcart_grandtotal);
	
};
</script>

<section>
  <form name="frm1" id="frm1" action="javascript:submitCart();" method="post">
    <div class="container section_cart">
      <div class="heading">
        <h3>What would you like to do next?</h3>
        <p>Please fill this form information.</p>
      </div>
      <div class="row">
        <div class="col-sm-6">
          <div class="chose_area">
            <div style="margin-left:10px;" class="">
              <div class="form-group">
                <label for="idkurir">Pilih Jasa Pengiriman.</label>
                <select id="idkurir" name="idkurir" class="validate[required] select_chosen">
                {foreach from=$datakurir item=kurir}
                  <option value="{$kurir.id}">{$kurir.nama}</option>
                {/foreach}  
                </select>
              </div>
              <div class="form-group">
                <label for="idtarif">Pilih kota Pengiriman.</label>
                <select class="validate[required] select_chosen" id="idtarif" name="idtarif">
                  
                </select>
              </div>
              <div class="form-group">
                <label class="" for="email">Email</label>
                <input type="text" disabled="disabled" readonly="readonly" value="{$login_customer.email}" class="form-control">
              </div>
              <div class="form-group">
                <label for="nama">Nama</label>
                <input type="text" value="{$login_customer.nama}" name="nama" id="nama" class="validate[required] form-control">
              </div>
              <div class="form-group">
                <label for="alamat">Alamat</label>
                <input type="text" value="{$login_customer.alamat}" name="alamat" id="alamat" class="form-control validate[required]">
              </div>
              <div class="form-group">
                <label for="kodepos">Kode Pos.</label>
                <input type="text" style="width:25%;" maxlength="5" value="{$login_customer.kodepos}" name="kodepos" id="kodepos" class="form-control validate[required]">
              </div>
              <div class="form-group">
                <label for="telepon">Telp / Hp</label>
                <input type="text" value="{$login_customer.telpon}" style="width:50%;" name="telepon" id="telepon" class="form-control validate[required]">
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="total_area">
            <ul>
              <li>Sub total belanja <span id="headcart_subtotal_display" class="angka">{number_format($carts.headcart.subtotal)}</span>
                <input type="hidden" value="{$carts.headcart.subtotal}" name="headcart_subtotal" id="headcart_subtotal">
              </li>
              <li> Total berat. <span id="headcart_totalberat_cart_display" class="angka">{$carts.headcart.totalberat_cart}</span> (Kg)
                <input type="hidden" value="{$carts.headcart.totalberat_cart}" name="headcart_totalberat_cart" id="headcart_totalberat_cart">
              </li>
              <li> Ongkos kirim / Kg <span id="headcart_tarif_display" class="angka">0</span>
                <input type="hidden" value="0" id="headcart_tarif" name="headcart_tarif">
              </li>
              <li> Total ongkos kirim. <span id="headcart_ongkir_display" class="angka">0</span>
                <input type="hidden" value="0" id="headcart_ongkir" name="headcart_ongkir">
              </li>
              <li class="potongan">Potongan Ongkos Kirim. <span id="headcart_potongan_display" class="angka">0</span>
                <input type="hidden" value="0" id="headcart_potongan" name="headcart_potongan">
              </li>
              <li> Grand total yg dibayar. <span id="headcart_grandtotal_display" class="angka">{number_format($carts.headcart.subtotal)}</span>
                <input type="hidden" value="{$carts.headcart.subtotal}" id="headcart_grandtotal" name="headcart_grandtotal">
              </li>
            </ul>
            <a href="{$baseurl}/cart.html" class="btn btn-default update">Back to cart</a>
            <button class="btn btn-primary check_out" id="simpan" type="submit">Confirm Check Out</button>
          </div>
        </div>
      </div>
    </div>
  </form>
</section>



<section>
  <div class="container section_cart">
    <h3>Keranjang Belanja Anda</h3>
    <div class="table-responsive">
      <table class="table table-condensed table-bordered table-striped table-hover" id="table-cart">
        <thead>
          <tr class="">
            <th style="width:35px;">&nbsp;</th>
            <th>Item</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
          </tr>
        </thead>
        <tbody>
        
        {$nomor = 1}
        {foreach from=$carts.detailcart item=barang}
        <tr class="row_cart" id="row_cart_{$barang.product_id}" data-id="{$barang.product_id}">
          <td><a href="{$baseurl}/product/{$barang.alias}.html">
              {$fakefile_url = Helper::create_fake_filename($barang.images)} 
              <img src="{$baseurl}/img/resize?file={$fakefile_url}&w=50&h=50" alt="{$barang.name}" class="img-responsive img-rounded" />
            </a></td>
          <td>
            <a href="{$baseurl}/product/{$barang.alias}.html">{$barang.name}</a>
            {if $barang.disc > 0} <span class="cart-disc">(Disc. {$barang.disc}%)</span> {/if} </td>
          <td style="text-align:right;">{number_format($barang.product_price)}</td>
          <td style="text-align:right;">{number_format($barang.qty_item)}</td>
          <td style="text-align:right;">{number_format($barang.totalharga_item)}</td>
        </tr>
          {$nomor = $nomor + 1}
        {/foreach}
          </tbody>
        
      </table>
    </div>
  </div>
</section>

<section id="section_success">
  <div class="container" id="status_checkout" style="min-height: 300px;display:none;">
    <h3>Terima kasih, Transaksi anda berhasil.</h3>
    <p>
      Anda telah berhasil melakukan checkout pemesanan dengan pembayaran transfer manual. Kami telah mengirim invoice ke email anda. Agar pesanan Anda dapat diproses oleh penjual segera lakukan pembayaran dan konfirmasi pembayaran.
    </p>
  </div>
</section>


{include file = "templates/$path_user/common/bottom-body.tpl"}
</body>
</html>
