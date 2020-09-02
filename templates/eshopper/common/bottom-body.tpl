<div class="container">
  {foreach from=$allbanner.bawah item=obj}
    <img class="img-responsive" src="{str_replace('[baseurlroot]', $baseurl, $obj.banner)}" />
  {/foreach}
</div>

<footer id="footer"><!--Footer-->
  
  <div class="footer-bottom">
    <div class="container">
      <div class="row">
        <p class="pull-left">Copyright © 2015 {$setting.nama}. All rights reserved.</p>
        <p class="pull-right">Powered  by <span><a target="_blank" href="http://izywebstore.com">IzywebStore.com</a></span></p>
      </div>
    </div>
  </div>
</footer>
<!--/Footer-->

<script src="{$baseurl}/templates/{$path_user}/assets/js/bootstrap.min.js"></script>
<!--<script src="{$baseurl}/templates/{$path_user}/assets/js/jquery.scrollUp.min.js"></script>
<script src="{$baseurl}/templates/{$path_user}/assets/js/jquery.prettyPhoto.js"></script>
-->

<!-- Our script -->
<script src="{$baseurl}/templates/{$path_user}/assets/js/jquery.number.min.js"></script>
<script type="text/javascript" src="{$baseurl}/templates/{$path_user}/assets/js/izycart.js"></script>
<!--<script type="text/javascript" src="{$baseurl}/templates/{$path_user}/assets/js/uiwidget.js"></script>-->
<script type="text/javascript" src="{$baseurl}/templates/{$path_user}/assets/js/numeral.min.js"></script>

<script src="{$baseurl}/templates/{$path_user}/assets/plugins/toastr/toastr.min.js"></script>
<link rel="stylesheet" type="text/css" href="{$baseurl}/templates/{$path_user}/assets/plugins/toastr/toastr.min.css">

<!-- jQuery Busy -->
<!--<script src="{$baseurl}/templates/{$path_user}/assets/plugins/jquery-busy/v1.06/jquery.busy.js"></script>-->

<!-- jQuery Noty -->
<!--<script src="{$baseurl}/templates/{$path_user}/assets/plugins/noty/packaged/jquery.noty.packaged.min.js"></script>-->

<!-- validation engine -->
<!--<script src="{$baseurl}/templates/{$path_user}/assets/plugins/validation/js/languages/jquery.validationEngine-en.js"></script>
<script src="{$baseurl}/templates/{$path_user}/assets/plugins/validation/js/jquery.validationEngine.js"></script>
<link rel="stylesheet" type="text/css" href="{$baseurl}/templates/{$path_user}/assets/plugins/validation/css/validationEngine.jquery.css">-->

<!-- jQuery UI -->
<!--<script src="{$baseurl}/templates/{$path_user}/assets/plugins/jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="{$baseurl}/templates/{$path_user}/assets/plugins/jquery-ui-1.9.2.custom/css/ui-lightness/jquery-ui-1.9.2.custom.min.css">
-->


{$allsettings.script_body} 