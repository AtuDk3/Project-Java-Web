<%-- 
    Document   : login
    Created on : Dec 9, 2023, 10:29:36 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style_login.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <title>Login</title>
        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">
    </head>

    <body>

        <div class="container right-panel-active" id="container">
            <div class="form-container sign-up">
                <form action="${pageContext.request.contextPath}/register" method="post">
                    <h1>Create Account</h1>
                    <div class="social-icons">
                        <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    </div>
                    <span>or use your email for registeration</span>
                    <input type="text" name="userName" placeholder="User Name" required>
                    <input type="email" name="email" placeholder="Email" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <input type="text" name="phone" placeholder="Phone" required>
                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger" role="alert">
                            <p class="error">${alert}</p>
                        </div>
                    </c:if>
                    <button>Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in">
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <h1>Sign In</h1>
                    <div class="social-icons">
                        <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    </div>
                    <span>or use your email password</span>
<!--                    <input type="email" name="userEmail" value="${uEmail}" placeholder="Email">-->
                    <input type="text" name="userName" value="${uName}" placeholder="User Name" required>
                    <input type="password" name="password" value="${uPass}" placeholder="Password" required>

                    <div class="checkbox_remember">
                        <input type="checkbox" name="remember">
                        <label>&nbspCheck me out</label>
                    </div>

                    <c:if test="${not empty alert}">
                        <div class="alert alert-danger" role="alert">
                            <p class="error">${alert}</p>
                        </div>
                    </c:if>
                    <a href="#">Forget Your Password?</a>
                    <button>Sign In</button>
                </form>
            </div>
            <div class="toggle-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <h1>Welcome Back!</h1>
                        <p>Enter your personal details to use all of site features</p>
                        <button class="hidden" id="login">Sign In</button>
                    </div>
                    <div class="toggle-panel toggle-right">
                        <h1>Welcome!</h1>
                        <p>Register with your personal details to use all of site features</p>
                        <a href="${pageContext.request.contextPath}/register"><button class="hidden" id="register">Sign Up</button></a>
                    </div>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/assets/js/script_login.js"></script>
    </body>

</html>