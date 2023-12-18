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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_add.css">
        
        <title>Add Product</title>
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <div class="container-form-add-product">
                    <h4>Add new Product</h4>
                    <form action="<?php echo BASE_URL; ?>product/insertProduct" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="nameCategory">Name Product</label>
                            <input type="text" class="form-control" placeholder="Enter name product" name="title_product" required>
                        </div>
                        <div class="form-group">
                            <label for="nameCategory">Image Product</label>
                            <input type="file" class="form-control" name="image_product" required>
                        </div>
                        <div class="row g-2">
                            <div class="col">
                                <label for="describeCategory">Price Product</label>
                                <input type="text" class="form-control" placeholder="Enter price product " name="price_product" required>
                            </div>
                            <div class="col">
                                <label for="describeCategory">Number of products</label>
                                <input type="text" class="form-control" placeholder="Enter the number of products" name="quantity_product" required>
                            </div>            
                        </div>
                        <div class="row g-2">
                            <div class="col">
                                <label>Hot Product :</label>
                                <select name="product_hot" id="">                   
                                    <option class="option" value="0">No</option>
                                    <option class="option" value="1">Yes</option>
                                </select>
                            </div>
                            <div class="col">
                                <label>Category Product :</label>
                                <select name="id_category_product" id="">
                                    <?php
                                    foreach ($category as $key => $cate) {
                                    ?>
                                    <option class="option" value="<?php echo $cate['id_category_product'] ?>">
                                        <?php echo $cate['title_category_product']; ?>
                                    </option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="describeCategory">Describe Product</label>
                                <textarea type="text" id="editor1" class="form-control" placeholder="Enter describe product here ..." name="desc_product"
                                          required></textarea>
                            </div>
                            <button id="btn" type="submit" class="btn btn-primary">Add new product</button>
                    </form>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <%@include file="../footer.jsp" %>

