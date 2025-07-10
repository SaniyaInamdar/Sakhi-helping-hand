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
	String role=request.getParameter("role");
	
 String uid=null;
     try {
		 
		 if(role.equals("Employee"))
		 {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select emp_email,emp_password,eid from tbl_employee";
           rs=stmt.executeQuery(sql);
		  while(rs.next())
		  {
			  if(username.equals(rs.getString(1)) && password.equals(rs.getString(2)))
			  {
				  uid=rs.getString(3);
				  state=1;
				  break;
			  }
			  else
				  state=0;
			  
			  
		  }
		  if(state==1)
		  {
			  response.sendRedirect("EmployeeProfile.jsp");
			  session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
		  }
		  else if(role.equals("Admin"))
		 {
			response.sendRedirect("admindashboard.jsp"); 
		 }
		  else
		  {
			  response.sendRedirect("Employee_Login.html");
			  
		  }
		  
		  
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