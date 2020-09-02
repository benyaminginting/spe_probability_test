<!DOCTYPE html>
<html lang="en">
<head>
{include file = "templates/$path_user/common/header.tpl"}
<body>
{include file = "templates/$path_user/common/top-body.tpl"}

<section id="slider"><!--slider-->
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            {$index = 0}
            {foreach from=$allbanner.atas key=myId item=itemBanner}
            <li data-target="#slider-carousel" data-slide-to="{$index}" {if $index==0} class="active" {/if}></li>
            {$index = $index + 1}
            {/foreach}
          </ol>
          <div class="carousel-inner"> {$index = 0}
            {foreach from=$allbanner.atas item=bannerobjek}
            <div class="item {if $index==0} active {/if}" style="padding-left:0;" align="center"> 
            	{$fakefile_url = Helper::create_fake_filename($bannerobjek.banner)}
            	<a class="fancybox" rel="gallery1" href="{$baseurl}/img/{$fakefile_url}" title="{$bannerobjek.title}"> 
                  <img class="img-responsive" src="{$baseurl}/img/resize?file={$fakefile_url}&w={$allsettings.image_banner_width}&h={$allsettings.image_banner_height}" alt="{$bannerobjek.title}" original="{$baseurl}/img/{$fakefile_url}"> 
                </a> 
            </div>
            {$index = $index + 1}
            {/foreach} </div>
          <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev"> <i class="fa fa-angle-left"></i> </a> <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next"> <i class="fa fa-angle-right"></i> </a> </div>
      </div>
    </div>
  </div>
  
  
  <!-- Add fancyBox -->
  <link rel="stylesheet" href="{$baseurl}/templates/{$path_user}/assets/plugins/fancyapps-fancyBox-18d1712/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
  <script type="text/javascript" src="{$baseurl}/templates/{$path_user}/assets/plugins/fancyapps-fancyBox-18d1712/source/jquery.fancybox.pack.js?v=2.1.5"></script> 

  <script>
$(document).ready(function() {
	$(".fancybox").fancybox({
		openEffect	: 'none',
		closeEffect	: 'none',
		padding : 0
	});
});
</script> 
</section>
<!--/slider-->

  <div class="container">
    <div class="row">
      <div class="col-md-3">
        {include file = "templates/$path_user/common/side-body-left.tpl"}
      </div>
      <div class="col-md-9 padding-right">
        <div class="features_items"><!--features_items-->
          <h2 class="title text-center">Features Items</h2>
          {$kolom = 1}
          {foreach from=$featuredproducts key=myId item=product}
          <div class="col-xs-6 col-sm-4 col-md-4">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center"> 
                	<a href="product/{$product.alias}.html" title="Click to see detail">
                     {$fakefile_url = Helper::create_fake_filename($product.images)}
                     <img src="{$baseurl}/img/resize?file={$fakefile_url}&w={$allsettings.image_product_width}&h={$allsettings.image_product_height}" alt="{$product.name}" class="img-responsive img-thumbnail" /> 
                    </a>
                    {if $allsettings.show_price}
                      {$nocart =""}
                      {if (!empty($product.spesial)) }
                        <h2 style='margin-top: 10px;margin-bottom: 0px;'>Rp. {number_format($product.spesial)}</h2> 
                        <strike>{number_format($product.price)}</strike>
                      {elseif $product.price == 0}
                        <h2>CALL</h2>
                        {$nocart = 'onClick=""  class="btn btn-default disabled"'}
                      {else}
                        <h2>Rp. {number_format($product.price)}</h2>
                      {/if}
                    {/if}
                  <p>{$product.name}</p>
                  <buttom href="javascript:void(0)" {if $nocart != ""}{$nocart}{else}onClick="addItemToCart({$product.id})" class="btn btn-default add-to-cart"{/if}  ><i class="fa fa-shopping-cart"></i>Add to cart</buttom> </div>
              </div>
            </div>
          </div>
          {/foreach} </div>
        <!--features_items-->
        
        <div class="recommended_items"><!--recommended_items-->
          <h2 class="title text-center">Best Seller items</h2>
          {foreach from=$bestsellerproducts item=product}
          <div class="col-xs-6 col-sm-4 col-md-4">
            <div class="product-image-wrapper">
              <div class="single-products">
                <div class="productinfo text-center"> 
                  <a href="product/{$product.alias}.html" title="Click to see detail">
                     {$fakefile_url = Helper::create_fake_filename($product.images)}
                     <img src="{$baseurl}/img/resize?file={$fakefile_url}&w={$allsettings.image_product_width}&h={$allsettings.image_product_height}" alt="{$product.name}" class="img-responsive img-thumbnail" /> 
                    </a>
                    {if $allsettings.show_price}
                      {$nocart =""}
                      {if (!empty($product.spesial)) }
                        <h2 style='margin-top: 10px;margin-bottom: 0px;'>Rp. {number_format($product.spesial)}</h2> 
                        <strike>{number_format($product.price)}</strike>
                      {elseif $product.price == 0}
                        <h2>CALL</h2>
                        {$nocart = 'onClick=""  class="btn btn-default disabled"'}
                      {else}
                        <h2>Rp. {number_format($product.price)}</h2>
                      {/if}
                    {/if}
                  <p>{$product.name}</p>
                  <buttom href="javascript:void(0)" {if $nocart != ""}{$nocart}{else}onClick="addItemToCart({$product.id})" class="btn btn-default add-to-cart"{/if}  ><i class="fa fa-shopping-cart"></i>Add to cart</buttom> </div>
              </div>
            </div>
          </div>
          {/foreach} </div>
        <!--/recommended_items--> 
      </div>
    </div>
  </div>

{include file = "templates/$path_user/common/bottom-body.tpl"}
</body>
</html>