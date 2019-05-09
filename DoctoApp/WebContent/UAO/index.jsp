<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
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
	
	<script type="text/javascript">
		history.pushState(null, null, location.href);
		window.onpopstate = function() {
			history.go(1);
		};
	</script>
	
</head>
  <body>
  <!-- =================Header================================ -->
  <%
  if (request.getAttribute("msg")!= null ){
	  %>
  <script>alert('<%request.getAttribute("msg");%>')</script>");<% }
  %>
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
	          <li class="nav-item active"><a href="#" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="about.aks" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="services.aks" class="nav-link">Services</a></li>
	          <li class="nav-item"><a href="contact.aks" class="nav-link">Contact</a></li>
	          <li class="nav-item cta" ><a href="" class="nav-link" data-toggle="modal" data-target="#modalRequest"><span>Login / Register</span></a></li>
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


	<!--============ slider =================================-->
    <section class="home-slider owl-carousel">
      <div class="slider-item" style="background-image: url('images/bg_1.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center" data-scrollax-parent="true">
            <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
              <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">New smile and New life</h1>
              <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Dentistry with heart. Because your smile is our passion</p>
              <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
              <a href="#" class="btn btn-primary px-4 py-3" data-toggle="modal" data-target="#modalRequest">Login / Register</a></p>
            </div>
          </div>
        </div>
      </div>

      <div class="slider-item" style="background-image: url('images/bg_2.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center" data-scrollax-parent="true">
            <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
              <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Ear Nose & Throat</h1>
              <p class="mb-4">Our Ear Nose & Throat specialists and hearing service center are unmatched in quality and commitment to patient care</p>
              <p><a href="#" class="btn btn-primary px-4 py-3" data-toggle="modal" data-target="#modalRequest">Login / Register</a></p>
            </div>
          </div>
        </div>
      </div>
      
       <div class="slider-item" style="background-image: url('images/bg_3.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center" data-scrollax-parent="true">
            <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
              <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Most advanced CHILD CARE</h1>
              <p class="mb-4">Healthy child makes healthy Nation</p>
              <p><a href="#" class="btn btn-primary px-4 py-3" data-toggle="modal" data-target="#modalRequest">Login / Register</a></p>
            </div>
          </div>
        </div>
      </div>
      
       <div class="slider-item" style="background-image: url('images/bg_2.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center" data-scrollax-parent="true">
            <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
              <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Trust Our EyeSight. To Our Insight </h1>
              <p class="mb-4">Trust - Care -Excellence... Our Core Values says it all...<br>
              DoctoApp Eye care is a didicated online facility for comprehensive eye care with best in class Infrastructure a and equipment from around the world</p>
              <p><a href="#" class="btn btn-primary px-4 py-3" data-toggle="modal" data-target="#modalRequest">Login / Register</a></p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
<!--============ END slider =================================-->


    <section class="ftco-intro">
    	<div class="container">
    		<div class="row no-gutters">
    			<div class="col-md-6 color-1 p-4" style="background-image: linear-gradient(to bottom right,#04091e, #1AD5B0);">
    				<h3 class="mb-4">Emergency Cases</h3>
    				<p><b>Be ALERT!<br> 
    				Expect the unexpected</b></p>
    				<p>Emergency cases are served faster to make faster relief</p>
    				<span class="phone-number">+ (91) 999 888 777 1</span>
    			</div>
    			<div class="col-md-6 color-2 p-4" style="background-image: linear-gradient(to bottom left,#04091e ,  #1AD5B0);">
    				<h3 class="mb-4">Opening Hours</h3>
    				<p class="openinghours d-flex">
    					<span>Monday - Saturday</span>
    					<span>8:00 - 19:00</span>
    				</p>
    				
    				<p class="openinghours d-flex">
    					<span>Sunday</span>
    					<span>10:00 - 14:00</span>
    				</p>
    			</div>
    			</div>
    	</div>
    </section>
  
    <section class="ftco-section ftco-services">
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-2">Our Service Keeps you Healthy</h2>
            <p>It is important for us to focus on the poor and marginalised.<br>
            Why do we invest our time and energy in research that points us towards cost-effective solutions for the country's healthcare needs?</p>
          </div>
        </div>
       
      </div>
      <div class="container-wrap mt-5">
      	<div class="row d-flex no-gutters">
      		<div class="col-md-6 img" style="background-image: url(images/about-2.jpg);">
      		</div>
      		<div class="col-md-6 d-flex">
      			<div class="about-wrap">
      				<div class="heading-section heading-section-white mb-5 ftco-animate">
		            <h2 class="mb-2">Cured with a personal touch</h2>
		            <p>Care that Never Quits.<br>Passionate About Medicine. Compassionate About People.</p>
		          </div>
		          <div class="list-services d-flex ftco-animate">
      					<div class="icon d-flex justify-content-center align-items-center">
      						<span class="icon-check2"></span>
      					</div>
      					<div class="text">
	      					<h3>Well Experienced Doctors</h3>
	      					<p>We heal the patients in the same way as they were deserved to be treated. We believe that <b>Medicines with Love and a Big Smile</b></b> can
	      					reduce patient's pain and can recover fast.</p>
      					</div>
      				</div>
      				<div class="list-services d-flex ftco-animate">
      					<div class="icon d-flex justify-content-center align-items-center">
      						<span class="icon-check2"></span>
      					</div>
      					<div class="text">
	      					<h3>We are here for You</h3>
	      					<p>We truly believe that getting best care and get cured by the latest updates in the medicine world is fundamental right of a Marginalized person also.</p>
      					</div>
      				</div>
      				<div class="list-services d-flex ftco-animate">
      					<div class="icon d-flex justify-content-center align-items-center">
      						<span class="icon-check2"></span>
      					</div>
      					<div class="text">
	      					<h3>High Technology Facilities</h3>
	      					<p>Our Doctors are facilitated with high technology facilities. They are updated with latest technologies and techniques</p>
      					</div>
      				</div>
      				<div class="list-services d-flex ftco-animate">
      					<div class="icon d-flex justify-content-center align-items-center">
      						<span class="icon-check2"></span>
      					</div>
      					<div class="text">
	      					<h3>Comfortable Clinics</h3>
	      					<p>Clinics must be a place where wait for their turn doesn't matters. Airy halls make feel better to the patients.</p>
      					</div>
      				</div>
      			</div>
      		</div>
      	</div>
      </div>
    </section>


    <section class="ftco-section">
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-3">Meet Our Doctors that runs Docto<b>App</b></h2>
            <p>Four great pupil with great and innovative minds and generous hearts came together to serve the nation and focused on below lines patients.</p>
          </div>
        </div>
        <div class="row">
        	<div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
        		<div class="staff">
      				<div class="img mb-4" style="background-image: url(images/person_5.jpg);"></div>
      				<div class="info text-center">
      					<h3><a href="teacher-single.html">Dr. PK Khare</a></h3>
      					<span class="position">Ophthalmologist</span>
      					<div class="text">
	        				<p>M.D., M.B.B.S</p>
	        				<ul class="ftco-social">
			              <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			              <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			              <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			            </ul>
	        			</div>
      				</div>
        		</div>
        	</div>
        	<div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
        		<div class="staff">
      				<div class="img mb-4" style="background-image: url(images/person_6.jpg);"></div>
      				<div class="info text-center">
      					<h3><a href="teacher-single.html">Dr. Rajiv Sen</a></h3>
      					<span class="position">Paediatrician</span>
      					<div class="text">
	        				<p>M.D., M.B.B.S</p>
	        				<ul class="ftco-social">
			              <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			              <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			              <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			            </ul>
	        			</div>
      				</div>
        		</div>
        	</div>
        	<div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
        		<div class="staff">
      				<div class="img mb-4" style="background-image: url(images/person_7.jpg);"></div>
      				<div class="info text-center">
      					<h3><a href="teacher-single.html">Dr. Madhuri Mirza</a></h3>
      					<span class="position">ENT Specialist</span>
      					<div class="text">
	        				<p>M.D., M.B.B.S</p>
	        				<ul class="ftco-social">
			              <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			              <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			              <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			            </ul>
	        			</div>
      				</div>
        		</div>
        	</div>
        	<div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
        		<div class="staff">
      				<div class="img mb-4" style="background-image: url(images/person_8.jpg);"></div>
      				<div class="info text-center">
      					<h3><a href="teacher-single.html">Dr. BP Bajpae</a></h3>
      					<span class="position">Dentist</span>
      					<div class="text">
	        				<p>M.D., M.B.B.S</p>
	        				<ul class="ftco-social">
			              <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			              <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			              <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			            </ul>
	        			</div>
      				</div>
        		</div>
        	</div>
        </div>
      </div>
    </section>
 <br>

	<!-- ===============foooter=============================== -->

    <footer class="ftco-footer ftco-bg-dark ftco-section" style="background: #2f89fc; background-image: linear-gradient(to bottom right,#04091e, #1AD5B0);">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-4">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2" style="color: white">Docto<b>App.</b></h2>
              <p><i>Eyes + Ears, Nose, Throat + Kids + Teeth specialist in one place
              <br>Opthalmologist + Otorhinolaryngolist + Paedetrician + Dentist </i>
              </p>
            </div>
            <ul class="ftco-footer-social list-unstyled float-md-left float-lft ">
              <li class="ftco-animate"><a href="#"><span class="icon-twitter" ></span></a></li>
              <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
              <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
            </ul>
            
            
          </div>
          <div class="col-md-3">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2"  style="color: white">Quick Links</h2>
              <ul class="list-unstyled">
                <li><a href="about.aks" class="py-2 d-block">About</a></li>
                <li><a href="services.aks" class="py-2 d-block">Features</a></li>
                <li><a href="https://www.google.co.in/maps/@22.7284071,75.8877179,17z?hl=en" 
                class="py-2 d-block">Site Map</a></li>
                <li><a href="contact.aks" class="py-2 d-block">Contact</a></li>
              </ul>
            </div>
          </div>
          
          <div class="col-md-5">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2"  style="color: white">Office</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">2<sup>nd</sup> floor, Kanchan Sagar Building, Industry House, Indore, Madhya Pradesh, India</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+91 999 888 777 1</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@DoctoApp.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Designed by & Developed by Shubhashish Das.
  
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="js/main.js"></script>
    
  </body>
</html>