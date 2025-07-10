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
<form name="update" action="userprofile.jsp" method="post">

    <div class="logo">
        <img src="img/LogoDash.png" alt="Sakhee Logo">
        
<%

				String username=(String)session.getAttribute("username");
			    String uid=(String)session.getAttribute("uid");
				session.setAttribute("username",username);
			   session.setAttribute("uid",uid);

%>
<h3><% out.println("User Id     " +uid+" Username   "+username);   %>
    </div>


   
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
		    sql="select user_pass from tbl_user where userid="+uid+" ";
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
			 sql="update tbl_user set user_pass='"+newpassword+"' where userid="+uid+" "; 
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