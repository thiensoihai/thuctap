<h3><?php echo $heading_title; ?></h3>
<div class="row">
<div id="carousel_featuredCategory" class="owl-carousel">
  <?php foreach ($categories as $category) { ?>
  <div class="item category-layout col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="category-thumb transition">
      <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a></div>
      
	  <div class="caption">
        <h4 style="text-align:center"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h4>
		<?php if($category['display_description_status']=="1"){?>
        <p><?php echo $category['description']; if($category['description']!=''){echo '..';}?></p>
		<?php } ?>
      </div>

    </div>
  </div>
  <?php } ?>
</div>  
</div>
<script type="text/javascript"><!--
$('#carousel_featuredCategory').owlCarousel({
	items: 4,
	autoPlay: 3000,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
--></script>
