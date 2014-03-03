<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="app.*" %>
<%@ page import="controllers.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<link rel="stylesheet" type="text/css" href="./resources/css/home.css?v=2"/>
	<title>Welcome to Quizz!</title>
</head>
<body>


<div id="wrap">
	
<!--HEADER BAR-->
	<div id="header">
		<div id="header-title">QUIZZ</div>
		
		<%	String username = (String)session.getAttribute("username");
		 	if (username == null || username.isEmpty()) { %>

				<div id="header-form">
					<form action="UserController" method="get"> 
						username <input type="text" name="username" />&nbsp;
						password <input type="text" name="password" />
						<input type="submit" value="LOGIN" />
					</form>	
				</div>
				
		<% } else { %>
		
			<p> Welcome <%= session.getAttribute("username") %> </p>
		
		<% } %>
		
	</div>

<!--MAIN, LEFT SECTION-->
	<div id="main">
		<div class="largeHeader">Most Popular</div>
		<ul>
		
			<!--TODO: Auto-generate quiz items based on below template-->
			<li>
				<div class="quizWidget">
					<div class="imgDiv">
						<img src="crab.jpg" alt="crab.jpg" height="42" width="42"></img>
					</div>
					<div class="contentDiv">
						<a href="quiz.jsp">Trivia on crabs</a><br/>
						Created by <a href="#">Jikyu Choi</a>
					</div>
					<div class="dateDiv">
						February 4th, 2014
					</div>
				</div>
			</li>
		</ul>
		
		<div class="largeHeader">Recently Created</div>

	</div>

<!--RIGHT SECTION-->
	<div id="sidebar">
		<div id="announcements">
			<div id="announcements-header">LATEST ANNOUNCEMENTS</div>
			<div id="announcements-body">Welcome to Quizz! This home page should contain an announcement section, list of popular quizzes, etc.</div>
		</div>
	
		<div class="smallHeader">YOUR QUIZZES</div>
		<div class="smallHeader">YOUR FRIENDS</div>
		<div class="smallHeader">YOUR ACHIEVEMENTS</div>
	</div>
	
</div>


</body>
</html>