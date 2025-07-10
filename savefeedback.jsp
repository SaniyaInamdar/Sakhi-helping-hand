<%@ page import="java.sql.*" %>
<html>
<head>
 <script language="JavaScript">     
            
          alert("Feedback submitted successfully");
        

       
           
    </script>
	</head>
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
    String bookid=(String)session.getAttribute("bookid");
   String feed=request.getParameter("txtfeedback");
java.util.Date d=new java.util.Date();
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		   
		   
		   sql="insert into tbl_feedback values("+Integer.parseInt(bookid)+",'"+String.valueOf(d)+"','"+feed+"')";
		   stmt.executeUpdate(sql);
		   //response.sendRedirect("userprofile.jsp");
		out.println("<a href=userprofile.jsp>Click Here</a>");
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