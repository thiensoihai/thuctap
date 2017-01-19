<?php echo $header; ?>
<section id="page-title">
    <div class="container clearfix">
        <h1><?php echo $heading_title; ?></h1>
		<span><?php echo $text_description; ?></span>		
         <ol class="breadcrumb">
		    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		    <?php } ?>
		</ol>
    </div>
</section>
<section id="content"> 
 <div class="content-wrap">  
  <div class="container clearfix">
   <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="shop" class="clearfix">
	  <?php foreach ($products as $product) { ?>
	  <div class="product clearfix">
	        <div class="product-image">
				<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>			
	            <?php if(count($product['sub_images']) > 0): ?>
					<?php foreach($product['sub_images'] as $k=>$v): ?>
					<a href="<?php echo $product['href']; ?>"><img src="<?php echo $v; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
					<?php endforeach; ?>
				<?php endif; ?>
				<?php if($product['discount'] > 0): ?>
				<div class="sale-flash"><?php echo $product['discount']; ?>% Off*</div>
				<?php endif; ?>
	            <div class="product-overlay">
	                <a href="javascript:void(0);" class="add-to-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="icon-shopping-cart"></i><span> <?php echo $button_cart; ?></span></a>
	                <a href="<?php echo $product['quickview']; ?>" class="item-quick-view" data-lightbox="ajax"><i class="icon-zoom-in2"></i><span> Quick View</span></a>
	            </div>
	        </div>
	        <div class="product-desc">
	            <div class="product-title"><h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3></div>
	            <?php if ($product['price']) { ?>
		        	<div class="product-price">
			          <?php if (!$product['special']) { ?>
			          <?php echo $product['price']; ?>
			          <?php } else { ?>
			          <del><?php echo $product['price']; ?></del> <ins><?php echo $product['special']; ?></ins> 
			          <?php } ?>
			          <?php if ($product['tax']) { ?>
			          <!--span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span-->
			          <?php } ?>
		        	</div>
		         <?php } ?>
	             <?php if ($product['rating']) { ?>
			       <div class="product-rating">
			          <?php for ($i = 1; $i <= 5; $i++) { ?>
			          <?php if ($product['rating'] < $i) { ?>
			          <i class="icon-star3"></i>
			          <?php } else { ?>
			          <i class="icon-star-empty"></i>
			          <?php } ?>
			          <?php } ?>
			        </div>
			     <?php } ?>			
	        </div>
	    </div>
		<?php } ?>
	</div>
    <?php echo $column_right; ?>
  </div>
 </div>
</section>
<?php echo $footer; ?> 