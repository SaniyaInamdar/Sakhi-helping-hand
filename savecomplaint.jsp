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
				
			   
			   String username=(String)session.getAttribute("username");
			   String uid=(String)session.getAttribute("uid");
			   session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
			
			
			%>
  <%
	
int serid=0;
   java.util.Date d=new java.util.Date();
 
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select max(compid) from tbl_complaint";
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
     String name=request.getParameter("name");
	String contact=request.getParameter("contact");
	String description=request.getParameter("description");
	
   

     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   
		   
		   sql="insert into tbl_complaint values("+serid+",'"+String.valueOf(d)+"',"+Integer.parseInt(uid)+",'"+username+"','"+description+"')";
		   stmt.executeUpdate(sql);
		   response.sendRedirect("userprofile.jsp");
		 //out.println("Registered Successful");
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