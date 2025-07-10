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
	 %>
	 <%
	

	String employeeName=request.getParameter("employeeName");	
	String education=request.getParameter("education");
	String employeeSkill=request.getParameter("employeeSkill");
	String employeeExperience=request.getParameter("employeeExperience");
	String employeeContact=request.getParameter("employeeContact");
	String employeeEmail=request.getParameter("employeeEmail");
	String employeePassword=request.getParameter("employeePassword");
int serid=0;
   

     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   
		    sql="select max(eid) from tbl_employee";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			 serid=rs.getInt(1);  
		   }
		   serid++;
			   
		   sql="insert into tbl_employee values("+serid+",'"+employeeName+"','"+education+"','"+employeeSkill+"','"+employeeExperience+"','"+employeeContact+"','"+employeeEmail+"','"+employeePassword+"')";
		   stmt.executeUpdate(sql);
		response.sendRedirect("EmployeeLogin.html");
		// out.println("Saved....");
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