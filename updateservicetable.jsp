<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings - Sakhee</title>
    <link rel="icon" href="img/favicon2.png">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
      body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: url('img/background.jpg') no-repeat center center fixed; /* Replace with your image path */
        background-size: cover;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    

      
 header {
            background-color: #467aaf;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 20px;
            color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        header .logo {
            display: flex;
            align-items: center;
        }
        
        header .logo img {
            height: 50px;
            margin-right: 10px;
        }
        
        header h1 {
            font-size: 24px;
            margin: 0;
        }
        
        header div {
            display: flex;
            align-items: center;
        }
        
        header .change-password,
        header .logout {
            margin-left: 10px;
        }
        
        header .logout a,
        header .change-password a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border: 1px solid white;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            margin-left: 10px;
        }
        
        header .logout a:hover,
        header .change-password a:hover {
            background-color: white;
            color: #467aaf;
		}

        .content {
            padding: 40px 20px;
        }

        .content h2 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 30px;
            color: #fcf9f9;
        }

        table {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        th, td {
            text-align: left;
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #467aaf;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .status {
            font-weight: bold;
        }

        .status.pending {
            color: #ffa500;
        }

        .status.completed {
            color: #28a745;
        }

        .status.in-progress {
            color: #17a2b8;
        }

        .feedback-btn {
            display: inline-block;
            color: #467aaf;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 12px;
            border: 1px solid #467aaf;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            cursor: pointer;
        }

        .feedback-btn:hover {
            background-color: #467aaf;
            color: white;
        }

        .feedback-submitted {
            color: gray;
            font-style: italic;
            pointer-events: none;
        }

        .download-receipt-btn {
            display: inline-block;
            color: #467aaf;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 12px;
            border: 1px solid #467aaf;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            cursor: pointer;
        }

        .download-receipt-btn:hover {
            background-color: #467aaf;
            color: white;
        }

        footer {
          background-color: #467aaf;
          color: white;
          text-align: center;
          padding: 15px;
          font-size: 14px;
          margin-top: auto;
      }
        .feedback-form {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            width: 90%;
            z-index: 1000;
        }

        .feedback-form h3 {
            margin-bottom: 15px;
            color: #333;
        }

        .feedback-form textarea {
            width: 100%;
            height: 100px;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: 'Poppins', sans-serif;
        }

        .feedback-form .stars {
            margin-bottom: 15px;
        }

        .feedback-form .stars i {
            font-size: 24px;
            color: #ddd;
            cursor: pointer;
            transition: color 0.3s;
        }

        .feedback-form .stars i:hover,
        .feedback-form .stars i.selected {
            color: #ffc107;
        }

        .feedback-form button {
            background-color: #467aaf;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .feedback-form button:hover {
            background-color: #365d8b;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .success-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            z-index: 1001;
        }

        .success-popup p {
            margin: 0 0 15px;
            color: #333;
        }

        .success-popup button {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        body {
          margin: 0;
          font-family: 'Poppins', sans-serif;
          background-color: #f9f9f9;
          display: flex;
          flex-direction: column;
          min-height: 100vh;
      }
      
      .content {
          padding: 40px 20px;
          flex: 1;
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
    <script>
        function openFeedbackForm(button) {
            document.querySelector('.overlay').style.display = 'block';
            document.querySelector('.feedback-form').style.display = 'block';
            document.getElementById('bookingId').textContent = button.dataset.bookingId;
        }

        function submitFeedback() {
            document.querySelector('.feedback-form').style.display = 'none';
            document.querySelector('.overlay').style.display = 'none';
            document.querySelector('.success-popup').style.display = 'block';
        }

        function closeSuccessPopup() {
            document.querySelector('.success-popup').style.display = 'none';
        }

        function selectStar(star) {
            const stars = document.querySelectorAll('.stars i');
            stars.forEach((s, index) => {
                s.classList.toggle('selected', index <= star);
            });
        }

        function downloadReceipt(bookingId) {
            // For demo purposes, create a simple text content for the receipt
            const receiptContent = `
                Receipt for Booking ID: ${bookingId}
                Service: House Cleaning
                Date: 15 Jan 2025
                Time: 10:00 AM
                Status: Completed
                Amount: $50
            `;

            // Create a Blob object for the receipt content
            const blob = new Blob([receiptContent], { type: 'text/plain' });
            const link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = `receipt_${bookingId}.txt`;
            link.click();
        }
    </script>
</head>
<body>
<header>
	
         	<%
				
			   
			   String username=(String)session.getAttribute("username");
			   String uid=(String)session.getAttribute("uid");
			   session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
			
			
			%>
        <div class="logo">
            <img src="img/LogoDash.png" alt="Sakhee Logo">
			   <h1><% out.print(username+""+uid); %></h1>
        </div>
               <div>
			    <div class="change-password">
                <a href="admindashboard.jsp">Home</a>
            </div>
           
            <div class="logout">
                <a href="Login.html">Logout</a>
            </div>
        </div>
  
			</header>
 <div class="logo">
       
 	
  <%!
     Connection con = null;
     Statement stmt = null;
     ResultSet rs = null;
     String url = "jdbc:mysql://localhost:3306/sakhee_database?useSSL=false&allowPublicKeyRetrieval=true";
     String user = "root";
     String pass = "root";
	 String sql;
	 int state=1;
  %>
  <%
  
	String serviceid=(String)session.getAttribute("serviceid");
	String servicetype=request.getParameter("servicetype");
	String servicenam=request.getParameter("servicenam");
	String servicedecription=request.getParameter("servicedecription");	
	String servicerule=request.getParameter("servicerule");
	String serviceduration=request.getParameter("serviceduration");
	String serviceamount=request.getParameter("serviceamount");
	
	
 
     try {
		 
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        
          // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="update tbl_service set service_type='"+servicetype+"',service_name='"+servicenam+"',service_description='"+servicedecription+"',service_rule='"+servicerule+"',service_duration='"+serviceduration+"',service_amoount='"+serviceamount+"' where srid="+Integer.parseInt(serviceid.trim())+"";
           stmt.executeUpdate(sql);
		     out.println("Successfully updated " + "MySQL server using TCP/IP..." + "<br>");
			// response.sendRedirect("viewprofile.jsp");
     } 
     catch (Exception e) { // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
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
  %>
  
 
  
  

   
        <h2>Service</h2>
        <table>
            <thead>
                <tr>
                    <th>Service Id</th>                    
                    <th>Type</th>
                    <th>Name</th>
					<th>Title</th>
                    <th>Description</th>
                    <th>Rule</th>
                    <th>Duration</th>
					<th>Amount</th>
                </tr>
            </thead>
            <tbody>
			 <%
	
	int bookid=0;
	String d="",service="",amount="",title="",rule="", Duration="", Description="";

   try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
          // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   sql="select * from tbl_service where srid="+Integer.parseInt(serviceid.trim())+"";
		   rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			 bookid=rs.getInt(1);  
			 d=rs.getString(2);
			 service=rs.getString(3);
			 title=rs.getString(4);
			 Description=rs.getString(5);
		rule=rs.getString(6);
		Duration=rs.getString(7);
		amount=rs.getString(8);
  %>
                <tr>
                    <td><%   out.print(bookid); %></td>
                    
                    <td><%   out.print(d); %></td>
                  <td><%   out.print(service); %></td>
				  <td><%   out.print(title); %></td>
				  <td><%   out.print(Description); %></td>
                     <td><%   out.print(rule); %></td>
				  <td><%   out.print(Duration); %></td>
				  <td><%   out.print(amount); %></td>
				  
                </tr>
               <%
			      }
		  
		   
	 }
     } 
     catch (Exception e) {
          //out.println("Exception: " + e.getMessage());
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
	 %>
  
</table>
</body>
</html>