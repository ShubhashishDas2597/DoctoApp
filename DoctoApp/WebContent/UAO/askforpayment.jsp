<%@page import="java.text.*"%>
<%@page import="template.*"%>
<%@page import="dao.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.cfg.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Patient Portal - DoctoApp</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" href="images/DocTrans2.png">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/owl.carousel.css">
    <link rel="stylesheet" href="css_main/owl.theme.css">
    <link rel="stylesheet" href="css_main/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/normalize.css">
    <!-- meanmenu icon CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/meanmenu.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/main.css">
    <!-- educate icon CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/educate-custon-icon.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="css_main/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="css_main/calendar/fullcalendar.print.min.css">
    <!-- touchspin CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/touchspin/jquery.bootstrap-touchspin.min.css">
    <!-- datapicker CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/datapicker/datepicker3.css">
    <!-- forms CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/form/themesaller-forms.css">
    <!-- colorpicker CSS
		============================================ -->
    <!-- select2 CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/select2/select2.min.css">
    <!-- chosen CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/chosen/bootstrap-chosen.css">
    <!-- ionRangeSlider CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/ionRangeSlider/ion.rangeSlider.css">
    <link rel="stylesheet" href="css_main/ionRangeSlider/ion.rangeSlider.skinFlat.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="UAO/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="js_main/vendor/modernizr-2.8.3.min.js"></script>
    <!--  -->
    <!-- ===================my defined  links and scripts==============================-->
    <style>
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);


/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
</style>
    <!-- ===================my defined  links and scripts==============================-->
</head>

<%
String pname = (String)session.getAttribute("pname"); 
if (pname != null)
{
%>

<body>
    <!--[if lt IE 8]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->
    <!-- =========================================Start Left menu area=============================-->
    <div class="left-sidebar-pro">
        <nav id="sidebar" class="">
            <div class="sidebar-header">
                <a href="logout.aks"><img class="main-logo" src="images/DocTrans.png" alt="" /></a>
                <strong><a href="logout.aks"><img src="images/DoctoTrans_small.png" alt="" /></a></strong>
            </div>
            <div class="left-custom-menu-adp-wrap comment-scrollbar">
                <nav class="sidebar-nav left-sidebar-menu-pro">
                    <ul class="metismenu" id="menu1">
                        <li class="active">
                            <a href="dashboard_p.aks">
								<span class="educate-icon educate-home icon-wrap"></span>
								<span class="mini-click-non">Dashboard</span>
							</a>
                        </li>
                        <li>
                            <a class="has-arrow" title="Landing Page" href="events.html" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> 
                            <span class="mini-click-non">Appointment</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="Make an Appointment" href="makeappointments.aks"><span class="mini-sub-pro">Make Appointment</span></a></li>
                                <li><a title="View Appointment" href="viewappointments.aks"><span class="mini-sub-pro">View Appointment</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="all-professors.html" aria-expanded="false"><span class="educate-icon educate-library icon-wrap"></span> <span class="mini-click-non">Prescription</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="Your Prescriptions" href="allprescrp.aks"><span class="mini-sub-pro">All Prescriptions</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="all-students.html" aria-expanded="false"><span class="educate-icon educate-charts icon-wrap"></span> <span class="mini-click-non">Payments</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="All Students" href="makepayments.aks"><span class="mini-sub-pro">New Payment</span></a></li>
                                <li><a title="Add Students" href="viewpayments.aks"><span class="mini-sub-pro">View Payments</span></a></li>
                            </ul>
                        </li>
                        
                        <li>
                            <a class="has-arrow" href="all-courses.html" aria-expanded="false">
                            <span class="educate-icon educate-department icon-wrap"></span> 
                            <span class="mini-click-non">Feedback</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="Give Feedbacks" href="givefeedback.aks"><span class="mini-sub-pro">Give Feedback</span></a></li>
                                <li><a title="Your Feedbacks" href="viewfeedbacks.aks"><span class="mini-sub-pro">View Feedbacks</span></a></li>
                                <li><a title="Raise Queries" href="edit-library-assets.html"><span class="mini-sub-pro">Raise a Query</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </nav>
    </div>
    <!--============================== End Left menu area ===============================-->
    <!-- Start Welcome area -->
    <div class="all-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="logo-pro">
                        <a href="logout.aks"><img class="main-logo" src="images/DocTrans.png" alt="" /></a>
                    </div>
                </div>
            </div>
        </div> 
        <div class="header-advance-area" >
            <div class="header-top-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="background: #38e09d; ">
                            <div class="header-top-wraper">
                                <div class="row">
                                    <div class="col-lg-1 col-md-0 col-sm-1 col-xs-12">
                                        <div class="menu-switcher-pro">
                                            <button type="button" id="sidebarCollapse" class="btn bar-button-pro header-drl-controller-btn btn-info navbar-btn">
												<i class="educate-icon educate-nav"></i>
											</button>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-11 col-md-11 col-sm-12 col-xs-12">
                                        <div class="header-right-info">
                                            <ul class="nav navbar-nav mai-top-nav header-right-menu">
                                                <li class="nav-item">
                                                    <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
															<span class="admin-name"><%=pname.toUpperCase() %></span>
															<i class="fa fa-angle-down edu-icon edu-down-arrow"></i>
														</a>
                                                    <ul role="menu" class="dropdown-header-top author-log dropdown-menu animated zoomIn">
                                                        
                                                        <li><a href="#"><span class="edu-icon edu-user-rounded author-log-ic"></span>My Profile</a>
                                                        </li>
                                                        <li><a href="logout.aks"><span class="edu-icon edu-locked author-log-ic"></span>Log Out</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="nav-item nav-setting-open"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><i class="educate-icon educate-menu"></i></a>

                                                    <div role="menu" class="admintab-wrap menu-setting-wrap menu-setting-wrap-bg dropdown-menu animated zoomIn">
                                                        <ul class="nav nav-tabs custon-set-tab">
                                                            <li class="active"><a data-toggle="tab" href="#Notes">Doctors</a>
                                                            </li>
                                                        </ul>
		<!-- ==============================================================list of doctors================== -->
                                                        <div class="tab-content custom-bdr-nt">
                                                            <div id="Notes" class="tab-pane fade in active">
                                                                <div class="notes-area-wrap">
                                                                    <div class="note-heading-indicate">
                                                                        <h2><i class="fa fa-comments-o"></i> List of Doctors</h2>
                                    <%
                                    HibernateTemplate.setConfiguration();
                                	
                                	Query q = HibernateTemplate.select("from doctor d");
                                	List lst = q.list();
                                	
                                	ListIterator it = lst.listIterator();
                                	
                                   %> 
                                                                        <p>At present we have <b><%=lst.size() %></b> Doctor(s)</p>
                                                                    </div>
                                                                    <div class="notes-list-area notes-menu-scrollbar">
                                                                        <ul class="notes-menu-list">
                                                                            <li>
                                   <% 
                                   while (it.hasNext())
                                   {
                                	   doctor dobj = (doctor)it.next();
                                	   
                                	%>
                                                                               <a>
                                                                                    <div class="notes-list-flow">
                                                                                        <div class="notes-img">
                                                                                            <span class="message-date">DoctoApp</span>
                                                                                        </div>
                                                                                        <div class="notes-content">
                                                                                  			<h4>Dr. <%= dobj.getDocname() %></h4>
                                                                                            <p> <%=dobj.getDocdet() %></p>
                                                                                            <p> Timings : <%=dobj.getCome() + " to " + dobj.getGo()%> </p>
                                                                                            <h5> <%=dobj.getSpcl() %></h5>
                                  
                                                                                        </div>
                                                                                    </div>
                                                                                </a>
                                                                              	<hr>
                                                                                 <%
				                                 	 								 }
				                                  								 %>
				                                                          </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
      <!-- ================================================================list of doctors================== -->
      <!-- ================================================================list of project================== -->
                                         
                                                            
 	  <!-- ================================================================list of doctors================== -->
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
<!-- ================================================================Mobile Menu start================== -->          
            <div class="mobile-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="mobile-menu">
                                <nav id="dropdown">
                                    <ul class="mobile-menu-nav">
                                        <li><a data-toggle="collapse" data-target="#Charts" href="dashboard_p.aks">Dashboard 
                                        </a>
                                        </li>
                                        <li><a data-toggle="collapse" data-target="#demoevent" href="#">Appointment <span class="admin-project-icon edu-icon edu-down-arrow"></span></a>
                                            <ul id="demoevent" class="collapse dropdown-header-top">
                                                <li><a href="makeappointments.aks">Make Appointment</a>
                                                </li>
                                                <li><a href="viewappointments.aks">View Appointment</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a data-toggle="collapse" data-target="#demopro" href="#">Prescription <span class="admin-project-icon edu-icon edu-down-arrow"></span></a>
                                            <ul id="demopro" class="collapse dropdown-header-top">
                                                <li><a href="allprescrp.aks">All Prescriptions</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a data-toggle="collapse" data-target="#democrou" href="#">Payments <span class="admin-project-icon edu-icon edu-down-arrow"></span></a>
                                            <ul id="democrou" class="collapse dropdown-header-top">
                                                <li><a href="makepayments.aks">New Payments</a>
                                                </li>
                                                <li><a href="viewpayments.aks">View Payments</a>
                                                </li>
                                            </ul>
                                        </li>
                                       
                                        <li><a data-toggle="collapse" data-target="#demodepart" href="#">Feedback <span class="admin-project-icon edu-icon edu-down-arrow"></span></a>
                                            <ul id="demodepart" class="collapse dropdown-header-top">
                                                <li><a href="givefeedback.aks">Give Feedback</a>
                                                </li>
                                                <li><a href="viewfeedbacks.aks">View Feedbacks</a>
                                                </li>
                                                <li><a href="edit-department.html">Raise a Query</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!-- ================================================================Mobile Menu end================== -->
<!-- ================================================================customizations start================== --> 

	<div class="breadcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="breadcome-list">
                                <div class="row">
                                    
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <ul class="breadcome-menu">
                                            <li><a href="dashboard_p.aks">Home</a> <span class="bread-slash">/</span>
                                            </li>
                                            <li><span class="bread-blod"><a href="makeappointments.aks">Make Appointments</a></span> <span class="bread-slash">/</span>
                                            </li>
                                            <li><span class="bread-blod">Payments</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>





        <div class="advanced-form-area mg-b-15">
            <div class="container-fluid">
                <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="sparkline14-list">
                            <br>
                            <div class="sparkline14-graph">
                            <div class="tsbox">
                                            <%
                                            int did = (int) session.getAttribute("did");
                            				int pid = (int) session.getAttribute("pid");
                            				String appdate = (String)session.getAttribute("appdate");
                            				String tareek = (String)session.getAttribute("tareek");
                            				
                            				HibernateTemplate.setConfiguration();
                            				
                            				Query q1 = HibernateTemplate.select("select a.aid from appointment a where a.pid = :x and a.did = :w and a.date_time = :y and a.takendate = :z");
                            				q1.setParameter("w", did);
                            				q1.setParameter("x", pid);
                            				q1.setParameter("y", appdate);
                            				q1.setParameter("z", tareek);
                            				
                            				List lst1 = q1.list();
                            				Iterator it1 = lst1.iterator();
                            				
                            				while (it1.hasNext())
                            				{
                            					Integer i1 = (Integer)it1.next();
                            				%>
                            					<b>Appointment Id:</b> <%= i1.intValue() %>
                            				<%
                            				 } 
                            				
                                            %>
                                              
                                            </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="ts-forms mg-b-23">
                                        	
                                            <div class="tsbox">
                                            
                                                <label class="label"><b>Pay Now </b></label>
                                                <label class="color-group" for="hex">
                                                <a href="makepayments.aks">
                                               		<input type="submit" value="Pay Now" class="form-control btn btn-success" >
                                               	</a>
												</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="ts-forms mg-b-23">
                                            <div class="tsbox">
                                                <label class="label"><b>Pay at Operator Desk</b> </label>
                                                <label class="color-group" for="hex">
                                                <a href="invoice.aks">
													<input type="button" value="Skip and get Appointment Letter" class="form-control btn btn-success" >
												</a>
												</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

	<br><br><br><br><br><br>

<!-- ================================================================customizations end================== -->       
        <div class="footer-copyright-area" style="background: #38e09d; ">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer-copy-right">
                            <p>Copyright �2019 All rights reserved | Designed by & Developed by Shubhashish Das.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jquery
		============================================ -->
    <script src="js_main/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="js_main/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="js_main/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="js_main/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="js_main/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="js_main/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="js_main/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="js_main/jquery.scrollUp.min.js"></script>
   <!-- mCustomScrollbar JS
		============================================ -->
    <script src="js_main/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js_main/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="js_main/metisMenu/metisMenu.min.js"></script>
    <script src="js_main/metisMenu/metisMenu-active.js"></script>
   <!-- datapicker JS
		============================================ -->
    <script src="js_main/datapicker/bootstrap-datepicker.js"></script>
    <script src="js_main/datapicker/datepicker-active.js"></script>
    <!-- input-mask JS
		============================================ -->
    <script src="js_main/input-mask/jasny-bootstrap.min.js"></script>
    <!-- chosen JS
		============================================ -->
    <script src="js_main/chosen/chosen.jquery.js"></script>
    <script src="js_main/chosen/chosen-active.js"></script>
    <!-- select2 JS
		============================================ -->
    <script src="js_main/select2/select2.full.min.js"></script>
    <script src="js_main/select2/select2-active.js"></script>
    <!-- ionRangeSlider JS
		============================================ -->
    <script src="js_main/ionRangeSlider/ion.rangeSlider.min.js"></script>
    <script src="js_main/ionRangeSlider/ion.rangeSlider.active.js"></script>
    <!-- rangle-slider JS
		============================================ -->
    <script src="js_main/rangle-slider/jquery-ui-1.10.4.custom.min.js"></script>
    <script src="js_main/rangle-slider/jquery-ui-touch-punch.min.js"></script>
    <script src="js_main/rangle-slider/rangle-active.js"></script>
    <!-- knob JS
		============================================ -->
    <script src="js_main/knob/jquery.knob.js"></script>
    <script src="js_main/knob/knob-active.js"></script>
    <!-- tab JS
		============================================ -->
    <script src="js_main/tab.js"></script><!-- plugins JS
		============================================ -->
    <script src="js_main/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js_main/main.js"></script>
    <!-- tawk chat JS
		============================================ -->
    <script src="js_main/tawk-chat.js"></script>
    
    
    <!-- maskedinput JS
		============================================ -->
    <script src="js_main/jquery.maskedinput.min.js"></script>
    <script src="js_main/masking-active.js"></script>
    <!-- datepicker JS
		============================================ -->
    <script src="js_main/datepicker/jquery-ui.min.js"></script>
    <script src="js_main/datepicker/datepicker-active.js"></script>
    <!-- form validate JS
		============================================ -->
    <script src="js_main/form-validation/jquery.form.min.js"></script>
    <script src="js_main/form-validation/jquery.validate.min.js"></script>
    <script src="js_main/form-validation/form-active.js"></script>
    <!-- dropzone JS
		============================================ -->
    <script src="js_main/dropzone/dropzone.js"></script>
    <!-- tab JS
		============================================ -->
    <script src="js_main/tab.js"></script>
    
    <!-- =====================my defined scripts================= -->
    <script type="text/javascript">
		history.pushState(null, null, location.href);
		window.onpopstate = function() {
			history.go(1);
		};
	</script>
    
</body>

<%
} else
{%>
	<jsp:forward page="index.aks"></jsp:forward>
<%
}
%>

</html>