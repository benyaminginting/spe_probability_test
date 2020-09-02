<!DOCTYPE html>
<html lang="en">
<head>
{include file = "templates/$path_user/common/header.tpl"}
<body>
{include file = "templates/$path_user/common/top-body.tpl"}

<div class="container">
  <div class="row">
    <div class="col-md-3">
      {include file = "templates/$path_user/common/side-body-left-memberarea.tpl"} 
    </div>
    <div class="col-md-9 padding-right">
      <div class="blog-post-area animated bounceInUp"> 
        <!-- judul page -->
        <h2 class="title text-center"> Member area </h2>
        <!-- isi konten page -->
        <div class="single-blog-post"> {$detailpage.content} </div>
      </div>
    </div>
  </div>
</div>
{include file = "templates/$path_user/common/bottom-body.tpl"}
</body>
</html>
