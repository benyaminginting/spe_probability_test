<div class="left-sidebar">
  <div class="panel">
    <h2>Category</h2>
    <div class="panel-group category-products" id="accordian"><!--category-productsr--> 
      {foreach from=$datacatproduct key=myId item=catproduct}
      {if $catproduct.jumlahsubcat > 0}
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title"> 
          	<a data-toggle="collapse" data-parent="#accordian" href="#cat-{$catproduct.id}"> <span class="badge pull-right"><i class="fa fa-plus"></i></span> {$catproduct.name} </a> </h4>
        </div>
        <div id="cat-{$catproduct.id}" class="panel-collapse collapse">
          <div class="panel-body">
            <ul class="nav ">
              {foreach from=$catproduct.datasubcat key=myId item=subcat}
              <li><a href="{$baseurl}/product-list/{$subcat.alias}">{$subcat.name}</a></li>
              {/foreach}
            </ul>
          </div>
        </div>
      </div>
      {else}
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title"><a href="{$baseurl}/product-list/{$catproduct.alias}">{$catproduct.name}</a></h4>
        </div>
      </div>
      {/if}
      {/foreach} </div>
    <!--/category-products--> 
  </div>
  <div class="panel">
  {foreach from=$allbanner.kiri item=obj}
    <img class="img-responsive" src="{str_replace('[baseurlroot]', $baseurl, $obj.banner)}" />
  {/foreach}
  </div>
</div>
