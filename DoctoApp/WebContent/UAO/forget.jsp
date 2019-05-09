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
	function check() {
		
		ch = document.getElementById("mob").value;
		if(ch.length < 12) {
		if (ch[0] < 6) {
			alert("Number cannot start with " + ch[0]);
			document.getElementById("mob").value="";
		}
		for (i=0; i<ch.length; i++)
			{
				if(ch[i] == 'e' || ch[i] == '.')
					{
						document.getElementById("mob").value="";
						alert("Number cannot contain e or .");
					}
			}
		}else {
			document.getElementById("mob").value="";
			alert("Number length cannot be greater than 12");							
		}
		
	}
	</script>
	
	
</head>
<body>
    <div class="page-wrapper bg-gra-03 p-t-100 p-b-50"  style="background: #2f89fc; background-image: linear-gradient(to bottom right,#04091e, #1AD5B0);">
        <div class="wrapper wrapper--w900" style="max-width: 1000px;">
            <div class="card card-6">
                <div class="card-heading">
                    <h2 class="title">Forget Password Form</h2>
                </div>
                <div class="card-body">
                    <form method="POST" action="das.aks">
                        <div class="form-row">
                            <div class="name">Mobile No.</div>
                            <div class="value">
                                <div class="input-group">
                                	<input class="input--style-6" type="number" id= "mob" name="mob" required="required" placeholder="PATIENT NUMBER" min="1"  required onkeypress="check()">
                                </div>
                            </div>
                        </div>
                       <div class="card-footer">
                   		 <input class="btn btn--radius-2 btn--blue-2" name="regis" type="submit" value="Get OTP">
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