<?php echo $header; ?>
<section id="page-title">
	<div class="container clearfix">
	    <h1><?php echo $heading_title; ?></h1>	
		<span><?php echo $text_account_already; ?></span>	
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
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?> 
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset id="account" class="col-sm-6">
          <legend><?php echo $text_your_details; ?></legend>         
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
            <div class="col-sm-9">
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
              <?php if ($error_firstname) { ?>
              <div class="text-danger"><?php echo $error_firstname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
            <div class="col-sm-9">
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
              <?php if ($error_lastname) { ?>
              <div class="text-danger"><?php echo $error_lastname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-9">
              <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-telephone">Cellphone</label>
            <div class="col-sm-9">
              <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="Cellphone" id="input-telephone" class="form-control" />
              <?php if ($error_telephone) { ?>
              <div class="text-danger"><?php echo $error_telephone; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-fax">Job Title</label>
            <div class="col-sm-4">
			 <select class="form-control" name="job_title">
			 	<option value="Stylist">Stylist</option> <option value="Trainer">Trainer</option> 
			 </select>              
            </div>
			<div class="col-sm-5">
				<label class="col-sm-6 noleftpadding" style="padding-top: 7px;">Experience*</label>
				<p class="col-sm-6 nopadding">
					<select class="form-control" name="experience">
						 <option value="0">0</option> <option value="0.5">0.5</option> <option value="1">1</option> <option value="2">2</option> <option value="3">3</option> <option value="4">4</option> <option value="5">5</option> <option value="6">6</option> <option value="7">7</option> <option value="8">8</option> <option value="9">9</option> <option value="10">10</option> <option value="11+">11+</option> 
					</select>
				</p>				
			</div>
          </div>          
        </fieldset>
        <fieldset id="address" class="col-sm-6">
          <legend><?php echo $text_your_address; ?></legend>        
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-address-1">Address</label>
            <div class="col-sm-9">
              <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
              <?php if ($error_address_1) { ?>
              <div class="text-danger"><?php echo $error_address_1; ?></div>
              <?php } ?>
            </div>
          </div>
          <!--div class="form-group">
            <label class="col-sm-3 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
            <div class="col-sm-9">
              <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
            </div>
          </div-->
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-city"><?php echo $entry_city; ?></label>
            <div class="col-sm-9">
              <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
              <?php if ($error_city) { ?>
              <div class="text-danger"><?php echo $error_city; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
            <div class="col-sm-9">
              <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
              <?php if ($error_postcode) { ?>
              <div class="text-danger"><?php echo $error_postcode; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-country"><?php echo $entry_country; ?></label>
            <div class="col-sm-9">
              <select name="country_id" id="input-country" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if ($error_country) { ?>
              <div class="text-danger"><?php echo $error_country; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
            <div class="col-sm-9">
              <select name="zone_id" id="input-zone" class="form-control">
              </select>
              <?php if ($error_zone) { ?>
              <div class="text-danger"><?php echo $error_zone; ?></div>
              <?php } ?>
            </div>
          </div>         
        </fieldset> 
		<div class="col-sm-12 nopadding">  
       	 	<fieldset class="col-sm-6">
          <legend><?php echo $text_class_infomtion; ?></legend>
		   <div class="form-group required">
            <label class="col-sm-3 control-label">Register for class: </label>
            <div class="col-sm-9">
              <?php foreach ($class_data as $class) { ?>
              <?php if (in_array($class['news_id'],$class_group_id)) { ?>
              <div class="radio">
                <label style="padding-left: 0px;">
                  <input type="checkbox" name="class_group_id[]" value="<?php echo $class['news_id']; ?>" checked="checked" />
                  <?php echo $class['title']; ?></label>
              </div>
              <?php } else { ?>
              <div class="radio">
                <label style="padding-left: 0px;">
                  <input type="checkbox" name="class_group_id[]" value="<?php echo $class['news_id']; ?>" />
                  <?php echo $class['title']; ?></label>
              </div>
              <?php } ?>
              <?php } ?>
			   <?php if ($error_classname) { ?>
              <div class="text-danger"><?php echo $error_classname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label"><?php echo $entry_newsletter; ?></label>
            <div class="col-sm-9">
              <?php if ($newsletter) { ?>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="1" checked="checked" />
                <?php echo $text_yes; ?></label>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="0" />
                <?php echo $text_no; ?></label>
              <?php } else { ?>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="1" />
                <?php echo $text_yes; ?></label>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="0" checked="checked" />
                <?php echo $text_no; ?></label>
              <?php } ?>
            </div>
          </div>
        </fieldset>
			<fieldset class="col-sm-6">
          	<legend>Location</legend>
		   <div class="form-group required">
            <label class="col-sm-3 control-label">Location: </label>
            <div class="col-sm-9">
			<select class="form-control" name="location" id="location">
			  <option value=""> Choose Location </option>
              <?php foreach($location_data as $key=>$value): ?>
			  <option value="<?php echo $value['location_id']; ?>"><?php echo $value['title']; ?></option>
              <?php endforeach; ?>
			  </select>
			   <?php if ($error_location) { ?>
              <div class="text-danger"><?php echo $error_location; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-3 control-label">Date Training</label>
            <div class="col-sm-8">
              <input type="text" name="date_training" value="<?php echo $date_training; ?>" placeholder="Date Training" readonly="true" id="input-date_training" class="form-control datetime" />
               
			  <?php if ($date_training) { ?>
              <div class="text-danger"><?php echo $date_training; ?></div>
              <?php } ?>
            </div>
			<div class="col-sm-1 nopadding">
			  <span class="input-group-btn">
              	<button type="button" class="btn btn-default fa-calendar-trigger"><i class="fa fa-calendar"></i></button>
              </span>
			</div>
          </div>
		  <div class="form-group">
            <label class="col-sm-3 control-label">Returning Student</label>
            <div class="col-sm-9">
              <select class="form-control" name="returning_student">
			 	  <option value="No">No</option> <option value="Yes">Yes</option> 
			  </select> 
            </div>
          </div>		  
        </fieldset>
		<fieldset class="col-sm-12">
          	<legend>Message</legend>
			<textarea name="message" rows="5" cols="50" class="form-control"></textarea>
		</fieldset>
		</div>       
        <div class="buttons">
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>       
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
  </div>
 </div>
</section>
<script type="text/javascript"><!--
// Sort the custom fields
$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: false
});
$('.fa-calendar-trigger').on('click', function() {
	$('#input-date_training').trigger('click');	
});
$('#account .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
		$('#account .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#account .form-group').length) {
		$('#account .form-group:first').before(this);
	}
});

$('#address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
		$('#address .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#address .form-group').length) {
		$('#address .form-group:first').before(this);
	}
});

$('input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}


		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}
			console.log(json);
			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['code'] + '"';

					if (json['zone'][i]['code'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'zone_id\']').html(html);
			//$('select[name=\'location\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php echo $footer; ?>