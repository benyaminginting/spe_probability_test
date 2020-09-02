<!DOCTYPE html>
<html lang="en">
<head>
{include file = "template/{$path_user}/common/header.tpl"}
</head><!--/head-->

<body>
	{include file = "template/{$path_user}/common/top-section.tpl"}
	    
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					{include file = "template/{$path_user}/common/side-catproducts.tpl"}
				</div>
				
				<div class="col-sm-9 padding-right">
                    {include file = "template/{$path_user}/common/post-confirm.tpl"}
				</div>
			</div>
		</div>
	</section>
    
    {include file = "template/{$path_user}/common/bottom-section.tpl"}
    
    {include file = "template/{$path_user}/common/javascript.tpl"}
  
</body>
</html>