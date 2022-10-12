<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="Moez Kchaou">
	
	<title>Contact message</title>

	<link rel="shortcut icon" href="${pageContext.request.contextPath}/IPSAS/assets/images/gt_favicon.png">
	
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/font-awesome.min.css">

	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/IPSAS/assets/css/main.css">
	<style>
	.alert {
  padding: 20px;
  background-color: red; 
  color: white;
  margin-bottom: 15px; 
}
.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}
	</style>
	<script>
// Get all elements with class="closebtn"
var close = document.getElementsByClassName("closebtn");
var i;

// Loop through all close buttons
for (i = 0; i < close.length; i++) {
  // When someone clicks on a close button
  close[i].onclick = function(){

    // Get the parent of <span class="closebtn"> (<div class="alert">)
    var div = this.parentElement;

    // Set the opacity of div to 0 (transparent)
    div.style.opacity = "0";

    // Hide the div after 600ms (the same amount of milliseconds it takes to fade out)
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
</script>

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
				<a class="navbar-brand" href="about.jsp"><img src="${pageContext.request.contextPath}/IPSAS/assets/images/logo.png" alt="Ipsas"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					
					<li><a href="about.jsp">About</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">More Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="active"><a href="sidebar-left.jsp">Left Sidebar</a></li>
							<li><a href="sidebar-right.jsp">Right Sidebar</a></li>
						</ul>
					</li>
					<li><a href="contact.jsp">Contact</a></li>
					<li><a class="btn" href="signin.jsp">SIGN IN / SIGN UP</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div> 
	<!-- /.navbar -->

	<header id="head" class="secondary"></header>

	<div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
  In this project we can add just 4 participants!
</div>
	<br><br><br><br><br><br>
	<p><a class="btn btn-action btn-lg" href="index.jsp" role="button">Index</a>
	
	<br><br><br><br><br>
	
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
	
</body>
</html>