<a href="<?php echo $shopping_cart; ?>" id="top-cart-trigger"><?php echo $text_shopping_cart; ?> <span id="cart-total"><?php echo $number_load_cart; ?></span></a>
<div class="top-cart-content">
   <div id="content-wap-cart">
    <div class="top-cart-title">
        <h4><?php echo $text_cart; ?></h4>
    </div>
    <div class="top-cart-items">
	   <?php if ($products || $vouchers) { ?>
	     <?php foreach ($products as $product) { ?>
	        <div class="top-cart-item clearfix">				
	            <div class="top-cart-item-image">
	                <?php if ($product['thumb']) { ?>
	            		<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
	            	<?php } ?>
	            </div>
	            <div class="top-cart-item-desc">
	                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>		            
	                <span class="top-cart-item-price"><?php echo $product['total']; ?></span>
	                <span class="top-cart-item-quantity">x <?php echo $product['quantity']; ?></span>
	            </div>
	        </div>
		<?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <div class="top-cart-item clearfix">
            <div class="top-cart-item-image">
                <a href="#"><img src="image/Voucher.png" alt="<?php echo $voucher['description']; ?>" /></a>
            </div>
            <div class="top-cart-item-desc">
                <a href="#"><?php echo $voucher['description']; ?></a>
                <span class="top-cart-item-price"><?php echo $voucher['amount']; ?></span>
                <span class="top-cart-item-quantity">x 1</span>
            </div>
        </div>
		<?php } ?>
		<?php } else { ?>
		 <div class="top-cart-item clearfix"><?php echo $text_empty; ?></div>
		<?php } ?>
    </div>
    <div class="top-cart-action 5padding clearfix">
		<table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <button class="button button-3d button-small fright allmargin-sm" onclick="window.location.href='<?php echo $cart; ?>'"><?php echo $text_checkout; ?></button>
    </div>
   </div>
</div>