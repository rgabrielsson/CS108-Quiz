<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="servlets.*" %>
<%@ page import="app.*" %>
<%@ page import="models.*" %>
<%@ page import="java.util.ArrayList" %>

<%
	App app = (App)session.getAttribute("app");
	User user = app.current_user;
	if (user == null || !user.isAdmin()){
		// Redirect to home page if user isn't an admin
		response.sendRedirect("/home.jsp");
	}
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title> Admin panel for <%= app.current_user.user_name %></title>
</head>

<body>
<!--HEADER BAR-->
	<%@ include file="header.jspf" %>

	<div id="content-users">
		<% ArrayList<User> users = User.getAllUsers(); %>
		<ol>
			<% for (User u : users) { %>
				<li> <%= u.user_name %> <%= u.date_created %> <a href="DeleteServlet?user=">DELETE</a></li>
			<% } %>
		</ol>
	</div>
	
	<div id="content-quizzes">
		<% ArrayList<Quiz> quizzes = Quiz.getAllQuizzes(); %>
		<ol>
			<% for (Quiz q : quizzes) { %>
				<li> <%= q.quiz_name %> <%= q.date_created %> <a href="EditQuizServlet?user=">EDIT</a></li>
			<% } %>
		</ol>
	</div>
	
	<div id="content-statistics">
		
	</div>
	
</body>
</html>