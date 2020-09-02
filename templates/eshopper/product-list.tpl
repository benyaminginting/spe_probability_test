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
      <div class="features_items">
        <h2 class="title text-center">Product List - {$category_name} ({$jlhdata})</h2>
        <div class="row">
          <div class="col-md-12 align-right">
            <form id="order" class="form-inline pull-right" method="get" action="{$_SERVER['PHP_SELF']}">
              <div class="form-group">
                <label>Sort By</label>
                <select name="order" class="form-control order_custom" id="dd_order" onchange='this.form.submit()'>
                    <option {if ($smarty.get['order']=='name')} selected="selected" {/if} value="name" >Alphabet (A-Z)</option>
                    <option {if ($smarty.get['order']=='dname')} selected="selected" {/if} value="dname" >Alphabet (Z-A)</option>
                    <option {if ($smarty.get['order']=='newest')} selected="selected" {/if} value="newest" >Newest Products</option>
                    <option {if ($smarty.get['order']=='oldest')} selected="selected" {/if} value="oldest" >Oldest Products</option>
                    <option {if ($smarty.get['order']=='highest')} selected="selected" {/if} value="highest" >Highest Price</option>
                    <option {if ($smarty.get['order']=='lowest')} selected="selected" {/if} value="lowest" >Lowest Price</option>
                </select>
                <input type="hidden" name="q" value="{$smarty.get['q']}">
              </div>
            </form>
          </div>
        </div>
        <div class="row">
        {foreach from=$resultdata key=myId item=data}
        <div class="col-md-4 col-sm-6">
          <div class="product-image-wrapper">
            <div class="single-products">
              <div class="productinfo text-center"> 
                <a href="{$baseurl}/product/{$data.alias}.html" title="Click to see detail"> 
                  {$fakefile_url = Helper::create_fake_filename($data.images)} 
                  <img src="{$baseurl}/img/resize?file={$fakefile_url}&w={$allsettings.image_product_width}&h={$allsettings.image_product_height}" alt="{$data.name}" class="img-responsive img-thumbnail" />
                  </a>
                  {$nocart = ""}
                  {if $allsettings.show_price}
                    {if (!empty($data.spesial)) }
                      <h2 style='margin-top: 10px;margin-bottom: 0px;'>Rp. {number_format($data.spesial)}</h2> 
                      <strike>{number_format($data.price)}</strike>
                    {elseif $data.price == 0}
                      <h2>CALL</h2>
                      {$nocart = 'onClick=""  class="btn btn-default disabled"'}
                    {else}
                      <h2>Rp. {number_format($data.price)}</h2>
                    {/if}
                  {/if}
                <p>{$data.name}</p>
                <button href="javascript:void(0)" {if $nocart != ""}{$nocart}{else}onClick="addItemToCart({$data.id})"  class="btn btn-default add-to-cart"{/if}><i class="fa fa-shopping-cart"></i>Add to cart</button> </div>
            
            <div class="sale-box" {$data.new }>
            {if $data.new == 'Y'}
            	<span class="new"></span>
            {else if $data.featured == 1}
                <span class="featured"></span>
            {else if $data.terlaris == 1}
            	<span class="best-seller"></span>    
            {/if}    
            </div>
            
            {if $data.disc > 0}
            <div class="disc-box"><span>DISC<br> {$data.disc}%</span></div>
            {/if}
            </div>
          </div>
        </div>
        {/foreach} 
        </div>
      </div>
		
      {include file = "templates/{$path_user}/common/pagination.tpl"} 
    </div>
  </div>
</div>
{include file = "templates/$path_user/common/bottom-body.tpl"}
<script type="text/javascript">
</script>
<style type="text/css">
.order_custom{
  margin-bottom: 10px;
}
h2 .text-center{
  margin-bottom: 10px;
}

</style>
</body>
</html>