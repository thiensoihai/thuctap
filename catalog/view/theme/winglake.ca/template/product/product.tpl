<?php echo $header; ?>
<section id="page-title">
    <div class="container clearfix">
        <h1><?php echo $heading_title; ?></h1>		
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
		<!--<div class="sidebar nobottommargin">
	      <div class="sidebar-widgets-wrap">
	  		<?php echo $column_left; ?>	
		  </div>
		</div>-->
		<div class="postcontent nobottommargin col_last">
			 <div class="single-product">
                <div class="single-product">
                    <div class="product">
                        <div class="col_half" style="margin-bottom: 20px;">
                            <!-- Product Single - Gallery  ============================================= -->
                            <div class="product-image-detail" id="detail-image">
								<?php if ($thumb || $images) { ?>
									<?php if($small_popup): ?>
									<img id="img_01" src="<?php echo $small_popup; ?>" data-zoom-image="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>"/> 
									<?php endif; ?>									
									<div id="gallery_01"> 
										<a href="javascript:void(0)" data-image="<?php echo $small_popup; ?>" data-zoom-image="<?php echo $popup; ?>"> 
											<img id="img_01" src="<?php echo $thumb; ?>" /> 
										</a> 
										<?php if(count($images) > 0): ?>
										<?php foreach ($images as $key=>$image) { ?>
											<?php if(!empty($image['thumb'])): ?>
											<a href="javascript:void(0)" data-image="<?php echo $image['small']; ?>" data-zoom-image="<?php echo $image['popup']; ?>"> 
												<img id="img_0<?php echo $key+2; ?>" src="<?php echo $image['thumb']; ?>" alt="<?php echo $heading_title; ?>" /> 
											</a>							              	
							            	<?php endif; ?>
										<?php } ?>										
										<?php endif; ?>	
									</div>		          
						          <?php } ?>
								 <?php if($discount > 0): ?>
                                 <div class="sale-flash">Sale <?php echo $discount; ?>% off!</div>
								<?php endif; ?>
                            </div>
							<script type="text/javascript">	
								$("#img_01").elevateZoom({ gallery : "gallery_01", galleryActiveClass: "active" });
								//$('#img_01').elevateZoom({tint:true, tintColour:'#F90', tintOpacity:0.5});
							</script>
							<!-- Product Single - Gallery End -->
                        </div>
                        <div class="col_half col_last " id="product">
							<h3><?php echo $heading_title; ?></h3>
                            <!-- Product Single - Price ============================================= -->
							<?php if ($price) { ?>
					          <div class="product-price" style="margin-top: 15px;">
					            <?php if (!$special) { ?>
					            <ins><?php echo $price; ?></ins>								
					            <?php } else { ?>
					            <del><?php echo $price; ?></del>
					            <ins><?php echo $special; ?></ins>
					            <?php } ?>
					            <!--<?php if ($tax) { ?>
								<hr>
					            <ins><?php echo $text_tax; ?> <?php echo $tax; ?></ins>
								<hr>
					            <?php } ?>-->
					            <?php if ($points) { ?>
					            <ins><?php echo $text_points; ?> <?php echo $points; ?></ins>
					            <?php } ?>
					            <?php if ($discounts) { ?>					           
					            <hr>					           
					            <?php foreach ($discounts as $discount) { ?>
					            <ins><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></ins>
					            <?php } ?>
					            <?php } ?>
					          </div>
					        <?php } ?>
							<!--<?php if ($product['rating']) { ?>
				               <div class="product-rating">
				                <?php for ($i = 1; $i <= 5; $i++) { ?>
				                <?php if ($product['rating'] > $i) { ?>
				                 <i class="icon-star3"></i>
				                <?php } else { ?>
				                 <i class="icon-star-empty"></i>
				                <?php } ?>
				                <?php } ?>
				              </div>
				            <?php } ?>-->                                        
                            <div class="clear"></div>                           
                            <!-- Product Single - Short Description    ============================================= -->                          						
							<ul class="iconlist">
								<?php if ($manufacturer) { ?>
					            <li><i class="icon-caret-right"></i><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
					            <?php } ?>
					            <li><i class="icon-caret-right"></i><?php echo $text_model; ?> <?php echo $model; ?></li>
					            <?php if ($reward) { ?>
					            <li><i class="icon-caret-right"></i><?php echo $text_reward; ?> <?php echo $reward; ?></li>
					            <?php } ?>
					            <!--li><i class="icon-caret-right"></i><?php echo $text_stock; ?> <?php echo $stock; ?></li-->
					        </ul>                            
                            <!-- Product Single - Meta
                            ============================================= -->
							<?php if(count($options) > 0 || count($recurrings) > 0 || !empty($description)): ?>
                            <div class="panel panel-default product-meta">
                                <?php if ($options || $recurrings) { ?>
								<div class="panel-body">
                                    <?php if ($options) { ?>						            
						            <h3><?php echo $text_option; ?></h3>
						            <?php foreach ($options as $option) { ?>
						            <?php if ($option['type'] == 'select') { ?>
						            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
						              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
						                <option value=""><?php echo $text_select; ?></option>
						                <?php foreach ($option['product_option_value'] as $option_value) { ?>
						                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
						                <?php if ($option_value['price']) { ?>
						                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
						                <?php } ?>
						                </option>
						                <?php } ?>
						              </select>
						            </div>
						            <?php } ?>
						            <?php if ($option['type'] == 'radio') { ?>
						            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						              <label class="control-label"><?php echo $option['name']; ?></label>
						              <div id="input-option<?php echo $option['product_option_id']; ?>">
						                <?php foreach ($option['product_option_value'] as $option_value) { ?>
						                <div class="radio">
						                  <label>
						                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
						                    <?php echo $option_value['name']; ?>
						                    <?php if ($option_value['price']) { ?>
						                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
						                    <?php } ?>
						                  </label>
						                </div>
						                <?php } ?>
						              </div>
						            </div>
						            <?php } ?>
						            <?php if ($option['type'] == 'checkbox') { ?>
						            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						              <label class="control-label"><?php echo $option['name']; ?></label>
						              <div id="input-option<?php echo $option['product_option_id']; ?>">
						                <?php foreach ($option['product_option_value'] as $option_value) { ?>
						                <div class="checkbox">
						                  <label>
						                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
						                    <?php echo $option_value['name']; ?>
						                    <?php if ($option_value['price']) { ?>
						                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
						                    <?php } ?>
						                  </label>
						                </div>
						                <?php } ?>
						              </div>
						            </div>
						            <?php } ?>
						            <?php if ($option['type'] == 'image') { ?>
						            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						              <label class="control-label"><?php echo $option['name']; ?></label>
						              <div id="input-option<?php echo $option['product_option_id']; ?>">
						                <?php foreach ($option['product_option_value'] as $option_value) { ?>
						                <div class="radio">
						                  <label>
						                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
						                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
						                    <?php if ($option_value['price']) { ?>
						                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
						                    <?php } ?>
						                  </label>
						                </div>
						                <?php } ?>
						              </div>
						            </div>
						            <?php } ?>
						            <?php if ($option['type'] == 'text') { ?>
						            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
						              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
						            </div>
						            <?php } ?>
						            <?php if ($option['type'] == 'textarea') { ?>
						            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
						              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
						            </div>
						            <?php } ?>
						            <?php if ($option['type'] == 'file') { ?>
						            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						              <label class="control-label"><?php echo $option['name']; ?></label>
						              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
						              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
						            </div>
						            <?php } ?>
						            <?php if ($option['type'] == 'date') { ?>
						            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
						              <div class="input-group date">
						                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
						                <span class="input-group-btn">
						                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
						                </span></div>
						            </div>
						            <?php } ?>
						            <?php if ($option['type'] == 'datetime') { ?>
						            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
						              <div class="input-group datetime">
						                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
						                <span class="input-group-btn">
						                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
						                </span></div>
						            </div>
						            <?php } ?>
						            <?php if ($option['type'] == 'time') { ?>
						            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
						              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
						              <div class="input-group time">
						                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
						                <span class="input-group-btn">
						                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
						                </span></div>
						            </div>
						            <?php } ?>
						            <?php } ?>
						            <?php } ?>
						            <?php if ($recurrings) { ?>
						            <hr>
						            <h3><?php echo $text_payment_recurring ?></h3>
						            <div class="form-group required">
						              <select name="recurring_id" class="form-control">
						                <option value=""><?php echo $text_select; ?></option>
						                <?php foreach ($recurrings as $recurring) { ?>
						                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
						                <?php } ?>
						              </select>
						              <div class="help-block" id="recurring-description"></div>
						            </div>
						            <?php } ?>						            
                                </div>
								<?php } ?>
								<div class="product-desc"><?php echo $description;  ?>	</div>
                            </div><!-- Product Single - Meta End -->
							<?php endif; ?>
                            <!-- Product Single - Quantity & Cart Button
                            ============================================= -->		                           
                            <div class="quantity clearfix">
                                <input type="button" value="-" class="minus">
                                <input type="text" step="1" min="1"  name="quantity" id="input-quantity" value="<?php echo $minimum; ?>" title="Qty" class="qty" size="4" />
                                <input type="button" value="+" class="plus">
                            </div>
                            <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="add-to-cart button nomargin"><?php echo $button_cart; ?></button>
							<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />                            
                            <div class="clear"></div>                            
				            <?php if ($minimum > 1) { ?>
				            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
				            <div class="clear"></div>
							<?php } ?>
                            <!-- Product Single - Share
                            ============================================= -->
                            <div class="si-share noborder clearfix" style="margin-top: 25px;">                              
                              <div style="padding: 5px 0px;">
					            <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
					            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>					           
                             </div>
							 <span style="float: right;">Share:</span>
                           </div>
							<!-- Product Single - Share End -->
                        </div>
						<div class="clear"></div>						
                    </div>
					
					<div class="col_full nobottommargin">
						<?php if ($review_status) { ?>
			            <div class="tab-pane" id="tab-review">
			              <form class="form-horizontal" id="form-review">
				                <div id="review"></div>
				                <h2><?php echo $text_write; ?></h2>
				                <?php if ($review_guest) { ?>
				                <div class="form-group required">
				                  <div class="col-sm-12">
				                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
				                    <input type="text" name="name" value="" id="input-name" class="form-control" />
				                  </div>
				                </div>
				                <div class="form-group required">
				                  <div class="col-sm-12">
				                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
				                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
				                    <!--div class="help-block"><?php echo $text_note; ?></div-->
				                  </div>
				                </div>
				                <div class="form-group required">
				                  <div class="col-sm-12">
				                    <label class="control-label" style="float: left; margin: 10px 10px 0px 0px;"><?php echo $entry_rating; ?></label> 
									<input id="rating-input" name="rating" type="number" value=""   style="float: left;" />
				                  </div>
								  <script type="text/javascript">
								  		$(document).ready(function (){
											 $('#rating-input').rating({min: 0,max: 5,step: 1, size: 'xs', showClear: false, 'showCaption':false }); 
										});
								  </script>
								</div>
				                <?php if ($site_key) { ?>
				                  <div class="form-group">
				                    <div class="col-sm-12">
				                      <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
				                    </div>
				                  </div>
				                <?php } ?>
				                <div class="buttons clearfix">
				                  <div class="pull-right">
				                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
				                  </div>
				                </div>
				                <?php } else { ?>
				                <?php echo $text_login; ?>
				                <?php } ?>
				              </form>
			               </div>
			            <?php } ?>
					</div>
                </div>
            </div>
			<div class="clear"></div><div class="line"></div>
			<?php if ($products) { ?>
			<div class="col_full nobottommargin">
            <h4><?php echo $text_related; ?></h4>
            <div id="oc-product" class="owl-carousel product-carousel">
			   <?php foreach ($products as $product) { ?>
                <div class="oc-item">
                    <div class="product iproduct clearfix">
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
                        <div class="product-desc center">
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
							<?php if($product['description']): ?>
						   <span><?php echo $product['description']; ?></span>
						   <?php endif; ?>
						   <a href="javascript:void(0);" class="add-to-cart btn-buy" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></a>
                        </div>
                    </div>
                </div>
				<?php } ?>
            </div>
            <script type="text/javascript">
                jQuery(document).ready(function($) {
                    var ocProduct = $("#oc-product");
                    ocProduct.owlCarousel({
                        margin: 30,
                        nav: true,
                        navText : ['<i class="icon-angle-left"></i>','<i class="icon-angle-right"></i>'],
                        autoplayHoverPause: true,
                        dots: false,
                        responsive:{
                            0:{ items:1 },
                            600:{ items:2 },
                            1000:{ items:4 }
                        }
                    });
                });
            </script>
           </div> 
		   <?php } ?>           
		</div>																																																																																																		
	</div>
  </div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success" style="width:70%;margin-top:10px;">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart-total').html(json['total_numner']);
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				$('.top-cart-content').load('index.php?route=common/cart/info #content-wap-cart');
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//-->	
</script>
</section>
<?php echo $footer; ?>


