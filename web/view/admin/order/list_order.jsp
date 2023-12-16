<%-- 
    Document   : list_order
    Created on : Dec 9, 2023, 7:12:50 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    h4 {
        text-align: center;
        padding: 10px;
    }

    #table_list {
        width: 95%;
    }

    .btn a {
        text-decoration: none;
        color: white;
    }

    .image {
        object-fit: cover;
        border-radius: 5%;
        box-shadow: 5px 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
</style>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>AdminSite</title>
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <table class="table table-striped">
    <thead>
        <tr>
            <th>Id Order</th>
            <th>Code Order</th>
            <th>Date Order</th>
            <th>Status Order</th>
            <th>Manager</th>
        </tr>
    </thead>

    <tbody>
        <?php
        $i = 0;
        foreach($orders as $key => $order){
            $i++; ?>

    <tr>
        <td><?php echo $i ?></td>
        <td><?php echo $order['code_order'] ?></td> 
        <td><?php echo $order['date_order'] ?></td>
        <td><?php if ($order['status_order'] == 0) {
            echo 'Not yet received!';
        } else {
            echo 'Processed!';
        } ?></td>
        <td>
            <button type="button" class="btn btn-warning"><a href="<?php echo BASE_URL ?>order/detailsOrder/<?php echo $order['code_order'] ?>">View Orders</button>          
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
