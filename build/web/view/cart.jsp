<%-- 
    Document   : cart
    Created on : Dec 19, 2023, 11:56:20 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart</title>

        <!--          - favicon-->

        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">

        <!--          - custom css link-->
        <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">
        <link rel="stylesheet" href="<c:url value="/assets/css/style_cart.css" />">

        <!--          - google font link-->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

    </head>

    <body>


        <div class="overlay" data-overlay></div>

        <!--          - NOTIFICATION TOAST-->


        <div class="notification-toast" data-toast>

            <button class="toast-close-btn" data-toast-close>
                <ion-icon name="close-outline"></ion-icon>
            </button>

            <div class="toast-banner">
                <img src="./assets/images/products/jewellery-1.jpg" alt="Rose Gold Earrings" width="80" height="70">
            </div>

            <div class="toast-detail">

                <p class="toast-message">
                    Someone in new just bought
                </p>

                <p class="toast-title">
                    Rose Gold Earrings
                </p>

                <p class="toast-meta">
                    <time datetime="PT2M">2 Minutes</time> ago
                </p>

            </div>

        </div>

        <!--          - HEADER-->


        <%@include file="header.jsp" %>

        <!--          - MAIN-->
        <main>

            <div class="breadcrumbs">
                <ol itemscope itemtype="http://schema.org/BreadcrumbList">
                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <a itemprop="item" href="home">
                            <span itemprop="name">Home Page / </span></a>
                        <meta itemprop="position" content="1" />
                    </li>

                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <span itemprop="item">
                            <strong itemprop="name">
                                &nbspCart
                            </strong>
                        </span>
                        <meta itemprop="position" content="" />
                    </li>
                </ol>
            </div>

            <div class="content_cart">
                <div class="container_cart">
                    <div class="container_cart_top">
                        <ul>
                            <c:set var="count" value="${0}"></c:set>
                            <c:forEach items="${sessionScope.cart}" var="cart" >
                                <c:set var="count" value="${count + 1}"></c:set>
                            </c:forEach>
                            <li>All products (${count})</li>
                            <li>Unit price</li>
                            <li>Quantity</li>
                            <li>Into money</li>
                            <li><a href="#"><ion-icon name="trash-outline"></ion-icon></a></li>
                        </ul>
                    </div>
                   
                    <div class="container_cart_center">
                        <c:set var="total" value="${0}"></c:set>
                        <c:forEach items="${sessionScope.cart}" var="map" >
                        <ul>
                            <li>
                                <div class="img_product_cart">
                                    <img src="${pageContext.request.contextPath}/assets/images/product/${map.value.product.imgProduct}"
                                         alt="">
                                </div>
                                <div class="title_product_cart">
                                    <p>${map.value.product.titleProduct}</p>
                                    <p>In Stock: ${map.value.product.quantityProduct}</p>
                                </div>
                            </li>
                            <li><fmt:formatNumber type="currency" value="${map.value.product.priceProduct * 0.9}" pattern="###,###₫" /></li>
                            <li>
                                <div class="wrapper">
                                    <span class="minus">-</span>
                                    <span class="num">${map.value.quantity}</span>
                                    <span class="plus">+</span>
                                </div>
                            </li>
                            <li><fmt:formatNumber type="currency" value="${map.value.product.priceProduct*0.9 * map.value.quantity}" pattern="###,###₫" /></li>
                            <li><a href="${pageContext.request.contextPath}/member/cart_delete?pid=${map.value.product.idProduct}"><ion-icon name="trash-outline"></ion-icon></a></li>
                            <c:set var="total" value="${total + map.value.product.priceProduct*0.9 * map.value.quantity}"></c:set>
                        </ul>
                        </c:forEach>
                    </div>                    

                    <div class="container_cart_bottom">
                        <a href="#"><span><ion-icon name="arrow-back-outline"></ion-icon></span>&nbsp Continue to shopping</a>
                    </div>
                </div>



                <div class="container_info">
                    <div class="container_info_top">
                        <div class="block_header">
                            <p>Delivery to</p>
                            <p><a href="#"><button class="btn_add_to_cart">Update Information</button></a></p>
                        </div>

                        <div class="block_info">
                            <p>Full Name: ${sessionScope.account.fullName != null ? sessionScope.account.fullName : '(Please update your full name!)'}</p>
                            <p>Phone: ${sessionScope.account.phone != null ? sessionScope.account.phone : '(Please update your phone number!)'}</p>
                            <p>Address: ${sessionScope.account.address != null ? sessionScope.account.address : '(Please update your address!)'}</p>
                        </div>
                    </div>

                    <div class="container_info_center">
                        <ul class="temporary">
                            <li>Temporary</li>
                            <li><fmt:formatNumber type="currency" value="${total}" pattern="###,###₫" /></li>
                        </ul>

                        <ul class="into_money">
                            <li>Into money</li>
                            <li><fmt:formatNumber type="currency" value="${total}" pattern="###,###₫" /><p>(VAT included if any)</p></li>
                        </ul>
                    </div>
                    
                    <button class="btn_buy">Buy Now</button>
                </div>
            </div>

        </div>


    </main>
    <!--          - FOOTER-->

    <%@include file="footer.jsp" %>

    <!--          - custom js link-->

    <script src="<c:url value="/assets/js/script.js" />"></script>

    <!--          - ionicon link-->

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <script src="${pageContext.request.contextPath}/assets/js/script_cart.js"></script>
</body>

</html>
