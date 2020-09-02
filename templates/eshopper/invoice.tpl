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
        <h2 class="title text-center"> INVOICE </h2>
        <!-- isi konten page -->
        <div class="single-blog-post">
		  <table cellspacing="0" cellpadding="0" class="table table-hover">
		    <thead>
		        <tr class="">
		            <th>INVOICE NO.</th>
		            <th>DATE.</th>
		            <th>TOTAL PRICE.</th>
		            <th>STATUS.</th>
		            <th>NO.TRACKING.</th>
		            <th>PAYMENT.</th>
		        </tr>
		    </thead>
		    <tbody>
		    	{foreach from=$invoice item=data}
		    		<tr>
		    			<td><a href="{$baseurl}/customer/detail_transaksi/{$data.nofak}" >{$data.nofak}</a></td>
		    			<td>{$data.tanggal}</td>
		    			<td>Rp. {$data.total|number_format}</td>
		    			<td>{$data.status}</td>
		    			<td>{$data.tracking}</td>
		    			<td>
		    				{if $data.status eq 'rejected' }
		    					Ditolak
		    				{else}
		    					Bank Transfer<br>[<a href="{$baseurl}/customer/confirm/{$data.nofak}">Confirm Payment</a>]
		    				{/if}
		    			</td>
		    		</tr>
		    	{/foreach}
		    </tbody>
		  </table>
		</div>
      </div>
    </div>
  </div>
</div>
{include file = "templates/$path_user/common/bottom-body.tpl"}
</body>
</html>
