<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="Moez Kchaou">
	
	<title>Find Conventions</title>

	<link rel="shortcut icon" href="${pageContext.request.contextPath}/IPSAS/assets/images/gt_favicon.png">
	
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/font-awesome.min.css">
	<style>
	.display-no{display:none;}
	#footer {
     margin-top: 1230px;}
	table {
  background: #012B39;
  border-radius: 0.25em;
  border-collapse: collapse;
  margin: 1em;
  width:99%;
}
th {
  border-bottom: 1px solid #364043;
  color: #E2B842;
  font-size: 0.85em;
  font-weight: 600;
  padding: 0.5em 1em;
  text-align: left;
}
td {
  color: #fff;
  font-weight: 400;
  padding: 0.65em 1em;
}

tbody tr {
  transition: background 0.25s ease;
}
tbody tr:hover {
  background: #014055;
}

	
	</style>
	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/main.css">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/IPSAS/assets/js/html5shiv.js"></script>
	<script src="${pageContext.request.contextPath}/IPSAS/assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body class="home">

	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<img src="${pageContext.request.contextPath}/IPSAS/assets/images/logo.png" alt="Ipsas">
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="about.jsp">About</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">More Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="sidebar-left.jsp">Left Sidebar</a></li>
							<li class="active"><a href="sidebar-right.jsp">Right Sidebar</a></li>
						</ul>
					</li>
					<li><a href="contact.jsp">Contact</a></li>
					<li><a class="btn" href="${pageContext.request.contextPath}/Signout">Sign out</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div> 
	

	<!-- Header -->
	<header id="head">
		<div class="container">
			<div class="row">
				<h1 class="lead">Find Conventions : </h1>
				
				<br><br>
				<p><a class="btn btn-action btn-lg" href="index.jsp" role="button">Index</a>  <a class="btn btn-default btn-lg" role="button">MORE INFO</a> </p>
			<br><br><br><br>
			</div>
		</div>
	</header>
	<!-- /Header -->
<h1 align="center">List Conventions :</h1>
	<hr>
	
	<table>
	
  <thead>
    <tr>
      
      <th>Type
      <th>Date Edition
      <th>Date Signature
      <th>Object
      <th>Start Date
      <th>Date Expiry
      <th>Participant
      <th>Action
      
	  
  </thead>
   <c:forEach items="${fconvention }" var="co">
  <tbody>
  
    <tr>
   	  
      
      <td><input type="text" class="form-control" name="type" value="${co.type }" readonly>
      <td><input type="text" class="form-control" name="date_edition" value="${co.date_edition }" readonly>
      <td><input type="text" class="form-control" name="date_signature" value="${co.date_signature }" readonly>
      <td><input type="text" class="form-control" name="object" value="${co.object }" readonly>
      <td><input type="text" class="form-control" name="start_date" value="${co.start_date }" readonly>
      <td><input type="text" class="form-control" name="date_expiry" value="${co.date_expiry }" readonly>
      <td><select name="participants" class="form-control" size="${co.participants.size()}">
				<c:forEach items="${co.participants}" var="p">
					<option value="${p.id_participant}">${p.participant}</option>
		      	</c:forEach>
      	</select>
      <td>					
            <form method="POST" action="${pageContext.request.contextPath}/">
								<input type="hidden" name="action" value="exportpdfconvention">
            
           <button type="submit" class="btn btn-action btn-sm"> Print
          	<input type="hidden" name="id_conv" value="${co.id_conv }">
           <input type="hidden" name="type" value="${co.type }">
           <input type="hidden" name="date_edition" value="${co.date_edition }">
            <input type="hidden" name="date_signature" value="${co.date_signature }">
            <input type="hidden" name="object" value="${co.object }">
            <input type="hidden" name="start_date" value="${co.start_date }">
            <input type="hidden" name="date_expiry" value="${co.date_expiry }">
           	
			
				<c:forEach items="${co.participants}" var="p">
				<select name="participants" class="display-no" >
				
				<option value="${p.participant}">${p.participant}</option>
					
		      	
      			</select>
   				</c:forEach>
					                 
      
            </button> 
      		</form>
      </tbody>
     </c:forEach>
  
</table>

<h1 align="center">Find Conventions :</h1>
	<hr>
	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							
								<form method="POST" action="${pageContext.request.contextPath}/">
								<input type="hidden" name="action" value="findconventionbytype">
								<div class="top-margin">
								
									<label>Type<span class="text-danger">*</span></label>
									
									<select name="type" class="form-control">
              							
              								<option value="University" selected="selected">University</option>
              								<option value="National Industrial">National Industrial</option>
              								<option value="Industrial">Industrial</option>
         									 </select>
    							
								</div>
								<hr>
								<div class="top-margin">
								<button class="btn btn-success" type="submit">Find Convention By Type</button>
									
								</div>
								</form>
								<form method="POST" action="${pageContext.request.contextPath}/">
								<input type="hidden" name="action" value="findconventionbydateedition">
								
								<div class="top-margin">
								<label>Date Edition<span class="text-danger">*</span></label>
									<input type="date"  name="date_edition" class="form-control">
									
								</div>
								<hr>
								<div class="top-margin">
								<button class="btn btn-success" type="submit">Find Convention By Date Edition</button>
									
								</div>
								</form>
								<form method="POST" action="${pageContext.request.contextPath}/">
								<input type="hidden" name="action" value="findconventionbydatesignature">
								
								<div class="top-margin">
									<label>Date Signature<span class="text-danger">*</span></label>
									<input type="date"  name="date_signature" class="form-control">
									<hr>
								<div class="top-margin">
								<button class="btn btn-success" type="submit">Find Convention By Date Signature</button>
									
								</div>
								</div>
								</form>
								<!-- <div class="top-margin">
									
								</div> -->
								<form method="POST" action="${pageContext.request.contextPath}/">
								<input type="hidden" name="action" value="findconventionbyobject">
								
								<div class="top-margin">
									<label>Object</label>
									<input type="text" name="object" placeholder="Search Object" class="form-control">
								<div class="top-margin">
								<button class="btn btn-success" type="submit">Find Convention By Object</button>
									
								</div>
								</div>
								</form>
								<form method="POST" action="${pageContext.request.contextPath}/">
								<input type="hidden" name="action" value="findconventionbystartdate">
								<div class="top-margin">
									<label>Start Date<span class="text-danger">*</span></label>
									<input type="date"  name="start_date" class="form-control">
								
									<hr>
								<div class="top-margin">
								<button class="btn btn-success" type="submit">Find Convention By Start Date</button>
									
								</div>
								</div>
								
								</form>
								<form method="POST" action="${pageContext.request.contextPath}/">
								<input type="hidden" name="action" value="findconventionbydateexpiry">
								<div class="top-margin">
									<label>Date Expiry<span class="text-danger">*</span></label>
									<input type="date" name="date_expiry" class="form-control">
									<hr>
								<div class="top-margin">
								<button class="btn btn-success" type="submit">Find Convention By Date Expiry</button>
									
								</div>
								</div>
								</form>
								<form method="POST" action="${pageContext.request.contextPath}/">
								<input type="hidden" name="action" value="findconventionbyparticipant">
								
								<div class="top-margin">
									<label>Participant<span class="text-danger">*</span></label>
									 <select name="participant" class="form-control" multiple>
							<c:forEach var="item" items="${listparticipants}">
								<option value="${item.id_participant}"	<c:if test="${co.participants.contains(item)}"> selected </c:if>>
									<c:out value="${item.participant}" />
								</option>
							</c:forEach>
					</select>
                    <hr>
								<div class="top-margin">
								<button class="btn btn-success" type="submit">Find Convention By Participant</button>
									
								</div>
					</div>
					</form>
								

							
							
							</div>
							</div>
							</div>
							

	
	
	<footer id="footer" class="top-space">

		<div class="footer1">
			<div class="container">
				<div class="row">
					
					<div class="col-md-3 widget">
						<h3 class="widget-title">Contact</h3>
						<div class="widget-body">
							<p>+216-74 225 665<br>
								<a href="mailto:#">CONTACT@IPSAS-ENS.NET</a><br>
								<br>
								Road 5 August  Saîd Aboubaker 3002 Sfax-Tunisia.
							</p>	
						</div>
					</div>

					<div class="col-md-3 widget">
						<h3 class="widget-title">Follow me</h3>
						<div class="widget-body">
							<p class="follow-me-icons clearfix">
								<a><i class="fa fa-twitter fa-2"></i></a>
								<a><i class="fa fa-dribbble fa-2"></i></a>
								<a ><i class="fa fa-github fa-2"></i></a>
								<a><i class="fa fa-facebook fa-2"></i></a>
							</p>	
						</div>
					</div>

					<div class="col-md-3 widget">
						<h3 class="widget-title">ENGINEERING COURSES</h3>
						<div class="widget-body">
							<p>PETROLEUM ENGINEERING</p>
							<p>INDUSTRIAL ENGINEERING</p>
							<p>COMPUTER ENGINEERING</p>
							<p>CIVIL ENGINEERING</p>
							<p>ELECTROMMECHANICAL ENGINEERING</p>
						</div>
					</div>
					<div class="col-md-3 widget">
						<h3 class="widget-title">COMPUTER ENGINEERING </h3>
						<div class="widget-body">
							<p>The engineer working in this field is therefore required either to overhaul IT infrastructures that no longer meet the standards of the organization, or to build them. He is also required to work on interface projects between the various IT systems of an organization, both from the point of view of the architecture and the network topology and the software solution.</p>
							
							
						</div>
					</div>

				</div> <!-- /row of widgets -->
			</div>
		</div>

		<div class="footer2">
			<div class="container">
				<div class="row">
					
					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="simplenav">
								
								<a href="about.jsp">About</a> |
								 |
								<a href="contact.jsp">Contact</a> |
								<b><a href="signup.jsp">Sign up</a></b>
							</p>
						</div>
					</div>

					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="text-right">
								Copyright &copy; 2021 
							</p>
						</div>
					</div>

				</div> <!-- /row of widgets -->
			</div>
		</div>
	</footer>	




	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	
	<script src="${pageContext.request.contextPath}/IPSAS/assets/js/headroom.min.js"></script>
	<script src="${pageContext.request.contextPath}/IPSAS/assets/js/jQuery.headroom.min.js"></script>
	<script src="${pageContext.request.contextPath}/IPSAS/assets/js/template.js"></script>
</body>
</html>