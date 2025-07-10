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
  %>
  <%
	username=request.getParameter("username");
	address=request.getParameter("address");
	email=request.getParameter("email");
    phone=request.getParameter("phone");
	password=request.getParameter("password");
  $uid=0;
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
		   
		   sql="insert into tbl_user values"+uid+",'"+username+"','"+address+"','"+email+"','"+phone+"','"+passwotd+"')";
		   stmt.executeUpdate(sql);
		   System.out.println("Registered Successful");
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