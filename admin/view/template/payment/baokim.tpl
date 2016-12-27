<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-authorizenet-aim" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-baokim" class="form-horizontal">
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-merchant"><?php echo $entry_merchant; ?></label>
						<div class="col-sm-10">
							<input type="text" name="baokim_merchant" value="<?php echo $baokim_merchant; ?>" placeholder="<?php echo $entry_merchant; ?>" id="input-merchant" class="form-control" />
							<?php if ($error_merchant) { ?>
							<div class="text-danger"><?php echo $error_merchant; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-security"><?php echo $entry_security; ?></label>
						<div class="col-sm-10">
							<input type="text" name="baokim_security" value="<?php echo $baokim_security; ?>" placeholder="<?php echo $entry_security; ?>" id="input-security" class="form-control" />
							<?php if ($error_security) { ?>
							<div class="text-danger"><?php echo $error_security; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-business"><?php echo $entry_business; ?></label>
						<div class="col-sm-10">
							<input type="text" name="baokim_business" value="<?php echo $baokim_business; ?>" placeholder="<?php echo $entry_business; ?>" id="input-business" class="form-control" />
							<?php if ($error_business) { ?>
							<div class="text-danger"><?php echo $error_business; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-server"><?php echo $entry_server; ?></label>
						<div class="col-sm-10">
							<select name="baokim_server" id="input-server" class="form-control">
								<?php if ($baokim_server == $url_real) { ?>
								<option value="<?php echo $url_real; ?>" selected="selected"><?php echo $text_url_real; ?></option>
								<?php } else { ?>
								<option value="<?php echo $url_real; ?>"><?php echo $text_url_real; ?></option>
								<?php } ?>
								<?php if ($baokim_server == $url_test) { ?>
								<option value="<?php echo $url_test; ?>" selected="selected"><?php echo $text_url_test; ?></option>
								<?php } else { ?>
								<option value="<?php echo $url_test; ?>"><?php echo $text_url_test; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
						<div class="col-sm-10">
							<select name="baokim_order_status_id" id="input-order-status" class="form-control">
								<?php foreach ($order_statuses as $order_status) { ?>
								<?php if ($order_status['order_status_id'] == $baokim_order_status_id) { ?>
								<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="baokim_status" id="input-status" class="form-control">
								<?php if ($baokim_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?> 