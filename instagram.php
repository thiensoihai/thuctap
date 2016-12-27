<?php

$user_id="1e341aed31764651803485877a34ec4c";
$access_token = "36480918655b4169bfc7c5892f49aa3b";

$url = "https://api.instagram.com/v1/users/".$user_id."/media/recent?access_token=".$access_token;
		
$ch = curl_init($url); 

curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 20); 
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 

$json = curl_exec($ch); 
curl_close($ch);
$result = json_decode($json);
foreach ($result->data as $post) { ?>
	<a class="instagram-unit" target="_blank" href="<?php echo $post->link;?>">
	<img src="<?php echo $post->images->low_resolution->url;?>"  alt="<?php echo $post->caption->text;?>"/></a></div>
	 <?php echo htmlentities(date("F j, Y, g:i a", $post->created_time));?>
<?php } ?>  
		
   