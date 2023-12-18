<%-- 
    Document   : list_product
    Created on : Dec 9, 2023, 6:55:31 PM
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
        <title>AdminSite</title>
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <h4>List Product</h4>
                <table class="table table-striped" id="table_list">
                    <thead>
                        <tr>
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
                        <?php
                        $i = 0;
                        foreach ($category as $key => $pro) {
                        $i++;?>
                        <tr>
                            <td><?php echo $i ?></td>
                            <td><?php echo $pro['title_product'] ?></td>
                            <td><img class="image" src="<?php echo BASE_URL ?>public/uploads/product/imageproduct/<?php echo $pro['image_product'] ?>" height="100px" width="100px"></td>
                            <td><?php echo $pro['title_category_product'] ?></td>
                            <td>
                                <?php
                                echo is_numeric($pro['price_product']) ? number_format($pro['price_product'], 0, ',', '.') . 'đ' : '0đ';
                                ?>
                            </td>
                            <td><?php echo $pro['quantity_product'] ?></td>
                            <td><?php if($pro['product_hot'] == 1) echo 'Yes';
                                else echo 'No'; ?></td>
                            <td><?php echo $pro['desc_product'] ?></td>
                            <td><button type="button" class="btn btn-danger"><a href="<?php echo BASE_URL ?>product/deleteProduct/<?php echo $pro['id_product'] ?>">Delete</button>
                                <button type="button" class="btn btn-warning"><a href="<?php echo BASE_URL ?>product/editProduct/<?php echo $pro['id_product'] ?>">Update</a></button>
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
