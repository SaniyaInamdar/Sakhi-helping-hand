<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Home Services - Sakhee</title>
    <link rel="icon" href="img/favicon2.png">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('img/homeservicebackground.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.312);
            pointer-events: none;
            z-index: -1;
        }

        header {
            background-color: #467aaf;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 10;
        }

        header .logo img {
            height: 40px;
            margin-right: 15px;
        }

      
        header h1 {
            font-size: 24px;
            margin: 0;
            flex-grow: 1;
        }

        header a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border: 1px solid white;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        header a:hover {
            background-color: white;
            color: #467aaf;
        }

        .content {
            padding: 40px 20px;
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .service-form {
            width: 600px; /* Restored form width */
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .service-form h2 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #010f1d;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-size: 16px;
            color: #333;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%; /* Ensures equal width */
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group textarea {
            resize: none;
        }

        .form-group button {
            width: 100%;
            background-color: #467aaf;
            color: white;
            padding: 10px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-group button:hover {
            background-color: #365d8b;
        }

        footer {
            background-color: #467aaf;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="img/logoDash.png" alt="Sakhee Logo">
        </div>
        <h1>Book Service - Home Services</h1>
        <a href="userhomepage.html">Back to Dashboard</a>
    </header>
   <%!
     Connection con = null;
     Statement stmt = null;
     ResultSet rs = null;
     String url = "jdbc:mysql://localhost:3306/sakhee_database?useSSL=false&allowPublicKeyRetrieval=true";
     String user = "root";
     String pass = "root";
	 String sql;
             %>
    <div class="content">
        <div class="service-form">
            <h2>Book Your Home Service</h2>
            <form action="BookDetails.jsp" method="GET">
                <div class="form-group">
                    <label for="service">Choose Service</label>
                    <select id="service" name="service" required>
                     
			 	<%
	
int sertyid=0;
   String servicename="";
 
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           //out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select * from tbl_service where service_Type='Home Services'";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			servicename=rs.getString(3);
		
	%>
                    <option name="servicetitle" value="<%= servicename %>"><i class="icofont icofont-ui-check"></i><% out.println(servicename); %></option>
                    
<%					
		  } 
	 }
	 }
     catch (Exception e) {
          out.println("Exception: " + e.getMessage());
     } 
	 %>
             
                    </select>
                </div>

                <div class="form-group">
                    <label for="date">Select Date</label>
                    <input type="date" id="date" name="date" required>
                </div>

                <div class="form-group">
                    <label for="time">Select Time</label>
                    <input type="time" id="time" name="time" required>
                </div>

                <div class="form-group">
                    <label for="location">Enter Duration</label>
                    <input type="text" id="location" name="duration" placeholder="Please Enter Duration (Enter NA IF Not Applicable)" required>
                </div>


                <div class="form-group">
                    <label for="day">How Many Days</label>
                    <input type="text" id="day" name="day" placeholder="How Many Days You Want (Enter NA for 1 day)" required>
                </div>

                
                <div class="form-group">
                    <label for="location">Enter Location</label>
                    <input type="text" id="location" name="location" placeholder="Enter your address" required>
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" placeholder="Enter your requirements" required rows="4"></textarea>
                </div>

           <!--     <div class="form-group">
                    <label for="payment">Payment Method</label>
                    <select id="payment" name="payment" required>
                        <option value="upi">UPI</option>
                        <option value="creditCard">Credit Card</option>
                        <option value="debitCard">Debit Card</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="total">Total Amount</label>
                    <input type="text" id="total" name="total" value="$50.00" readonly>
                </div> -->

                <div class="form-group">
                    <button type="submit">Continue</button>
                </div>
            </form>
        </div>
    </div>

    <footer>
        &copy; 2025 Sakhee. All rights reserved.
    </footer>
</body>
</html>
