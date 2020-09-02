<!DOCTYPE html>
<html lang="en">
  <head>
    {include file = "templates/$path_user/common/header.tpl"}
    <style type="text/css">
    </style>
    <body>
      {include file = "templates/$path_user/common/top-body.tpl"}
      <div class="container">
        <div class="row">
          <div class="col-md-3"> {include file = "templates/$path_user/common/side-body-left.tpl"} </div>
          <div class="col-md-9 padding-right">
            <h3>Silahkan Login terlebih dahulu!</h3>
            <div>
              <p>Anda harus <a href="{$baseurl}/customer/signin.html" title="">login</a> terlebih dahulu untuk melanjutkan. Jika bukan member , silahkan mendaftar terlebih dahulu.</p>
            </div>
          </div>
        </div>
      </div>
      {include file = "templates/$path_user/common/bottom-body.tpl"}
    </body>
  </html>