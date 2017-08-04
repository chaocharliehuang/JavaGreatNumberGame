<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Great Number Game</title>
<style>
	body {
		text-align: center;
	}
	
	.message {
		text-align: center;
		color: white;
		padding: 20px;
		border: 1px solid black;
		margin: 0 auto 20px;
		width: 30%;
	}
	
	.right {
		background-color: green;
	}
	
	.wrong {
		background-color: red;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h1>Welcome to the Great Number Game!</h1>
	<p>I am thinking of a number between 1 and 10.</p>
	<p>Take a guess!</p>
	
	<% if (session.getAttribute("guess") != null) { %>
		<% int guess = (int) session.getAttribute("guess"); %>
		<% int randomNumber = (int) session.getAttribute("randomNumber"); %>
		<% if (guess > randomNumber) { %>
			<div class="message wrong">Too high!</div>
		<% } else if (guess < randomNumber) { %>
			<div class="message wrong">Too low!</div>
		<% } else { %>
			<div class="message right">
				<%= guess %> was the number!
				<br><br>
				<form action="/GreatNumberGame/GreatNumberGame" method="POST">
					<input type="submit" value="Play again!">
				</form>
			</div>
		<% } %>
	<% } %>
	
	<form action="/GreatNumberGame/GreatNumberGame" method="POST" id="form_guess">
		<input type="text" name="guess">
		<br><br>
		<input type="submit" value="Submit">
	</form>
</body>
</html>