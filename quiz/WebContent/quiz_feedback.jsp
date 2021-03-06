<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="models.*" %>
<%@ page import="questions.*" %>
<%@ page import="app.*" %>
<%@ page import="java.util.HashMap" %>
    
<%
	HashMap<String, String> feedback = (HashMap<String, String>) request.getAttribute("feedback");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<!-- library -->
	<link rel="stylesheet" type="text/css" href="css/library/foundation.min.css">
	<link rel="stylesheet" type="text/css" href="css/library/normalize.css">
	<title>Feedback</title>
</head>
<body>
	<a href="home.jsp" style="font-size:24px">HOME</a>
	<ul>
	<% for (String key : feedback.keySet()) { %>
		<% if (!key.equals("score") && !key.equals("time")) { %>
		<li>		
			<%= feedback.get(key) %>
		</li>
		<% } %>
	<% } %>
	</ul>
	<h3>Total Score: <%= feedback.get("score") %></h3>
	<h3>Total Time: <%= feedback.get("time") %>s</h3>
	
</body>
</html>