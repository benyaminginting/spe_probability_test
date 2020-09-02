<!DOCTYPE html>
<html lang="en">
	<head>
		{include file = "templates/$path_user/common/header.tpl"}
		<body>
			{include file = "templates/$path_user/common/top-body.tpl"}
			<div class="container">
				<div class="row">
					<div class="col-md-3"> {include file = "templates/$path_user/common/side-body-left.tpl"} </div>
					<div class="col-md-9 padding-right">
						<div class="blog-post-area animated bounceInUp">
							<!-- judul page -->
							<h2 class="title text-center"> Detail invoice </h2>
							<!-- isi konten page -->
							<div class="single-blog-post">
								<!-- isi konten page -->
								<div class="single-blog-post" style="padding:3%;">
									<div class="row">
										<div class="col-xs-6">
											<dl class="dl-horizontal">
											  <dt>Tanggal</dt>
											  <dd>{$headtrans.tanggal}</dd>
											  <dt>Kurir Pengiriman</dt>
											  <dd>{$headtrans.kulirservice}</dd>
											  <dt>Kota Tujuan</dt>
											  <dd>{$headtrans.kota}</dd>
											</dl>	
										</div>
									  	<div class="col-xs-6">
									  		<dl class="dl-horizontal">
											  <dt>Nama Penerima</dt>
											  <dd>{$headtrans.atas_nama}</dd>
											  <dt>Alamat Tujuan</dt>
											  <dd>{$headtrans.alamat}</dd>
											  <dt>Kode Pos</dt>
											  <dd>{$headtrans.kodepos}</dd>
											  <dt>Nomor Telepon</dt>
											  <dd>{$headtrans.telepon}</dd>
											</dl>
									  	</div>

									</div>
									<div id="cart">
										<table class="table table-condensed table-bordered table-striped table-hover">
									        <thead>
									          <tr class="">
									          	<th>Item</th>
									            <th>Quantity</th>
									            <th>Price</th>
									            <th>Total</th>
									          </tr>
									        </thead>
									        <tbody>
									        {foreach from=$detailtrans item=barang}
									          <tr class="row_cart" >
									            <td><a href="{$baseurl}/product/{$barang.info->alias}">{$barang.product_name}</a> 
									            	{if $barang.disc_perc>0}
									            		(disc {$barang.disc_perc}%)
									            	{/if} 
									            </td>
												<td>{$barang.qty}</td>
												<td style="text-align:right;">Rp. {number_format($barang.harga)}</td>
												<td style="text-align:right;">Rp. {number_format($barang.totalharga)}</td>
									          </tr>
									        {/foreach}
									        </tbody>
									        <tfoot>
									          <tr>
									            <td style="text-align:right;" colspan="3">Subtotal : </td>
									            <td style="text-align:right;"><span id="headcart_subtotal">Rp. {number_format($headtrans.total)}</span></td>
									          </tr>
									          <tr>
									            <td style="text-align:right;" colspan="3">Total Shipping Fee. ({$headtrans.totalberat} Kg)</td>
									            <td style="text-align:right;"><span id="headcart_jumlah_item">Rp. {number_format($headtrans.ongkir)}</span></td>
									          </tr>
									          <tr>
									            <td style="text-align:right;" colspan="3">Grandtotal.</td>
									            <td style="text-align:right;"><span id="headcart_totalberat_cart">Rp. {number_format($headtrans.grandtotal)}</span></td>
									          </tr>
									        </tfoot>
									    </table>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			{include file = "templates/$path_user/common/bottom-body.tpl"}
		</body>
	</html>