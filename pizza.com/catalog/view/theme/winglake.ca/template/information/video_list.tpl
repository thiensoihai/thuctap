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
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
	  <?php echo $content_top; ?>
	  <?php if(!empty($all_video)): ?>
	  <ul class="video-list">
	     <?php foreach ($all_video as $video) { ?>
           <li class="js-video" style="background: url('<?php echo $video['image']; ?>') no-repeat center;">
		   	  <a href="<?php echo $video['view']; ?>"><img src="image/bg_play_1.png" title="<?php echo $video['title']; ?>" alt="<?php echo $video['title']; ?>" /></a>
		   </li>
		 <?php } ?>        
      </ul>
	  <?php endif; ?>
	  <?php if(!empty($pagination)): ?>
	  <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
	  <?php endif; ?>
	  <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
   </div>
  </div>
</section>
<?php echo $footer; ?> 