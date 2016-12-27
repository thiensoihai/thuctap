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
<link href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/css/nivo-slider.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/css/anythingslider.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/css/lightbox.css" rel="stylesheet"/>
<link href="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/css/style.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<!--[if lt IE 9]>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?> stretched background-site">
<div class="ipad-box9">
  <h4>PLACE YOUR BOOKING HERE!!!</h4>
  <div class="mCont">
    <form>
      <fieldset>
        <label class="q1"> Year
          <input type="text">
        </label>
        <label class="q1"> Day
          <input type="text">
        </label>
        <label class="q1"> Month
          <input type="text">
        </label>
        <label class="q1"> Time
          <input type="text">
        </label>
        <label class="q2"> Name
          <input type="text">
        </label>
        <label class="q1"> Guests
          <input type="text">
        </label>
        <label> E-mail
          <input type="text">
        </label>
        <label class="q3"> Telephone
          <input type="text">
        </label>
        <label> Special request
          <textarea></textarea>
        </label>
        <div class="submitHolder">
          <input type="submit" value="place booking">
        </div>
        <div class="clearfix"></div>
      </fieldset>
    </form>
  </div>
</div>
<div class="topBar">
  <div class="backg"></div>
  <a href="#" class="bookTable">Book a table</a></div>
<div id="header">
  <div class="container">
    <div class="logoContainer"> <a href="1_home.html"><img src="img/logo.png" alt=""></a> </div>
    <div class="topData">
      <ul class="social">
        <li><a href="#" class="fb">Facebook</a></li>
        <li><a href="#" class="twit">Twitter</a></li>
        <li><a href="#" class="rss">Rss</a></li>
        <li><a href="#" class="mail">E-mail</a></li>
      </ul>
      <address>
      123 Eastern 12th ST New York, NY +49 1234 56789-0
      </address>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<div id="menuContainer">
  <div class="container">
    <ul class="mainMenu" id="nav">
		<li><a href="<?php echo $home; ?>">Home</a></li>
	    <li <?php echo $router['information_id']==4 ? 'class="current"' : ''; ?>><a href="<?php echo $about_us; ?>">About Us</a></li>
        <li>
        <div class="dropdown">
            <a class="" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Menu
            </a>
            <ul style="z-index:100" class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <?php  foreach ($categories as $category) { ?>
                <?php if($category['category_id'] !== "210"){ ?>
                <li><a href="<?php echo $category['href'] ?>"><?php echo $category['name'] ?></a></li>
                <?php }else{ define('create', $category['href']); } } ?>
            </ul>
        </div>
        </li>
		<li <?php echo $router['route']=='information/contact' ? 'class="current"' : ''; ?>><a href="<?php echo $contact; ?>">Contact Us</a></li>	

    </ul>
      <!-- id="bkTable"-->
    <div class="login"><a href="<?php echo create?>" class="bookTable">Book a table</a>
      <ul>
        <li><a href="">Login</a></li>
        <li><a href="">Password</a></li>
      </ul>
    </div>
    <div class="clearfix"></div>
  </div>
</div>