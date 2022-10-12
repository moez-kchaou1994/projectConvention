<%@page import="ipsas.model.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="Moez Kchaou">
	
	<title>List Contacts</title>

	<link rel="shortcut icon" href="${pageContext.request.contextPath}/IPSAS/assets/images/gt_favicon.png">
	
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/font-awesome.min.css">

	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/main.css">
	<style>
	table {
  background: #012B39;
  border-radius: 0.25em;
  border-collapse: collapse;
  margin: 1em;
  width:95%;
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
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/IPSAS/assets/js/html5shiv.js"></script>
	<script src="${pageContext.request.contextPath}/IPSAS/assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>

	<!-- Fixed navbar -->
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
	<!-- /.navbar -->
	
	<header id="head" class="secondary"></header>
	
		 <h1 align="center">Lists of contacts</h1>
		 <hr>
	
		
	<table>
  <thead>
    <tr>
      <th>ID Contact
      <th>Name
      <th>Email
      <th>Phone
      <th>Message
      <th>
	  <th>Actions
  </thead>
   <c:forEach items="${listcontact}" var="contact">
  <tbody>
  
    <tr>
    <form method="POST" action="${pageContext.request.contextPath}/">
    <input type="hidden" name="action" value="editcontact">
      <td><input type="text" class="form-control"  name="id_contact" value="${contact.id_contact }" readonly> </td>               
      <td><input type="text" class="form-control"  name="name" value="${contact.name }"></td>
      <td><input type="text" class="form-control" name="email" value="${contact.email }"></td>
      <td><input type="text" class="form-control" name="phone" value="${contact.phone }"></td>
      <td><input type="text" class="form-control" name="message" value="${contact.message }"></td>
    <td>					
                  
           <button type="submit" class="btn btn-action btn-sm"> Edit </button> 
   					
   					</form> 
   					
       <td>             <form method="POST" action="${pageContext.request.contextPath}/">
       							<input type="hidden" name="action" value="deletecontact">
                               <button class="btn btn-action btn-sm" type="submit">Delete<input type="hidden" name="id_contact" value="${contact.id_contact }"></button>
   					   </form>  
 
  </tbody>
     </c:forEach>
  
</table>
<hr>









<br>
  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;

 
 <a class="btn btn-action btn-lg" href="index.jsp" role="button">Index</a>
	
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