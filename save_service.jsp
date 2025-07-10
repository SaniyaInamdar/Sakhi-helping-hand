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
	

	String servicetype=request.getParameter("servicetype");	
	String servicehead=request.getParameter("servicehead");
	String ServiceTitle=request.getParameter("ServiceTitle");
	String serviceDescription=request.getParameter("ServiceDescr");
	String servicerule=request.getParameter("servicerule");
	String Servicedur=request.getParameter("ServiceDescr");
	String serviceamount=request.getParameter("serviceamount");
int serid=0;
   

     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   
		    sql="select max(srid) from tbl_service";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			 serid=rs.getInt(1);  
		   }
		   serid++;
			   
		   sql="insert into tbl_service values("+serid+",'"+servicetype+"','"+servicehead+"','"+ServiceTitle+"','"+serviceDescription+"','"+servicerule+"','"+Servicedur+"',"+Integer.parseInt(serviceamount)+")";
		   stmt.executeUpdate(sql);
		 out.println("Saved....");
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