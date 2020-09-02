<!DOCTYPE html>
<html lang="en">
  <head>
    {include file = "templates/$path_user/common/header.tpl"}
    <body>
      {include file = "templates/$path_user/common/top-body.tpl"}
      <!-- validation engine -->
      <script src="{$baseurl}/templates/{$path_user}/assets/plugins/jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.min.js"></script>
      <link rel="stylesheet" type="text/css" href="{$baseurl}/templates/{$path_user}/assets/plugins/jquery-ui-1.9.2.custom/css/ui-lightness/jquery-ui-1.9.2.custom.min.css">
      <script src="{$baseurl}/templates/{$path_user}/assets/plugins/validation/js/jquery.validationEngine.js"></script>
      <script src="{$baseurl}/templates/{$path_user}/assets/plugins/validation/js/languages/jquery.validationEngine-en.js"></script>
      <link rel="stylesheet" type="text/css" href="{$baseurl}/templates/{$path_user}/assets/plugins/validation/css/validationEngine.jquery.css">
      
      <script type="text/javascript">
      {literal}

      $(document).ready(function(){
        initConfirmForm();
        $('.datepickers').datepicker({dateFormat : "dd-mm-yy"});
      }); 
      function initConfirmForm(){
        
        $("#frmconfirm").validationEngine({
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
              toastr["success"]('Konfirmasi pembayaran anda telah dikirim.');
            // window.location = baseurl;
            }
          }
        });
      }

      {/literal}
      </script>

      <div class="container">
        <div class="row">
          <div class="col-md-3"> {include file = "templates/$path_user/common/side-body-left.tpl"} </div>
          <div class="col-md-9 padding-right">
            <div class="blog-post-area animated bounceInUp">
              <!-- judul page -->
              <h2 class="title text-center"> {$detailpage.title} </h2>
              <!-- isi konten page -->
              <div class="single-blog-post">
                <p>
                  <h4 class="robotoCondensed">Faktur Pembelian <button class="btn btn-xs" onclick="$('#show-faktur').toggle()" type="button">Show/hide</button></h4>
                  <div id="show-faktur" style="display:none;">
                    <div class="row">
                      <div class="col-xs-6">
                        <dl class="dl-horizontal">
                          <dt>Tanggal</dt>
                          <dd>: {$data_headtrans.tanggal}</dd>
                          <dt>Kepada</dt>
                          <dd>: {$data_headtrans.atas_nama}</dd>
                          <dt>Alamat</dt>
                          <dd>: {$data_headtrans.alamat}</dd>
                        </dl>
                      </div>
                      <div class="col-xs-6">
                        <dl class="dl-horizontal">
                          <dt>Kode Pos</dt>
                          <dd>: {$data_headtrans.kodepos}</dd>
                          <dt>Telepon</dt>
                          <dd>: {$data_headtrans.telepon}</dd>
                          <dt>No. Invoice</dt>
                          <dd>: <strong>{$data_headtrans.nofak}</strong></dd>
                        </dl>
                      </div>
                    </div>

                    <table class="table table-condensed table-bordered table-striped table-hover">
                      <thead>
                        <tr class="">
                          <th>No.</th>
                          <th>Item</th>
                          <th>Quantity</th>
                          <th>Price</th>
                          <th>Total</th>
                        </tr>
                      </thead>
                      <tbody>
                      {$no = 0}
                      {foreach from = $data_detailtrans item = barang}
                      {$no = $no + 1}
                        <tr class="row_cart" >
                          <td>{$no}</td>
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
                          <td style="text-align:right;" colspan="4">Subtotal : </td>
                          <td style="text-align:right;"><span id="headcart_subtotal">Rp. {number_format($data_headtrans.total)}</span></td>
                        </tr>
                        <tr>
                          <td style="text-align:right;" colspan="4">Total Biaya Ongkos Kirim. ({$data_headtrans.totalberat} Kg)</td>
                          <td style="text-align:right;"><span id="headcart_jumlah_item">Rp. {number_format($data_headtrans.ongkir)}</span></td>
                        </tr>
                        <tr>
                          <td style="text-align:right;" colspan="4">Grandtotal.</td>
                          <td style="text-align:right;"><span id="headcart_totalberat_cart">Rp. {number_format($data_headtrans.grandtotal)}</span></td>
                        </tr>
                      </tfoot>
                    </table>
                    <!-- <table class="table table-condensed table-bordered table-striped table-hover">
                        <thead>
                          <tr class="">
                            <th width="1">No.</th>
                            <th>Item</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                          </tr>
                        </thead>
                        <tbody>
                        {$no = 0}
                        {foreach from = $data_detailtrans item = barang}
                        {$no = $no + 1}
                          <tr class="row_cart" >
                            <td>{$no}</td>
                            <td>{$barang.product_name}</td>
                            <td>{$barang.qty}</td>
                            <td style="text-align:right;">Rp. {number_format($barang.harga)}</td>
                            <td style="text-align:right;">Rp. {number_format($barang.harga * $barang.qty)}</td>
                          </tr>
                        {/foreach}
                        </tbody>
                        <tfoot>
                          <tr>
                            <td style="text-align:right;" colspan="4">Subtotal</td>
                            <td style="text-align:right;"><span id="headcart_subtotal">Rp. {number_format($data_headtrans.total)}</span></td>
                          </tr>
                          <tr>
                            <td style="text-align:right;" colspan="4">Ongkos Kirim</td>
                            <td style="text-align:right;"><span id="headcart_jumlah_item">Rp. {number_format($data_headtrans.ongkir)}</span></td>
                          </tr>
                          <tr style="font-weight:bold;">
                            <td style="text-align:right;" colspan="4">Grandtotal</td>
                            <td style="text-align:right;"><span id="headcart_totalberat_cart">Rp. {number_format($data_headtrans.grandtotal)}</span></td>
                          </tr>
                      </tfoot>
                    </table> -->
                  </div>
                </p>
                <hr />
                <div class="row">
                  <h2 class="page-header">Pembayaran</h2>
                  <form action="{$baseurl}/customer/validate_confirm" id="frmconfirm" name="frmconfirm" class="form-horizontal" >
                    <input type="hidden" name="nofak" id="nofak" value="{$data_headtrans.nofak}" />
                    <input type="hidden" name="bank_tujuan" id="bank_tujuan" value="{$data_headtrans.bank}" />
                    <div class="form-group">
                      <label for="no_invoice" class="col-sm-2 control-label">No. Invoice</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="no_invoice" value="{$data_headtrans.nofak}" readonly="readonly" disabled="disabled">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="banktujuan" class="col-sm-2 control-label">Rek.tujuan transfer</label>
                      <div class="col-sm-10">
                        <select id="banktujuan" name="banktujuan" class="validate[required]">
                          {foreach from=$databank item=data}
                          <option value="{$data.id}" {if $data_headtrans.bank == $data.id} selected="selected" {/if}>{$data.nama}, {$data.rekening} a/n {$data.atas_nama}</option>
                          {/foreach}
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="tanggal" class="col-sm-2 control-label">Tanggal Bayar/transfer</label>
                      <div class="col-sm-10">
                        <input type="text" name="tanggal" id="tanggal" class="validate[required] form-control datepickers" size="10" placeholder="Format : dd-mm-yyyy" value="{if $count_confirm > 0}{date('d-m-Y', strtotime($data_confirm.tanggal))}{/if}" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="bank" class="col-sm-2 control-label">Nama Bank</label>
                      <div class="col-sm-10">
                        <input type="text" class="validate[required] form-control" name="bank" id="bank" value="{$data_confirm.bank}" placeholder="Cth : BCA, Mandiri, BII, BRI, Danamon, dll." />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="name" class="col-sm-2 control-label">Nama Pemilik Rekening</label>
                      <div class="col-sm-10">
                        <input type="text" class="validate[required] form-control" name="name" id="name" value="{$data_confirm.name}" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="no_rekening" class="col-sm-2 control-label">No.Rekening</label>
                      <div class="col-sm-10">
                        <input type="text" class="validate[required] form-control" name="no_rekening" id="no_rekening" value="{$data_confirm.no_rekening}" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="total" class="col-sm-2 control-label">Jumlah Bayar/transfer</label>
                      <div class="col-sm-10">
                        <input type="text" class="validate[required] form-control" name="total" id="total" value="{$data_confirm.total}" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="keterangan" class="col-sm-2 control-label">Keterangan Pengiriman</label>
                      <div class="col-sm-10">
                        <textarea class="form-control" name="keterangan" id="keterangan"  rows="3" >{$data_confirm.keterangan}</textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="keterangan" class="col-sm-2 control-label">
                        <span style="padding-top:5px; padding-bottom:20px;"><img width="80" src="{$baseurl}/libraries/securimage/securimage_show.php?sid={md5(uniqid(time()))}" style="position:relative; height:28px; top:-1px;" /></span>  
                      </label>
                      <div class="col-sm-10">
                        <input class="validate[required] form-control" type="text" name="txtcaptcha" id="txtcaptcha" value="" placeholder="Captcha" />
                      </div>
                    </div>
                    {if $data_headtrans.status == 'prosessing' || $data_headtrans.status == 'pending'}
                    {if $count_confirm > 0}
                    <strong>Menunggu konfirmasi ..</strong>
                    {else}
                    <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default" name="simpan" id="simpan">Kirim</button>
                      </div>
                    </div>
                    {/if}
                    {/if}
                    
                    <span id="loadbar" class="loader" style="display:none;">
                      <img src="images/icon/busy.gif" align="absmiddle" />
                      loading...
                    </span>
                  </div>
                </form>
                <span style="display:none;" id="pesan">Konfirmasi anda telah disimpan. Terima kasih</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      {include file = "templates/$path_user/common/bottom-body.tpl"}
    </body>
  </html>