<div class="clear bottommargin-lg"></div>
<div id="shop" class="clearfix col-sm-12">
  <?php foreach ($products as $key=>$product) { ?>
  <div class="product clearfix">
        <div class="product-image">
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>			
            <?php if(count($product['sub_images']) > 0): ?>
				<?php foreach($product['sub_images'] as $k=>$v): ?>
					<?php if(!empty($v)): ?>
					<a href="<?php echo $product['href']; ?>"><img src="<?php echo $v; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
					<?php endif; ?>
				<?php endforeach; ?>
			<?php endif; ?>
			<?php if($product['discount'] > 0): ?>
			<div class="sale-flash"><?php echo $product['discount']; ?>% Off*</div>
			<?php endif; ?>           
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
		          <?php if ($product['rating'] > $i) { ?>
		          <i class="icon-star3"></i>
		          <?php } else { ?>
		          <i class="icon-star-empty"></i>
		          <?php } ?>
		          <?php } ?>
		        </div>
		     <?php } ?>
			 <?php if($product['description']): ?>
			 <span><?php echo $product['description']; ?></span>
			 <?php endif; ?>
			 <a href="javascript:void(0);" class="add-to-cart btn-buy" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></a>		
        </div>
   </div>
   <?php echo ($key+1)%4==0 ? '<p class="bottommargin-lg" style="clear: both;" ></p>' : ''; ?>
  <?php } ?>
<div class="clear bottommargin-lg"></div>  
</div>