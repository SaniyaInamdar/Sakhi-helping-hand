<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Services - Sakhee</title>
    <link rel="icon" href="img/favicon2.png">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('img/servicebackground.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
        
            position: sticky;
            background-color: #467aaf;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 24px;
            margin: 0;
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
            background-color: rgba(255, 255, 255, 0);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .content h2 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 30px;
            color: #f9fafb;
        }

        .service-card {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .single-table {
            background-color: rgba(255, 255, 255, 0.247);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            padding: 20px;
            text-align: center;
        }

        .single-table:hover {
            transform: scale(1.05); /* Slight zoom effect */
            box-shadow: 6px 6px 15px rgba(76, 67, 193, 0.2), -6px -6px 15px rgba(107, 122, 198, 0.8);
        }

        .table-head {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .table-head .icon {
            font-size: 30px;
            margin-right: 10px;
        }

        .table-head h4 {
            font-size: 24px;
            color: #e5f0fa;
        }

        .table-list {
            list-style-type: none;
            padding: 0;
            margin: 20px 0;
        }

        .table-list li {
            margin: 10px 0;
            font-size: 16px;
            color: #99cbd2;
        }

        .table-list li i {
            color: #467aaf;
            margin-right: 10px;
        }

        .table-bottom {
            margin-top: 20px;
        }

        .table-bottom .btn {
            background-color: #467aaf;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .table-bottom .btn:hover {
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

        
    </style>
</head>
<body>
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
            <h1><% out.print(username+""+uid); %></h1>
        </div>
        <div>
		  <div class="change-password">
                <a href="userprofile.jsp">Home</a>
            </div>
            <div class="change-password">
                <a href="changepassword.jsp">Change Password</a>
            </div>
			
            <div class="logout">
                <a href="Login.html">Logout</a>
            </div>
        </div>
    </header>
    
    

    <div class="content">
        <h2>Choose Your Service</h2>

        <div class="service-card">
            <!-- Home Services Table -->
            <div class="single-table">
                <div class="table-head">
                    <div class="icon">
                        <i class="fa-solid fa-house-chimney"></i>
                    </div>
                    <h4 class="title">Home Services</h4>
                </div>
                <ul class="table-list">
				<%!
     Connection con = null;
     Statement stmt = null;
     ResultSet rs = null;
     String url = "jdbc:mysql://localhost:3306/sakhee_database?useSSL=false&allowPublicKeyRetrieval=true";
     String user = "root";
     String pass = "root";
	 String sql;
	 int sertyid=0;
   String servicename="";
             %>
			 	<%
	

 
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           //out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select * from tbl_service where service_type='Home Services'";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			servicename=rs.getString(3);
		
	%>
                    <li name="servicetitle" value="<%= servicename %>"><i class="icofont icofont-ui-check"></i><% out.println(servicename); %></li>
                    
<%					
		  } 
	 }
	 }
     catch (Exception e) {
          out.println("Exception: " + e.getMessage());
     } 
	 %>
                </ul>
                <div class="table-bottom">
                    <a class="btn" href="ShowServicesType.jsp">Book Now</a>
                </div>
            </div>

            <!-- Child & Elder Care Table -->
            <div class="single-table">
                <div class="table-head">
                    <div class="icon">
                        <i class="fa-solid fa-hand-holding-hand"></i>
                    </div>
                    <h4 class="title">Child & Elder Care</h4>
                </div>
                <ul class="table-list">
                 <%
	

 
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           //out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select * from tbl_service where service_type='Child Care'";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			servicename=rs.getString(3);
		
	%>
                    <li name="servicetitle" value="<%= servicename %>"><i class="icofont icofont-ui-check"></i><% out.println(servicename); %></li>
                    
<%					
		  } 
	 }
	 }
     catch (Exception e) {
          out.println("Exception: " + e.getMessage());
     } 
	 %>
                </ul>
                <div class="table-bottom">
                    <a class="btn" href="childeldercareservice.jsp">Book Now</a>
                </div>
            </div>

            <!-- Personal Care Table -->
            <div class="single-table">
                <div class="table-head">
                    <div class="icon">
                        <i class="fa-solid"></i>
                    </div>
                    <h4 class="title">Personal Care</h4>
                </div>
                <ul class="table-list">
                    <%
	

 
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           //out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select * from tbl_service where service_type='Personal Care'";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			servicename=rs.getString(3);
		
	%>
                    <li name="servicetitle" value="<%= servicename %>"><i class="icofont icofont-ui-check"></i><% out.println(servicename); %></li>
                    
<%					
		  } 
	 }
	 }
     catch (Exception e) {
          out.println("Exception: " + e.getMessage());
     } 
	 %>
                </ul>
                <div class="table-bottom">
                    <a class="btn" href="personalcareservice.jsp">Book Now</a>
                </div>
            </div>
        </div>
    </div>

    <footer>
        &copy; 2025 Sakhee. All rights reserved.
    </footer>
</body>
</html>
