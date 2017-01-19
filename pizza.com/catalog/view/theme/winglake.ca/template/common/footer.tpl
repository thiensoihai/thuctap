<div id="footer">
  <div class="container">
    <div class="top">
      <h3 class="hdr1">Were looking forward to your visit</h3>
    </div>
    <div class="mid">
      <div class="col1">
        <h4><span class="lft"></span>Hours<span class="rt"></span></h4>
        <span class="day">Monday</span> <span class="hour">11:00 am - 09:00 pm</span> <span class="day">Tuesday</span> <span class="hour">11:00 am - 09:00 pm</span> <span class="day">Wendsday</span> <span class="hour">11:00 am - 09:00 pm</span> <span class="day">Thursday</span> <span class="hour">11:00 am - 09:00 pm</span> <span class="day">Friday</span> <span class="hour">11:00 am - 09:00 pm</span> <span class="day">Saturday</span> <span class="hour">11:00 am - 09:00 pm</span> <span class="day">Sunday</span> <span class="hour">11:00 am - 09:00 pm</span> </div>
      <div class="col2">
        <h4><span class="lft"></span>Contact & Location<span class="rt"></span></h4>
        <div class="brdr">
          <div class="ftMap">
            <iframe width="151" height="117" src="http://maps.google.pl/maps?f=q&amp;source=s_q&amp;hl=pl&amp;geocode=&amp;q=123+Eastern+12th+ST+New+York,+NY&amp;aq=&amp;sll=51.923943,27.608643&amp;sspn=6.879039,16.907959&amp;ie=UTF8&amp;hq=123+Eastern&amp;hnear=W+12th+St,+New+York,+Stany+Zjednoczone&amp;ll=40.741588,-73.990536&amp;spn=0.016663,0.024356&amp;t=m&amp;output=embed&amp;iwloc=near"></iframe>
            <br/>
            <small><a href="http://maps.google.pl/maps?f=q&amp;source=embed&amp;hl=pl&amp;geocode=&amp;q=123+Eastern+12th+ST+New+York,+NY&amp;aq=&amp;sll=51.923943,27.608643&amp;sspn=6.879039,16.907959&amp;ie=UTF8&amp;hq=123+Eastern&amp;hnear=W+12th+St,+New+York,+Stany+Zjednoczone&amp;ll=40.741588,-73.990536&amp;spn=0.016663,0.024356&amp;t=m" style="color:#0000FF;text-align:left">Get Directions</a></small></div>
          <p> 123 Eastern 12th ST New York, NY, North America<br>
            <br>
            +49 1234 56789-0 +49 1234 56789-12<br>
            <br>
            <a href="mailto:info@delimondo.com">info@delimondo.com</a> <a href="#">www.delimondo.com</a> </p>
          <div class="clearfix"></div>
        </div>
      </div>
      <div class="col3">
        <div class="lftMrg">
          <h4><span class="lft"></span>Latest Blog Post<span class="rt"></span></h4>
          <span class="data1">22 June, 2011 <img src="img/data1-dot.png" alt=""> no comments</span> <a href="#">Pellentesque habitant morbi tristique senectus et netus et male. </a> <span class="data1">7 May, 2011 <img src="img/data1-dot.png" alt=""> 11 comments</span> <a href="#">Pellentesque habitant morbi tristique senectus et netus et male. </a> </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <div class="btm"></div>
    <div class="footNotes">
      <ul class="social">
        <li><a href="#" class="fb">Facebook</a></li>
        <li><a href="#" class="twit">Twitter</a></li>
        <li><a href="#" class="rss">Rss</a></li>
        <li><a href="#" class="mail">E-mail</a></li>
      </ul>
      <p>All Content © Copyright 2012 - This work is licensed under a Creative Commons License.</p>
      <div class="clearfix"></div>
    </div>
  </div>
</div>
<!-- Go To Top
============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>
<!-- Footer Scripts
============================================= -->
<?php $config = $this->registry->get('config'); ?>
<script src="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/js/jquery.js"></script> 
<script src="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/bootstrap/js/bootstrap.min.js"></script> 
<script src="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/js/jquery.nivo.slider.pack.js"></script> 
<script src="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/js/jquery.arctext.js"></script> 
<script src="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/js/jquery.anythingslider.min.js"></script> 
<script src="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/js/lightbox.js"></script> 
<script src="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/js/selectnav.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){$(".curved").arctext({radius:250,rotate:true,dir:1});$("#slider1Nivo").nivoSlider({effect:"random",pauseTime:8000,captionEasing:"linear",slices:15,boxCols:8,boxRows:4,animSpeed:500,startSlide:0,directionNav:true,controlNav:true,controlNavThumbs:false,pauseOnHover:true,manualAdvance:false,prevText:"Prev",nextText:"Next",randomStart:false,beforeChange:function(){},afterChange:function(){},slideshowEnd:function(){},lastSlide:function(){},afterLoad:function(){}});$("#anythingSlider2").anythingSlider({autoPlay:false,expand:true,pauseOnHover:true,hashTags:false,buildNavigation:false,buildStartStop:false,delay:8000});$(".box9").hide();$("#bkTable").click(function(){$(".box9").fadeToggle();return false});$(".ipad-box9").hide();$(".topBar .bookTable").click(function(){$(".ipad-box9").slideToggle();return false});$("form#bkForm input, textarea").blur(function(){var h=$(this);var e=false;if(h.val()==""){e=true}if(h.data("type")=="email"){var g=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;var f=h.val().replace("#","@");if(!g.test(f)){e=true}}e?h.addClass("error"):h.removeClass("error");return true});$("form#bkForm").submit(function(){$(this).find("input, textarea").trigger("blur");var b=$(this).find(".error").length;return b==0});$("ul.mainMenu li.subMenu ul").hide();$("ul.mainMenu li.subMenu > a").click(function(){$("ul.mainMenu li.subMenu ul").hide();$(this).next("ul").toggle();return false});$("body").click(function(){$("ul.mainMenu li.subMenu ul").hide()});$("a[data-rel]").each(function(){$(this).attr("rel",$(this).data("rel"))});selectnav("nav")});
</script>

<?php if(!empty($facebook['id']) > 0): ?>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '<?php echo $facebook['id']; ?>',
      xfbml      : true,
      version    : 'v2.4'
    });
  };
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<?php endif; ?>
</body></html>