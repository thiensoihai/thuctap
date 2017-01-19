<div class="invite-wrap">
<script type="text/javascript">
	function subscribe()
	{
		var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var email = $('#txtemail').val();
		if(email != "")
		{
			if(!emailpattern.test(email))
			{
				alert("Your email wrong format, example: abc@mail.com.");
				return false;
			}
			else
			{
				$.ajax({
					url: 'index.php?route=module/newsletters/news',
					type: 'post',
					data: 'email=' + $('#txtemail').val()+'&name='+$('#txtName').val(),
					dataType: 'json',
					success: function(json) {						
						alert(json.message);						
					}
				});
				return false;
			}
		}
		else
		{
			alert("Please enter your email before submit newsletters.");
			$(email).focus();
			return false;
		}
	}
</script>
<div class="col-sm-6 newletter-intro">
	<h2>Invite to sign up
	<span>Sign up to get the latest on sales, new releases and more …</span>
	</h2>	
</div>
<div class="col-sm-6 inv-form">	
	<form action="" method="post">		      
        <div class="col-sm-12">
          <input type="text" name="txtName" id="txtName" value="" placeholder="Your name" class="form-control"  />     	       
        </div>
        <div class="col-sm-12">	               
      		<input type="text" name="txtemail" id="txtemail" value="" placeholder="Email" class="form-control "  />  
        </div>
        <div class="col-sm-12">	               
      		<button type="submit" class="btn btn-signup" onclick="return subscribe();">SIGN UP</button>  
        </div>
		<br class="bottommargin-lg" />
	</form> 
</div>
</div>
