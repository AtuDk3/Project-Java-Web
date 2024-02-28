<%-- 
    Document   : profile
    Created on : Dec 18, 2023, 9:48:16 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #update_info {
        display: none;
    }
</style>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>One Piece Shop</title>

        <!--          - favicon-->

        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">

        <!--          - custom css link-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">
        <link rel="stylesheet" href="<c:url value="/assets/css/style_product_details.css" />">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_update.css">

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

            <section style="background-color: #eee; margin: 0 5%; border-radius: 10px; font-size: 16px;">
                <div class="container py-5">

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img src="${pageContext.request.contextPath}/assets/images/uploads/avatar/${sessionScope.account.avatar}" alt="avatar" class="rounded-circle img-fluid" style="width: 150px; height: 150px; object-fit: cover; margin: 0 auto;">
                                    <h5 class="my-3">${sessionScope.account.userName}</h5>
                                    <p class="text-muted mb-1">Email: ${sessionScope.account.email}</p>
                                    <p class="text-muted mb-4">Phone: ${sessionScope.account.phone}</p>
                                    <div class="d-flex justify-content-center mb-2">
                                        <button style="font-size: 16px;" type="button" class="btn btn-primary" onclick="showUpdateInfo()">Update Profile</button>
                                        <a href="${pageContext.request.contextPath}/member/change_password"><button style="font-size: 16px;" type="button" class="btn btn-outline-primary ms-1">Change Password</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8" id="show_info">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Full Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${sessionScope.account.fullName}</p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Email</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${sessionScope.account.email}</p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Password</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${sessionScope.account.password}</p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Phone</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${sessionScope.account.phone}</p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Address</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${sessionScope.account.address}</p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Create Date</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${sessionScope.account.createDate}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-8" id="update_info">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <form action="${pageContext.request.contextPath}/member/update_profile" method="post" enctype="multipart/form-data">
                                        <input type="hidden" value="${sessionScope.account.userName}" name="userName">
                                        <div class="form-group">
                                            <label for="fullName">Full Name</label>
                                            <input value="${sessionScope.account.fullName}" type="text" name="fullName" class="form-control" required>
                                        </div>
                                        
                                        <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="text" class="form-control" value="${sessionScope.account.email}" name="email" required>
                                        </div>
                                        
                                        <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input type="text" class="form-control" value="${sessionScope.account.phone}" name="phone" required>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="image">Image</label>
                                            <input type="file" name="image" class="form-control">
                                            <p> <img class="image" src="${pageContext.request.contextPath}/assets/images/uploads/avatar/${sessionScope.account.avatar}" height="100px" width="100px"></p>

                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address</label>
                                            <input type="text" class="form-control" value="${sessionScope.account.address}" name="address" required>
                                        </div> 
                                        <button id="btn" type="submit" class="btn btn-primary">Update Profile</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card mb-4 mb-md-0">
                                <div class="card-body">
                                    <p class="mb-4"><span class="text-primary font-italic me-1">Purchase</span> History
                                    </p>

                                    <table id="example" class="table table-striped" id="table_list" style="width:100%;">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Id Order</th>
                                                <th>Date Order</th>
                                                <th>ID customer</th>
                                                <th>Email</th>
                                                <th>Status Order</th>
                                                <th>Manager</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${requestScope.listCarts}" var="listCarts" varStatus="no" >
                                                <tr>
                                                    <td>${no.index + 1}</td>
                                                    <td>${listCarts.idCart}</td> 
                                                    <td>${listCarts.buyDate}</td>
                                                    <td>${listCarts.buyer.id}</td>                             
                                                    <td>${listCarts.buyer.email}</td>

                                                    <c:choose>
                                                        <c:when test="${listCarts.statusOrder eq  0}">
                                                            <td><ion-icon name="close-outline"></ion-icon> Not yet processed</td>
                                                        </c:when>
                                                        <c:otherwise>
                                                    <td><ion-icon name="checkmark-outline"></ion-icon> Processed</td>
                                                    </c:otherwise>
                                                </c:choose>                      

                                            <td>
                                                <a href="${pageContext.request.contextPath}/member/profile/order_details?cid=${listCarts.idCart}"><button type="button" class="btn btn-warning">View Orders</button></a>
                                            </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>                                       

                </div>
            </section>



        </main>
        <!--          - FOOTER-->

        <%@include file="footer.jsp" %>

        <!--          - custom js link-->

        <script src="<c:url value="/assets/js/script.js" />"></script>

        <!--          - ionicon link-->
        <script>
                                            function showUpdateInfo() {
                                                document.getElementById("update_info").style.display = "block";
                                                document.getElementById("show_info").style.display = "none";
                                            }

        </script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
        <script>
                                            new DataTable('#example');
        </script>
    </body>

</html>
