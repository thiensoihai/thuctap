<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-news" data-toggle="tooltip" title="<?php if($data['invoice']==1): ?>Send Invoice Customer<?php else: ?><?php echo $button_save; ?><?php endif;?>" class="btn btn-primary">
			<?php if($data['invoice']==1): ?>
				<i class="fa fa-print"></i>
			<?php else: ?>
				<i class="fa fa-save"></i>
			<?php endif; ?>			
		</button>
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
    <?php if (isset($error) && !empty($error)) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-news" class="form-horizontal">
          <div class="tab-pane active col-sm-6" id="tab-customer">              
              <div class="form-group required">
                <label class="col-sm-4 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                <div class="col-sm-8">
                  <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                  <?php if ($error_firstname) { ?>
                  <div class="text-danger"><?php echo $error_firstname; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-4 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                <div class="col-sm-8">
                  <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                  <?php if ($error_lastname) { ?>
                  <div class="text-danger"><?php echo $error_lastname; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-4 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-8">
                  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php  } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-4 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                <div class="col-sm-8">
                  <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                  <?php if ($error_telephone) { ?>
                  <div class="text-danger"><?php echo $error_telephone; ?></div>
                  <?php  } ?>
                </div>
              </div>			 
			 <div class="form-group">
                <label class="col-sm-4 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                <div class="col-sm-8">
                  <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
                </div>
              </div>
			 <div class="form-group">
                <label class="col-sm-4 control-label" for="input-address">Address</label>
                <div class="col-sm-8">
                  <input type="text" name="address" value="<?php echo $address; ?>" placeholder="Address" id="input-address" class="form-control" />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-4 control-label" for="input-city">City</label>
                <div class="col-sm-8">
                  <input type="text" name="city" value="<?php echo $city; ?>" placeholder="City" id="input-city" class="form-control" />
                </div>
              </div>			  
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-state">Region / State</label>
                <div class="col-sm-8">
                   <input type="text" name="state" value="<?php echo $state; ?>" placeholder="State" id="input-state" class="form-control" />
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-4 control-label" for="input-state">Zipcode</label>
                <div class="col-sm-8">
                  <input type="text" name="zipcode" value="<?php echo $zipcode; ?>" placeholder="Zipcode" id="input-zipcode" class="form-control" />
                </div>
              </div>                          
            </div>
		  <div class="col-sm-6">
		  	  <div class="form-group">
                <label class="col-sm-4 control-label" for="input-class_id_0">Class Training</label>
                <div class="col-sm-8">
                  <?php foreach ($class_data as $key=>$class) { ?>
                    <?php if (in_array($class['news_id'],$class_id) ) { ?>
					<p class="col-sm-12" style="padding-left: 0px;"><input  type="checkbox" name="class_id[]" checked="true" id="class_id_<?php echo $key; ?>" value="<?php echo $class['news_id']; ?>"/> <label><?php echo $class['title'].' (Fees: '.$class['amount_fees'].')'; ?></label>  </p>                  
                    <?php } else { ?>
					<?php if(empty($data['invoice'])): ?>
                    <p class="col-sm-12" style="padding-left: 0px;"><input  type="checkbox" name="class_id[]" id="class_id_<?php echo $key; ?>" value="<?php echo $class['news_id']; ?>"/> <label><?php echo $class['title'].' Fees: '.$class['amount_fees']; ?></label></p>
					<?php endif; ?>
                    <?php } ?>
                    <?php } ?>
                </div>
              </div>
			  <?php if(!empty($data['invoice']) || $data['registration_id'] > 0): ?>
			  <div class="form-group">
                <label class="col-sm-4 control-label" for="input-deposit">Amount Deposit</label>
                <div class="col-sm-8">
                  <input type="text" name="deposit" value="<?php echo $deposit; ?>" placeholder="Amount deposit" id="input-zipcode" class="form-control" />
                </div>
              </div>
			  <?php endif; ?>
			  <div class="form-group">
                <label class="col-sm-4 control-label" for="input-job_title">Job Title</label>
                <div class="col-sm-8">
                  <select name="job_title" id="input-job_title" class="form-control">
				 	<option value="Stylist" <?php echo $job_title=='Stylist' ? 'selected="true"' : '';?>>Stylist</option> 
					<option value="Trainer" <?php echo $job_title=='Trainer' ? 'selected="true"' : '';?>>Trainer</option> 
				 </select>
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-4 control-label" for="input-experience">Experience</label>
                <div class="col-sm-8">
                   <select name="experience" class="form-control" id="input-experience">
					 <option value="0" <?php echo $experience=='0' ? 'selected="true"' : '';?>>0</option>
					 <option value="0.5" <?php echo $experience=='0.5' ? 'selected="true"' : '';?>>0.5</option>
					 <?php for($i=1;$i<11;$i++){ ?>
					 	<option value="<?php echo $i; ?>" <?php echo $experience==$i ? 'selected="true"' : '';?>><?php echo $i; ?></option>
					 <?php }?>
					 <option value="11+" <?php echo $experience=='11+' ? 'selected="true"' : '';?>>11+</option>						 
				  </select>
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-4 control-label" for="input-returning_student">Returning Student</label>
                <div class="col-sm-8">
                  <select name="returning_student" class="form-control" id="input-returning_student">
				 	  <option  value="No" <?php echo $returning_student=='No' ? 'selected="true"' : '';?>>No</option> 
					  <option value="Yes" <?php echo $returning_student=='Yes' ? 'selected="true"' : '';?>>Yes</option> 
				  </select>
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-4 control-label" for="input-location">Location</label>
                <div class="col-sm-8">
                  <select class="form-control" name="location" id="location">
					  <option value=""> Choose Location </option>
		              <?php foreach($location_data as $key=>$value): ?>
					  <?php if($location==$value['location_id']): ?>
					  <option value="<?php echo $value['location_id']; ?>" selected="true"><?php echo $value['title']; ?></option>
					  <?php else: ?>
					  <option value="<?php echo $value['location_id']; ?>"><?php echo $value['title']; ?></option>
		              <?php endif; ?>
		              <?php endforeach; ?>
				  </select>
                </div>
              </div>
			  <div class="form-group">
                <label class="col-sm-4 control-label" for="input-state">Date Training</label>
                <div class="col-sm-7">
                  <input type="text" name="date_training" value="<?php echo $date_training; ?>" placeholder="Date Training" id="input-date_training" class="form-control date" /> 				  
				</div>
				<div class="col-sm-1" style="padding: 0px;">
					<span class="input-group-btn">
	                  	<button type="button" class="btn btn-default fa-calendar-trigger"><i class="fa fa-calendar"></i></button>
	                </span>
				</div>			
              </div>            
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-8">
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
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-approved"><?php echo $entry_approved; ?></label>
                <div class="col-sm-8">
                  <select name="approved" id="input-approved" class="form-control">
                    <?php if ($approved) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div> 
		  </div>
		 <fieldset class="col-sm-12">
          	<legend>Message</legend>
			<textarea name="message" rows="5" cols="50" class="form-control"><?php echo $message; ?></textarea>
		</fieldset>		
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$('#language a:first').tab('show');
$('.date').datetimepicker({
	pickTime: false
});
$('.fa-calendar-trigger').on('click', function() {
	$('#input-date_training').trigger('click');	
});
</script>
<?php echo $footer; ?>