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
        <title>Dashboard | List Product</title>
        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <h4>List Product</h4>
                <table id="example" class="table table-striped" id="table_list" style="width:100%;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Id</th>
                            <th>Name Product</th>
                            <th>Iamge Product</th>
                            <th>Category Product</th>

                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Hot Product</th>

                            <th>Describe</th>
                            <th>Manager</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${requestScope.productList}" var="productList" varStatus="no" >
                            <tr>
                                <td>${no.index + 1}</td>
                                <td>${productList.idProduct}</td>
                                <td>${productList.titleProduct}</td>
                                <td><img class="image" src="${pageContext.request.contextPath}/assets/images/uploads/${productList.imgProduct}" height="100px" width="100px"></td>
                                <td>${productList.categoryProduct.titleCategoryProduct}</td>
                                <td><fmt:formatNumber type="currency" value="${productList.priceProduct * 0.9}" pattern="###,###₫" /></td>
                        <td>${productList.quantityProduct}</td>

                        <c:choose>
                            <c:when test="${productList.hotProduct == 1}">
                                <td>Yes</td>
                            </c:when>
                            <c:otherwise>
                                <td>No</td>
                            </c:otherwise>
                        </c:choose>

                        <td>${fn:length(productList.descProduct) <= 100 ? productList.descProduct : fn:substring(productList.descProduct, 0, 100)}...</td>
                        <td>
                            <button type="button" onclick="confirmDeleteProduct(${productList.idProduct})" class="btn btn-danger">Delete</button>
                            <a href="${pageContext.request.contextPath}/admin/product/update?pid=${productList.idProduct}"><button type="button" class="btn btn-warning">Update</button></a>
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
