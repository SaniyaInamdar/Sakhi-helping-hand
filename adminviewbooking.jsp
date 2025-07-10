<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin view Bookings- Sakhee</title>
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
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <img src="img/LogoDash.png" alt="Sakhee Logo">
            <%
                String username = (String) session.getAttribute("username");
                String uid = (String) session.getAttribute("uid");
                session.setAttribute("username", username);
                session.setAttribute("uid", uid);
            %>
            <h1><% out.print(username); %></h1>
        </div>
        <div>
		
            <div class="logout">
                <a href="admindashboard.jsp">Home</a>
            </div>
         
            <div class="logout">
                <a href="Login.html">Logout</a>
            </div>
        </div>
    </header>

    <!-- Content -->
    <div class="content">
       
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
  
  
  

    <div class="content">
        <h2>Pending Bookings</h2>
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>                    
                    <th>Date</th>
                    <th>Service Title</th>
					<th>Amount</th>
                    <th>Status</th>
                    
                 </tr>
            </thead>
            <tbody>
			 <%
	
	int bookid=0;
	String d="",service="",amount="",status="",action="";
out.print(uid);
   try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
          // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   sql="select * from tbl_booking";
		   rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			 bookid=rs.getInt(1);  
			 d=rs.getString(4);
			 service=rs.getString(6);
			 amount=rs.getString(7);
			 status=rs.getString(8);
		
  %>
                <tr>
                    <td><%   out.print(bookid); %></td>
                    
                    <td><%   out.print(d); %></td>
                  <td><%   out.print(service); %></td>
				  <td><%   out.print(amount); %></td>
				  <td><%   out.print(status); %></td>
                   
                     
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
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Sakhee Inc. All rights reserved.</p>
    </footer>
</body>
</html>
