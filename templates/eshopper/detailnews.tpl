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
    <ol class="breadcrumb">
      <li><a href="{$baseurl}/">Home</a></li>
      <li><a href="{$baseurl}/content/news">Berita</a></li>
      <li class="active">{$content.name}</li>
    </ol>

	<div class="" align="center">
    {$fakefile_url = Helper::create_fake_filename($content.images)}
    <img src="{$baseurl}/img/{$fakefile_url}" class="img-thumbnail" alt="{$content.name}" />
    </div>
    
	<div class="page-header"><h1>{$content.name}</h1>
    	<div class="tanggal">
        {Helper::namahari_indo($content.tanggal)}, 
        {date('d', strtotime($content.tanggal))}
        {Helper::namabulan_indo($content.tanggal)}
        {date('Y', strtotime($content.tanggal))}
        </div>
    </div>
    {Helper::fix_content_url($content.description)}
    {include file = "templates/{$path_user}/common/sharebutton.tpl"}

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