<!-- Footer ============================================= -->        
<footer id="footer" class="dark">
    <div class="container nopadding links-bottom">
        <!-- Footer Widgets   ============================================= -->
        <div class="footer-widgets-wrap clearfix">
		    <?php if ($informations) { ?>
		          <?php foreach ($informations as $information) { ?>
		         	  <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
		          <?php } ?>
		     <?php } ?>            
        </div>
		<!-- .footer-widgets-wrap end -->
    </div>
    <!-- Copyrights
    ============================================= -->
    <div id="copyrights">
        <div class="container clearfix">
            <div class="col_half">
                <?php echo $powered; ?>
            </div>
            <div class="col_half col_last tright">
                <div class="fright clearfix">
					<?php if(count($hok_sharing['sharing']) > 0): ?>
						<?php foreach($hok_sharing['sharing'] as $key=>$value): ?>
	                    <a href="<?php echo $value['sharing_link']; ?>" class="social-icon si-small si-borderless si-<?php echo $value['sharing_icon']; ?>">
	                        <i class="<?php echo $value['sharing_style']; ?>"></i>
	                        <i class="<?php echo $value['sharing_style']; ?>"></i>
	                    </a>
						<?php endforeach; ?>
					<?php endif; ?>                    
                </div>
                <div class="clear"></div>
                <i class="icon-envelope2"></i> <a href="mailto: <?php echo $email; ?>"><?php echo $email; ?></a> <span class="middot">&middot;</span> <i class="icon-headphones"></i> <a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a> <span class="middot">&middot;</span>
            </div>
        </div>
    </div><!-- #copyrights end -->
</footer>
<!-- #footer end -->
</div>
<!-- Go To Top
============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>
<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="catalog/view/javascript/ilashmax/functions.js"></script>
<?php if(!empty($facebook['id']) > 0): ?>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '<?php echo $facebook['id']; ?>',
      xfbml      : true,
      version    : 'v2.4'
    });
  };
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<?php endif; ?>
</body></html>