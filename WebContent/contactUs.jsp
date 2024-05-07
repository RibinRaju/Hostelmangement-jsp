<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us</title>
<style>
header {
	background-color: rgba(51, 51, 51, 0.7); /* Transparent black */
	color: #fff;
	padding: 20px;
	text-align: center;
}

body {
	background-color: grey;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 20px auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	background-color: #f9f9f9;
}

h2 {
	text-align: center;
}

form {
	margin-top: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="email"], textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

textarea {
	height: 150px;
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<header>
		<h1>CONTACT US</h1>
	</header>
	<div class="container">

		<form action="contact_process.php" method="get">
			<label for="name">Your Name:</label> <input type="text" id="name"
				name="name" required> <label for="email">Your Email:</label>
			<input type="email" id="email" name="email" required> <label
				for="message">Message:</label>
			<textarea id="message" name="message" required></textarea>

			<input type="submit" value="Send Message">
		</form>
	</div>
</body>
</html>
