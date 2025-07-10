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
	<form name="frmshow" action="assignservices.jsp" method="post">
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
        <h2>Select  Bookings Id</h2>
        <table>
            <thead>
                <tr>
                    <td>Booking ID</td>                    
                    <td><Select name="bookid">
					<option>Select</option>
               
			 <%
	
	int bookid=0;
	String d="",service="",amount="",status="",action="";

   try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
          // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   sql="select * from tbl_booking where bookstatus='Pending'";
		   rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			 bookid=rs.getInt(1);  
			
		
  %>
               
                    <option><%   out.print(bookid); %></option>
                    
                    
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
	 //session.setAttribute("bookid",String.valueOf(bookid));
	 %>
	 </select></td></tr>
	 <tr><td colspan=2><input type="submit" value="Show">
	 
            </tbody>
        </table>
    </div>
</form>
<form name="frm" action="updatebooking.jsp" method="post">
<br><br><br>
<table border=1>
<%  
String bdate="",custid="",cust_email="",sername="",custadd="",custmobile="";
String id=request.getParameter("bookid");
int srid=0;
 //out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>"+id);
try {
		 
		 
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           stmt = con.createStatement();
		    sql="select tbl_booking.book_id,tbl_user.userid,tbl_user.username,tbl_booking.bookdate,tbl_booking.sername,tbl_booking.amount,tbl_booking.bookstatus,tbl_user.user_address,tbl_user.user_mobile from tbl_booking,tbl_user where tbl_booking.cid=tbl_user.userid and tbl_booking.book_id="+Integer.parseInt(id.trim())+"";
			// out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>"+sql);
           rs=stmt.executeQuery(sql);
		  while(rs.next())
		  {
			 
%>
			 
			  
			  
		 

<tr><td>Bookid</td><td><input type="text" id="employeeName" name="bookid" value="<% out.println(rs.getString(1)); %>"></td></tr>
<tr><td>User Id</td><td><input type="text" id="employeeName" name="servicetype" value="<% out.println(rs.getString(2)); %>"></td></tr>
<tr><td>User Name</td><td><input type="text" id="employeeName" name="servicetype" value="<% out.println(rs.getString(3)); %>"></td></tr>

<tr><td>Book Date</td><td><input type="text" id="employeeSkill" name="servicerule" value="<% out.println(rs.getString(4)); %>"></td></tr>
<% 
sername=rs.getString(5);
 
%>
<tr><td>Service Name</td><td><input type="text" id="employeeName" name="servicetype" value="<% out.println(sername); %>"></td></tr>
  <tr><td>Booking Amount</td><td><input type="text" id="employeeSkill" name="serviceamount" value="<%  out.println(rs.getString(6)); %>"></td></tr>
    <tr><td>Booking Status</td><td><input type="text" id="employeeSkill" name="serviceamount" value="<%  out.println(rs.getString(7)); %>"></td></tr>
<tr><td>User Adress</td><td><input type="text" id="Empeducation" name="servicenam" value="<% out.println(rs.getString(8)); %>"></td></tr> 
<tr><td>User Mobile</td><td><input type="text" id="employeeSkill" name="servicedecription" value="<%  out.println(rs.getString(9)); %>"></td></tr>


              
<%



 }
		 
		  
		  
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
	 //out.println(sername);
	 
	
 %>
 <tr><td>Select employee No</td><td><select name="empno"><option>Select Employee No</option>
 <%  
 String ename="";
 out.println(sername);
try {
		 
		 
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
		 
	     stmt = con.createStatement();
		   sql="select * from tbl_employee where emp_skill='"+sername+"'";
		    out.println(sql);
		     rs=stmt.executeQuery(sql);
		  while(rs.next())
		  {
			
%>
<option><% out.println(rs.getString(1)); %></option> 
<%



 }
		 
		  
		  
	 
		 
     } 
     catch (Exception e) {
        //  out.println("Exception: " + e.getMessage());
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
 </select>
 
               
                <tr><td>   <input type="Submit" value="Update"></td>
				  <td> <input type="reset" value="Clear"></td>
				   </table> 
				   </form>
    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Sakhee Inc. All rights reserved.</p>
    </footer>
</body>
</html>
