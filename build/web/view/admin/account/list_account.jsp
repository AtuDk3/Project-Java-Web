<%-- 
    Document   : list_product
    Created on : Dec 9, 2023, 6:55:31 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Định dạng giá tiền-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Cắt chuỗi-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_list.css">
        <title>Dashboard | List Account</title>
        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <h4>List Account</h4>
                <table id="example" class="table table-striped" id="table_list" style="width:100%;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Id</th>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Full Name</th>
                            <th>Avatar</th>
                            <th>Phone</th>
                            <th>Create Date</th>
                            <th>Role</th>
                            <th>Address</th>
                            <th>Manager</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${requestScope.listAccounts}" var="listAccounts" varStatus="no" >
                            <tr>
                                <td>${no.index + 1}</td>
                                <td>${listAccounts.id}</td>
                                <td>${listAccounts.userName}</td>
                                <td>${listAccounts.email}</td>
                                <td>${listAccounts.password}</td>
                                <td>${listAccounts.fullName}</td>
                                <td><img class="image" src="${pageContext.request.contextPath}/assets/images/uploads/avatar/${listAccounts.avatar}" height="100px" width="100px"></td>
                                <td>${listAccounts.phone}</td>
                                <td>${listAccounts.createDate}</td>

                                <c:choose>
                                    <c:when test="${listAccounts.roleID == 1}">
                                        <td>Admin</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>User</td>
                                    </c:otherwise>
                                </c:choose>
                                        
                                <td>${listAccounts.address}</td>
                                <td>
                                    <button type="button" onclick="confirmDeleteAccount(${listAccounts.id})" class="btn btn-danger">Delete</button>
                                    <a href="${pageContext.request.contextPath}/admin/account/update?aid=${listAccounts.id}"><button type="button" class="btn btn-warning">Update</button></a>
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
