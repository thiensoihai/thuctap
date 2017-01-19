<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
				<h1><?php echo $heading_title; ?></h1>
				<ul class="breadcrumb">
					<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php } ?>
				</ul>
			</div>
		</div>
		<div class="container-fluid">
			<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
			<?php } ?>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-hok-sharing" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
						<div class="col-sm-10">
							<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
							<?php if ($error_name) { ?>
							<div class="text-danger"><?php echo $error_name; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-pos-top"><?php echo $entry_pos_top; ?></label>
						<div class="col-sm-10">
							<input type="text" name="pos_top" value="<?php echo $pos_top; ?>" placeholder="<?php echo $entry_pos_top; ?>" id="input-pos-top" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-pos-bottom"><?php echo $entry_pos_bottom; ?></label>
						<div class="col-sm-10">
							<input type="text" name="pos_bottom" value="<?php echo $pos_bottom; ?>" placeholder="<?php echo $entry_pos_bottom; ?>" id="input-pos-bottom" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-pos-left"><?php echo $entry_pos_left; ?></label>
						<div class="col-sm-10">
							<input type="text" name="pos_left" value="<?php echo $pos_left; ?>" placeholder="<?php echo $entry_pos_left; ?>" id="input-pos-left" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-pos-left"><?php echo $entry_pos_right; ?></label>
						<div class="col-sm-10">
							<input type="text" name="pos_right" value="<?php echo $pos_right; ?>" placeholder="<?php echo $entry_pos_right; ?>" id="input-pos-right" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-size"><?php echo $entry_size; ?></label>
						<div class="col-sm-10">
							<select name="size" id="input-size" class="form-control">
								<?php if ($size) { ?>
								<option value="<?php echo $size; ?>" selected="selected"><?php echo $size; ?></option>
								<?php } ?>
								<option value="1x">1x</option>
								<option value="2x">2x</option>
								<option value="3x">3x</option>
								<option value="4x">4x</option>
								<option value="5x">5x</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="status" id="input-status" class="form-control">
								<?php if ($status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<table id="sharing" class="table table-striped table-bordered table-hover">
						<thead>
						  <tr>
							<td class="text-left"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_sharing_icon; ?>"><?php echo $entry_sharing_icon; ?></span></td>
							<td class="text-left"><?php echo $entry_sharing_name; ?></td>
							<td class="text-left"><?php echo $entry_sharing_link; ?></td>
							<td class="text-left"><?php echo $entry_sharing_style; ?></td>
							<td class="text-right" style="width:3%"><?php echo $entry_sort_order; ?></td>
							<td style="width:1%"></td>
						  </tr>
						</thead>
						<tbody>
							<?php $sharing_row = 0; ?>
							<?php foreach ($sharings as $sharing) { ?>
							<tr id="sharing-row<?php echo $sharing_row; ?>">
								<td class="text-left"><input type="text" name="sharing[<?php echo $sharing_row; ?>][sharing_icon]" value="<?php echo $sharing['sharing_icon']; ?>" id="input-sharing-icon" class="form-control" /></td>
								<td class="text-left"><input type="text" name="sharing[<?php echo $sharing_row; ?>][sharing_name]" value="<?php echo $sharing['sharing_name']; ?>" id="input-sharing-name" class="form-control" /></td>
								<td class="text-left"><input type="text" name="sharing[<?php echo $sharing_row; ?>][sharing_link]" value="<?php echo $sharing['sharing_link']; ?>" id="input-sharing-link" class="form-control" /></td>
								<td class="text-left"><input type="text" name="sharing[<?php echo $sharing_row; ?>][sharing_style]" value="<?php echo $sharing['sharing_style']; ?>" id="input-sharing-style" class="form-control" /></td>
								<td class="text-right"><input type="text" name="sharing[<?php echo $sharing_row; ?>][sort_order]" value="<?php echo $sharing['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
								<td class="text-left"><button type="button" onclick="$('#sharing-row<?php echo $sharing_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
							</tr>
							<?php $sharing_row++; ?>
							<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4"></td>
								<td class="text-left"><button type="button" onclick="addSharing();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
							</tr>
						</tfoot>
					</table>	
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
var sharing_row = <?php echo $sharing_row; ?>;
function addSharing() {
	html  = '<tr id="sharing-row' + sharing_row + '">';
    html += '	<td class="text-left"><input type="text" name="sharing[' + sharing_row + '][sharing_icon]" value="" placeholder="<?php echo $entry_sharing_icon; ?>" class="form-control" />';
    html += '	<td class="text-left"><input type="text" name="sharing[' + sharing_row + '][sharing_name]" value="" placeholder="<?php echo $entry_sharing_name; ?>" class="form-control" />';
    html += '	<td class="text-left"><input type="text" name="sharing[' + sharing_row + '][sharing_link]" value="" placeholder="<?php echo $entry_sharing_link; ?>" class="form-control" />';
    html += '	<td class="text-left"><input type="text" name="sharing[' + sharing_row + '][sharing_style]" value="" placeholder="<?php echo $entry_sharing_style; ?>" class="form-control" />';
	html += '  	<td class="text-right"><input type="text" name="sharing[' + sharing_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  	<td class="text-left"><button type="button" onclick="$(\'#sharing-row' + sharing_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#sharing>tbody').append(html);
	
	sharing_row++;
}
</script>
</div>
<?php echo $footer; ?>