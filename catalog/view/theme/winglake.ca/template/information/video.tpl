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
    <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
	  <?php echo $content_top; ?>
	  <div class="col-sm-12 col-sm-8 nopadding">
	  	  <iframe width="420" height="315" src="<?php echo $link_youte; ?>" frameborder="0" allowfullscreen></iframe>
		  <h1><?php echo $heading_title; ?></h1>		  
		  <div class="content-videos"><?php echo $description; ?></div>
	  </div>
	  <?php if(count($other_videos) > 0): ?>
	  <div class="col-sm-12 col-sm-4 nopadding">
	     <div class="other-videos">
		  	 <ul>
			    <?php foreach($other_videos as $key=>$value): ?>
			 	<li class="go-video-link">
					<p class="col-sm-4" style="background: url('<?php echo $value['image']; ?>') no-repeat center;">
						<a href="<?php echo $value['link']; ?>"><img src="image/bg_play_2.png" border="0" title="<?php echo $value['title']; ?>" alt="<?php echo $value['title']; ?>"/></a>
					</p>
					<p class="col-sm-8">
						<a href="<?php echo $value['link']; ?>"><strong><?php echo $value['title']; ?></strong><br /></a>
						<i><?php echo $value['date_added']; ?></i>
					</p>
				</li>
				<?php endforeach; ?>
			 </ul>
		 </div>
	  </div>
	  <?php endif; ?>
	  <?php echo $content_bottom; ?>
	  </div>
    <?php echo $column_right; ?></div>
   </div>
  </div>
</div>
<?php echo $footer; ?> 