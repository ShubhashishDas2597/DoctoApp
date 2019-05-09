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

    <!-- ===================my defined  links and scripts==============================-->
</head>

<%
String oname = (String)session.getAttribute("oname"); 
if (oname != null)
{
%>

<script type="text/javascript">
	function check() {
		
		ch = document.getElementById("rgb").value;
		if(ch.length < 12) {
		if (ch[0] < 6) {
			alert("Number cannot start with " + ch[0]);
			document.getElementById("rgb").value="";
		}
		for (i=0; i<ch.length; i++)
			{
				if(ch[i] == 'e' || ch[i] == '.')
					{
						document.getElementById("rgb").value="";
						alert("Number cannot contain e or .");
					}
			}
		}else {
			document.getElementById("rgb").value="";
			alert("Number length cannot be greater than 12");							
		}
		
	}
	</script>


	<script type="text/javascript">
	function checkname() {
		
		naam = document.getElementById("hex").value;
		if (naam[naam.length-1] >= 48 || naam[naam.length-1] <= 57) {
			alert("Name cannot have " + naam[naam.length-1]);
			document.getElementById("hex").value="";
		}
		
	}
	</script>
	
<body>
<%
  if (request.getAttribute("msg")!= null ){
	  %>
  <script>alert('<%request.getAttribute("msg");%>')</script>");<% }
  %>

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
                            <a href="dashboard_o.aks">
								<span class="educate-icon educate-home icon-wrap"></span>
								<span class="mini-click-non">Dashboard</span>
							</a>
                        </li>
                        <li>
                        <a title="Add new Patient" href="registration_user_o.aks">
                        <span class="educate-icon educate-professor icon-wrap sub-icon-mg" aria-hidden="true"></span>
                        	<span class="mini-click-non">Add new Patient</span></a>
                        </li>
                        <li>
                            <a class="has-arrow" title="Landing Page" href="events.html" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> 
                            <span class="mini-click-non">Appointment</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="Make an Appointment" href="makeappointments_o.aks"><span class="mini-sub-pro">Make Appointment</span></a></li>
                                <li><a title="Manage Appointment" href="viewappointments_o.aks"><span class="mini-sub-pro">Manage Appointment</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a  href="viewqueries_o.aks" aria-expanded="false">
                            <span class="educate-icon educate-library icon-wrap"></span> <span class="mini-click-non">Queries</span></a>
                        </li>
                        <li>
                            <a href="viewfeedbacks_o.aks" aria-expanded="false">
                            <span class="educate-icon educate-charts icon-wrap"></span> <span class="mini-click-non">FeedsBacks</span></a>
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
															<span class="admin-name">Mr. <%=oname.toUpperCase()%></span>
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
                                                            <!-- <li><a data-toggle="tab" href="#Projects">Projects</a>
                                                            </li> -->
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
                                        <li><a data-toggle="collapse" data-target="#Charts" href="dashboard_o.aks">Dashboard 
                                        </a>
                                        </li>
                                        <li><a data-toggle="collapse" data-target="#Charts" href="registration_user_o.aks">Add new Patient</a>
                                        </li>
                                        <li><a data-toggle="collapse" data-target="#demoevent" href="#">Appointment <span class="admin-project-icon edu-icon edu-down-arrow"></span></a>
                                            <ul id="demoevent" class="collapse dropdown-header-top">
                                                <li><a href="makeappointments_o.aks">Make Appointment</a>
                                                </li>
                                                <li><a href="viewappointments_o.aks">Manage Appointment</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a data-toggle="collapse" data-target="#Charts" href="viewqueries_o.aks">Queries</a>
                                        </li>
                                        <li><a data-toggle="collapse" data-target="#Charts" href="viewfeedbacks_o.aks">FeedBacks</a>
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
                                            <li><a href="dashboard_o.aks">Home</a> <span class="bread-slash">/</span>
                                            </li>
                                            <li><span class="bread-blod">Make Appointments</span>
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
                            <div class="sparkline14-hd">
                                <div class="main-sparkline14-hd">
                                    <h1>Patient Information</h1>
                                </div>
                            </div>
                            <div class="sparkline14-graph">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="ts-forms mg-b-23">
                                            <div class="tsbox">
                                            <form action="addapp_o.aks" method="post">
                                                <label class="label">Patient Name</label>
                                                <label class="color-group" for="hex">
														<input type="text" id="hex" name="name" required="required"  onkeypress="checkname()">
													</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="colorpicker-inner ts-forms mg-b-23">
                                            <div class="tsbox">
                                                <label class="label">Mobile</label>
                                                <label class="color-group" for="rgb">
														<input type="text" id="rgb" name="mob" required="required"  onkeypress="check()">
													</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                   <!--  </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"> -->
                        <div class="sparkline16-list responsive-mg-b-30">
                        
                            <div class="sparkline16-hd">
                                <div class="main-sparkline16-hd">
                                    <h1>Doctor Information</h1>
                                </div>
                            </div>
                            
                            <%
                            Date d = new Date();
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                            /* GregorianCalendar cal1 = new GregorianCalendar();
                            cal1.setTime(d);
                            cal1.add(Calendar.DATE, 1);*/
                            String mindate =  Date_format.tareek();
                            GregorianCalendar cal = new GregorianCalendar();
                            cal.setTime(d);
                            cal.add(Calendar.MONTH, 2);
                           	//df.format(cal.getTime()); its necesssary to give because to correct date format
                            %>
                         	
                            <div class="sparkline16-graph">
                                <div class="date-picker-inner">
                                    <div class="form-group data-custon-pick" id="data_1">
                                        <label>Appointment Date</label>
                                        <div class="input-group ">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                            <input type="date" class="form-control" required="required" name="appdate" min="<%=mindate %>" max="<%=df.format(cal.getTime())%>">
                                        </div>
                                    </div>
                                    <div class="form-group data-custon-pick" id="data_2">
                                        <label>Department</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-stethoscope"></i></span>
                                            <select id="type" name= "dept" class=" form-control" tabindex="-1">
												<option hidden>---Department---</option>
											   
											   	<%
											    while (it.hasPrevious())
				                                   {
				                                	   doctor dobj = (doctor)it.previous();
				                                	   out.print(it + " " + dobj.getDocpass());
											   	%>
											    <option value="<%=dobj.getDocid() %>"><%=dobj.getSpcl() + " - Dr." + dobj.getDocname() %></option>
											   
											<% } %>
											</select>
                                        </div>
                                    </div>
                                    <div class="form-group data-custon-pick" id="data_4">
                                        <label>Fees</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                            <input type="text" class="form-control" value="Rs. 200" readonly="readonly">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group data-custon-pick" id="data_5">
                                        <div class="input-group">
                                            <input type="submit" class="form-control" value="Submit and Generate Appointment Letter"style="color: green;" >
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>














<!-- ================================================================customizations end================== -->       
        <div class="footer-copyright-area" style="background: #38e09d; ">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer-copy-right">
                            <p>Copyright ©2019 All rights reserved | Designed by & Developed by Shubhashish Das.</p>
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