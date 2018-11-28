<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OASAES~Platform</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background: url("img/bg.png") no-repeat;
	background-size: 100%;
	font-family: serif;
	color: black;
}
</style>
</head>
<body>

	<img alt="header" src="img/hr.jpg" style="height: 100px;">
	<!-- <img alt="header" src="img/h2.png" style="height: 100%;"> -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <!-- <a
		class="navbar-brand" href="index.jsp">OASAES</a> -->

	<div class="collapse navbar-collapse" id="navbarColor02">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home

			</a></li>
			<li class="nav-item"><a class="nav-link" href="notice.jsp">Notice</a></li>
			<li class="nav-item"><a class="nav-link" href="schedule.jsp">Schedule</a></li>
			<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0" action="searchAssign.jsp" method="post">
			<input class="form-control mr-sm-2" placeholder="Search by Course" type="text" name="searchAssignByCourse">
			<!-- <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button> -->
		</form>
		<ul class="nav navbar-nav navbar-right">
			<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
		</ul>
	</div>
	</nav>