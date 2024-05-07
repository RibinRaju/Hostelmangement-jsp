
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to Our Hostel</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: grey;
	margin: 0;
	padding: 0;
	background-image:
		url('./images/lovepik-mogan-mountain-hostel-picture_500360228.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

header {
	background-color: rgba(51, 51, 51, 0.7); /* Transparent black */
	color: #fff;
	padding: 20px;
	text-align: center;
}

.container {
	justify-content: center;
	width: 45%;
	margin: 50px auto;
	background-color: rgba(255, 255, 255, 0.7); /* Transparent white */
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.available-spaces {
	margin-bottom: 20px;
}

.available-spaces h2 {
	margin-top: 0;
}

.room-selection h2 {
	margin-top: 0;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="date"], input[type="email"], input[type="password"],input[type="readonly"],input[type="number"],
	select, button {
	width: 200%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-sizing: border-box;
	background-color: rgba(255, 255, 255, 0.7); /* Transparent white */
}

input[type="submit"] {
	background-color: grey;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 20px;
	width: 200px;
	height: 40px;
	margin-right: 45%;
}

input[type="submit"]:hover, input[type="button"]:hover {
	background-color: grey;
}

#link {
	color: black;
	text-decoration: none;
}

input[type="button"] {
	background-color: grey;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 20px;
	height: 40px;
	width: 200px;
	margin-right: 5%;
}

textarea{
width: 200%; /* Adjust width as needed */
padding: 10px;
margin-bottom: 10px;
border: 1px solid #ccc;
border-radius: 10px;
box-sizing: border-box;
background-color: rgba(255, 255, 255, 0.7); /* Transparent white */
}
</style>

</head>
<body>
<body>
	<header>
	<h1>Welcome to Our Hostel</h1>
	</header>
	<div class="container">
		<div class="available-spaces">
			<a href="#" onclick="goToRoomSelection()" id="link">
				<h2>
					<u>Check Availability</u>
				</h2>
			</a>
		</div>
		<%
			String selectedRoomId = request.getParameter("selectedRoomId");
		%>
		<div class="room-selection">
			<h2>Room Selection & Registration</h2>
			<form id="room-selection-form" action="residentialactivities.jsp"
				method="GET">
				<table>
					<tr>
						<td><label for="name">Room No:</label></td>
						<td><input type="text" id="name" name="RoomNumber"
							value="<%=selectedRoomId%>" readonly required></td>
					</tr>

					<tr>
						<td><label for="check-in-date">Check-in Date:</label></td>
						<td><input type="date" id="checkindate" name="check-in-date"
							required></td>
					</tr>

					<tr>
						<td><label for="check-out-date">Check-out Date:</label></td>
						<td><input type="date" id="checkoutdate"
							name="check-out-date" required></td>
					</tr>

					<tr>
						<td><label for="name">Name:</label></td>
						<td><input type="text" id="name" name="name" required></td>
					</tr>

					<tr>
						<td><label for="phone">Phone Number:</label></td>
						<td><input type="text" id="phone" name="phone" required></td>
					</tr>
					
					
					<tr>
						 <td><label for="Adress">Address:</label></td>
    					<td><textarea name="Address" rows="5" cols="25"></textarea></td>
					</tr>
					

					<tr>
						<td><label for="username">Username:</label></td>
						<td><input type="text" id="username" name="username" required></td>
					</tr>

					<tr>
						<td><label for="password">Password:</label></td>
						<td><input type="password" id="password" name="password"
							required></td>
					</tr>
					<tr>
						
						<td><label for="total rent">totalrent:</label></td>
						<td><input type="text" id="rentAmount" name="paidRent" readonly required></td>
					
					</tr>
					<tr>
						
						<td><label for="card details">CardDetails:</label></td>
						<td><input type="text" id="cardNumber" name="carddetails" autocomplete="off"  maxlength="19" required></td>
					
					</tr>

					<tr>
						<td><input type="button" value="Back" onclick="back()"></td>
						<td><input type="button" value="Calculate Rent" onclick="calculateRent()"></td>
						<td><input type="submit" value="pay"></td>
					</tr>

				</table>
			</form>

		</div>
	</div>

	<script>
	document.getElementById('cardNumber').addEventListener('input', function (e) {
	    var target = e.target;
	    var input = target.value.replace(/\D/g, '').substring(0, 16); // Remove non-digit characters and limit to 16 digits
	    var formatted = input.replace(/(\d{4})(?=\d)/g, '$1-'); // Insert hyphens every four digits
	    
	    target.value = formatted;
	});
		function calculateRent() {
			var checkinDate = document.getElementById("checkindate").value;
			var checkoutDate = document.getElementById("checkoutdate").value;
			var dailyRate = 350; // Assuming $350 per day

			var startDate = new Date(checkinDate);
			var endDate = new Date(checkoutDate);
			var duration = (endDate - startDate)/ (1000 * 60 * 60 * 24);

			var totalRent = duration * dailyRate;
			document.getElementById("rentAmount").value = totalRent.toFixed(2);
		}

		function goToRoomSelection() {
			window.location.href = 'availablespaces.jsp';
		}

		function back() {
			window.location.href = 'index.html';
		}
	</script>
</body>
</html>
