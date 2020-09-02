<!DOCTYPE html>
<html lang="en">
<head>
{include file = "templates/{$path_user}/common/header.tpl"}
</head><!--/head-->

<body>
	{include file = "templates/{$path_user}/common/top-body.tpl"}
	    
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					{include file = "templates/{$path_user}/common/side-body-left.tpl"}
				</div>
				
				<div class="col-sm-9 padding-right">
                    <div class="blog-post-area">
						<h2 class="title text-center">Contact Us</h2>
						<!-- isi konten page -->
						<div class="single-blog-post">
							<div class="row">
								Apabila anda mempunyai pertanyaan seputar produk kami, silahkan kontak langsung dengan kami:</p>
								<strong>{$setting.nama}</strong><br />
								{$setting.alamat} {$setting.kota}<br />
								Phone {$setting.telpon}<br />
								<table>
									<tr>
										<td>Y!M : </td>
										<td>&nbsp;</td>
									</tr>
									{foreach from=$sideym key=myId item=dataym}
									<tr>
										<td>&nbsp;</td>
										<td><a href="ymsgr:sendim?{$dataym.ymid}" border="0"><img src="http://opi.yahoo.com/online?u={$dataym.ymid}&m=g&t=2" alt="{$dataym.nama}"></a></td>
									</tr>
										{/foreach}
										<td>Email: </td>
										<td><a href="mailto:{$setting.email}">{$setting.email}</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
    {include file = "templates/$path_user/common/bottom-body.tpl"}
</body>
</html>