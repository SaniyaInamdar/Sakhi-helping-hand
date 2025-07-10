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
	String username=request.getParameter("empname");
	
	String password=request.getParameter("emppassword");
	String role=request.getParameter("role");
	
 String uid=null;
     try {
		   if(role.equals("Admin"))
		 {
				if(username.equals("admin") && password.equals("admin"))
				{
					response.sendRedirect("admindashboard.jsp");
				}
				else
				{
				response.sendRedirect("invalid.jsp");
			 
				}
		 }
		 else if(role.equals("Employee"))
		 {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           
           stmt = con.createStatement();
		    sql="select emp_email,emp_password,eid from tbl_employee";
           rs=stmt.executeQuery(sql);
		  while(rs.next())
		  {
			//  out.println("Successfully connected to " + username + "<br>"+role);
			  if(username.equals(rs.getString(1)) && password.equals(rs.getString(2)))
			  {
				  out.println("Successfully connected to " + username + "<br>"+role);
				  uid=rs.getString(3);
				  state=1;
				  break;
			  }
			  else
				  state=0;
			  
			  
		  }
		  if(state==1)
		  {
			  out.println("Successfully connected to " + username + "<br>"+role);
			  response.sendRedirect("employeedashboard.jsp");
			  session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
		  }
		 
		  else
		  {
			// response.sendRedirect("EmployeeLogin.html");
			  
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