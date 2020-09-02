<!DOCTYPE html>
<html lang="en">
<head>
{include file = "templates/$path_user/common/header.tpl"}
<body>
{include file = "templates/$path_user/common/top-body.tpl"}

<script src="{$baseurl}/templates/{$path_user}/assets/plugins/jcarousel/jquery.jcarousel.min.js"></script>
<script src="{$baseurl}/templates/{$path_user}/assets/plugins/jcarousel/jcarousel.responsive.js"></script>
<link type="text/css" rel="stylesheet" href="{$baseurl}/templates/{$path_user}/assets/plugins/jcarousel/jcarousel.responsive.css" />


  
  <!-- Add fancyBox -->
  <link rel="stylesheet" href="{$baseurl}/templates/{$path_user}/assets/plugins/fancyapps-fancyBox-18d1712/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
  <script type="text/javascript" src="{$baseurl}/templates/{$path_user}/assets/plugins/fancyapps-fancyBox-18d1712/source/jquery.fancybox.pack.js?v=2.1.5"></script> 
  

  <script>
$(document).ready(function() {
	$(".fancybox").fancybox({
		padding : 0
	});
});
</script> 
<script>
$(document).ready(function(){
  $('.swapToPreview').click(function(){
	  var thumb = $(this).attr('thumb');
	  var original = $(this).attr('original');
	  
	  var thumb2 = $('#preview-image').attr('thumb');
	  var original2 = $('#preview-image').attr('original');
	 
	 $(this).attr('thumb', thumb2);
	 $(this).attr('src', thumb2); 
	 $(this).attr('original', original2); 
	 
	 $('#preview-image').attr('thumb', thumb);
	 $('#preview-image').attr('src', original); 
	 $('#preview-image').attr('original', original); 
	 
	 $('#preview-image').parent().attr('href', original);
  });
});
</script>      
<div class="container">
  <div class="row">
    <div class="col-md-3"> {include file = "templates/$path_user/common/side-body-left.tpl"} </div>
    <div class="col-md-9">
    <div class="content-page animated bounceInUp">
       <div class="page-header">
           <h1>{$product.name}</h1>
           <div class="breadcrumbs">
           <ol class="breadcrumb">
              <li><a href="{$baseurl}">Home</a></li>
              <li><a href="{$baseurl}/product-list">Products</a></li>
              <li><a href="{$baseurl}/product-list/{$product.category_alias}">{$product.category_name}</a></li>
              <li class="active">{$product.name}</li>
          </ol>
       	  </div>
       </div>
       
       <div class="row">
         <div class="col-md-6">
           {$fakefile_url = Helper::create_fake_filename($product.images)}
           <a href="{$baseurl}/img/{$fakefile_url}" class="fancybox"  title="{$product.name}">
         	<img id="preview-image" class="img-responsive img-thumbnail" src="{$baseurl}/img/{$fakefile_url}" thumb="{$baseurl}/img/resize?file={$fakefile_url}&w={$allsettings.image_product_width}&h={$allsettings.image_product_height}" original="{$baseurl}/img/{$fakefile_url}" />
           </a>
         </div>
         <div class="col-md-6">
          {$add_images = json_decode($product.images_additional, true)}
          {$jumlah_add_img = count($add_images)}
          {if $allsettings.setadd == 1 and $jumlah_add_img > 0}
            <div class="jcarousel-wrapper">
                <div class="jcarousel">
                    <ul>
                      {foreach from=$add_images item=image}
						<li>
                        	<a href="javascript:;">
                            	{$fakefile_url = Helper::create_fake_filename($image)}
                            	<img  class="img-thumbnail swapToPreview" src="{$baseurl}/img/{$fakefile_url}" thumb="{$baseurl}/img/resize?file={$fakefile_url}&w={$allsettings.image_product_width}&h={$allsettings.image_product_height}" original="{$baseurl}/img/{$fakefile_url}" />
                            </a>
                        </li>
                      {/foreach}
                    </ul>
                </div>

                <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
                <a href="#" class="jcarousel-control-next">&rsaquo;</a>
            </div>
          {/if}	
            <div class="product-information" style="padding:35px;">
            {if !empty($product.merek)}
              <h3>Merek : {$product.merek}</h3>
            {/if}
            
            <span style="margin-top:0;">Stok tersedia ({Helper::stock_product($product.kodebarang)})</span>
            
            <div class="row">
            {if !empty($atribut) OR !empty($atribut2) }
              <div class="col-md-6">
                {if !empty($atribut)}
                <div class="control-group inline">
                  <label for="value_atribut" class="control-label">{strtoupper($atribut.name)}</label>
                  <div class="controls">
                    <input type="hidden" name="nama_atribut" id="nama_atribut" value="{$atribut.name}" />
                    <select name="value_atribut" class="form-control" id="value_atribut">
                    {foreach from=$atribut.data item=atr}
                        <option value="{($atr)}">{strtoupper($atr)}</option>
                    {/foreach}
                    </select>
                  </div>
                </div>
                {/if}
			  </div>
              <div class="col-md-6">
                {if !empty($atribut)}
                <div class="control-group inline">
                  <label for="value_atribut2" class="control-label">{strtoupper($atribut2.name)}</label>
                  <div class="controls">
                    <input type="hidden" name="nama_atribut2" id="nama_atribut2" value="{$atribut2.name}" />
                    <select name="value_atribut2" class="form-control" id="value_atribut2">
                    {foreach from=$atribut2.data item=atr}
                        <option value="{($atr)}">{strtoupper($atr)}</option>
                    {/foreach}
                    </select>
                  </div>
                </div>
                {/if}
              </div>
            {/if}
            </div>
            
            
            <span>
            <span class="price">
              {$nocart = ""}
              {if $allsettings.show_price}
                {if !empty($product.spesial)}
                <strike style='font-size:18px;'>Rp. {number_format($product.price)}</strike> Rp. {number_format($product.spesial)}
                {elseif $product.price == 0}
                  CALL
                  {$nocart = 'onClick=""  class="btn btn-default disabled"'}
                {else}
                Rp. {number_format($product.price)}
                {/if}
              {/if}
            </span>
         	<button {if $nocart != ""}{$nocart}{else} onClick="addItemToCart({$product.id})" class="btn btn-fefault cart" type="button"> <i class="fa fa-shopping-cart"{/if}></i> Add to cart </button>
            </span><br>
            <span>
              {if !empty($datatag)}tag :{/if}
              {foreach from=$datatag item=tag}
                <a href="{$baseurl}/product-list/tag/{$tag}">#{$tag}
                </a>
              {/foreach}
            </span>
            
            </div>
         </div>
       </div>
    
      <div class="row">
        <div class="col-xs-12" align="justify" style="margin-top:5px;">
          {str_replace('[baseurlroot]', $baseurl, $product.description)}
        </div>
      </div>
    </div>
            
    </div>
  </div>
</div>
{include file = "templates/$path_user/common/bottom-body.tpl"}
</body>
</html>
