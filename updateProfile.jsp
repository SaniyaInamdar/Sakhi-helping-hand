<%@ page import="java.sql.*" %>
<html>
<body>

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
	String employeeName=request.getParameter("employeeName");
	String employeeEdu=request.getParameter("employeeEdu");
	String employeeSkill=request.getParameter("employeeSkill");	
	String Experience=request.getParameter("Experience");
	String Contact=request.getParameter("Contact");
	String Email=request.getParameter("Email");
	
	
 
     try {
		 
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        
          // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="update tbl_employee set education='"+employeeEdu+"',ename='"+employeeName+"',emp_skill='"+employeeSkill+"',mobile='"+Contact+"',emp_email='"+Email +"'  where eid="+Integer.parseInt(uid)+"";
           stmt.executeUpdate(sql);
		     out.println("Successfully updated " + "MySQL server using TCP/IP..." + "<br>");
			 response.sendRedirect("viewprofile.jsp");
     } 
     catch (Exception e) { // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
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