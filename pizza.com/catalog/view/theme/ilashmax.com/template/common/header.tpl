<?php $config = $this->registry->get('config'); ?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<!--link href="catalog/view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" /-->
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
<!--link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" /-->
<link href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/stylesheet/stylesheet_default.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<!--[if lt IE 9]>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
<link rel="stylesheet" href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/stylesheet/append/font-icons.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/stylesheet/append/animate.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/stylesheet/append/magnific-popup.css" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/stylesheet/append/responsive.css" type="text/css" />
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<script src="catalog/view/javascript/ilashmax/plugins.js" type="text/javascript"></script>
<script src="catalog/view/javascript/ilashmax/jquery.elevatezoom.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?> stretched background-site">
 <!-- Document Wrapper=============================================-->
<div id="wrapper" class="clearfix">
   <header id="header">
    <div id="header-wrap">
        <div class="container clearfix">		    
            <div class="col-sm-12 col-sm-6 nopadding header-mobile">
			   <div id="primary-menu-trigger"><i class="icon-reorder"></i></div>			
	            <!-- Logo============================================= -->
	            <div id="logo-ilashmax">
					 <?php if ($logo) { ?>
			          <a href="<?php echo $home; ?>" class="standard-logo" data-dark-logo="<?php echo $logo; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>		          
					  <?php } else { ?>
			          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
			         <?php } ?>
	            </div>
				<!-- #logo end -->
				<p class="time-open">
			        <span>we open:</span>
			        <strong class="we_open"><?php echo $we_open; ?></strong>
			        <span>phone:</span>
			        <strong class="we_open"><?php echo $telephone; ?></strong>
			    </p>
			</div> 
			 <div class="col-sm-6 right-block-social">
			 	  <div class="links">
				  	<ul>
						<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
						<li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
						<li id="top-cart"><?php echo $cart; ?></li>
					</ul>
			      </div>
				  <div class="socials">
				  	<?php if($config_twitter_parameter): ?>
			        <a class="tt" href="<?php echo $config_twitter_parameter; ?>" target="_blank"></a>
					<?php endif; ?>
					<?php if($config_youtube_parameter): ?>
			        <a class="ytb" href="<?php echo $config_youtube_parameter; ?>" target="_blank"></a>
					<?php endif; ?>
					<?php if($config_facebook_parameter): ?>
			        <a class="fb" href="<?php echo $config_facebook_parameter; ?>" target="_blank"></a>
					<?php endif; ?>
					<?php if($config_googleplus_parameter): ?>
			        <a class="gg" href="<?php echo $config_googleplus_parameter; ?>" target="_blank"></a>
					<?php endif; ?>
					<?php if($config_instagram_parameter): ?>
			        <a class="ins" href="<?php echo $config_instagram_parameter; ?>" target="_blank"></a>
					<?php endif; ?>
					<?php if($config_email): ?>
			        <a class="email" href="mailto:<?php echo $config_email; ?>"></a>
					<?php endif; ?>
			      </div>
				  <div class="search-box">
			         <?php echo $search; ?>
			      </div>
			 </div>          
        </div>
		<!-- Primary Navigation============================================= -->
        <nav id="primary-menu">
          <?php if ($categories) { ?>
			<ul>                  
			    <li><a href="<?php echo $home; ?>">Home</a></li>
			    <li <?php echo $router['information_id']==4 ? 'class="current"' : ''; ?>><a href="<?php echo $about_us; ?>">About Us</a></li>			    
				<?php  foreach ($categories as $category) { ?>
				<?php $class = ($router['path']==$category['category_id']) ? 'current' : ''; ?>
				 <?php if ($category['children']) { ?>				 	 
				     <?php $class .= ($category['column'] >=3) ? ' mega-menu ' : ''; ?>					 
                     <li class="<?php echo $class; ?>"><a href="<?php echo $category['href']; ?>"><div><?php echo $category['name']; ?></div></a>
					   <?php if($category['column'] > 1): ?>
					   <div class="mega-menu-content style-2 col-<?php echo $category['column'] ? $category['column'] : ($category['column'] >= 3 ? '4' : '2'); ?> clearfix">
					   <?php endif; ?>
					   <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                           <ul>
                                <?php foreach ($children as $child) { ?>
									<?php echo create_menu_item($child); ?>
					                <!--li class="mega-menu-title"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li-->
					            <?php } ?>									
                           </ul>
						<?php } ?>
						<?php if($category['column'] > 1): ?>
						</div>
						<?php endif; ?>   
                     </li>
				  <?php } else { ?>
			       <li class="<?php echo $class; ?>"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
			     <?php } ?>																																																																																																																																																																																																	
				<?php } ?>
				<li <?php echo $router['route']=='information/news' ? 'class="current"' : ''; ?>><a href="<?php echo $training_program; ?>">Training Programs</a></li>
				<li <?php echo $router['route']=='account/registerform' ? 'class="current"' : ''; ?>><a href="<?php echo $registerform; ?>">Registration Form</a></li>
				<!--li <?php echo $router['route']=='information/video' ? 'class="current"' : ''; ?>><a href="<?php echo $video_youtube; ?>">Videos</a></li-->
				<li <?php echo $router['route']=='information/contact' ? 'class="current"' : ''; ?>><a href="<?php echo $contact; ?>">Contact Us</a></li>									
              </ul>
			<?php } ?>               
        </nav>
		<!-- #primary-menu end -->
    </div>
  </header><!-- #header end --> 