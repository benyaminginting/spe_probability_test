<div class="overlay-loader" id="loader" style="display:none;"><i class="fa fa-refresh fa-spin"></i></div>

<header id="header"><!--header-->
  <div class="header_top"><!--header_top-->
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <div class="contactinfo">
            <ul class="nav nav-pills">
              <li><a href="#"><i class="fa fa-phone"></i> {$setting.telpon}</a></li>
              <li><a href="#"><i class="fa fa-envelope"></i> {$setting.email}</a></li>
            </ul>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="social-icons pull-right">
            <ul class="nav navbar-nav">
            {if $allsettings.facebook != ""}  
              <li><a href="{$allsettings.facebook}"><i class="fa fa-facebook"></i></a></li>
            {/if}  
            {if $allsettings.twitter != ""}  
              <li><a href="{$allsettings.twitter}"><i class="fa fa-twitter"></i></a></li>
            {/if}  
            {if $allsettings.instagram != ""}  
              <li><a href="{$allsettings.instagram}"><i class="fa fa-instagram"></i></a></li>
            {/if}  
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--/header_top-->
  
  <div class="container">
    <div class="row">
      <marquee behavior="scroll">
      {$runningtext}
      </marquee>
    </div>
  </div>
  <div class="header-middle" id="nav-cart"><!--header-middle-->
    <div class="container">
      <div class="row">
        <div class="col-sm-4">
          <div class="logo "> <a href="{$baseurl}"><img  src="{$logo}" class="img-responsive" alt="{$setting.nama}" /></a> </div>
        </div>
        <div class="col-sm-8">
          <div class="shop-menu pull-right ">
            <ul class="nav navbar-nav">
              {if $login_customer.is_login}
              <li><a href="{$baseurl}/customer/profile.html"><i class="fa fa-user"></i> {$login_customer.nama}</a></li>
              <li><a href="{$baseurl}/customer/invoice.html"><i class="fa fa-list"></i> Invoice</a></li>
              <li><a href="{$baseurl}/cart/checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>
              <li><a href="{$baseurl}/cart.html"><i class="fa fa-shopping-cart"></i> Cart <span id="jlhbarang" class="badge">{$carts.headcart.jumlah_item}</span></a></li>
              <li><a href="{$baseurl}/customer/logout"><i class="fa fa-lock"></i> Logout</a></li>
              {else}
              <li><a href="{$baseurl}/cart/checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>
              <li><a href="{$baseurl}/cart.html"><i class="fa fa-shopping-cart"></i> Cart <span id="jlhbarang" class="badge">{$carts.headcart.jumlah_item}</span></a></li>
              <li><a href="{$baseurl}/customer/signin.html"><i class="fa fa-lock"></i> Login</a></li>
              {/if}
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--/header-middle-->
  
  <div class="header-bottom"><!--header-bottom-->
    <div class="container">
      <div class="row">
        <div class="col-sm-9">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          </div>
          <div class="mainmenu pull-left">
            <ul class="nav navbar-nav collapse navbar-collapse">
              <li><a class="" href="{$baseurl}/">Home</a></li>
              <li><a class="" href="{$baseurl}/page/about.html">About Us</a></li>
              <li><a class="" href="{$baseurl}/product-list">Products</a></li>
              <li><a class="" href="{$baseurl}/page/howto.html">How To Shop</a></li>
              <li><a class="" href="{$baseurl}/news">News</a></li>
              <li><a class="" href="{$baseurl}/page/contact.html">Contact</a></li>
              <li><a class="" href="{$baseurl}/page/promo.html">Promo</a></li>
            </ul>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="search_box pull-right">
            <form id="frmsearch" action="{$baseurl}/search" method="get" class="">
              <input type="text" placeholder="Search" name="q" id="q" value="{$searchq}"/> <br>
              <input type="hidden" name="order" value="{$smarty.get['order']}">
              <!-- <select name="pilihfilter" class="span3" id="pilihfilter">
                  <option value="" selected="selected">Urutkan</option>
                  <option value="">Harga Terendah</option>
                  <option value="">Harga Tertinggi</option>
                  <option value="">Ascending</option>
                  <option value="">Descending</option>

              </select> -->
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--/header-bottom--> 
</header>
<!--/header-->