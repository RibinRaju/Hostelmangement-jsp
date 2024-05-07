<%@ page import="com.mvc.doa.CategoryDao"%>
<%@ page import="com.mvc.bean.RoomBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Select Room</title>
<style>
header {
	background-color: rgba(51, 51, 51, 0.7); /* Transparent black */
	color: #fff;
	padding: 20px;
	text-align: center;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: grey;
}

.container {
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

form {
	text-align: center;
}

fieldset {
	border: none;
	margin: 0;
	padding: 0;
}

input[type="radio"] {
	margin-right: 10px;
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<header>
		<h1>Welcome to Our Hostel</h1>
	</header>
	<div class="container">
		<%
			try {
				List<RoomBean> freeRooms = CategoryDao.getFreeRooms();

				if (freeRooms.isEmpty()) {
		%>
		<p>No free rooms available.</p>
		<%
			} else {
		%>
		<h2>Select Room</h2>
		<form action="AddUser.jsp" method="post">
			<fieldset>
				<legend>Available Rooms:</legend>
				<%
					for (RoomBean roomBean : freeRooms) {
				%>
				<input type="radio" name="selectedRoomId"
					id="room<%=roomBean.getRoomId()%>"
					value="<%=roomBean.getRoomId()%>"> <label
					for="room<%=roomBean.getRoomId()%>">Room ID <%=roomBean.getRoomId()%></label><br>
				<%
					}
				%>
			</fieldset>
			<br> <input type="submit" value="Select Room">
		</form>
		<%
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		%>
	</div>
</body>
</html>
