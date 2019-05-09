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
	<script type="text/javascript">
	function checkage() {
		
		umr = document.getElementById("age").value;
		if(age < 1 && age > 100) {
			document.getElementById("mob").value="";
			alert("Number length cannot be greater than 12");			
		}
	}
	</script>
	
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
	<script type="text/javascript">
	function checkname() {
		
		naam = document.getElementById("name").value;
		if (naam[naam.length-1] >= 48 || naam[naam.length-1] <= 57) {
			alert("Name cannot have " + naam[naam.length-1]);
			document.getElementById("name").value="";
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
                    <form method="POST" action="addpatient.aks">
                        <div class="form-row">
                            <div class="name">Full name</div>
                            <div class="value">
                                <input class="input--style-6" type="text" name="name" required="required" placeholder="PATIENT NAME" onkeypress="checkname()">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Mobile No.</div>
                            <div class="value">
                                <div class="input-group">
                                	<input class="input--style-6" type="number" id= "mob" name="mob" required="required" placeholder="PATIENT NUMBER" min="1"  required onkeypress="check()">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Gender</div>
                            <div class="value">
                                <div class="input-group">
                                	<input type="radio" name="gender" value="male" checked="checked"> Male 
									<input type="radio" name="gender" value="female"> Female
									<input type="radio" name="gender" value="other"> I prefer not to tell  
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Age</div>
                            <div class="value">
                                <div class="input-group">
                                	<input class="input--style-6" required="required" type="number" id= "age" name="age" placeholder="PATIENT AGE"  required min="1" max="100">
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
                        <div class="form-row">
                            <div class="name">Address</div>
                            <div class="value">
                                <div class="input-group">
                                <select id="type" name= "state" class="input--style-6">
									<option hidden>---State---</option>
								    
								    <option value="Bihar">Bihar</option><option value="Chhattisgarh">Chhattisgarh</option>
								    <option value="Jharkhand">Jharkhand</option><option value="MP">MP</option><option value="Maharashtra">Maharashtra</option>
								    <option value="UP">UP</option><option value="WB">WB</option><option value="Other">Other</option>
								</select>
								
								<select id="size" name= "city" class="input--style-6">
								    <option hidden>-- City -- </option>
								</select>
                                <textarea class="textarea--style-6" name="addr" placeholder="Full Address"></textarea>
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
    <script>
$(document).ready(function() {

    $("#type").change(function() {
        var val = $(this).val();
        if (val == "MP") {
            $("#size").html("<option value='Indore'>Indore</option><option value='Bhopal'>Bhopal</option><option value='Satna'>Satna</option><option value='Rewa'>Rewa</option><option value='Sidhi'>Sidhi</option><option value='Shahdol'>Shahdol</option><option value='Other'>Other</option>");
        } else if (val == "UP") {
            $("#size").html("<option value='Lucknow'>Lucknow</option><option value='Agra'>Agra</option><option value='Other'>Other</option>");

        } else if (val == "Other") {
            $("#size").html("<option value='Other'>Other</option>");

        }
    });


});
</script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->