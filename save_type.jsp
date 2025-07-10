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
     String serid=request.getParameter("serviceId");
	 String serviceName=request.getParameter("serviceName");
	 String serviceDescription=request.getParameter("serviceDescription");

   

     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   
		   
		   sql="insert into service_type values("+Integer.parseInt(serid)+",'"+serviceName+"','"+serviceDescription+"')";
		   stmt.executeUpdate(sql);
		 out.println("Registered Successful");
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