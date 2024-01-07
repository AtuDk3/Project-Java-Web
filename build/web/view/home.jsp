<%-- 
    Document   : home
    Created on : Dec 13, 2023, 7:53:22 PM
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
        <title>One Piece Shop</title>


        <!--          - favicon-->

        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">


        <!--          - custom css link-->

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">


        <!--          - google font link-->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

    </head>

    <body>


        <div class="overlay" data-overlay></div>

        <!--          - MODAL-->

        <div class="modal" data-modal>

            <div class="modal-close-overlay" data-modal-overlay></div>

            <div class="modal-content">

                <button class="modal-close-btn" data-modal-close>
                    <ion-icon name="close-outline"></ion-icon>
                </button>

                <div class="newsletter-img">
                    <img src="./assets/images/newsletter.png" alt="subscribe newsletter" width="400" height="400">
                </div>

                <div class="newsletter">

                    <form action="#">

                        <div class="newsletter-header">

                            <h3 class="newsletter-title">Subscribe Newsletter.</h3>

                            <p class="newsletter-desc">
                                Subscribe the <b>Anon</b> to get latest products and discount update.
                            </p>

                        </div>

                        <input type="email" name="email" class="email-field" placeholder="Email Address" required>

                        <button type="submit" class="btn-newsletter">Subscribe</button>

                    </form>

                </div>

            </div>

        </div>


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


            <!--              - BANNER-->


            <%@include file="banner.jsp" %>





            <!--              - PRODUCT-->


            <div class="product-container">

                <div class="container">



                    <!--                      - SIDEBAR-->


                    <div class="sidebar  has-scrollbar" data-mobile-menu>

                        <div class="sidebar-category">

                            <div class="sidebar-top">
                                <h2 class="sidebar-title">Category</h2>

                                <button class="sidebar-close-btn" data-mobile-menu-close-btn>
                                    <ion-icon name="close-outline"></ion-icon>
                                </button>
                            </div>


                            <ul class="sidebar-menu-category-list">

                                <li class="sidebar-menu-category">

                                    <button class="sidebar-accordion-menu" data-accordion-btn>

                                        <div class="menu-title-flex">
                                            <img src="./assets/images/icons/posters.png" alt="clothes" width="30" height="30"
                                                 class="menu-title-img">

                                            <p class="menu-title">Posters</p>
                                        </div>

                                        <div>
                                            <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                            <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                        </div>

                                    </button>

                                    <ul class="sidebar-submenu-category-list" data-accordion>
                                        <c:forEach items="${requestScope.categoryPosters}" var="catePosters" >
                                            <li class="sidebar-submenu-category">
                                                <a href="#" class="sidebar-submenu-title">
                                                    <p class="product-name">${catePosters.titleCategoryProduct}</p>
                                                    <data value="300" class="stock" title="Available Stock">300</data>
                                                </a>
                                            </li>

                                        </c:forEach>
                                    </ul>

                                </li>

                                <li class="sidebar-menu-category">

                                    <button class="sidebar-accordion-menu" data-accordion-btn>

                                        <div class="menu-title-flex">
                                            <img src="./assets/images/icons/toy.png" alt="clothes" width="30" height="30"
                                                 class="menu-title-img">

                                            <p class="menu-title">Figures & Toys</p>
                                        </div>

                                        <div>
                                            <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                            <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                        </div>

                                    </button>

                                    <ul class="sidebar-submenu-category-list" data-accordion>
                                        <c:forEach items="${requestScope.categoryFiguresToys}" var="cateFiguresToys" >
                                            <li class="sidebar-submenu-category">
                                                <a href="#" class="sidebar-submenu-title">
                                                    <p class="product-name">${cateFiguresToys.titleCategoryProduct}</p>
                                                    <data value="300" class="stock" title="Available Stock">300</data>
                                                </a>
                                            </li>

                                        </c:forEach>
                                    </ul>

                                </li>

                                <li class="sidebar-menu-category">

                                    <button class="sidebar-accordion-menu" data-accordion-btn>

                                        <div class="menu-title-flex">
                                            <img src="./assets/images/icons/clothers.png" alt="clothes" width="30" height="30"
                                                 class="menu-title-img">

                                            <p class="menu-title">Clothers</p>
                                        </div>

                                        <div>
                                            <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                            <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                        </div>

                                    </button>

                                    <ul class="sidebar-submenu-category-list" data-accordion>
                                        <c:forEach items="${requestScope.categoryClothers}" var="cateClothers" >
                                            <li class="sidebar-submenu-category">
                                                <a href="#" class="sidebar-submenu-title">
                                                    <p class="product-name">${cateClothers.titleCategoryProduct}</p>
                                                    <data value="300" class="stock" title="Available Stock">300</data>
                                                </a>
                                            </li>

                                        </c:forEach>
                                    </ul>

                                </li>

                                <li class="sidebar-menu-category">

                                    <button class="sidebar-accordion-menu" data-accordion-btn>

                                        <div class="menu-title-flex">
                                            <img src="./assets/images/icons/accessories.png" alt="clothes" width="30" height="30"
                                                 class="menu-title-img">

                                            <p class="menu-title">Accessories</p>
                                        </div>

                                        <div>
                                            <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                            <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                        </div>

                                    </button>

                                    <ul class="sidebar-submenu-category-list" data-accordion>
                                        <c:forEach items="${requestScope.categoryAccessories}" var="cateAccessories" >
                                            <li class="sidebar-submenu-category">
                                                <a href="#" class="sidebar-submenu-title">
                                                    <p class="product-name">${cateAccessories.titleCategoryProduct}</p>
                                                    <data value="300" class="stock" title="Available Stock">300</data>
                                                </a>
                                            </li>

                                        </c:forEach>
                                    </ul>

                                </li>

                            </ul>

                        </div>

                        <div class="product-showcase">

                            <h3 class="showcase-heading">best sellers</h3>

                            <div class="showcase-wrapper">

                                <div class="showcase-container">
                                    <c:forEach items="${requestScope.top5BestSellerProduct}" var="top5BestSellerProduct" >
                                        <div class="showcase">

                                            <a href="${pageContext.request.contextPath}/product_details?pid=${top5BestSellerProduct.idProduct}&cid=${top5BestSellerProduct.categoryProduct.idCategoryProduct}" class="showcase-img-box">
                                                <img src="${pageContext.request.contextPath}/assets/images/uploads/product/${top5BestSellerProduct.imgProduct}" alt="${top5BestSellerProduct.titleProduct}" width="75" height="75"
                                                     class="showcase-img">
                                            </a>

                                            <div class="showcase-content">

                                                <a href="${pageContext.request.contextPath}/product_details?pid=${top5BestSellerProduct.idProduct}&cid=${top5BestSellerProduct.categoryProduct.idCategoryProduct}">
                                                    <h4 class="showcase-title">${top5BestSellerProduct.imgProduct}</h4>
                                                </a>

                                                <div class="showcase-rating">
                                                    <ion-icon name="star"></ion-icon>
                                                    <ion-icon name="star"></ion-icon>
                                                    <ion-icon name="star"></ion-icon>
                                                    <ion-icon name="star"></ion-icon>
                                                    <ion-icon name="star"></ion-icon>
                                                </div>

                                                <div class="price-box">
                                                    <del><fmt:formatNumber type="currency" value="${top5BestSellerProduct.priceProduct}" pattern="###,###đ" /></del>
                                                    <p class="price"><fmt:formatNumber type="currency" value="${top5BestSellerProduct.priceProduct * 0.9}" pattern="###,###đ" /></p>
                                                </div>

                                            </div>

                                        </div>
                                    </c:forEach>
                                </div>

                            </div>

                        </div>

                    </div>



                    <div class="product-box">


                        <!--                          - PRODUCT MINIMAL-->


                        <div class="product-minimal">

                            <div class="product-showcase">

                                <h2 class="title">Hot Product</h2>

                                <div class="showcase-wrapper has-scrollbar">

                                    <div class="showcase-container">
                                        <c:forEach items="${requestScope.top5HotProducts}" var="top5HotProducts" >
                                            <div class="showcase">

                                                <a href="${pageContext.request.contextPath}/product_details?pid=${top5HotProducts.idProduct}&cid=${top5HotProducts.categoryProduct.idCategoryProduct}" class="showcase-img-box">
                                                    <img src="${pageContext.request.contextPath}/assets/images/uploads/product/${top5HotProducts.imgProduct}" alt="${top5HotProducts.titleProduct}" class="showcase-img"
                                                         width="70" height="70">
                                                </a>

                                                <div class="showcase-content">

                                                    <a href="${pageContext.request.contextPath}/product_details?pid=${top5HotProducts.idProduct}&cid=${top5HotProducts.categoryProduct.idCategoryProduct}">
                                                        <h4 class="showcase-title">${top5HotProducts.titleProduct}</h4>
                                                    </a>

                                                    <c:url var="editURL" value="/product/list">
                                                        <c:param name="cid" value="${top5HotProducts.categoryProduct.idCategoryProduct}" /></c:url>
                                                    <a href="${editURL}&index1=-2" class="showcase-category">${top5HotProducts.categoryProduct.titleCategoryProduct}</a>

                                                    <div class="price-box">
                                                        <p class="price"><fmt:formatNumber type="currency" value="${top5HotProducts.priceProduct * 0.9}" pattern="###,###đ" /></p>
                                                        <del><fmt:formatNumber type="currency" value="${top5HotProducts.priceProduct}" pattern="###,###đ" /></del>
                                                    </div>

                                                </div>

                                            </div>
                                        </c:forEach>
                                    </div>                          

                                </div>

                            </div>

                            <div class="product-showcase">

                                <h2 class="title">Trending</h2>

                                <div class="showcase-wrapper  has-scrollbar">

                                    <div class="showcase-container">
                                        <c:forEach items="${requestScope.productModel}" var="proModel" >
                                            <div class="showcase">

                                                <a href="#" class="showcase-img-box">
                                                    <img src="./assets/images/product/${proModel.imgProduct}" alt="running & trekking shoes - white" class="showcase-img"
                                                         width="70" height="70">
                                                </a>

                                                <div class="showcase-content">

                                                    <a href="#">
                                                        <h4 class="showcase-title">${proModel.titleProduct}</h4>
                                                    </a>

                                                    <a href="#" class="showcase-category">${proModel.categoryProduct.titleCategoryProduct}</a>

                                                    <div class="price-box">
                                                        <p class="price">${proModel.priceProduct}</p>
                                                        <del>${proModel.priceProduct}</del>
                                                    </div>

                                                </div>

                                            </div>
                                        </c:forEach>
                                    </div>                                

                                </div>

                            </div>

                            <div class="product-showcase">

                                <h2 class="title">Top Rated</h2>

                                <div class="showcase-wrapper  has-scrollbar">

                                    <div class="showcase-container">

                                        <div class="showcase">

                                            <a href="#" class="showcase-img-box">
                                                <img src="./assets/images/products/watch-3.jpg" alt="pocket watch leather pouch" class="showcase-img"
                                                     width="70">
                                            </a>

                                            <div class="showcase-content">

                                                <a href="#">
                                                    <h4 class="showcase-title">Pocket Watch Leather Pouch</h4>
                                                </a>

                                                <a href="#" class="showcase-category">Watches</a>

                                                <div class="price-box">
                                                    <p class="price">$50.00</p>
                                                    <del>$34.00</del>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="showcase">

                                            <a href="#" class="showcase-img-box">
                                                <img src="./assets/images/products/jewellery-3.jpg" alt="silver deer heart necklace" class="showcase-img"
                                                     width="70">
                                            </a>

                                            <div class="showcase-content">

                                                <a href="#">
                                                    <h4 class="showcase-title">Silver Deer Heart Necklace</h4>
                                                </a>

                                                <a href="#" class="showcase-category">Jewellery</a>

                                                <div class="price-box">
                                                    <p class="price">$84.00</p>
                                                    <del>$30.00</del>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="showcase">

                                            <a href="#" class="showcase-img-box">
                                                <img src="./assets/images/products/perfume.jpg" alt="titan 100 ml womens perfume" class="showcase-img"
                                                     width="70">
                                            </a>

                                            <div class="showcase-content">

                                                <a href="#">
                                                    <h4 class="showcase-title">Titan 100 Ml Womens Perfume</h4>
                                                </a>

                                                <a href="#" class="showcase-category">Perfume</a>

                                                <div class="price-box">
                                                    <p class="price">$42.00</p>
                                                    <del>$10.00</del>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="showcase">

                                            <a href="#" class="showcase-img-box">
                                                <img src="./assets/images/products/belt.jpg" alt="men's leather reversible belt" class="showcase-img"
                                                     width="70">
                                            </a>

                                            <div class="showcase-content">

                                                <a href="#">
                                                    <h4 class="showcase-title">Men's Leather Reversible Belt</h4>
                                                </a>

                                                <a href="#" class="showcase-category">Belt</a>

                                                <div class="price-box">
                                                    <p class="price">$24.00</p>
                                                    <del>$10.00</del>
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase-container">

                                        <div class="showcase">

                                            <a href="#" class="showcase-img-box">
                                                <img src="./assets/images/products/jewellery-2.jpg" alt="platinum zircon classic ring" class="showcase-img"
                                                     width="70">
                                            </a>

                                            <div class="showcase-content">

                                                <a href="#">
                                                    <h4 class="showcase-title">platinum Zircon Classic Ring</h4>
                                                </a>

                                                <a href="#" class="showcase-category">jewellery</a>

                                                <div class="price-box">
                                                    <p class="price">$62.00</p>
                                                    <del>$65.00</del>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="showcase">

                                            <a href="#" class="showcase-img-box">
                                                <img src="./assets/images/products/watch-1.jpg" alt="smart watche vital plus" class="showcase-img" width="70">
                                            </a>

                                            <div class="showcase-content">

                                                <a href="#">
                                                    <h4 class="showcase-title">Smart watche Vital Plus</h4>
                                                </a>

                                                <a href="#" class="showcase-category">Watches</a>

                                                <div class="price-box">
                                                    <p class="price">$56.00</p>
                                                    <del>$78.00</del>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="showcase">

                                            <a href="#" class="showcase-img-box">
                                                <img src="./assets/images/products/shampoo.jpg" alt="shampoo conditioner packs" class="showcase-img"
                                                     width="70">
                                            </a>

                                            <div class="showcase-content">

                                                <a href="#">
                                                    <h4 class="showcase-title">shampoo conditioner packs</h4>
                                                </a>

                                                <a href="#" class="showcase-category">cosmetics</a>

                                                <div class="price-box">
                                                    <p class="price">$20.00</p>
                                                    <del>$30.00</del>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="showcase">

                                            <a href="#" class="showcase-img-box">
                                                <img src="./assets/images/products/jewellery-1.jpg" alt="rose gold peacock earrings" class="showcase-img"
                                                     width="70">
                                            </a>

                                            <div class="showcase-content">

                                                <a href="#">
                                                    <h4 class="showcase-title">Rose Gold Peacock Earrings</h4>
                                                </a>

                                                <a href="#" class="showcase-category">jewellery</a>

                                                <div class="price-box">
                                                    <p class="price">$20.00</p>
                                                    <del>$30.00</del>
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>




                        <!--                          - PRODUCT FEATURED-->


                        <div class="product-featured">

                            <h2 class="title">Deal of the day</h2>

                            <div class="showcase-wrapper has-scrollbar">

                                <div class="showcase-container">

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <img src="./assets/images/products/shampoo.jpg" alt="shampoo, conditioner & facewash packs" class="showcase-img">
                                        </div>

                                        <div class="showcase-content">

                                            <div class="showcase-rating">
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                            </div>

                                            <a href="#">
                                                <h3 class="showcase-title">shampoo, conditioner & facewash packs</h3>
                                            </a>

                                            <p class="showcase-desc">
                                                Lorem ipsum dolor sit amet consectetur Lorem ipsum
                                                dolor dolor sit amet consectetur Lorem ipsum dolor
                                            </p>

                                            <div class="price-box">
                                                <p class="price">$150.00</p>

                                                <del>$200.00</del>
                                            </div>

                                            <button class="add-cart-btn">add to cart</button>

                                            <div class="showcase-status">
                                                <div class="wrapper">
                                                    <p>
                                                        already sold: <b>20</b>
                                                    </p>

                                                    <p>
                                                        available: <b>40</b>
                                                    </p>
                                                </div>

                                                <div class="showcase-status-bar"></div>
                                            </div>

                                            <div class="countdown-box">

                                                <p class="countdown-desc">
                                                    Hurry Up! Offer ends in:
                                                </p>

                                                <div class="countdown">

                                                    <div class="countdown-content">

                                                        <p class="display-number">360</p>

                                                        <p class="display-text">Days</p>

                                                    </div>

                                                    <div class="countdown-content">
                                                        <p class="display-number">24</p>
                                                        <p class="display-text">Hours</p>
                                                    </div>

                                                    <div class="countdown-content">
                                                        <p class="display-number">59</p>
                                                        <p class="display-text">Min</p>
                                                    </div>

                                                    <div class="countdown-content">
                                                        <p class="display-number">00</p>
                                                        <p class="display-text">Sec</p>
                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                                <div class="showcase-container">

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <img src="./assets/images/products/jewellery-1.jpg" alt="Rose Gold diamonds Earring" class="showcase-img">
                                        </div>

                                        <div class="showcase-content">

                                            <div class="showcase-rating">
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                            </div>

                                            <h3 class="showcase-title">
                                                <a href="#" class="showcase-title">Rose Gold diamonds Earring</a>
                                            </h3>

                                            <p class="showcase-desc">
                                                Lorem ipsum dolor sit amet consectetur Lorem ipsum
                                                dolor dolor sit amet consectetur Lorem ipsum dolor
                                            </p>

                                            <div class="price-box">
                                                <p class="price">$1990.00</p>
                                                <del>$2000.00</del>
                                            </div>

                                            <button class="add-cart-btn">add to cart</button>

                                            <div class="showcase-status">
                                                <div class="wrapper">
                                                    <p> already sold: <b>15</b> </p>

                                                    <p> available: <b>40</b> </p>
                                                </div>

                                                <div class="showcase-status-bar"></div>
                                            </div>

                                            <div class="countdown-box">

                                                <p class="countdown-desc">Hurry Up! Offer ends in:</p>

                                                <div class="countdown">
                                                    <div class="countdown-content">
                                                        <p class="display-number">360</p>
                                                        <p class="display-text">Days</p>
                                                    </div>

                                                    <div class="countdown-content">
                                                        <p class="display-number">24</p>
                                                        <p class="display-text">Hours</p>
                                                    </div>

                                                    <div class="countdown-content">
                                                        <p class="display-number">59</p>
                                                        <p class="display-text">Min</p>
                                                    </div>

                                                    <div class="countdown-content">
                                                        <p class="display-number">00</p>
                                                        <p class="display-text">Sec</p>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>




                        <!--                          - PRODUCT GRID-->


                        <div class="product-main">
                            <c:forEach items="${requestScope.categoryProduct}" var="categoryProduct" >
                                <div class="product-main-top">
                                    <h2 class="title">${categoryProduct.titleCategoryProduct}</h2>

                                    <c:url var="editURL" value="/product/list">
                                        <c:param name="cid" value="${categoryProduct.idCategoryProduct}" /></c:url>

                                        <a href="${editURL}&index1=-2"><button class="btn_see_more">See more</button></a>
                                </div>
                                <div class="product-grid">
                                    <c:forEach items="${requestScope.topProducts}" var="topProducts" >
                                        <c:if test="${categoryProduct.idCategoryProduct == topProducts.categoryProduct.idCategoryProduct}">
                                            <div class="showcase">

                                                <div class="showcase-banner">

                                                    <img src="${pageContext.request.contextPath}/assets/images/uploads/product/${topProducts.imgProduct}" alt="Mens Winter Leathers Jackets" width="300" class="product-img default">
                                                    <img src="${pageContext.request.contextPath}/assets/images/uploads/product/${topProducts.imgProduct}" alt="Mens Winter Leathers Jackets" width="300" class="product-img hover">

                                                    <c:choose>
                                                        <c:when test="${topProducts.hotProduct == 1}">
                                                            <p class="showcase-badge angle black">hot</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p class="showcase-badge angle pink">sale</p>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <div class="showcase-actions">

                                                        <a href="#"><button class="btn-action">
                                                                <ion-icon name="heart-outline"></ion-icon>
                                                            </button></a>

                                                        <a href="${pageContext.request.contextPath}/product_details?pid=${topProducts.idProduct}&cid=${topProducts.categoryProduct.idCategoryProduct}"><button class="btn-action">
                                                                <ion-icon name="eye-outline"></ion-icon>
                                                            </button></a>

                                                        <a href="url"><button class="btn-action">
                                                                <ion-icon name="repeat-outline"></ion-icon>
                                                            </button></a>

                                                        <a href="${pageContext.request.contextPath}/member/cart_add?pid=${topProducts.idProduct}&quantity=1"><button class="btn-action">
                                                                <ion-icon name="bag-add-outline"></ion-icon>
                                                            </button></a>

                                                    </div>

                                                </div>

                                                <div class="showcase-content">

                                                    <a href="${editURL}&index1=-2" class="showcase-category">${topProducts.categoryProduct.titleCategoryProduct}</a>

                                                    <a href="${pageContext.request.contextPath}/product_details?pid=${topProducts.idProduct}&cid=${topProducts.categoryProduct.idCategoryProduct}">
                                                        <h3 class="showcase-title">${topProducts.titleProduct}</h3>
                                                    </a>

                                                    <div class="showcase-rating">
                                                        <ion-icon name="star"></ion-icon>
                                                        <ion-icon name="star"></ion-icon>
                                                        <ion-icon name="star"></ion-icon>
                                                        <ion-icon name="star-outline"></ion-icon>
                                                        <ion-icon name="star-outline"></ion-icon>
                                                    </div>

                                                    <div class="price-box">
                                                        <p class="price"><fmt:formatNumber type="currency" value="${topProducts.priceProduct * 0.9}" pattern="###,###₫" /></p>
                                                        <del><fmt:formatNumber type="currency" value="${topProducts.priceProduct}" pattern="###,###₫" /></del>
                                                    </div>

                                                </div>

                                            </div>
                                        </c:if>

                                    </c:forEach>                                  

                                </div>
                            </c:forEach>
                        </div>

                    </div>

                </div>

            </div>






            <!--              - TESTIMONIALS, CTA & SERVICE-->


            <div>

                <div class="container">

                    <div class="testimonials-box">


                        <!--                          - TESTIMONIALS-->


                        <div class="testimonial">

                            <h2 class="title">testimonial</h2>

                            <div class="testimonial-card">

                                <img src="./assets/images/testimonial-1.jpg" alt="alan doe" class="testimonial-banner" width="80" height="80">

                                <p class="testimonial-name">Alan Doe</p>

                                <p class="testimonial-title">CEO & Founder Invision</p>

                                <img src="./assets/images/icons/quotes.svg" alt="quotation" class="quotation-img" width="26">

                                <p class="testimonial-desc">
                                    Lorem ipsum dolor sit amet consectetur Lorem ipsum
                                    dolor dolor sit amet.
                                </p>

                            </div>

                        </div>




                        <!--                          - CTA-->


                        <div class="cta-container">

                            <img src="./assets/images/cta-banner.jpg" alt="summer collection" class="cta-banner">

                            <a href="#" class="cta-content">

                                <p class="discount">25% Discount</p>

                                <h2 class="cta-title">Summer collection</h2>

                                <p class="cta-text">Starting @ $10</p>

                                <button class="cta-btn">Shop now</button>

                            </a>

                        </div>




                        <!--                          - SERVICE-->


                        <div class="service">

                            <h2 class="title">Our Services</h2>

                            <div class="service-container">

                                <a href="#" class="service-item">

                                    <div class="service-icon">
                                        <ion-icon name="boat-outline"></ion-icon>
                                    </div>

                                    <div class="service-content">

                                        <h3 class="service-title">Worldwide Delivery</h3>
                                        <p class="service-desc">For Order Over $100</p>

                                    </div>

                                </a>

                                <a href="#" class="service-item">

                                    <div class="service-icon">
                                        <ion-icon name="rocket-outline"></ion-icon>
                                    </div>

                                    <div class="service-content">

                                        <h3 class="service-title">Next Day delivery</h3>
                                        <p class="service-desc">UK Orders Only</p>

                                    </div>

                                </a>

                                <a href="#" class="service-item">

                                    <div class="service-icon">
                                        <ion-icon name="call-outline"></ion-icon>
                                    </div>

                                    <div class="service-content">

                                        <h3 class="service-title">Best Online Support</h3>
                                        <p class="service-desc">Hours: 8AM - 11PM</p>

                                    </div>

                                </a>

                                <a href="#" class="service-item">

                                    <div class="service-icon">
                                        <ion-icon name="arrow-undo-outline"></ion-icon>
                                    </div>

                                    <div class="service-content">

                                        <h3 class="service-title">Return Policy</h3>
                                        <p class="service-desc">Easy & Free Return</p>

                                    </div>

                                </a>

                                <a href="#" class="service-item">

                                    <div class="service-icon">
                                        <ion-icon name="ticket-outline"></ion-icon>
                                    </div>

                                    <div class="service-content">

                                        <h3 class="service-title">30% money back</h3>
                                        <p class="service-desc">For Order Over $100</p>

                                    </div>

                                </a>

                            </div>

                        </div>

                    </div>

                </div>

            </div>






            <!--              - BLOG-->


            <div class="blog">

                <div class="container">

                    <div class="blog-container has-scrollbar">

                        <div class="blog-card">

                            <a href="#">
                                <img src="./assets/images/blog-1.jpg" alt="Clothes Retail KPIs 2021 Guide for Clothes Executives" width="300" class="blog-banner">
                            </a>

                            <div class="blog-content">

                                <a href="#" class="blog-category">Fashion</a>

                                <a href="#">
                                    <h3 class="blog-title">Clothes Retail KPIs 2021 Guide for Clothes Executives.</h3>
                                </a>

                                <p class="blog-meta">
                                    By <cite>Mr Admin</cite> / <time datetime="2022-04-06">Apr 06, 2022</time>
                                </p>

                            </div>

                        </div>

                        <div class="blog-card">

                            <a href="#">
                                <img src="./assets/images/blog-2.jpg" alt="Curbside fashion Trends: How to Win the Pickup Battle."
                                     class="blog-banner" width="300">
                            </a>

                            <div class="blog-content">

                                <a href="#" class="blog-category">Clothes</a>

                                <h3>
                                    <a href="#" class="blog-title">Curbside fashion Trends: How to Win the Pickup Battle.</a>
                                </h3>

                                <p class="blog-meta">
                                    By <cite>Mr Robin</cite> / <time datetime="2022-01-18">Jan 18, 2022</time>
                                </p>

                            </div>

                        </div>

                        <div class="blog-card">

                            <a href="#">
                                <img src="./assets/images/blog-3.jpg" alt="EBT vendors: Claim Your Share of SNAP Online Revenue."
                                     class="blog-banner" width="300">
                            </a>

                            <div class="blog-content">

                                <a href="#" class="blog-category">Shoes</a>

                                <h3>
                                    <a href="#" class="blog-title">EBT vendors: Claim Your Share of SNAP Online Revenue.</a>
                                </h3>

                                <p class="blog-meta">
                                    By <cite>Mr Selsa</cite> / <time datetime="2022-02-10">Feb 10, 2022</time>
                                </p>

                            </div>

                        </div>

                        <div class="blog-card">

                            <a href="#">
                                <img src="./assets/images/blog-4.jpg" alt="Curbside fashion Trends: How to Win the Pickup Battle."
                                     class="blog-banner" width="300">
                            </a>

                            <div class="blog-content">

                                <a href="#" class="blog-category">Electronics</a>

                                <h3>
                                    <a href="#" class="blog-title">Curbside fashion Trends: How to Win the Pickup Battle.</a>
                                </h3>

                                <p class="blog-meta">
                                    By <cite>Mr Pawar</cite> / <time datetime="2022-03-15">Mar 15, 2022</time>
                                </p>

                            </div>

                        </div>

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
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="Chat Bot One Piece Shop"
        agent-id="a5ff5270-615e-45c8-9577-8776b8221e70"
        language-code="vi"
        ></df-messenger>

</body>

</html>
