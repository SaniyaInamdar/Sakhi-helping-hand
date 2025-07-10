<!doctype html>
<%@ page import="java.sql.*" %>
<html class="no-js" lang="zxx">
    <head>
        <!-- Meta Tags -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="keywords" content="Site keywords here">
		<meta name="description" content="">
		<meta name='copyright' content=''>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- Title -->
        <title>Sakhee - Helping Hand</title>
		
		<!-- Favicon --><link rel="icon" href="img/favicon2.png">
		
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Nice Select CSS -->
		<link rel="stylesheet" href="css/nice-select.css">
		<!-- Font Awesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		<!-- icofont CSS -->
        <link rel="stylesheet" href="css/icofont.css">
		<!-- Slicknav -->
		<link rel="stylesheet" href="css/slicknav.min.css">
		<!-- Owl Carousel CSS -->
        <link rel="stylesheet" href="css/owl-carousel.css">
		<!-- Datepicker CSS -->
		<link rel="stylesheet" href="css/datepicker.css">
		<!-- Animate CSS -->
        <link rel="stylesheet" href="css/animate.min.css">
		<!-- Magnific Popup CSS -->
        <link rel="stylesheet" href="css/magnific-popup.css">
		
		<!-- Medipro CSS -->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">
		
    </head>
    <body>
	
		<!-- Header Area -->
		<header class="header">
			<!-- Topbar -->
			<div class="topbar">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-5 col-12">
							<!-- Contact -->
							<ul class="top-link">
								<li><a href="index.html#About">About</a></li>
								<li><a href="index.html#Services">Services</a></li>
								<li><a href="index.html#Contact">Contact</a></li>
							</ul>
							<!-- End Contact -->
						</div>
						<div class="col-lg-6 col-md-7 col-12">
							<!-- Top Contact -->
							<ul class="top-contact">
								<li><i class="fa fa-phone"></i>+91 6874123565</li>
								<li><i class="fa fa-envelope"></i><a href="mailto:support@yourmail.com">support@yourmail.com</a></li>
							</ul>
							<!-- End Top Contact -->
						</div>
					</div>
				</div>
			</div>
			<!-- End Topbar -->

			<!-- Header Inner -->
			<div class="header-inner">
				<div class="container">
					<div class="inner">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-12">
								<!-- Start Logo -->
								<div class="logo">
									<a href="index.html"><img src="img/logo.png" alt="#"></a>
								</div>
								<!-- End Logo -->
								<!-- Mobile Nav -->
								<div class="mobile-nav"></div>
								<!-- End Mobile Nav -->
							</div>
							<div class="col-lg-7 col-md-9 col-12">
								<!-- Main Menu -->
								<div class="main-menu">
									<nav class="navigation">
										<ul class="nav menu">
											<li class="active"><a href="index.html#home">Home</a></li>
											<li><a href="index.html#About">About Us</a></li>
											<li><a href="index.html#Services">Services</a></li>
											<li><a href="index.html#Job">Job</a></li>
											<li><a href="index.html#Contact">Contact Us</a></li>
											<li><a href="Login.html">Login</a></li>
										</ul>
									</nav>
								</div>
								<!-- End Main Menu -->
							</div>
							<div class="col-lg-2 col-12">
								<div class="get-quote">
									<a href="Login.html" class="btn">Book Service</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Header Inner -->
		</header>
		<!-- End Header Area -->

		<!-- Start Sign-Up Section -->
		<section class="login section">
			<div class="container">
				<div class="inner">
					<div class="row"> 
						<!-- Left Column (Image or Map Section) -->
						<div class="col-lg-6">
							<div class="login-left">
								<!-- Start Google Map (or Image) -->
								<div id="myMap"></div>
								<!-- End Google Map -->
							</div>
						</div>

						<!-- Right Column (Sign Up Form) -->
						<div class="col-lg-6">
				<form class="form" method="post" action="save_menu.jsp">
	
												<%!
     Connection con = null;
     Statement stmt = null;
     ResultSet rs = null;
     String url = "jdbc:mysql://localhost:3306/sakhee_database?useSSL=false&allowPublicKeyRetrieval=true";
     String user = "root";
     String pass = "root";
	 String sql;
   %>
								<h2>Service Type Details</h2>
								<br>
								<!-- Form -->
									<div class="row">
									
									<div class="col-lg-12">
									<div class="form-group">
											
											Select Service Type  
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="Sertype">
<%
	
int serid=0;
   
 
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
         //  out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select * from service_des";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			 serid=rs.getInt(1);  
			   
			   
%>
<option value="<%= serid %>"><% out.println(rs.getString(2)); %></option>
<%
			  
		   }
		   %>
		   </select>
		  
<%		   
		  } 
	 }
     catch (Exception e) {
          out.println("Exception: " + e.getMessage());
     } 
	%>
	</div> <!-- Username -->
										</div>
										<div class="col-lg-12">
											<div class="form-group">
	
		<%
	
int sertyid=0;
   
 
     try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, user, pass);
        if(con!=null) {
           //out.println("Successfully connected to " + "MySQL server using TCP/IP..." + "<br>");
           stmt = con.createStatement();
		    sql="select max(sertype_id) from service_des";
           rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
			 sertyid=rs.getInt(1);
		   }
		   sertyid++;
		   
		  } 
	 }
     catch (Exception e) {
          out.println("Exception: " + e.getMessage());
     } 
	%>
												<input type="text" name="servicetype" placeholder="<% out.println(sertyid); %> " required="" style="width: 100%; padding: 15px; font-size: 16px;">
											</div> <!-- Username -->
										</div>
										<div class="col-lg-12">
											<div class="form-group">
												<input type="text" name="serviceName" placeholder="service Name " required="" style="width: 100%; padding: 15px; font-size: 16px;">
											</div> <!-- Username -->
										</div>
										<div class="col-lg-12">
											<div class="form-group">
											<textarea name="serviceDescription" placeholder="Service description" rows="3" style="width: 100%; padding: 15px; font-size: 16px;"></textarea>
												</div> <!-- Email -->
										</div>
										
										</div>
										<div class="col-12" style="display: flex; gap: 15px; margin-top: 20px;">
											<div class="form-group signup-btn" style="flex: 1;">
												<button class="btn" type="submit" style="padding: 15px 30px; font-size: 16px;">Submit</button> <!-- Sign Up Button -->
											</div>
											<div class="form-group clear-btn" style="flex: 1;">
												<button class="btn" type="reset" style="padding: 15px 30px; font-size: 16px;">Clear</button> <!-- Clear Button -->
											</div>
										</div>
									</div>
								</form>
								<!-- End Form -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Sign-Up Section -->

		<!-- Footer Area -->
		<footer id="footer" class="footer">
			<!-- Footer Top -->
			<div class="footer-top">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 col-12">
							<div class="single-footer">
								<h2>About Us</h2>
								<p>Welcome to our website! We are dedicated to providing the best services in the industry. Our mission is to deliver exceptional results and customer satisfaction in every project we undertake. We believe in innovation, quality, and continuous improvement.</p>
								<!-- Social Links -->
								<ul class="social">
									<li><a href="#"><i class="icofont-facebook"></i></a></li>
									<li><a href="#"><i class="icofont-google-plus"></i></a></li>
									<li><a href="#"><i class="icofont-twitter"></i></a></li>
									<li><a href="#"><i class="icofont-vimeo"></i></a></li>
									<li><a href="#"><i class="icofont-pinterest"></i></a></li>
								</ul>
								<!-- End Social Links -->
							</div>
						</div>

						<div class="col-lg-4 col-md-6 col-12">
							<div class="single-footer f-link">
								<h2>Quick Links</h2>
								<ul>
									<li><a href="index.html#home"><i class="fa fa-caret-right" aria-hidden="true"></i>Home</a></li>
									<li><a href="index.html#About"><i class="fa fa-caret-right" aria-hidden="true"></i>About Us</a></li>
									<li><a href="index.html#Service"><i class="fa fa-caret-right" aria-hidden="true"></i>Services</a></li>
									<li><a href="index.html#Contact"><i class="fa fa-caret-right" aria-hidden="true"></i>Contact</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Footer Top -->

			<!-- Footer Bottom -->
			<div class="footer-bottom">
				<div class="container">
					<p>&copy; 2025 Sakhee. All rights reserved.</p>
				</div>
			</div>
		</footer>
		<!-- End Footer Area -->

		<!-- Scripts -->
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/slicknav.min.js"></script>
		<script src="js/datepicker.js"></script>
		<script src="js/main.js"></script>
	</body>
</html>
