<div class="single-product shop-quick-view-ajax clearfix">
    <div class="ajax-modal-title">
        <h2><?php echo $heading_title; ?></h2>
    </div>
    <div class="product modal-padding clearfix">
        <div class="col_half nobottommargin">
            <div class="product-image">
                <div class="fslider" data-pagi="false">
                    <div class="flexslider">
                        <div class="slider-wrap">
                            <div class="slide">
                                <a href="javascript:;" alt="<?php echo $heading_title; ?>"
                                   title="<?php echo $heading_title; ?>">
                                    <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>">
                                </a>
                            </div>
	                        <?php if(count($images) > 0): ?>
                            <?php foreach ($images as $image) { ?>
	                        <div class="slide">
		                        <a href="javascript:;" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>">
			                        <img src="<?php echo $image['popup']; ?>" alt="<?php echo $heading_title; ?>">
		                        </a>
	                        </div>
	                        <?php } ?>
	                        <?php endif; ?>
                        </div>
                    </div>
                </div>
                <?php if(isset($discount) && $discount > 0): ?>
                 <div class="sale-flash">Sale <?php echo $discount; ?>% off!</div>
				<?php endif; ?>
            </div>
        </div>
        <div class="col_half nobottommargin col_last product-desc">
	        <?php if ($price) { ?>
            <div class="product-price">
	            <?php if (!$special) { ?>
	                <?php echo $price; ?>
	            <?php } else { ?>
                    <del><?php echo $price; ?></del>
                    <ins><?php echo $special; ?></ins>
	            <?php } ?>
            </div>
	        <?php } ?>
	        <?php if ($rating) { ?>
            <div class="product-rating">
	            <?php for ($i = 1; $i <= 5; $i++) { ?>
	                <?php if ($rating < $i) { ?>
	                    <i class="icon-star3"></i>
	                <?php } else { ?>
		                <i class="icon-star-empty"></i>
		            <?php } ?>
	            <?php } ?>
            </div>
	        <?php } ?>
            <div class="clear"></div>
            <div class="line"></div>
            <!-- Product Single - Quantity & Cart Button
            ============================================= -->
            <form class="cart nobottommargin clearfix" method="post" enctype='multipart/form-data'>
                <div class="quantity clearfix">
                    <input type="button" value="-" class="minus">
                    <input type="text" step="1" min="1" name="quantity" value="1" title="Qty" class="qty" size="4"/>
                    <input type="button" value="+" class="plus">
                </div>
                <button type="button" class="add-to-cart button nomargin"
                        onclick="cart.add('<?php echo $product_id; ?>',$('.qty').val());">
	                <?php echo $button_cart; ?>
                </button>
            </form>
            <!-- Product Single - Quantity & Cart Button End -->
            <div class="clear"></div>
            <div class="line"></div>
            <p><?php echo $description; ?></p>
            <div class="panel panel-default product-meta nobottommargin">
                <div class="panel-body">
	                <!--
                    <span itemprop="productID" class="sku_wrapper">SKU: <span class="sku">8465415</span></span>
                    <span class="posted_in">Category: <a href="http://localhost/offbeat/wp/product-category/shoes/"
                                                         rel="tag">Shoes</a>.</span>
                                                         -->
	                <?php if (count($tags) > 0) {
	                    $tag = [];
	                    foreach ($tags as $val) {
	                        $tag[] = "<a href='{$val[href]}' rel='tag'>$val[tag]</a>";
	                    }
	                ?>
                    <span class="tagged_as">
	                    <?php echo $text_tags; ?> <?php echo implode(', ', $tag); ?>.
                    </span>
					<?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>