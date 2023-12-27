<%-- 
    Document   : add_product
    Created on : Dec 9, 2023, 2:33:39 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_update.css">

        <title>Dashboard | Update Account</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo/logo.png"" type="image/x-icon">
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <div class="container-form-add-product">
                    <h4>Update Account</h4>
                    <form action="${pageContext.request.contextPath}/admin/account/update?aid=${account.id}" method="post" enctype="multipart/form-data">
                        <div class="row g-2">
                            <div class="col">
                                <label for="userName">User Name</label>
                                <input type="text" class="form-control" value="${account.userName}" name="userName" required>
                            </div>
                            <div class="col">
                                <label for="fullName">Full Name</label>
                                <input type="text" class="form-control" value="${account.fullName}" name="fullName" required>
                            </div>
                        </div>

                        <div class="row g-2">
                            <div class="col">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" value="${account.email}" name="email" required>
                            </div>
                            <div class="col">
                                <label for="password">Password</label>
                                <input type="text" class="form-control" value="${account.password}" name="password" required>
                            </div>
                        </div>

                        <div class="col">
                            <label for="avatar">Avatar</label>
                            <input type="file" class="form-control" name="avatar">
                            <p> <img class="image" src="${pageContext.request.contextPath}/assets/images/uploads/avatar/${account.avatar}" height="100px" width="100px"></p>
                        </div>
                        <div class="row g-2">
                            <div class="col">
                                <label for="phone">Phone</label>
                                <input type="text" class="form-control" value="${account.phone}" name="phone" required>
                            </div>

                            <div class="col">
                                <label>Role :</label>
                                <select name="roleID" required>       
                                <c:choose>
                                        <c:when test="${account.roleID == 1}">
                                            <option selected value="1">Admin</option>
                                            <option value="2">User</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option selected value="2">User</option>
                                            <option value="1">Admin</option>
                                        </c:otherwise>
                                    </c:choose>                                           
                                </select>
                            </div>
                        </div>

                        <div class="col">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" value="${account.address}" name="address" required>
                        </div>
                </div>

                <button id="btn" type="submit" class="btn btn-primary">Update account</button>
                </form>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <%@include file="../footer.jsp" %>

