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
	String bookid=request.getParameter("bookid");
	
	
 
     try {
		 
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        
          // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="update tbl_booking set bookstatus='Completed' where book_id="+Integer.parseInt(bookid.trim())+"";
           stmt.executeUpdate(sql);
		     out.println("Successfully updated " + "MySQL server using TCP/IP..." + "<br>");
			// response.sendRedirect("viewprofile.jsp");
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