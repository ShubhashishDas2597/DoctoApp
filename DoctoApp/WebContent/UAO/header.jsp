<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<title>DoctoApp</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    
    
    <link rel="shortcut icon" href="images/DocTrans2.png">
	<style>
		.ftco-footer-social .ftco-animate:hover {
			background-color: #00ffbf;
		}
	</style>
	<script>
        function check() {
		var ch = document.getElementById("appointment_name").value;
		if (ch.length <= 3 ) {
			document.getElementById("appointment_name").value = "";
			alert("Please enter the correct uid");
			return false
		}
		else {
			return true;
		}
        }
   </script> 
   <script type="text/javascript">
	function mobcheck() {
		
		ch = document.getElementById("mob").value;
		if(ch.length < 12) {
		if (ch[0] < 6) {
			alert("Number cannot start with " + ch[0]);
			document.getElementById("mob").value="";
		}
				if(ch[ch.length-1] == 'e' || ch[ch.length-1] == '.')
				{
					document.getElementById("mob").value="";
					alert("Number cannot contain e or .");
				}
			
		}else {
			document.getElementById("mob").value="";
			alert("Number length cannot be greater than 12");							
		}
		
	}
	</script>
	
</head>
<body> 
	
	<!-- =================Header================================ -->
    <!-- ================ start of the nav bar ============ -->
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.aks" style="float:left">
	      <span style="font-family: Broadway; font-size: 42px" >D</span>
	      Docto<span>App</span>
	      </a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto nav-tabs">
	          <li class="nav-item"><a href="index.aks" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="about.aks" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="services.aks" class="nav-link">Services</a></li>
	          <li class="nav-item"><a href="contact.aks" class="nav-link">Contact</a></li>
	          <li class="nav-item cta"><a href="" class="nav-link" data-toggle="modal" data-target="#modalRequest"><span>Login / Register</span></a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
<!-- ================================Modal==================================== -->

<div class="modal fade" id="modalRequest" tabindex="-1" role="dialog" aria-labelledby="modalRequestLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
       
      	<div class="col-md-12 ftco-animate pr-md-5 order-md-first">
		  <div class="row">
		   	<div class="col-md-12 nav-link-wrap">
		    	<div class="modal-header">
         		 <h5 class="modal-title" id="modalRequestLabel"><b>LOGIN</b></h5>
        		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         		   <span aria-hidden="true" style="color:black;">&times;</span>
         		  </button>
       			</div>
		    </div>
		    <div class="col-md-12 nav-link-wrap mb-5">
		       <div class="nav ftco-animate nav-tabs" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		           <a class="nav-link active" id="v-pills-whatwedo-tab" data-toggle="pill" 
		           href="#v-pills-whatwedo" role="tab" aria-controls="v-pills-whatwedo" aria-selected="true">Doctor/Worker</a>

		           <a class="nav-link" id="v-pills-mission-tab" data-toggle="pill" 
		           href="#v-pills-mission" role="tab" aria-controls="v-pills-mission" aria-selected="false">Patient</a>
		            
		       </div>
		       
		          </div>
		          <div class="col-md-12 d-flex align-items-center">
		            
		            <div class="tab-content ftco-animate" id="v-pills-tabContent">

		              <div class="tab-pane fade show active" id="v-pills-whatwedo" role="tabpanel" aria-labelledby="v-pills-whatwedo-tab">
		              	
		              	<div class="modal-body" >
				          <form action="checkuserlogin.aks " method="post">
				            <div class="form-group">
				              <label for="appointment_name" class="text-black"><b>UserId</b></label>
				              <input type="text" name = "uid" class="form-control" id="appointment_name" placeholder="User ID" required>
				            </div>
				            <div class="form-group">
				              <label for="appointment_pwd" class="text-black"><b>Password</b></label>
				              <input type="password" name = "pass" class="form-control" id="appointment_pwd" placeholder="Password" required>
				              <input type="checkbox" onclick="showpass()">Show Password
				              <input type="hidden" name="decide" value="doc">
				            </div>
				            <script type="text/javascript">
				            	function showpass() {
				            		var show = document.getElementById("appointment_pwd");
									if (show.type === "password") {
									    show.type = "text";
									  } else {
									    show.type = "password";
									  }
								}	
				            	
				            </script>
				            <br><br><br>
				            <div class="row">
				              <div class="col-md-4">
				                <div class="form-group" style="font-family: Arial">
				               		<a href="registration_user.aks">New User? Register</a>
				                </div>    
				              </div>
				              <div class="col-md-4">
				                <div class="form-group">
				                  	<a href="forget.aks">Forget Password</a>
				                </div>
				              </div>
				              <div class="col-md-4">
				                <div class="form-group" style="font-family: Arial">
				               		<input type="submit" class="btn btn-success" 
				               		name = "login" title="Fill all and then click submit" onclick="return check()">
				                </div>    
				              </div>
				            </div>
				            
				           </form> 
				             
				          </div>
          	
		              </div>

		              <div class="tab-pane fade" id="v-pills-mission" role="tabpanel" aria-labelledby="v-pills-mission-tab">
		                <div class="modal-body" >
				          <form action="checkuserlogin.aks" method="post">
				            <div class="form-group">
				              <label for="mob" class="text-black"><b>Mobile Number</b></label>
				              <input type="number" name = "mob" min="1" class="form-control" id="mob" 
				              placeholder="Registered Number" required title="Registered Mobile Number" onkeypress="mobcheck()">
				            </div>
				            <div class="form-group">
				              <label for="pat_pwd" class="text-black"><b>Password</b></label>
				              <input type="password" name = "ppass" class="form-control" id="pat_pwd" placeholder="Password" required title="Password mentioned on the top of the Prescription">
				              <input type="checkbox" onclick="showppass()">Show Password
				              <input type="hidden" name="decide" value="pat">
				            </div>
				            <script type="text/javascript">
				            	function showppass() {
									var show = document.getElementById("pat_pwd");
									if (show.type === "password") {
									    show.type = "text";
									  } else {
									    show.type = "password";
									  }
				            		
								}	
				            	
				            	
				            </script>
				            <br><br><br>
				            <div class="row">
				              <div class="col-md-4">
				                <div class="form-group" style="font-family: Arial">
				               		<a href="registration_user.aks">New User? Register</a>
				                </div>    
				              </div>
				              <div class="col-md-4">
				                <div class="form-group">
				                  	<a href="#">Forget Password</a>
				                </div>
				              </div>
				              <div class="col-md-4">
				                <div class="form-group" style="font-family: Arial">
				               		<input type="submit" class="btn btn-success" 
				               		name = "login_patient" title="Fill all and then click submit">
				                </div>    
				              </div>
				            </div>
				            
				           </form> 
				             
				          </div>
		              </div>
		              
		            </div>
		          </div>
		        </div>
		      </div>
      </div>
     </div>
    </div>
<!-- ==========================Modal End======================== -->
<!--============ END nav =================================-->
<!-- =================end header ========================= -->    

  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
	
</body>
</html>