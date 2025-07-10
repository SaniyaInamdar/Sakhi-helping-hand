<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint Form</title>
    <link rel="icon" href="img/favicon2.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('img/background.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        

        /* Navbar */
        header {
            background-color: #467aaf;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 25px;
            color: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        header .logo {
            display: flex;
            align-items: center;
        }

        header .logo img {
            height: 40px;
            margin-right: 10px;
        }

        header h1 {
            font-size: 22px;
            margin: 0;
        }

        header nav {
            display: flex;
            gap: 20px;
        }

        header nav a {
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border: 1px solid white;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        header nav a:hover {
            background-color: white;
            color: #467aaf;
        }

        /* Complaint Section Styling */
        .contact-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 40px 30px;
            background: rgba(255, 255, 255, 0.326); /* Set a transparent white background */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
            max-width: 1200px;
            border-radius: 10px;
        }
        

        .contact-container {
            width: 50%;
            padding: 30px;
        }

        .contact-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #f8fafb;
            font-size: 28px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #467aaf;
            outline: none;
            box-shadow: 0 0 5px rgba(70, 122, 175, 0.5);
        }

        .form-group textarea {
            resize: vertical;
            min-height: 120px;
        }

        /* Submit and Clear buttons */
        .buttons-container {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .submit-btn,
        .clear-btn {
            background-color: #467aaf;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover,
        .clear-btn:hover {
            background-color: #365d8b;
        }

        /* Modal (Popup) */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 100px;
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border-radius: 10px;
            width: 50%;
            text-align: center;
            position: relative;
        }

        /* Close button */
        .modal .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 10px;
            right: 20px;
            cursor: pointer;
        }

        .modal .close:hover,
        .modal .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }



        /* Contact Image Styling */
.contact-image {
    width: 45%;
    padding: 20px;
    background: transparent; /* Ensure no background color */
}

.contact-image img {
    width: 100%;
    height: auto;
    max-width: 500px;  /* Adjust the image width as per your need */
    border-radius: 10px;
}

        /* Footer */
        footer {
            margin-top: 40px;
            background-color: #467aaf;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .contact-section {
                flex-direction: column;
            }

            .contact-container,
            .contact-image {
                width: 100%;
            }
        }
		 header {
            background-color: #467aaf;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 20px;
            color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        header .logo {
            display: flex;
            align-items: center;
        }
        
        header .logo img {
            height: 50px;
            margin-right: 10px;
        }
        
        header h1 {
            font-size: 24px;
            margin: 0;
        }
        
        header div {
            display: flex;
            align-items: center;
        }
        
        header .change-password,
        header .logout {
            margin-left: 10px;
        }
        
        header .logout a,
        header .change-password a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border: 1px solid white;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            margin-left: 10px;
        }
        
        header .logout a:hover,
        header .change-password a:hover {
            background-color: white;
            color: #467aaf;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
   <!-- Header -->
    <header>
        <div class="logo">
            <img src="img/LogoDash.png" alt="Sakhee Logo">
			
			<%
				
			   
			   String username=(String)session.getAttribute("username");
			   String uid=(String)session.getAttribute("uid");
			   session.setAttribute("username",username);
			   session.setAttribute("uid",uid);
			
			
			%>
            <h1><% out.print(username+""+uid); %></h1>
			
        </div>
        <div>
		  <div class="change-password">
                <a href="userprofile.jsp">Home</a>
            </div>
            <div class="change-password">
                <a href="changepassword.jsp">Change Password</a>
            </div>
			
            <div class="logout">
                <a href="Login.html">Logout</a>
            </div>
        </div>
    </header>
    

    <!-- Complaint Section -->
    <div id="complaint-form" class="contact-section">
        <!-- Complaint Form -->
        <div class="contact-container">
            <h2>We Value Your Feedback!</h2>
            <form  method="POST" action="savecomplaint.jsp">
                <!-- Name -->
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
				String uname="";
				String mobile="";
try {
		 
		 
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
          // out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select * from tbl_user where userid="+uid+"";
           rs=stmt.executeQuery(sql);
		  while(rs.next())
		  {
			  uname=rs.getString(2);
			  mobile=rs.getString(5);
%>
                      
<%					
		  } 
	 }
	 }
     catch (Exception e) {
          out.println("Exception: " + e.getMessage());
     } 
	 %>

                <div class="form-group">
                    <label for="name"><i class="fas fa-user icon">Your Name</i> </label>
                    <input type="text" id="name" name="name" placeholder="Enter your name" required value="<% out.print(uname); %> ">
                </div>

                <!-- Contact Number -->
                <div class="form-group">
                    <label for="contact"><i class="fas fa-phone icon"></i> Your Contact Number</label>
                    <input type="text" id="contact" name="contact" placeholder="Enter your contact number" required value="<% out.print(mobile); %> ">
                </div>

                <!-- Description -->
                <div class="form-group">
                    <label for="description"><i class="fas fa-clipboard-list icon"></i> Complaint Description</label>
                    <textarea id="description" name="description" placeholder="Describe your complaint" required></textarea>
                </div>

                <!-- Buttons -->
                <div class="buttons-container">
                    <button type="submit" class="submit-btn" >Submit Complaint</button>
                    <button type="reset" class="clear-btn">Clear Form</button>
                </div>
            </form>
        </div>

        <!-- Contact Image -->
        <div class="contact-image">
            <img src="img/complaint-image.jpg" alt="Complaint Image">
        </div>
    </div>

    <!-- Modal -->
    <div id="complaintModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3>Complaint Successfully Submitted!  We Will Call You Shortly</h3>
        </div>
    </div>

    <script>
        // Show the modal when the Submit button is clicked
        function showModal(event) {
            event.preventDefault();  // Prevent form submission to keep the modal open
            document.getElementById("complaintModal").style.display = "block";
        }

        // Close the modal when the close button is clicked
        function closeModal() {
            document.getElementById("complaintModal").style.display = "none";
        }

        // Close the modal if the user clicks outside the modal
        window.onclick = function(event) {
            if (event.target == document.getElementById("complaintModal")) {
                document.getElementById("complaintModal").style.display = "none";
            }
        }
    </script>

    <!-- Footer -->
    <footer>
        &copy; 2025 Sakhee. All rights reserved.
    </footer>

</body>
</html>
