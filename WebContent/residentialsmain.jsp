<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Residentials</title>
<style>
header {
    background-color: rgba(51, 51, 51, 0.7); /* Transparent black */
    color: #fff;
    padding: 20px;
    text-align: center;
}
body { 
    background-color:grey;

    font-family: Arial, sans-serif;
    
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

section {
    margin-bottom: 30px;
}

h2 {
    margin-top: 0;
    color: #333;
}

ul {
    list-style-type: none;
    padding: 0;
}

li {
    margin-bottom: 10px;
}

a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

button {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
<header> <h1>Discover the Comfort of Wanderlust Haven's Residential Accommodations</h1></header>
<div class="container">
    <section>
        <h2>Pay Rent</h2>
        <p>Click the button below to pay your rent.</p>
        <button onclick="payRent()">Pay Rent</button>
    </section>

    <section>
        <h2>Register a Complaint</h2>
        <p>If you have any complaints, please fill out the form <a href="#">here</a>.</p>
    </section>

    <section>
        <h2>Essential Needs</h2>
        <p>View our food menu and other essential items <a href="#">here</a>.</p>
    </section>

    <section>
        <h2>User Profile Updation</h2>
        <p>Update your profile information <a href="#">here</a>.</p>
    </section>

    <section>
        <h2>Food Menu</h2>
        <p>Explore our delicious food menu <a href="#">here</a>.</p>
    </section>
</div>

<script>
function payRent() {
    // Implement logic to handle rent payment
    alert(
    		<html>
    		<head>
    		<body><form acion="payment.jsp" method="get">
    		card details:<input type="text" name="carddetais" maxlength="19"></form></body></html>);
    // window.location.href = "rent-payment.html"; // Redirect to rent payment page
}
</script>
</body>
</html>
