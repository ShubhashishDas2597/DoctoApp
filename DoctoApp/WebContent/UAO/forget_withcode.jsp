<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Patient Portal - DoctoApp</title>
    <link rel="shortcut icon" href="images/DocTrans2.png">

    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Main CSS-->
    <link href="css_userreg/main.css" rel="stylesheet" media="all">
    
	<script type="text/javascript">
		function msg() {
			
			pwd = 	document.getElementById("pwd").value;
			cpwd = 	document.getElementById("cpwd").value;
			
			if (pwd != cpwd)
				{
					alert("Password and Confirm Password must be same");
					document.getElementById("pwd").value="";
					document.getElementById("cpwd").value="";
					return false;
				
				}
			
		}
	</script>

</head>
<body>
    <div class="page-wrapper bg-gra-03 p-t-100 p-b-50"  style="background: #2f89fc; background-image: linear-gradient(to bottom right,#04091e, #1AD5B0);">
        <div class="wrapper wrapper--w900" style="max-width: 1000px;">
            <div class="card card-6">
                <div class="card-heading">
                    <h2 class="title">REGISTRATION FORM</h2>
                </div>
                <div class="card-body">
                    <form method="POST" action="reset_pass.aks">
                       
                        <div class="form-row">
                            <div class="name">Code</div>
                            <div class="value">
                                <div class="input-group">
                                	<input class="input--style-6" type="number" name="code" required="required" placeholder="One Time Password" min="1"  required onkeypress="check()">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Password</div>
                            <div class="value">
                                <div class="input-group">
                                	<input class="input--style-6" type="password" placeholder="**********" required name="pwd" id="pwd"
                                	pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Retype Password</div>
                            <div class="value">
                                <div class="input-group">
                                	<input class="input--style-6" type="password" placeholder="**********" required name="cpwd" id="cpwd">
                                </div>
                            </div>
                        </div>
                        
                       <div class="card-footer">
                   		 <input class="btn btn--radius-2 btn--blue-2" name="regis" type="submit" value="Register" onclick="msg()">
             		   </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor_userreg/jquery/jquery.min.js"></script>


    <!-- Main JS-->
    <script src="js_userreg/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->