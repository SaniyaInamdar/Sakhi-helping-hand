<%@ page import="java.sql.*" %>
<html>
<body>

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
	String username=request.getParameter("username");
	
	String password=request.getParameter("password");
	
	
 String uid=null;
     try {
		 
		 
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
          out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select user_email,user_pass,userid from tbl_user";
           rs=stmt.executeQuery(sql);
		  while(rs.next())
		  { 
	 // out.println("Successfully connected to " + username + "<br>"+password);
	 //out.println("Successfully connected to " + rs.getString(1) + "<br>"+rs.getString(2));
			 if(username.equals(rs.getString(1)) && password.equals(rs.getString(2)))
			  {
				  out.println("Successfully connected to " + username + "<br>"+password);
	
				  uid=rs.getString(3);
				  state=1;
				  break;
			  }
			  else
				  state=0;
			  
			  
		  }
		  if(state==1)
		  {
			  response.sendRedirect("userprofile.jsp");
			  session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
		  }
		 
		  else
		  {
			//  response.sendRedirect("Login.html");
			  
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
</table>
</body>
</html>