<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin add services- Sakhee</title>
    <link rel="icon" href="img/favicon2.png">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('img/background.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            color: white;
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

        .content {
            text-align: center;
            padding: 40px 20px;
            flex-grow: 1;
        }

        .content h2 {
            font-size: 32px;
            margin-bottom: 30px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);
        }
/* General Form Styling */
form {
    width: 50%;
    margin: 20px auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.content {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

/* Label Styling */
label {
    font-size: 14px;
    font-weight: bold;
    color: #333;
    margin-bottom: 5px;
}

/* Input Fields Styling */
input[type="text"], select, textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    color: #333;
    box-sizing: border-box;
}

textarea {
    resize: vertical;
    min-height: 100px;
}

input[type="text"]:focus, select:focus, textarea:focus {
    border-color: #007bff;
    outline: none;
}

/* Button Styling */
button {
    width: 100%;
    padding: 15px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.3s ease;
}

button:hover {
    opacity: 0.9;
}

button:focus {
    outline: none;
}

/* Register Button Styling */
.login-btn button {
    background-color: #007bff;
    color: white;
}

/* Clear Button Styling */
.clear-btn button {
    background-color: #f44336;
    color: white;
}

/* Flex Container for Buttons */
.col-12 {
    display: flex;
    gap: 15px;
    margin-top: 20px;
}

/* Form Group Styling */
.form-group {
    display: flex;
    flex-direction: column;
}

/* Input and Textarea Focus Styling */
input[type="text"]:focus, select:focus, textarea:focus {
    border-color: #007bff;
    outline: none;
}

/* Responsive Styles */
@media (max-width: 768px) {
    form {
        width: 95%;
    }

    .col-12 {
        flex-direction: column;
    }

    .form-group {
        width: 100%;
    }
}

       
        footer {
            background-color: #467aaf;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="logo">
            <img src="img/LogoDash.png" alt="Sakhee Logo">
            <%
                String username = (String) session.getAttribute("username");
                String uid = (String) session.getAttribute("uid");
                session.setAttribute("username", username);
                session.setAttribute("uid", uid);
            %>
            <h1><% out.print(username); %></h1>
        </div>
        <div>
		
            <div class="logout">
                <a href="admindashboard.jsp">Home</a>
            </div>
         
            <div class="logout">
                <a href="Login.html">Logout</a>
            </div>
        </div>
    </header>

    <!-- Content -->
    <form name="addservice" action="save_service.jsp" method="post">
	<div class="content">
	
       <div class="form-group">
                    <label for="servicetype">Service Type</label>
                    <select id="servicetype" name="servicetype">
					<option>Home Services</option>
					<option>Child Care</option>
					<option>Personal Care</option>
					</select>
                </div>
				<div class="form-group">
                    <label for="servicehead">Service Heading</label>
					 
                    <input type="text" id="servicehead" name="servicehead" class="form-control"required />
                </div>
				<div class="form-group">
                    <label for="ServiceTitle">Service Title</label>
					<input type="text" id="ServiceTitle" name="ServiceTitle" class="form-control"required />
				</div>
               
                <div class="form-group">
                     <label for="ServiceDescr">Service Description</label>
                    <textarea id="servicede" name="ServiceDescr" class="form-control"  required /></textarea>
                </div>
                
                <div class="form-group">
                    <label for="servicerule">Rules and Regulation</label>
                    <textarea id="servicerule" name="servicerule" class="form-control" required /></textarea>
                </div>
                
                <div class="form-group">
                    <label for="Servicedur">Service Duration</label>
                    <input type="text" id="Servicedur" name="Servicedur" class="form-control"  required />
                </div>
                <div class="form-group">
                    <label for="serviceamount">Amount </label>
                    <input type="text" id="serviceamount" name="serviceamount" class="form-control"  required />
                </div>
                
                

                <div class="col-12" style="display: flex; gap: 15px; margin-top: 20px;">
                  <div class="form-group login-btn" style="flex: 1;">
                    <button class="btn" type="submit" style="padding: 15px 30px; font-size: 16px;">Save</button> <!-- Login Button -->
                  </div>
                  <div class="form-group clear-btn" style="flex: 1;">
                    <button class="btn" type="reset" style="padding: 15px 30px; font-size: 16px;">Clear</button> <!-- Clear Button -->
                  </div>
                </div>
                <!-- Sign Up Link -->
                </div>
            </form>
    
</div>
    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Sakhee Inc. All rights reserved.</p>
    </footer>
</body>
</html>
