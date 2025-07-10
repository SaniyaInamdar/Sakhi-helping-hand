<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Sakhee</title>
    <link rel="icon" href="img/favicon2.png">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .payment-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
        }

        .payment-container h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #467aaf;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group select, .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #467aaf;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-group button:hover {
            background-color: #365d8b;
        }

        .qr-container {
            display: none;
            text-align: center;
            margin-top: 15px;
        }

        .qr-container img {
            max-width: 150px;
            margin: 10px auto;
            display: block;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
         	<%
				
			   
			   String username=(String)session.getAttribute("username");
			   String uid=(String)session.getAttribute("uid");
			   session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
			
			
			%>
			</header>
			<%!
     Connection con = null;
     Statement stmt = null;
     ResultSet rs = null;
     String url = "jdbc:mysql://localhost:3306/sakhee_database?useSSL=false&allowPublicKeyRetrieval=true";
     String user = "root";
     String pass = "root";
	 String sql;
	 int state=1;
	 java.util.Date d=new java.util.Date();
	 
  %>
  
      <%
String serviceid=request.getParameter("sid");
	String servicename="",amount="";
 //String servicename=(String)session.getAttribute("servicename");
	// String amount=(String)session.getAttribute("serviceamount");
	   int bookid=0;
	//out.println("service id"+servicename);
//int serid=Integer.parseInt(serviceid);
   try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
          //out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   sql="select max(book_id) from tbl_booking";
		   rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			 bookid=rs.getInt(1);  
		   }
		   bookid++;
		   //get service name
		   sql="select * from tbl_service where srid="+Integer.parseInt(serviceid.trim())+"";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
						
			servicename=rs.getString(4);
			amount=rs.getString(8);
		   }
%>	 
 
       
 <!-- Main Content -->
   <body>
    <div class="payment-container">
        <h2>Make Payment</h2>
        <form id="payment-form" action="savepayment.jsp" method="POST">
		<div class="form-group upi-input">
		
                <label for="upi-id">Date</label>
                <input type="text" id="upi-id" name="upi-id" value="<% out.println(String.valueOf(d)); %>">
            </div>
			<div class="form-group upi-input">
		
                <label for="upi-id">Customer Name</label>
                <input type="text" id="upi-id" name="upi-id" value="<% out.println(username); %>">
            </div>
            <div class="form-group">
                <label for="payment-method">Select Payment Method</label>
                <select id="payment-method" name="payment_method" required>
                    <option value="upi">UPI</option>
                    <option value="qr">QR Code</option>
                </select>
            </div>
            <div class="form-group upi-input">
                <label for="upi-id">Enter UPI ID</label>
                <input type="text" id="upi-id" name="upi-id" placeholder="e.g., yourname@upi">
            </div>
            <div class="qr-container">
                <p>Scan this QR code using Google Pay or PhonePe:</p>
                <img src="img/qrcode.png" alt="QR Code">
                <p><strong>UPI ID:</strong> yourname@upi</p>
            </div>
            <div class="form-group">
                <label for="amount">Amount</label>
                <input type="text" id="amount" name="amount" value="<% out.print(amount); %>" readonly>
            </div>
            <div class="form-group">
                <button type="submit">Pay Now</button>
            </div>
        </form>
    </div>
	
  
  <%
	
	
		   
		   //out.println("Registered Successful"+bookid);
		   sql="insert into  tbl_booking values("+bookid+","+Integer.parseInt(uid)+",'"+username+"','"+String.valueOf(d)+"','"+serviceid+"','"+servicename+"',"+Integer.parseInt(amount)+",'Pending')";
		   stmt.executeUpdate(sql);
		// out.println("Registered Successful");
	 }
     } 
     catch (Exception e) {
          out.println("Exception: " + e.getMessage());
     } 
     finally {
         try {
            if (con != null) {
                con.close();
            }
         } 
         catch (SQLException e) { }
		 
     }
	 session.setAttribute("bookid",String.valueOf(bookid));
	 session.setAttribute("servicename",servicename);
  %>
</table>
</body>
 <script>
        const paymentMethodSelect = document.getElementById('payment-method');
        const upiInput = document.querySelector('.upi-input');
        const qrContainer = document.querySelector('.qr-container');

        paymentMethodSelect.addEventListener('change', () => {
            if (paymentMethodSelect.value === 'upi') {
                upiInput.style.display = 'block';
                qrContainer.style.display = 'none';
            } else if (paymentMethodSelect.value === 'qr') {
                upiInput.style.display = 'none';
                qrContainer.style.display = 'block';
            }
        });
    </script>
</html>