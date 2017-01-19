
<div class="buttons">
	<div class="pull-right">
		<input id="button-confirm" type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />
	</div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({ 
		type: 'GET',
		url: 'index.php?route=payment/baokim/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});
});
//--></script>
