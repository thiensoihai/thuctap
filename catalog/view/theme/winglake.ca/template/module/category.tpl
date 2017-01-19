 <div class="widget widget_links clearfix">
    <h4><?php echo isset($menu_main['name']) ? $menu_main['name'] : $categories[0]['name']; ?></h4>
    <ul>
	  <?php foreach ($categories as $category) { ?>
		 <li>
		  <?php if ($category['category_id'] == $category_id) { ?>
		  	<a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
			  <?php if ($category['children']) { ?>
			  <ul>
			  <?php foreach ($category['children'] as $child) { ?>
				  <?php if ($child['category_id'] == $child_id) { ?>
				  	<li><a href="<?php echo $child['href']; ?>" class="active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a></li>
				  <?php } else { ?>
				  	<li><a href="<?php echo $child['href']; ?>">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a></li>
				  <?php } ?>
			  <?php } ?>
			  </ul>
			  <?php } ?>
		  <?php } else { ?>
		  <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
		  <?php } ?>
		 </li>
	  <?php } ?>
    </ul>
</div>