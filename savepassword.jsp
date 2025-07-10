 <!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard - Sakhee</title>
    <link rel="icon" href="img/favicon2.png">
    
</head>
<body>
<form name="update" action="updateProfile.jsp">

    <div class="logo">
        <img src="img/LogoDash.png" alt="Sakhee Logo">
        <h1>Employee Dashboard</h1>
<%

				String username=(String)session.getAttribute("username");
			    String uid=(String)session.getAttribute("uid");
				session.setAttribute("username",username);
			   session.setAttribute("uid",uid);

%>
<h3><% out.println("Employee Id      " +uid+" Employee Email/Username   "+username);   %>
    </div>


   <ul>
	<li id="viewProfile"><a href="viewprofile.jsp"></i>View Profile</a></li>
     <li id="viewProfile"><a href="changepassword.jsp"></i>Change Password</a></li>
        <li id="viewAssignedTasks"><a href="viewAssignedTask.jsp"></i> View Assigned Services</a></li>
        <li id="payment"><a href="#"></i> Payment</a></li>
        <li id="availability"><a href="#"></i> Availability</a></li>
        <li id="complaints"><a href="#"></i> Complaints</a></li>
    </ul>
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
		 
		 
		String  oldpassword=request.getParameter("oldpassword");
		String  newpassword=request.getParameter("newpassword");
		String  confirmpassword=request.getParameter("confirmpassword");
		if(newpassword.equals(confirmpassword))
		{
			
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
          // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select emp_password from tbl_employee where eid="+uid+" ";
           rs=stmt.executeQuery(sql);
		  while(rs.next())
		  {
			  if((rs.getString(1)).equals(oldpassword))
			  {
				  state=1;
				  break;
			  }
			  else
				  state=0;
		  }
		  if(state==1)
		  {
			 sql="update tbl_employee set emp_password='"+newpassword+"' where eid="+uid+" "; 
				stmt.executeUpdate(sql); 
				out.println("passsword changed please logout and login again with new password");
		  }
		  else
		  {
			  out.println("Old password does not match");
		  }
		}
}
}catch(Exception e){
               out.println("error"+e);

	               }
%>

 
<center>

           
               <a href="EmployeeLogin.html">Logout</a>