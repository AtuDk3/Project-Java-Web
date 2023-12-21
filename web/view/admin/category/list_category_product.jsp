<%-- 
    Document   : list_category
    Created on : Dec 9, 2023, 7:10:07 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_list.css">
        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">
        <title>Dashboard | List Category</title>
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <h4>List Category Product</h4>               

                <table id="example" class="table table-striped" style="width:100%;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Name Category Product</th>
                            <th>Describe Category Product</th>
                            <th>Manager</th>
                        </tr>
                    </thead>
                    <tbody>     
                        <c:forEach items="${requestScope.cateProductList}" var="cateProductList" varStatus="no" >
                            <tr>
                                <td>${no.index + 1}</td>
                                <td>${cateProductList.idCategoryProduct}</td>
                                <td>${cateProductList.titleCategoryProduct}</td>
                                <td>${cateProductList.descCategoryProduct}</td>
                                <td>
                                    <button type="button" onclick="confirmDelete(${cateProductList.idCategoryProduct})" class="btn btn-danger">Delete</button> 
                                    <button type="button" class="btn btn-warning"><a href="${pageContext.request.contextPath}/admin/category_product/update?cid=${cateProductList.idCategoryProduct}">Update</a></button>
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
