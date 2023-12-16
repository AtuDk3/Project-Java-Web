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
        <link rel="stylesheet" href="http://localhost:8080/Ecommer_Website/assets/css/admin/style_update.css">
        <title>AdminSite</title>
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <div class="container-form-add-product">
    <?php
    foreach ($productbyid as $key => $pro) {
    ?>
        <h4>Update Product</h4>
        <form action="<?php echo BASE_URL; ?>product/updateProduct/<?php echo $pro['id_product']; ?>" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="nameCategory">Name Product</label>
                <input value="<?php echo $pro['title_product'] ?>" type="text" name="title_product" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="nameCategory">Image Product</label>
                <input type="file" name="image_product" class="form-control">
                <p> <img class="image" src="<?php echo BASE_URL ?>public/uploads/product/imageproduct/<?php echo $pro['image_product'] ?>" height="100px" width="100px"></p>
            </div>
            <div class="row g-2">
            <div class="col">
                <label for="describeCategory">Price Product</label>
                <input type="text" class="form-control" value="<?php echo $pro['price_product'] ?>" name="price_product" required>
            </div>
            <div class="col">
                <label for="describeCategory">Number of products</label>
                <input type="text" class="form-control" value="<?php echo $pro['quantity_product'] ?>" name="quantity_product" required>
            </div>            
        </div>
        <div class="row g-2">
        <div class="col">
                <label>Hot Product :</label>
                <select name="product_hot" id=""> 
                    <?php
                        if ($pro['product_hot'] == 0) {
                    ?>
                        <option selected value="0">No</option>
                        <option value="1">Yes</option>
                    <?php 
                        }  
                        else {
                    ?>                      
                        <option value="0">No</option>
                        <option selected value="1">Yes</option>
                    <?php
                        }
                    ?>
                </select>
            </div>
            <div class="col">
                <label>Category Product :</label>
                <select name="category_product" id="">
                    <?php
                    foreach ($category as $key => $cate) {
                        ?>
                        <option <?php
                                    if ($pro['id_category_product'] == $cate['id_category_product']) {
                                        echo 'selected';
                                    }
                                    ?> value="<?php echo $cate['id_category_product'] ?>"><?php echo $cate['title_category_product'] ?></option>                
                    <?php } ?>
                </select>
            </div>
            <div class="form-group">
                <label for="describeCategory">Describe Product</label>
                <textarea type="text" id="editor1" name="desc_product" class="form-control" required><?php echo $pro['desc_product']; ?></textarea>
            </div>
            <button id="btn" type="submit" class="btn btn-primary">Update product</button>
        </form>
    <?php } ?>
</div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <%@include file="../footer.jsp" %>


