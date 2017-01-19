<?php if(count($categories) > 0): ?>
<?php foreach ($categories as $category) { ?>
  <div class="col_full bottommargin-sm">
	<a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>"></a>
  </div>    
<?php } ?>
<?php endif; ?>
