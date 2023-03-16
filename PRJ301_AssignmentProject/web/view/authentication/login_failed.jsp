<%-- 
    Document   : login_failed
    Created on : Feb 20, 2023, 11:05:41 AM
    Author     : sonnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="align">
        <div class="grid align__item">
            <div class="login">
                <img src="img/FPT_logo_2010.svg.png" alt=""/>
                <form action="login" method="post" class="form">
                    <div class="form__field">
                        <input type="email" placeholder="username">
                    </div>
                    <div class="form__field">
                        <input type="password" placeholder="•••••••••">
                    </div>
                    <div class="form__field">
                        <input type="submit" value="Login">
                    </div>
                </form>
            </div>
        </div>
        <script>
            window.onload = function(alert("Your account doesn't match any account in database. Please login again !"));
        </script>
    </body>
</html>