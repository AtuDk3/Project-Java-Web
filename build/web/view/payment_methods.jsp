<%-- 
    Document   : payment_methods
    Created on : Dec 31, 2023, 8:30:38 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .logo-momo {
        width: 50px;
        height: auto;
        margin-right: 10px;
        border-radius: 5px;
        object-fit: cover;
    }

    .logo {
        width: 150px;
        height: auto;
        margin-right: 10px;
        border-radius: 5px;
        object-fit: cover;
    }

    #btn-pay-method {
        background-color: #fff;
    }

    #btn-pay-method:hover {
        background-color: #dee2e6;
        transition: background-color 0.3s;
    }
</style>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Methods</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo/logo.png" type="image/x-icon">
    </head>
    <body>
        <section style="background-color: #eee;">
            <div class="container py-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row d-flex justify-content-center pb-5">
                            <div class="col-md-7 col-xl-5 mb-4 mb-md-0">
                                <div class="py-4 d-flex flex-row">
                                    <h5><span class="far fa-check-square pe-2"></span><b>One Piece Shop</b> |</h5>
                                    <span class="ps-2">Pay</span>
                                </div>
                                <h4>Payment methods</h4>
                                <div class="pt-2">
                                    <div class="d-flex pb-2">
                                        <div class="ms-auto">
                                            <p class="text-primary">
                                                <a style="text-decoration: none;" href="${pageContext.request.contextPath}/home"><i class="fas fa-plus-circle text-primary pe-1"></i>Go to >> Homepage</a>
                                            </p>
                                        </div>
                                    </div>
                                    <p>
                                        This is an estimate for the portion of your order (not covered by
                                        insurance) due today . once insurance finalizes their review refunds
                                        and/or balances will reconcile automatically.
                                    </p>
                                    <form action="${pageContext.request.contextPath}/member/cart/buy" method="post">
                                        <div class="d-flex flex-row pb-3">
                                            <button id="btn-pay-method" type="submit" class="rounded border d-flex w-100 p-3 align-items-center">Payment In Cash</button>
                                        </div>
                                    </form>

                                    <form class="" method="POST" target="_blank" enctype="application/x-www-form-urlencoded" action="">
                                        <div class="d-flex flex-row pb-3">
                                            <button name="momo" id="btn-pay-method" type="submit" class="rounded border d-flex w-100 p-3 align-items-center"><img src="${pageContext.request.contextPath}/assets/images/logo-momo.webp" alt="Momo Logo" class="logo-momo">Payment Via MOMO QR</button>
                                        </div>
                                    </form>

                                    <form class="" method="POST" target="_blank" enctype="application/x-www-form-urlencoded" action="<?php echo BASE_URL ?>cart/momoATMProcessing">
                                        <div class="d-flex flex-row pb-3">
                                            <button id="btn-pay-method" type="submit" class="rounded border d-flex w-100 p-3 align-items-center"><img src="${pageContext.request.contextPath}/assets/images/logo-momo.webp" alt="Momo Logo" class="logo-momo">Payment Via MOMO ATM</button>
                                        </div>
                                    </form>

                                    <form action="${pageContext.request.contextPath}/member/payment_vnp" method="post" enctype="application/x-www-form-urlencoded">
                                        <div class="d-flex flex-row pb-3">
                                            <button id="btn-pay-method" type="submit" class="rounded border d-flex w-100 p-3 align-items-center"><img src="${pageContext.request.contextPath}/assets/images/logo-vnpay.jpg" alt="VNPAY Logo" class="logo">Payment Via VNPAY</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    </section>
                    </body>
                    </html>

