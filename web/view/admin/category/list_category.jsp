<%-- 
    Document   : list_category
    Created on : Dec 9, 2023, 7:10:07 PM
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
        <link rel="stylesheet" href="http://localhost:8080/Ecommer_Website/assets/css/admin/style_list.css">
        <title>AdminSite</title>
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <h4>List Category Product</h4>

<table class="table table-striped">
    <thead>
        <tr>
            <th>Id</th>
            <th>Name Category Product</th>
            <th>Describe Category Product</th>
            <th>Manager</th>
        </tr>
    </thead>

    <tbody>
        <?php
        $i = 0;
        foreach($category as $key => $cate){
            $i++; ?>

    <tr>
        <td><?php echo $i ?></td>
        <td><?php echo $cate['title_category_product'] ?></td> 
        <td><?php echo $cate['desc_category_product'] ?></td>
        <td>
            <button type="button" class="btn btn-danger"><a href="<?php echo BASE_URL ?>product/deleteCategory/<?php echo $cate['id_category_product'] ?>">Delete</button> 
            <button type="button" class="btn btn-warning"><a href="<?php echo BASE_URL ?>product/editCategory/<?php echo $cate['id_category_product'] ?>">Update</a></button>
        </td>
    </tr>
<?php
} ?>
</tbody>
</table>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <%@include file="../footer.jsp" %>
