<%-- 
    Document   : update_product
    Created on : Dec 9, 2023, 6:50:06 PM
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
        <title>Dashboard | Update Product</title>
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

                    <h4>Update Product</h4>
                    <form action="${pageContext.request.contextPath}/admin/product/update?pid=${product.idProduct}" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="titleProduct">Name Product</label>
                            <input value="${product.titleProduct}" type="text" name="titleProduct" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="imageProduct">Image Product</label>
                            <input type="file" name="imageProduct" class="form-control">
                            <p> <img class="image" src="${pageContext.request.contextPath}/assets/images/uploads/${product.imgProduct}" height="100px" width="100px"></p>
                        </div>
                        <div class="row g-2">
                            <div class="col">
                                <label for="priceProduct">Price Product</label>
                                <input type="text" class="form-control" value="${product.priceProduct}" name="priceProduct" required>
                            </div>
                            <div class="col">
                                <label for="quantityProduct">Number of products</label>
                                <input type="text" class="form-control" value="${product.quantityProduct}" name="quantityProduct" required>
                            </div>            
                        </div>
                        <div class="row g-2">
                            <div class="col">
                                <label>Hot Product :</label>
                                <select name="hotProduct"> 
                                    <c:choose>
                                        <c:when test="${product.hotProduct == 1}">
                                            <option selected value="1">Yes</option>
                                            <option value="0">No</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option selected value="0">No</option>
                                            <option value="1">Yes</option>
                                        </c:otherwise>
                                    </c:choose>             
                                </select>
                            </div>
                            <div class="col">
                                <label>Category Product :</label>
                                <select name="idCategoryProduct">
                                    <c:forEach items="${requestScope.categoryProduct}" var="categoryProduct" >
                                        <c:choose>
                                            <c:when test="${categoryProduct.idCategoryProduct eq product.categoryProduct.idCategoryProduct}">
                                                <option value="${categoryProduct.idCategoryProduct}" selected>${categoryProduct.titleCategoryProduct}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${categoryProduct.idCategoryProduct}">${categoryProduct.titleCategoryProduct}</option>
                                            </c:otherwise>
                                        </c:choose>                
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="describeCategory">Describe Product</label>
                                <textarea type="text" id="editor1" name="descProduct" class="form-control" required>${product.descProduct}</textarea>
                            </div>
                            <button id="btn" type="submit" class="btn btn-primary">Update product</button>
                    </form>

                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <%@include file="../footer.jsp" %>


