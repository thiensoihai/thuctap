<div class="fslider" data-arrows="false">
  <div class="flexslider">
	<div class="slider-wrap">
	  <?php foreach ($categories as $category) { ?>
	  <div class="slide">
	  	 <a href="<?php echo $category['href']; ?>">
			<img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>">
		</a>
	  </div> 
  	<?php } ?>
   </div>
  </div>
</div>