<?php echo $header; ?>
<?php echo $top_banner_sidebar; ?>
<section id="page-title">
    <div class="container clearfix">
        <h1>Category</h1>
		
    </div>
 </section>
<section id="content">  
  <div class="content-wrap">
    <div class="container clearfix">		
		<div class="col-sm-12">
			  <?php //echo $content_top; ?>
			  <?php $border = 0; ?>   
		      <?php if ($products) { ?>		      
		      <div id="shop" class="clearfix col-sm-12" style="border-bottom: none;">
		        <?php foreach ($products as $key=>$product) { ?>					
		       		<div class="product clearfix <?php echo ($border==1) ? 'noleftborder' : ''; ?>">
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
				<?php echo ($key+1)%4==0 ? '<p class="bottom_line_products" style="clear: both;" ></p>' : ''; ?>
				<?php $border = ($key+1)%4==0 ? 1 : 0; ?>																																																														
		        <?php } ?>
		      </div>			  
		      <div class="row paging-product">
		        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
		        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
		      </div>
      		<?php }	?>
		      <?php if (!$categories && !$products) { ?>
		      <p><?php echo $text_empty; ?></p>
		      <div class="buttons">
		        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
		      </div>
		    <?php } ?>
		    <?php echo $content_bottom; ?>																																																																																							
			<?php echo $column_right; ?>
		</div>																																																																																																		
	</div>
  </div>
</section>
<?php echo $footer; ?>
