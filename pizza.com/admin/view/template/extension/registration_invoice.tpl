<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $title; ?></title>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<div style="width: 680px;">  
  
  <table style="border-collapse: collapse; width: 100%;  margin-bottom: 20px;">
  	<tbody>
		<tr>
			<td width="50%"><a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;" /></a></td>
			<td width="50%">
				<p style="margin-top: 0px; margin-bottom: 20px;text-align: right;"><?php echo $text_greeting; ?></p>
			</td>
		</tr>
	</tbody>
  </table>   
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;" colspan="2"><?php echo $InvoiceNumber; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td valign="top" style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><b><?php echo $text_order_id; ?></b> <?php echo $order_id; ?><br />
          <b><?php echo $firstname; ?></b> <?php echo $lastname; ?><br />
          <b>Email: </b><?php echo $email; ?><br />          
          <b>Phone: </b> <?php echo $telephone; ?> <br />         	  
          <b>Address: </b> <?php echo ($address ? $address.', ' : '') ?> <?php echo $city; ?> <?php echo ($state ? $state.',' : ''); ?> <?php echo $zipcode; ?><br />         	  
		</td>
        <td valign="top" style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;">
          <b>Job Title: </b> <?php echo $job_title; ?><br />
          <b>Experience: </b> <?php echo $experience; ?><br />
          <b>Returning Student: </b> <?php echo $returning_student; ?><br />
          <b>Date Training: </b> <?php echo $date_training_invoice; ?><br />
          <?php if($location): ?><b>Location: </b> <?php echo $location; ?><br /><?php endif; ?>
		 </td>
      </tr>
    </tbody>
  </table>
  <?php if ($message) { ?>
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;">Message</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $message; ?></td>
      </tr>
    </tbody>
  </table>
  <?php } ?>
  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;">No#</td>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;">Class</td>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222;">Amount</td>
        <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: right; padding: 7px; color: #222222;">Disposit</td>        
      </tr>
    </thead>
    <tbody>
      <?php $i=0; foreach ($class_data_full as $key=>$item) { ?>
		  <?php if(in_array($item['news_id'],$class_id)){ ?>
	      <tr>
	        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo ($i + 1); ?></td>
	        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $item['title']; ?></td>
	        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $item['amount_fees']; ?></td>
	        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $deposit; ?></td>
	      </tr>
	      <?php $i++; } ?>
      <?php } ?>
    </tbody>
	<tfoot>     
      <tr>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;" colspan="3"><b>Total:</b></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $deposit; ?></td>
      </tr>    
    </tfoot>
  </table>
  <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_footer; ?></p>
</div>
</body>
</html>