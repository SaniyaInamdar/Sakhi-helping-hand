<%@ page import="java.sql.*" %>
<html>
<body>
<table border="1">
  <th>UserId</th><th>Name</th>
   <th>Address</th><th>Email</th>
    <th>Mobile</th>
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
				

			   String username=(String)session.getAttribute("username");
			   String uid=(String)session.getAttribute("uid");
			   session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
			
			
			%>
  <%
	String current_password=request.getParameter("current_password");
	
	String new_password=request.getParameter("new_password");
	String confirm_password=request.getParameter("confirm_password");
	
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select user_pass  from tbl_user  where userid="+Integer.parseInt(uid)+"";
           rs=stmt.executeQuery(sql);
		  while(rs.next())
		  {
			  if(current_password.equals(rs.getString(1)))
			  {
				 
				  state=1;
				  break;
			  }
			  else
				  state=0;
			  
			  
		  }
		  if(state==1)
		  {
			  if(new_password.equals(confirm_password))
			  {
			  sql="update tbl_user set user_pass='"+new_password+"' where userid="+Integer.parseInt(uid)+"";
			  stmt.executeUpdate(sql);
		      out.println("password changed");
			
			  session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
			    response.sendRedirect("userprofile.jsp");
			  }
			  else
			  {
				  out.println("passsword and confirm password does not match");
			  }
				  
		  }
		  else
			  response.sendRedirect("Invalidpassword.html");
		  
		  
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
</table>
</body>
</html>