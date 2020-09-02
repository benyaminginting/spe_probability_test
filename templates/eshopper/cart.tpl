<!DOCTYPE html>
<html lang="en">
<head>
{include file = "templates/{$path_user}/common/header.tpl"}
</head>
<!--/head-->
<body>
<div id="main-wrapper">
<script type="text/javascript">
$(document).ready(function(){

  $('.qty_item').change(function(){
    var id = $(this).attr('data-id');
    var qty = $(this).val();
    var price = $(this).attr('data-price');
    var counter = $(this).attr('data-counter');
    updateItemCart(id,qty);

  });

});

</script>
{include file = "templates/{$path_user}/common/top-body.tpl"}
<div class="container animated bounceInDown" id="cart_items">

	<h2 class="title text-center">Shopping Cart / Keranjang Belanja</h2>
  {if $carts.headcart.jumlah_item>0}
  <a href="{$baseurlroot}/product-list" class="btn btn-default"> <i class="fa fa-shopping-cart"></i> Continue shopping</a>
  <a href="{$baseurl}/cart/checkout.html" class="btn btn-default"> <i class="fa fa-crosshairs"></i> Next Step</a>
  <button onClick="resetShoppingCart()" class="btn btn-default"> <i class="fa fa-remove"></i> Reset Cart</button>
  
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
        {foreach from=$carts.detailcart item=barang}
          <tr class="row_cart" id="row_cart_{$barang.product_id}" data-id="{$barang.product_id}">
            <td><button class="btn btn-danger btn-xs" type="button" title="Hapus item ini" onClick="deleteCart('{$barang.product_id}')"><i class="fa fa-times"></i></button></td>
            <td>
            	<a href="{$baseurl}/product/{$barang.alias}.html">{$barang.name}</a> 
                {if $barang.disc > 0}
                <span class="cart-disc">(Disc. {$barang.disc}%)</span>
                {/if}
            </td>
            <td style="text-align:right;">{number_format($barang.product_price)}</td>
            <td>
            	<select title="Qty barang yang akan dibeli" class="form-control qty_item"  data-id="{$barang.product_id}" id="detailcart_qty_{$barang.product_id}" name="detailcart_qty[{$barang.product_id}]" >
              	{for $angka=1 to $barang.qty}
                    <option value="{$angka}" {if $barang.qty_item == $angka} selected="selected" {/if} >{$angka}</option>
                {/for}
                </select>
            </td>
            <td style="text-align:right;">
              <span id="detailcart_totalharga_item_{$barang.product_id}">{number_format($barang.totalharga_item)}</span></td>
          </tr>
        {/foreach}
        </tbody>
        <tfoot>
          <tr>
            <td style="text-align:right;" colspan="4">Subtotal : </td>
            <td style="text-align:right;"><span id="headcart_subtotal">{number_format($carts.headcart.subtotal)}</span></td>
          </tr>
          <tr>
            <td style="text-align:right;" colspan="4">Total item barang : </td>
            <td style="text-align:right;"><span id="headcart_jumlah_item">{$carts.headcart.jumlah_item}</span></td>
          </tr>
          <tr>
            <td style="text-align:right;" colspan="4">Total berat (Kg.) : </td>
            <td style="text-align:right;"><span id="headcart_totalberat_cart">{$carts.headcart.totalberat_cart}</span></td>
          </tr>
        </tfoot>
      </table>
    </div>
  {else}
    <div class="blog-post-area animated bounceInUp"> 
        <!-- isi konten page -->
        <div class="single-blog-post"> 
          <h4>Keranjang Belanja Anda Kosong</h4> 
        </div>
      </div>
  {/if}
</div>
{include file = "templates/$path_user/common/bottom-body.tpl"}

</body>
</html>