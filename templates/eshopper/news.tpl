<!DOCTYPE html>
<html lang="en">
<head>
{include file = "templates/{$path_user}/common/header.tpl"}
</head><!--/head-->

<body>
	{include file = "templates/{$path_user}/common/top-body.tpl"}
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					{include file = "templates/{$path_user}/common/side-body-left.tpl"}
				</div>
				
				<div class="col-sm-9 padding-right">
                    {if empty($alias)}
					  <div class="blog-post-area">
					    <h2 class="title text-center">News List</h2>
						  {foreach from=$articlelist key=myId item=data}
					    <div class="row item-news">
						    <div class="col-sm-4">
						      <a href="news/{$data.alias}"> 
                  {$fakefile_url = Helper::create_fake_filename($data.images)} 
                  <img src="{$baseurl}/img/resize?file={$fakefile_url}&w={$allsettings.image_product_width}&h={$allsettings.image_product_height}" alt="{$data.judul}" class="img-responsive img-thumbnail" />
                              </a>
						    </div>
						    <div class="col-sm-8">
						      <h3 class="judul_news">{$data.judul}</h3>
						      <div class="post-meta">
						        <ul>
						          <li><i class="fa fa-calendar"></i> {$data.tanggal}</li>
						        </ul> 
						      </div>
						      <p>{$data.simple}</p>
						      <a  class="btn btn-primary"  href="news/{$data.alias}">Read More</a><br>
						    </div>
					    </div>
						  {/foreach}
					  {include file = "templates/{$path_user}/common/pagination.tpl"}
					  </div>
					{else}
					<div class="blog-post-area">
					  <!-- isi konten page -->
					  <div class="single-blog-post">
					    <h3>{$articlelist.judul}</h3>
					    <div class="post-meta">
					      <ul>
					        <li><i class="fa fa-calendar"></i> {$articlelist.tanggal}</li>
					      </ul>
					    </div>
					    {if !empty($articlelist.images)}
					    <p align="center"><img src="../{$articlelist.images}" alt="{$articlelist.judul}"  class="img-responsive img-thumnail" ></p>
					    {/if}
					    {$articlelist.keterangan}
					  </div>
					</div>
					{/if}
				</div>
			</div>
		</div>
		{include file = "templates/$path_user/common/bottom-body.tpl"}
	<style type="text/css">
	.judul_news{
		padding: 0;
		margin: 0;
		margin-bottom: 5px;
	}

	.item-news{
		margin-bottom: 10px;
		border-bottom: 1px solid #ccc;
		padding-bottom: 20px;
	}

	</style>
	</body>
	</html>