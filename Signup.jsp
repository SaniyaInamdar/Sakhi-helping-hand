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
	String username=request.getParameter("username");
	String address=request.getParameter("address");
	String email=request.getParameter("email");
    String phone=request.getParameter("phone");
	String password=request.getParameter("password");
  int uid=0;
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select max(userid) from tbl_user";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			  uid=rs.getInt(1);
		   }
		   uid++;
		   sql="insert into tbl_user values("+uid+",'"+username+"','"+address+"','"+email+"','"+phone+"','"+password+"')";
		   stmt.executeUpdate(sql);
		   out.println("Registered Successful");
		   response.sendRedirect("Login.html");
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