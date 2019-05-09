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
    <title>Doctor Portal - DoctoApp</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" href="images/DocTrans2.png">
    <link rel="stylesheet" href="css_main/bootstrap.min.css">
	<link rel="license" href="https://www.opensource.org/licenses/mit-license/">
<style>
			/* reset */

*
{	
	border: 0;
	box-sizing: content-box;
	color: inherit;
	font-family: inherit;
	font-size: inherit;
	font-style: inherit;
	font-weight: inherit;
	line-height: inherit;
	list-style: none;
	margin: 0;
	padding: 0;
	text-decoration: none;
	vertical-align: top;
}

/* content editable */

*[contenteditable] { border-radius: 0.25em; min-width: 1em; outline: 0; }

*[contenteditable] { cursor: pointer; }

*[contenteditable]:hover, *[contenteditable]:focus, td:hover *[contenteditable], td:focus *[contenteditable], img.hover { background: #DEF; box-shadow: 0 0 1em 0.5em #DEF; }

span[contenteditable] { display: inline-block; }

/* heading */

h1 { font: bold 100% sans-serif; letter-spacing: 0.5em; text-align: center; text-transform: uppercase; }

/* table */

table { font-size: 75%; table-layout: fixed; width: 100%; }
table { border-collapse: separate; border-spacing: 2px; }
th, td { border-width: 1px; padding: 0.5em; position: relative; text-align: left; }
th, td { border-radius: 0.25em; border-style: solid; }
th { background: #EEE; border-color: #BBB; }
td { border-color: #DDD; }

/* page */

html { font: 16px/1 'Open Sans', sans-serif; overflow: auto; padding: 0.5in; }
html { background: #999; cursor: default; }

body { box-sizing: border-box; height: 11in; margin: 0 auto; overflow:dden; padding: 0.5in; width: 8.5in; }
body { background: #FFF; border-radius: 1px; box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5); }

/* header */

header { margin: 0 0 3em; }
header:after { clear: both; content: ""; display: table; }

header h1 { background: #000; border-radius: 0.25em; color: #FFF; margin: 0 0 1em; padding: 0.5em 0; }
header address { float: left; font-size: 75%; font-style: normal; line-height: 1.25; margin: 0 1em 1em 0; }
header address p { margin: 0 0 0.25em; }
header span, header img { display: block; float: right; }
header span { margin: 0 0 1em 1em; max-height: 25%; max-width: 60%; position: relative; }
header img { max-height: 100%; max-width: 100%; }
header input { cursor: pointer; -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)"; height: 100%; left: 0; opacity: 0; position: absolute; top: 0; width: 100%; }

/* article */

article, article address, table.meta, table.inventory { margin: 0 0 3em; }
article:after { clear: both; content: ""; display: table; }
article h1 { clip: rect(0 0 0 0); position: absolute; }

article address { float: left; font-size: 125%; font-weight: bold; }

/* table meta & balance */

table.meta, table.balance { float: right; width: 36%; }
table.meta:after, table.balance:after { clear: both; content: ""; display: table; }

/* table meta */

table.meta th { width: 40%; }
table.meta td { width: 60%; }

/* table items */

table.inventory { clear: both; width: 100%; }
table.inventory th { font-weight: bold; text-align: center; }

table.inventory td:nth-child(1) { width: 26%; }
table.inventory td:nth-child(2) { width: 38%; }
table.inventory td:nth-child(3) { text-align: right; width: 12%; }
table.inventory td:nth-child(4) { text-align: right; width: 12%; }
table.inventory td:nth-child(5) { text-align: right; width: 12%; }

/* table balance */

table.balance th, table.balance td { width: 50%; }
table.balance td { text-align: right; }

/* aside */

aside h1 { border: none; border-width: 0 0 1px; margin: 0 0 1em; }
aside h1 { border-color: #999; border-bottom-style: solid; }

/* javascript */

.add, .cut
{
	border-width: 1px;
	display: block;
	font-size: .8rem;
	padding: 0.25em 0.5em;	
	float: left;
	text-align: center;
	width: 0.6em;
}

.add, .cut
{
	background: #9AF;
	box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	background-image: -moz-linear-gradient(#00ADEE 5%, #0078A5 100%);
	background-image: -webkit-linear-gradient(#00ADEE 5%, #0078A5 100%);
	border-radius: 0.5em;
	border-color: #0076A3;
	color: #FFF;
	cursor: pointer;
	font-weight: bold;
	text-shadow: 0 -1px 2px rgba(0,0,0,0.333);
}

.add { margin: -2.5em 0 0; }

.add:hover { background: #00ADEE; }

.cut { opacity: 0; position: absolute; top: 0; left: -1.5em; }
.cut { -webkit-transition: opacity 100ms ease-in; }

tr:hover .cut { opacity: 1; }

@media print {
	* { -webkit-print-color-adjust: exact; }
	html { background: none; padding: 0; }
	body { box-shadow: none; margin: 0; }
	span:empty { display: none; }
	.add, .cut { display: none; }
}

@page { margin: 0; }
</style>



	</head>
	<body>
		<header>
			<h1>Prescription Letter</h1>
			<address>
				<p>DoctoApp</p>
				<p>Industry House</p>
				<p>Indore, Madhya Pradesh, 485001</p>
				<p>076722 227750</p>
			</address>
			<span><img alt="logo" src="images/DocTrans.png"></span>
		</header>
							<%
								HibernateTemplate.setConfiguration();
								prescripton pres = (prescripton)session.getAttribute("pres");
								
          						int aid  = pres.getAid();
          						Object o = HibernateTemplate.findOperation(appointment.class, aid);
          						appointment a = (appointment) o ;
          						
          						Object o1 = HibernateTemplate.findOperation(patient.class, a.getPid());
          						patient p = (patient) o1 ;
          						
          						Object o2 = HibernateTemplate.findOperation(doctor.class, a.getDid());
          						doctor d = (doctor) o2 ;
          						
          						Query q = HibernateTemplate.select("select pr.prid from prescripton pr where pr.aid = :x and pr.medcn = :y and pr.date_time = :z");
          						q.setParameter("x", aid);
          						q.setParameter("y", pres.getMedcn());
          						q.setParameter("z", pres.getDate_time());
          						
          						List l = q.list();
          						Iterator it = l.iterator();
          						int prid = 0;
          						while (it.hasNext())
          						{
          							prid = (int)it.next();
          						}
          					%>
		<article>
			<h1>Doctor</h1>
			<address>
				<p><%="Dr. " + d.getDocname() %></p>
			</address>
			<table class="meta">
				<tr>
				
					<th><span>Prescription Id</span></th>
					<td><span><%=prid %></span></td>
				</tr>
				<tr>
					<th><span>Appointment Id</span></th>
					<td><span><%=aid %></span></td>
				</tr>
				<tr>
					<th>Patient Name</th>
					<td><%=p.getPname().toString().toUpperCase() %></td>
				</tr>
				<tr>
					<th>Age</th>
					<td><%=p.getAge() %></td>
				</tr>
				<tr>
					<th>Gender</th>
					<td><%=p.getSex() %></td>
				</tr>
				<tr>
					<th>Taken Date</th>
					<td><%=a.getTakendate() %></td>
				</tr>
			</table>
			
			<table class="inventory">
				<thead>
					<tr>
						<th>Medcine</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<textarea cols="110" rows="20" style="background: #FFF; resize: none;" readonly="readonly">
							<%=pres.getMedcn() %>
						</textarea>
						</td>
					</tr>
				</tbody>
			</table> 
		</article>
		<aside>
			<h1>Additional Notes</h1>
			<div>
				<p>*Please check the medicine after Purchase*</p>
			</div>
		</aside>
		<p><button title="Check and Print" id= "btn" class="btn btn-success"
				 onclick="myFunction()">
				Print</button>
		</p>
		
		<script>
			function myFunction() {
				//document.getElementById("btn").style.visibility = 'hidden';
				window.print();
				window.location = "appointments.aks";
			}
		</script>		
	 
	</body>
</html>