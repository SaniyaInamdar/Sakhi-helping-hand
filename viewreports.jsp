<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports- Sakhee</title>
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
    <div class="content">
       
    

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Sakhee Inc. All rights reserved.</p>
    </footer>
</body>
</html>
