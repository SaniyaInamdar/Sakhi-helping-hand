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
	
int serid=0;
   
 
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select max(service_id) from tbl_service";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			  serid=rs.getInt(1);
		   }
		   serid++;
		   
		  } 
	 }
     catch (Exception e) {
          out.println("Exception: " + e.getMessage());
     } 
	%>
  <%
     String sertype=request.getParameter("servicetype");
	String serviceName=request.getParameter("serviceName");
	String serviceDescription=request.getParameter("serviceDescription");
	String servicePrice=request.getParameter("servicePrice");
	String serviceStatus=request.getParameter("serviceStatus");

   

     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   
		   
		   sql="insert into tbl_service values("+serid+",'"+sertype+"','"+serviceName+"','"+serviceDescription+"',"+Integer.parseInt(servicePrice)+",'"+serviceStatus+"')";
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