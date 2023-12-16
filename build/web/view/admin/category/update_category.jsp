<%-- 
    Document   : update_category
    Created on : Dec 9, 2023, 7:07:24 PM
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
                <div class="container-form-update-article">
    <h4>Edit Category Product</h4>
    <?php
    foreach($categorybyid as $key => $cate) {
        ?> 
    <form action="<?php echo BASE_URL ?>/product/updateCategoryProduct/<?php echo $cate['id_category_product'] ?>" method="post">
        <div class="form-group">
            <label for="nameCategory">Name Category Product</label>
            <input type="text" value="<?php echo $cate['title_category_product'] ?>" name="title_category_product" class=" form-control" >
        </div>
        <div class="form-group">
            <label for="describeArticle">Describe Category Product</label>
            <textarea type="text" value="<?php echo $cate['desc_category_product'] ?>" name="desc_category_product" class=" form-control" ></textarea>
        </div>
        <button id="btn" type="submit" class="btn btn-primary">Update Category Product</button>
    </form>
    <?php
    } ?>
</div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <%@include file="../footer.jsp" %>
