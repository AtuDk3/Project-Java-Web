<%-- 
    Document   : change_password
    Created on : Dec 22, 2023, 2:28:50 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password</title>

        <!--          - favicon-->

        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">

        <!--          - custom css link-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">
        <link rel="stylesheet" href="<c:url value="/assets/css/style_product_details.css" />">

        <!--          - google font link-->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

    </head>

    <body>
        <!--          - HEADER-->

        <%@include file="header.jsp" %>

        <!--          - MAIN-->
        <main>

            <div class="breadcrumbs">
                <ol itemscope itemtype="http://schema.org/BreadcrumbList">
                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <a itemprop="item" href="home">
                            <span itemprop="name">Home Page / </span></a>
                        <meta itemprop="position" content="1" />
                    </li>
                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <span itemprop="item">
                            <strong itemprop="name">
                                &nbspProfile
                            </strong>
                        </span>
                        <meta itemprop="position" content="2" />
                    </li>
                </ol>
            </div>

            <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
                <div class="container">
                    <div class="row gx-lg-5 align-items-center">
                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <h1 class="my-5 display-3 fw-bold ls-tight">
                                Committed to protecting <br />
                                <span class="text-primary">your information</span>
                            </h1>
                            <p style="color: hsl(217, 10%, 50.8%)">
                                Note: Do not share your account and password with anyone!
                            </p>
                        </div>

                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <div class="card">
                                <div class="card-body py-5 px-md-5">
                                    <form action="${pageContext.request.contextPath}/member/change_password" autocomplete="off" method="post" onsubmit="return validatePasswords()" style="font-size: 16px;">
                                        <div class="row">
                                            <input type="hidden" value="${sessionScope.account.userName}" name="userName">

                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form3Example4">Old Password <span style="color: red;">*</span></label>
                                                <input type="text" id="oldPassword" class="form-control" name="oldPassword" required />
                                            </div>

                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form3Example4">New Password <span style="color: red;">*</span></label>
                                                <input type="text" id="newPassword" class="form-control" name="newPassword" required />
                                            </div>

                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="form3Example4">Confirm New Password <span style="color: red;">*</span></label>
                                                <input type="text" id="confirmNewPassword" class="form-control" name="confirmNewPassword" required />
                                            </div>

                                            <c:if test="${not empty alert}">
                                                <div class="alert alert-danger" role="alert" style="font-size: 13px; margin-left: 20px; width: 95%">
                                                    <p class="error" style="margin-bottom: 0;">${alert}</p>
                                                </div>
                                            </c:if>

                                            <button type="submit" class="btn btn-primary btn-block mb-4" style="width: fit-content; margin-left: 15px; font-size: 16px">
                                                Change password
                                            </button>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </main>
        <!--          - FOOTER-->

        <%@include file="footer.jsp" %>

        <!--          - custom js link-->

        <script src="<c:url value="/assets/js/script.js" />"></script>

        <!--          - ionicon link-->
        <script>
                                        function validatePasswords() {

                                            var oldPassword = document.getElementById('oldPassword').value;
                                            var newPassword = document.getElementById('newPassword').value;
                                            var confirmNewPassword = document.getElementById('confirmNewPassword').value;

                                            if (oldPassword === newPassword) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Oops...',
                                                    text: 'The new password must be different from the old password!',
                                                });
                                                return false;
                                            }

                                            if (newPassword !== confirmNewPassword) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Oops...',
                                                    text: 'New password and confirm password are not the same!',
                                                });
                                                return false;
                                            }

                                            return true;
                                        }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/script_cart.js"></script>
    </body>

</html>



