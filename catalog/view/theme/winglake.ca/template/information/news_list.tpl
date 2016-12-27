<?php echo $header; ?>
<section id="content"> 
 <div class="content-wrap"> 
	 <div class="container clearfix"> 
	  	<div class="row">
		<?php echo $column_left; ?>
	    <?php if ($column_left && $column_right) { ?>
	    <?php $class = 'col-sm-6'; ?>
	    <?php } elseif ($column_left || $column_right) { ?>
	    <?php $class = 'col-sm-9'; ?>
	    <?php } else { ?>
	    <?php $class = 'col-sm-12'; ?>
	    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
	  <?php echo $content_top; ?>
	  <?php if(count($all_news) > 0): ?>
	  <?php foreach($all_news as $key=>$news): ?>
	  <div class="training-item">        
		<div class="title">
		  <?php if(!empty($news['image'])): ?>
		  <img src="<?php echo $news['image']; ?>" width="150"  title="<?php echo $news['title']; ?>" alt="<?php echo $news['title']; ?>"/>
		  <?php endif; ?>
		  <?php if(!empty($news['title'])): ?>
          <h2><?php echo str_replace(' ','<br />',trim($news['title'])); ?></h2>
		  <?php endif; ?>
		  <?php if(!empty($news['description'])): ?>
          <p><?php echo $news['description']; ?></p>
		  <?php endif; ?>
		  <?php if(!empty($news['amount_fees'])): ?>
          <h6><?php echo $news['amount_fees']; ?></h6>
		  <?php endif; ?>
		  <?php if(!empty($news['register_link'])): ?>
		  	<a href="<?php echo $news['register_link']; ?>" target="_blank" class="link-register">Click here to register</a>
		  <?php endif; ?>
        </div>
		<?php if(!empty($news['content'])): ?>
        <div class="data">
			 <?php echo $news['content']; ?>
			 <?php if(!empty($news['register_link'])): ?>
			  	<a href="<?php echo $news['register_link']; ?>" target="_blank" class="link-register">Click here to register</a>
			 <?php endif; ?>			
		</div>
		<?php endif; ?>	
      </div>
	  <?php endforeach; ?>     
	  <?php endif; ?> 
	  <?php if($pagination): ?>
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