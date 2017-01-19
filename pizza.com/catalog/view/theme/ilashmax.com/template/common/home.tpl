<?php echo $header; ?>
<?php echo $top_banner_sidebar; ?>
<section id="content">
  <div class="content-wrap">
     <div class="container clearfix">
	 	<?php //echo $column_left_sidebar; ?>	   
	 	<?php //echo $column_right_sidebar; ?>
  		<?php echo $content_top; ?>
		<?php if ($content_bottom_left && $content_bottom_right) { ?>
	    <?php $s_class = 'col-sm-6'; ?>
	    <?php } elseif ($content_bottom_left || $content_bottom_right) { ?>
	    <?php $s_class = 'col-sm-9'; ?>
	    <?php } else { ?>
	    <?php $s_class = 'col-sm-12'; ?>
	    <?php } ?>
		<?php if(!empty($instagram_id_parameter) && !empty($token_instagram_parameter)): ?>	
		<div class="row">			
			<link href="catalog/view/javascript/ilashmax/instagram/pongstagr.am.min.css" rel="stylesheet" media="screen" />
			<script src="catalog/view/javascript/ilashmax/instagram/pongstagr.am.min.js" type="text/javascript"></script>
			<script type="text/javascript">
			$(document).ready(function () {			 
			  $('#instafeed').pongstgrm({
			    accessId:     '<?php echo $instagram_id_parameter; ?>',
			    accessToken:  '<?php echo $token_instagram_parameter; ?>',
				likes:     false,
				comments:  false,
				timestamp: false,
			  });			  				  
			  $('#selector').pongstgrm({
			      show:             'profile',
			      picture_size:     '70',                 
			      //profile_bg_img:   '/image/catalog/ins-logo.png',
			      profile_bg_color: '',
				  accessId:     '<?php echo $instagram_id_parameter; ?>',
			      accessToken:  '<?php echo $token_instagram_parameter; ?>'
			  });
			});
			</script>
			<div class="col-sm-12" id="selector"></div>
			<div class="col-sm-12 norightpadding" id="instafeed"></div>
		</div>
		<?php endif; ?>
		<?php echo $content_bottom; ?>
  	 </div>
  </div>
</section>
<?php echo $footer; ?>