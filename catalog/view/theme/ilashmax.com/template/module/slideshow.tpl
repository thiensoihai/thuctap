<?php if(count($banners) > 0): ?>
<section id="slider_<?php echo $module; ?>" class="slider-parallax revslider-wrap ohidden clearfix">           
    <div class="tp-banner-container">
        <div class="tp-banner revo_banner_<?php echo $module; ?>" >
          <ul>            
			<?php foreach ($banners as $key=>$banner) { ?>			 
             <li data-transition="slideup" data-slotamount="1" data-masterspeed="1500" data-delay="10000"  data-saveperformance="off"  style="background-color: #E9E8E3;">
                    <!-- LAYERS -->
                    <div class="tp-caption customin ltl tp-resizeme revo-slider-caps-text uppercase"
                    data-x="0"
                    data-y="0"
                    data-customin="x:250;y:0;z:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:10% 0%;"
                    data-speed="200"
                    data-start="500"
                    data-easing="easeInBounce"
                    data-splitin="none"
                    data-splitout="none"
                    data-elementdelay="0.01"
                    data-endelementdelay="0.1"
                    data-endspeed="1000"
                    data-endeasing="Power4.easeIn" style="">
					<?php if(!empty($banner['link'])): ?>
						<a href="<?php echo $banner['link']; ?>" target="_blank"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['l_title']; ?>"></a>					
					<?php else: ?>
						<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['l_title']; ?>">
					<?php endif; ?>
					</div>					
					<?php if(!empty($banner['description'])): ?>
                    <div class="tp-caption customin ltl tp-resizeme revo-slider-desc-text tleft"
                    data-x="0"
                    data-y="100"
                    data-customin="x:300;y:150;z:0;rotationZ:0;scaleX:1.3;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                    data-speed="200"
                    data-start="500"
                    data-easing="easeInOutElastic"
                    data-splitin="none"
                    data-splitout="none"
                    data-elementdelay="0.01"
                    data-endelementdelay="0.1"
                    data-endspeed="1000"
                    data-endeasing="Power4.easeIn" style=" color: #333; max-width: 550px; white-space: normal;"><?php echo $banner['description']; ?></div>
					<?php endif; ?>					
                </li>			 
			<?php } ?>
        </ul>
       </div>
    </div>
 </section>
<script type="text/javascript"><!--
addRevolitionSlides('revo_banner_<?php echo $module; ?>');
--></script>
<?php endif; ?>