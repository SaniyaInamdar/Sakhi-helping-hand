<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Success</title>
    <link rel="icon" href="img/favicon2.png">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
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

        .success-container {
            text-align: center;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
        }

        .success-container h2 {
            color: #28a745;
        }

        .success-container p {
            font-size: 18px;
            margin: 10px 0;
        }

        .receipt {
            text-align: left;
            background: #f9f9f9;
            padding: 15px;
            margin-top: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            color: #555;
        }

        .receipt p {
            margin: 5px 0;
        }

        .receipt .bold {
            font-weight: bold;
        }

        .success-container a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: white;
            background-color: #467aaf;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .success-container a:hover {
            background-color: #365d8b;
        }

        .download-btn {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background-color: #ff5722;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .download-btn:hover {
            background-color: #e64a19;
        }

        .footer {
            margin-top: 30px;
            color: #888;
            font-size: 14px;
        }

    </style>
</head>
<body>
  	<%
				
			   
			   String username=(String)session.getAttribute("username");
			   String uid=(String)session.getAttribute("uid");
			   session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
			
			
			%>
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
  
  String payment_method=request.getParameter("payment_method");
	//out.println("service id"+serviceid);
 String servicename=(String)session.getAttribute("servicename");
	 String amount=request.getParameter("amount");
	int payid=0;
	String bookid=(String)session.getAttribute("bookid");

   try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
          // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   sql="select max(payid) from tbl_payment";
		   rs=stmt.executeQuery(sql);
		    while(rs.next())
		   {
			 payid=rs.getInt(1);  
		   }
		   payid++;
  
  %>
  <div class="success-container">
        <h2>Payment Successful!</h2>
        

  
    
        <!-- Receipt Section -->
        <div class="receipt" id="receipt">
            <p><span class="bold">Transaction ID:</span><% out.print(payid); %></p>
			
			 
  
            <p><span class="bold">Date:</span> <% out.print(d); %></p>
			
            <p><span class="bold">Payment Method:</span> <% out.print(payment_method); %> </p>
            <p><span class="bold">Amount Paid:</span> <% out.print(amount); %> </p>
            <p><span class="bold">Service:</span> <% out.print(servicename); %> </p>
        </div>

<%
	
		  
		   sql="insert into  tbl_payment values("+payid+",'"+String.valueOf(d)+"',"+Integer.parseInt(uid)+",'"+username+"',"+ Integer.parseInt(bookid)+",'"+ payment_method +"',"+Integer.parseInt(amount)+",'"+servicename+"')";
		   stmt.executeUpdate(sql);
		 //out.println("Registered Successful");
	 }
     } 
     catch (Exception e) {
         // out.println("Exception: " + e.getMessage());
     } 
     finally {
         try {
            if (con != null) {
                con.close();
            }
         } 
         catch (SQLException e) { }
     }
	 %>
        <a href="userprofile.jsp">Return to Dashboard</a>

        <a href="#" class="download-btn" onclick="downloadReceipt()">Download Receipt</a>

        <div class="footer">
            <p>Thank you for using our services. If you have any queries, feel free to contact us.</p>
        </div>
    </div>

    <script>
        function downloadReceipt() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            // Add content to the PDF
            doc.setFont("Arial", "normal");
            doc.text("Payment Receipt", 14, 10);
            doc.text("Transaction ID: 1234567890", 14, 20);
            doc.text("Date: 16th January 2025", 14, 30);
            doc.text("Payment Method: Credit Card", 14, 40);
            doc.text("Amount Paid: ₹50.00", 14, 50);
            doc.text("Service: Home Cleaning", 14, 60);

            // Save the PDF
            doc.save("receipt.pdf");
        }
    </script>
</body>
</html>
