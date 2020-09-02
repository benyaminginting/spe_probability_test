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
        <h2 class="title text-center">Result Search {if $jlhcari >0 } {$jlhcari} found  {else} Not Found {/if}</h2>
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
        {foreach from=$resultdata key=myId item=data}
        <div class="col-md-4 col-sm-6">
          <div class="product-image-wrapper">
            <div class="single-products">
              <div class="productinfo text-center"> 
                <a href="product/{$data.alias}" title="Click to see detail"> 
                  {$fakefile_url = Helper::create_fake_filename($data.images)} 
                  <img src="{$baseurl}/img/resize?file={$fakefile_url}&w={$allsettings.image_product_width}&h={$allsettings.image_product_height}" alt="{$data.name}" class="img-responsive img-thumbnail" />
                  </a>
                  {if $allsettings.show_price}
                    {if (!empty($data.spesial)) }
                      <h2 style='margin-top: 10px;margin-bottom: 0px;'>Rp. {number_format($data.spesial)}</h2> 
                      <strike>{number_format($data.price)}</strike>
                    {else}
                      <h2>Rp. {number_format($data.price)}</h2>
                    {/if}
                  {/if}
                <p>{$data.name}</p>
                <a href="javascript:void(0)" onClick="beliBarang({$data.id})"  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a> </div>
            </div>
          </div>
        </div>
        {/foreach} 
      </div>
		
      {include file = "templates/{$path_user}/common/pagination.tpl"} 
    </div>
  </div>
</div>
{include file = "templates/$path_user/common/bottom-body.tpl"}
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