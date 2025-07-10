	<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard - Sakhee</title>
    <link rel="icon" href="img/favicon2.png">
     <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('img/background.jpg') no-repeat center center fixed; /* Replace with your image path */
            background-size: cover;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            color: white;
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
            text-align: center;
            padding: 40px 20px;
            flex-grow: 1; /* Ensures content section grows to push footer down */
        }
        
        .content h2 {
            font-size: 32px;
            margin-bottom: 30px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);
        }
        
        .cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Space between cards */
            justify-content: center;
            padding: 20px;
        }
        
        .card {
            background: rgba(255, 255, 255, 0.3); /* Increased opacity */
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5); /* Stronger shadow for contrast */
            padding: 20px;
            text-align: center;
            width: 300px;
            height: 300px;
            transition: transform 0.3s ease-in-out, background 0.3s ease-in-out;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            color: #e3e5e7;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);
        }
        
        .card i {
            font-size: 60px;
            margin-bottom: 15px;
            color: #467aaf; /* Icon color changed to blue */
        }
        
        .card h3 {
            font-size: 24px;
            margin: 10px 0;
        }
        
        .card p {
            font-size: 16px;
        }
        
        .card a {
            margin-top: 10px;
            text-decoration: none;
            color: rgb(244, 243, 247);
            font-weight: bold;
            padding: 10px 20px;
            border: 1px solid white;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        
        .card a:hover {
            background-color: white;
            color: #467aaf;
        }
        
        .card:hover {
            transform: scale(1.05);
            background: rgba(255, 255, 255, 0.4); /* Increased opacity on hover */
        }
        
        /* Footer */
        footer {
            background-color: #467aaf;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
        }
        
        
    </style>
</head>
<body>
<form name="update" action="updateProfile.jsp">
  <!-- Header -->
    <header>
        <div class="logo">
            <img src="img/LogoDash.png" alt="Sakhee Logo">
			<%
				
			   
			   String username=(String)session.getAttribute("username");
			   String uid=(String)session.getAttribute("uid");
			   session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
			
			
			%>
            <h1><% out.print(username); %></h1>
        </div>
        <div>
		 <div class="change-password">
                <a href="employeedashboard.jsp">Home</a>
            </div>
          <div class="logout">
                <a href="changepassword.jsp">Change Password</a>
            </div>
            <div class="logout">
                <a href="EmployeeLogin.html">Logout</a>
            </div>
        </div>
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
  %>
<%  
try {
		 
		 
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
          // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select * from tbl_employee where eid="+uid+"";
           rs=stmt.executeQuery(sql);
		  while(rs.next())
		  {
%>
			 
			  
			  
		 
<center>
<br><br><br>
<table border=1>
<tr><td>Employee Name</td><td><input type="text" id="employeeName" name="employeeName" value="<% out.println(rs.getString(2)); %>"></td></tr>
<tr><td>Employee Education</td><td><input type="text" id="Empeducation" name="employeeEdu" value="<% out.println(rs.getString(3)); %>"></td></tr> 
<tr><td>Employee Skill</td><td><input type="text" id="employeeSkill" name="employeeSkill" value="<%  out.println(rs.getString(4)); %>"></td></tr>
<tr><td>Employee Experience</td><td><input type="text" id="employeeSkill" name="Experience" value="<% out.println(rs.getString(5)); %>"></td></tr>
 <tr><td>Employee Contact</td><td><input type="text" id="employeeSkill" name="Contact" value="<% out.println(rs.getString(6)); %>"></td></tr>
  <tr><td>Employee Email</td><td><input type="text" id="employeeSkill" name="Email" value="<%  out.println(rs.getString(7)); %>"></td></tr>
            </table>    
<%



 }
		 
		  
		  
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
 %>
               
                <tr><td>   <input type="Submit" value="Update">
				  <tr><td> <input type="reset" value="Clear">