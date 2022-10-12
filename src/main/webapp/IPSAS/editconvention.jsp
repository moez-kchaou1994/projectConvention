<%@page import="java.util.List"%>
<%@page import="ipsas.model.Convention"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Moez Kchaou">

<title>Edit Convention</title>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/IPSAS/assets/images/gt_favicon.png">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/IPSAS/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/IPSAS/assets/css/font-awesome.min.css">
<style>




#footer {
    margin-top: 800px;
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/IPSAS/assets/css/bootstrap-theme.css"
	media="screen">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/IPSAS/assets/css/main.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/IPSAS/assets/js/html5shiv.js"></script>
	<script src="${pageContext.request.contextPath}/IPSAS/assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body class="home">
	<%
	Convention convention = (Convention) session.getAttribute("conventionTab");
	%>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom">
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<img
					src="${pageContext.request.contextPath}/IPSAS/assets/images/logo.png"
					alt="Ipsas">
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="about.jsp">About</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">More Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="sidebar-left.jsp">Left Sidebar</a></li>
							<li class="active"><a href="sidebar-right.jsp">Right
									Sidebar</a></li>
						</ul></li>
					<li><a href="contact.jsp">Contact</a></li>
					<li><a class="btn" href="${pageContext.request.contextPath}/Signout">Sign out</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>


	<!-- Header -->
	<header id="head">
		<div class="container">
			<div class="row">
				<h1 class="lead">Edit Convention :</h1>

				<br> <br>
				<p>
					<a class="btn btn-action btn-lg" href="index.jsp" role="button">Index</a>
					<a class="btn btn-default btn-lg" role="button">MORE INFO</a>
				</p>
				<br> <br> <br> <br>
			</div>
		</div>
	</header>
	<!-- /Header -->

	<h1 align="center">Edit Convention :</h1>
	<hr>
	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">Edit Convention</h3>
							<hr>
							
							
							<c:forEach items="${idconvention }" var="co">
							<form method="POST" action="${pageContext.request.contextPath}/">
							<input type="hidden" name="action" value="editconvention">
								<div class="top-margin">
									<input type="hidden" class="form-control" name="id_conv"
							value="${co.id_conv }">
									<label>Type<span class="text-danger">*</span></label>
									
									<select name="type" class="form-control">


							<option value="University"
								<c:if test="${co.type == 'University'}"> selected </c:if>>University</option>
							<option value="National Industrial"
								<c:if test="${co.type == 'National Industrial'}"> selected </c:if>>National
								Industrial</option>
							<option value="Industrial"
								<c:if test="${co.type == 'Industrial'}"> selected </c:if>>Industrial</option>
					</select>
    
								</div>
								<div class="top-margin">
								<label>Date Edition<span class="text-danger">*</span></label>
									<input type="date"  name="date_edition" class="form-control" value="${co.date_edition }">
									
								</div>
								<div class="top-margin">
									<label>Date Signature<span class="text-danger">*</span></label>
									<input type="date"  name="date_signature" class="form-control" value="${co.date_signature }">
								</div>

								<div class="top-margin">
									<label>Object</label>
									<input type="text" name="object"  class="form-control" value="${co.object }">
								</div>
								<div class="top-margin">
									<label>Start Date<span class="text-danger">*</span></label>
									<input type="date"  name="start_date" class="form-control" value="${co.start_date }">
								</div>
								<div class="top-margin">
									<label>Date Expiry<span class="text-danger">*</span></label>
									<input type="date" name="date_expiry" class="form-control" value="${co.date_expiry }" >
								</div>
								<div class="top-margin">
								<label>Particpants<span class="text-danger">*</span></label>
									<select name="participant" class="form-control" multiple>
							<c:forEach var="item" items="${listparticipants}">
								<option value="${item.id_participant}"	<c:if test="${co.participants.contains(item)}"> selected </c:if>>
									<c:out value="${item.participant}"/>
								</option>
							</c:forEach>
					</select>
								</div>
								<hr>

								<div class="row">
								<div class="col-lg-4 text-right">
										<a class="btn btn-success" href="${pageContext.request.contextPath}/IPSAS/index.jsp">Index</a>
									</div>
									<div class="col-lg-8 text-right">
										<button class="btn btn-action" type="submit">Edit convention</button>
									</div>
								</div>
							</form>
							</c:forEach>
						</div>
					</div>

				</div>
	
	<br>


	<footer id="footer" class="top-space">

		<div class="footer1">
			<div class="container">
				<div class="row">

					<div class="col-md-3 widget">
						<h3 class="widget-title">Contact</h3>
						<div class="widget-body">
							<p>
								+216-74 225 665<br> <a href="mailto:#">CONTACT@IPSAS-ENS.NET</a><br>
								<br> Road 5 August Saîd Aboubaker 3002 Sfax-Tunisia.
							</p>
						</div>
					</div>

					<div class="col-md-3 widget">
						<h3 class="widget-title">Follow me</h3>
						<div class="widget-body">
							<p class="follow-me-icons clearfix">
								<a><i class="fa fa-twitter fa-2"></i></a> <a><i
									class="fa fa-dribbble fa-2"></i></a> <a><i
									class="fa fa-github fa-2"></i></a> <a><i
									class="fa fa-facebook fa-2"></i></a>
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
						<h3 class="widget-title">COMPUTER ENGINEERING</h3>
						<div class="widget-body">
							<p>The engineer working in this field is therefore required
								either to overhaul IT infrastructures that no longer meet the
								standards of the organization, or to build them. He is also
								required to work on interface projects between the various IT
								systems of an organization, both from the point of view of the
								architecture and the network topology and the software solution.</p>


						</div>
					</div>

				</div>
				<!-- /row of widgets -->
			</div>
		</div>

		<div class="footer2">
			<div class="container">
				<div class="row">

					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="simplenav">

								<a href="about.jsp">About</a> | | <a href="contact.jsp">Contact</a>
								| <b><a href="signup.jsp">Sign up</a></b>
							</p>
						</div>
					</div>

					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="text-right">Copyright &copy; 2021</p>
						</div>
					</div>

				</div>
				<!-- /row of widgets -->
			</div>
		</div>
	</footer>




	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->

	<script
		src="${pageContext.request.contextPath}/IPSAS/assets/js/headroom.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/IPSAS/assets/js/jQuery.headroom.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/IPSAS/assets/js/template.js"></script>
</body>
</html>