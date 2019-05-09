<%@page import="dao.*"%>
<%@page import="template.*"%>
<%@page import="template.HibernateTemplate"%>
<%@page import="dao.doctor"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.cfg.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

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
    <!-- x-editor CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/editor/select2.css">
    <link rel="stylesheet" href="css_main/editor/datetimepicker.css">
    <link rel="stylesheet" href="css_main/editor/bootstrap-editable.css">
    <link rel="stylesheet" href="css_main/editor/x-editor-style.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="css_main/data-table/bootstrap-table.css">
    <link rel="stylesheet" href="css_main/data-table/bootstrap-editable.css">
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
	<%
  if (request.getAttribute("msg")!= null ){
	  %>
  <script>alert('<%request.getAttribute("msg");%>')</script>
  <%
  }
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
                            <a class="has-arrow" title="Landing Page" href="events.html" aria-expanded="false">
                            <span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> 
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
															<span class="admin-name">Mr. <%=oname.toUpperCase() %></span>
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
                                    Configuration cfg = new Configuration();
                                	cfg.configure("doc.cfg.xml");
                                	
                                	SessionFactory sf = cfg.buildSessionFactory();
                                	Session s = sf.openSession();
                                	
                                	Query q = s.createQuery("from doctor d");
                                	List lst = q.list();
                                	
                                	//int max = (int)Collections.max(lst);
                                	
                                	Iterator it = lst.iterator();
                                	
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
            <div class="breadcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="breadcome-list">
                                <div class="row">
                                   
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <ul class="breadcome-menu">
                                            <li><a href="#">Home</a> <span class="bread-slash">/</span>
                                            </li>
                                            <li><span class="bread-blod">Dashboard</span>
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
<!-- =================================================informative boxes =============================-->        
        <div class="analytics-sparkle-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="analytics-sparkle-line reso-mg-b-30">
                            <div class="analytics-content">
                                <h5>Incomes</h5>
                                <%
                                Query q1 = HibernateTemplate.select("from appointment a where a.takendate =:x and a.payment not like 'not'");
								q1.setParameter("x", Date_format.tareek());
                                List lst1 = q1.list();
                                %>
                                <h2>&#8377;<span class="counter"><%=200 * lst1.size() %></span> <span class="tuition-fees">Total Today's Paid Money</span></h2>
                                <span class="text-success">*Fees only</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="analytics-sparkle-line reso-mg-b-30">
                            <div class="analytics-content">
                                <h5>Appointments</h5>
                                <%
                                Query q2 = HibernateTemplate.select("from appointment a where a.date_time = :y ");
                				q2.setParameter("y", Date_format.tareek());
                				
                				List lst2 = q2.list();
                				
                                %>
                                <h2><span class="counter"><%=lst2.size() %></span> <span class="tuition-fees">Today's</span></h2>
                                <span class="text-danger">*Inclusive All Departments(Paid and Non Paid Appoitments)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!-- =================================================informative boxes end =============================-->        
        <div class="product-sales-area mg-tb-30">
            <div class="container-fluid">
                <div class="row">
 <!-- =================================================graphs =============================-->                
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-sales-chart">
                            <div class="portlet-title">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="caption pro-sl-hd">
                                            <span class="caption-subject"><b>Income</b></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="actions graph-rp graph-rp-dl">
                                            <p>All Expenses in &#8377;</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
								Gson gsonObj = new Gson();
								Map<Object,Object> map = null;
								List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
								
								Query qm = s.createQuery("select count(a.pid) , a.takendate from appointment a where a.payment not like 'not' group by a.takendate");
								List lm = qm.list();
								Iterator im = lm.iterator();
								while(im.hasNext())
								{
									Object o[] = (Object[])im.next();
									int val = Integer.parseInt(o[0].toString()) * 200;
									map = new HashMap<Object,Object>(); map.put("label", o[1].toString()); map.put("y", val); list.add(map);
								
								}
								String dataPoints = gsonObj.toJson(list);
							%>
                            <div id="chartContainer" style="height: 356px;">
                            
                            
                            
                            </div>
                        </div>
                    </div>
<!-- =================================================graphs end =============================-->                     
                    
<!-- =================================================side graphs =============================-->                     
                </div>
            </div>
        </div>
		
		<div class="data-table-area mg-b-15">
            <div class="container-fluid">
                <div class="row">
 <!-- =================================================graphs =============================-->    
 					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="sparkline12-list mg-b-30">
                            <div class="sparkline12-hd">
                                <div class="main-sparkline12-hd">
                                    <h1>Appointments</h1>
                                </div>
                            </div>
                            <div class="sparkline12-graph">
                                <div class="static-table-list">
                                    <table class="table hover-table">
                                        <thead>
                                        <%
                                        Query q3 = s.createQuery("from doctor d");
                                        List lst3 = q3.list();
                                        Iterator it3 = lst3.iterator();
                                        while (it3.hasNext())
                                        {
                                        	doctor d = (doctor) it3.next();
                                        	//out.println(d.getDocname()); // print doc name
                                        	%>
	                                        <tr>
	                                       		<th colspan="4" style="text-align: ; font-size:15px; color: green;"><%="Dr. " + d.getDocname() %></th>
	                                        </tr>
                                            <tr>
                                                <th>S.No</th>
                                                <th>Appointment Id</th>
                                                <th>Patient Name</th>
                                                <th>Date_time</th>
                                                <th>Payment</th>
                                                <th>Print</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                        <%
                                        	Query q4 = s.createQuery("from appointment a where a.did = :x ");
                                        	q4.setParameter("x", d.getDocid());
                                        	List l = q4.list();
                                        	Iterator i = l.iterator();
                                        	int in = 1;
                                        	while (i.hasNext())
                                        	{
                                        		appointment a = (appointment) i.next();
                                        		Object  o = s.get(patient.class,a.getPid()); 
                                        		patient p = (patient) o;
                                        %>
                                        	
                                            <tr>
                                                <td><%=in++ %></td>
                                                <td><%=a.getAid() %></td>
                                                <td><%=p.getPname() %></td>
                                                <td><%=a.getDate_time() %></td>
                                                <td><%=a.getPayment() %></td>
                                                <td>
                                                <a href="paidd.aks?aid=<%=a.getAid() %>">
                                            		<button data-toggle="tooltip" title="Get Print " class="pd-setting-ed" type="submit">
                                            			Get Print
                                            		</button>
                                            		</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <%}
                                        }%>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>            
<!-- =================================================graphs end =============================-->                     
 
<!-- =================================================side graphs =============================-->                     
                </div>
            </div>
        </div>
	
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
    <!-- counterup JS
		============================================ -->
    <script src="js_main/counterup/jquery.counterup.min.js"></script>
    <script src="js_main/counterup/waypoints.min.js"></script>
    <script src="js_main/counterup/counterup-active.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="js_main/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js_main/scrollbar/mCustomScrollbar-active.js"></script>
    
    <!-- metisMenu JS
		============================================ -->
    <script src="js_main/metisMenu/metisMenu.min.js"></script>
    <script src="js_main/metisMenu/metisMenu-active.js"></script>
    <!-- morrisjs JS
		============================================ -->
    <script src="js_main/morrisjs/raphael-min.js"></script>
    <script src="js_main/morrisjs/morris.js"></script>
    <script src="js_main/morrisjs/morris-active.js"></script>
    <!-- morrisjs JS
		============================================ -->
    <script src="js_main/sparkline/jquery.sparkline.min.js"></script>
    <script src="js_main/sparkline/jquery.charts-sparkline.js"></script>
    <script src="js_main/sparkline/sparkline-active.js"></script>
    <!-- calendar JS
		============================================ -->
    <script src="js_main/calendar/moment.min.js"></script>
    <script src="js_main/calendar/fullcalendar.min.js"></script>
    <script src="js_main/calendar/fullcalendar-active.js"></script>
    <!-- data table JS
		============================================ -->
    <script src="js_main/data-table/bootstrap-table.js"></script>
    <script src="js_main/data-table/tableExport.js"></script>
    <script src="js_main/data-table/data-table-active.js"></script>
    <script src="js_main/data-table/bootstrap-table-editable.js"></script>
    <script src="js_main/data-table/bootstrap-editable.js"></script>
    <script src="js_main/data-table/bootstrap-table-resizable.js"></script>
    <script src="js_main/data-table/colResizable-1.5.source.js"></script>
    <script src="js_main/data-table/bootstrap-table-export.js"></script>
    <!--  editable JS
		============================================ -->
    <script src="js_main/editable/jquery.mockjax.js"></script>
    <script src="js_main/editable/mock-active.js"></script>
    <script src="js_main/editable/select2.js"></script>
    <script src="js_main/editable/moment.min.js"></script>
    <script src="js_main/editable/bootstrap-datetimepicker.js"></script>
    <script src="js_main/editable/bootstrap-editable.js"></script>
    <script src="js_main/editable/xediable-active.js"></script>
    <!-- Chart JS
		============================================ -->
    <script src="js_main/peity/jquery.peity.min.js"></script>
    <script src="js_main/peity/peity-active.js"></script>
    <!-- tab JS
		============================================ -->
    <script src="js_main/tab.js"></script>
    <!-- plugins JS
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
    
    <!-- =====================my defined scripts================= -->
    <script type="text/javascript">
		history.pushState(null, null, location.href);
		window.onpopstate = function() {
			history.go(1);
		};
	</script>
    
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    
    <script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	
	axisY:{
		title: "Amounts",
		suffix: "",
		includeZero: true
	},
	data: [{
		type: "spline",
		toolTipContent: "<b>{label}</b>: {y}",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
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