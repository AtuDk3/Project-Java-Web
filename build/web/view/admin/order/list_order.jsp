<%-- 
    Document   : list_order
    Created on : Dec 9, 2023, 7:12:50 PM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_list.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo/logo.png" type="image/x-icon">
        <title>Dashboard | List Order</title>
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
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
                                    <a href="${pageContext.request.contextPath}/admin/order/order_details?cid=${listCarts.idCart}"><button type="button" class="btn btn-warning">View Orders</button></a>
                                    <button type="button" onclick="confirmDeleteCart('${listCarts.idCart}')" class="btn btn-danger">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <%@include file="../footer.jsp" %>
