<?php if(count($special_products) > 0  || count($bestseller_products) > 0  || count($featured_products) > 0 ):  ?>
<div class="tabs topmargin-lg clearfix" id="tab-3">
    <ul class="tab-nav clearfix">
		<?php if(count($special_products) > 0 ): ?>
        <li><a href="#tabs-9"><?php echo $tab_special; ?></a></li>
		<?php endif; ?>
		<?php if(count($bestseller_products) > 0 ): ?>
        <li><a href="#tabs-10"><?php echo $tab_bestseller; ?></a></li>
		<?php endif; ?>
		<?php if(count($featured_productsspecial_products) > 0 ): ?>
        <li><a href="#tabs-11"><?php echo $tab_featured; ?></a></li>
		<?php endif; ?>
    </ul>
    <div class="tab-container">
		 <?php if($special_products): ?>
        <div class="tab-content clearfix" id="tabs-9">		 
            <div id="shop" class="clearfix">
			    <?php foreach ($special_products as $product) { ?>
				  <div class="product clearfix">
				    <div class="product-image">
				      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
				       <?php if($product['discount'] > 0): ?>
					   <div class="sale-flash"><?php echo $discount; ?>% Off*</div>
					   <?php endif; ?>
					   <div class="product-overlay">
					  	  <a href="javascript:void(0);" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="add-to-cart"><i class="icon-shopping-cart"></i><span> <?php echo $button_cart; ?></span></a>
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
				          <del><?php echo $product['price']; ?></del>  &nbsp;  <ins><?php echo $product['special']; ?></ins>
				          <?php } ?>
				          <?php if ($product['tax']) { ?>
				          	<br /><ins><?php echo $text_tax; ?> <?php echo $product['tax']; ?></ins>
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
        </div>
		<?php endif; ?>
		<?php if($bestseller_products): ?>
        <div class="tab-content clearfix" id="tabs-10">			
            <div id="shop" class="clearfix">
            	<?php foreach ($bestseller_products as $product) { ?>
				 <div class="product clearfix">
				    <div class="product-image">
				      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
				       <?php if($product['discount'] > 0): ?>
					   <div class="sale-flash"><?php echo $discount; ?>% Off*</div>
					   <?php endif; ?>
					   <div class="product-overlay">
					  	  <a href="javascript:void(0);" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="add-to-cart"><i class="icon-shopping-cart"></i><span> <?php echo $button_cart; ?></span></a>
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
				          <del><?php echo $product['price']; ?></del>  &nbsp;  <ins><?php echo $product['special']; ?></ins>
				          <?php } ?>
				          <?php if ($product['tax']) { ?>
				          	<br /><ins><?php echo $text_tax; ?> <?php echo $product['tax']; ?></ins>
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
        </div>
		<?php endif; ?>
		<?php if($featured_products): ?>
        <div class="tab-content clearfix" id="tabs-11">		  
            <div id="shop" class="clearfix">
				<?php foreach ($featured_products as $product) { ?>
				  <div class="product clearfix">
				    <div class="product-image">
				      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
				       <?php if($product['discount'] > 0): ?>
					   <div class="sale-flash"><?php echo $discount; ?>% Off*</div>
					   <?php endif; ?>
					   <div class="product-overlay">
					  	  <a href="javascript:void(0);" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="add-to-cart"><i class="icon-shopping-cart"></i><span> <?php echo $button_cart; ?></span></a>
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
				          <del><?php echo $product['price']; ?></del> &nbsp; <ins><?php echo $product['special']; ?></ins>
				          <?php } ?>
				          <?php if ($product['tax']) { ?>
				          	<br /><ins><?php echo $text_tax; ?> <?php echo $product['tax']; ?></ins>
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
        </div>
		<?php endif; ?>
    </div>
</div>
<?php endif; ?>