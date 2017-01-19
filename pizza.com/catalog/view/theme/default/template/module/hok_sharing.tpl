<div class="row" style="position:fixed; <?php echo $style; ?>">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="social-links">
			<?php foreach ($sharings as $sharing) { ?>
			<?php if ($sharing['sharing_style']) { ?>
			<?php $style = "style=\""; ?>
			<?php $style .= $sharing['sharing_style']; ?>
			<?php $style .= "\""; ?>
			<?php } else { ?>
			<?php $style = ''; ?>
			<?php } ?>
			<a href="<?php echo $sharing['sharing_link']; ?>" title="<?php echo $sharing['sharing_name']; ?>" target="_blank" <?php echo $style; ?> >  <i class="fa fa-<?php echo $sharing['sharing_icon']; ?> <?php echo ($size?'fa-'.$size:''); ?>"></i> </a>
			<?php } ?>
		</div>
	</div>  
</div>
