<%-- 
    Document   : details_order
    Created on : Dec 9, 2023, 7:14:23 PM
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_details_order.css">
        <title>Detail Order</title>
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <section class="vh-100 gradient-custom-2" id="section">
                    <div class="container py-5 h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-md-10 col-lg-8 col-xl-6">

                                <div class="card card-stepper" style="border-radius: 16px;">

                                    <div class="card-header p-4">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>                              
                                                <?php
                                                foreach ($details_info as $key => $info) {
                                                ?>
                                                <p class="text-muted mb-2"> Details Order: <span class="fw-bold text-body"><?php echo $info['code_order'] ?></span></p>
                                                <div class="d-flex flex-row mb-4 pb-2">
                                                    <div class="flex-fill">
                                                        <p class="bold">Name Customer: <span class="fw-bold text-body"><?php echo $info['name'] ?></span></p>
                                                        <p class="text-muted">Phone: <span class="fw-bold text-body"><?php echo $info['phone'] ?></span></p>
                                                        <p class="text-muted">Address: <span class="fw-bold text-body"><?php echo $info['address'] ?></span></p>
                                                        <p class="text-muted">Email: <span class="fw-bold text-body"><?php echo $info['email'] ?></span></p>
                                                        <p class="text-muted">Note: <span class="fw-bold text-body"><?php echo $info['content'] ?></span></p>
                                                    </div>
                                                </div>
                                                <?php
                                                }
                                                ?>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="card-body p-4">
                                        <?php
                                        $total = 0;
                                        foreach ($details_orders as $key => $details) {
                                        $total += $details['price_product'] * $details['quantity_product'];
                                        ?>
                                        <div class="d-flex flex-row mb-4 pb-2">
                                            <div class="flex-fill">
                                                <h5 class="bold">Name Product: <?php echo $details['title_product'] ?></h5>
                                                <p class="text-muted">Quantity: <?php echo $details['quantity_product'] ?></p>
                                                <h6 class="mb-3"> <?php echo number_format($details['price_product'], 0, ',', '.') . 'đ/1' ?></h6>
                                                <h5 class="mb-3"> The total amount: <?php echo number_format($details['price_product'] * $details['quantity_product'], 0, ',', '.') . 'đ' ?></h5>
                                                <p class="text-muted">Time Order: <span class="text-body"><?php echo $details['date_order'] ?></span></p>
                                            </div>
                                            <div>
                                                <img class="align-self-center img-fluid" id="image" src="<?php echo BASE_URL ?>public/uploads/product/imageproduct/<?php echo $details['image_product'] ?>" width="250">
                                            </div>
                                        </div>
                                        <?php
                                        }
                                        ?>

                                        <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4">
                                            <li class="step0 active" id="step1"><span style="margin-left: 22px; margin-top: 12px;">PLACED</span></li>
                                            <li class="step0 active text-center" id="step2"><span>SHIPPED</span></li>
                                            <li class="step0 text-muted text-end" id="step3"><span style="margin-right: 22px;">DELIVERED</span></li>
                                        </ul>
                                    </div>
                                    <div class="card-footer p-4">
                                        <h6 class="text-muted mb-2"> Total amount: <span class="fw-bold text-body"><?php echo number_format($total, 0, ',', '.') . 'đ' ?></span></h6>
                                        <button type="submit" class="btn btn-warning"><a style="text-decoration: none; color: black;" href="<?php echo BASE_URL ?>order/orderConfirm/<?php echo $details['code_order'] ?>">Processed</a></button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <%@include file="../footer.jsp" %>
