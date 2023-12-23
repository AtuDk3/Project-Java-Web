<%-- 
    Document   : products
    Created on : Dec 13, 2023, 8:33:48 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .active-paging {
        background-color: blue;
    }
</style>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Anon - eCommerce Website</title>


        <!--          - favicon-->

        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">


        <!--          - custom css link-->
        <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">


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

                    </div>

                    <div class="product-box">                                             

                        <!--                          - PRODUCT GRID-->

                        <div class="product-main">

                            <h2 class="title">All Products</h2>

                            <div class="product-grid">

                                <div class="showcase">

                                    <div class="showcase-banner">

                                        <img src="./assets/images/products/jacket-3.jpg" alt="Mens Winter Leathers Jackets" width="300" class="product-img default">
                                        <img src="./assets/images/products/jacket-4.jpg" alt="Mens Winter Leathers Jackets" width="300" class="product-img hover">

                                        <p class="showcase-badge">15%</p>

                                        <div class="showcase-actions">

                                            <button class="btn-action">
                                                <ion-icon name="heart-outline"></ion-icon>
                                            </button>

                                            <button class="btn-action">
                                                <ion-icon name="eye-outline"></ion-icon>
                                            </button>

                                            <button class="btn-action">
                                                <ion-icon name="repeat-outline"></ion-icon>
                                            </button>

                                            <button class="btn-action">
                                                <ion-icon name="bag-add-outline"></ion-icon>
                                            </button>

                                        </div>

                                    </div>

                                    <div class="showcase-content">

                                        <a href="#" class="showcase-category">jacket</a>

                                        <a href="#">
                                            <h3 class="showcase-title">Mens Winter Leathers Jackets</h3>
                                        </a>

                                        <div class="showcase-rating">
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star-outline"></ion-icon>
                                            <ion-icon name="star-outline"></ion-icon>
                                        </div>

                                        <div class="price-box">
                                            <p class="price">$48.00</p>
                                            <del>$75.00</del>
                                        </div>

                                    </div>

                                </div>

                                <div class="showcase">

                                    <div class="showcase-banner">
                                        <img src="./assets/images/products/shirt-1.jpg" alt="Pure Garment Dyed Cotton Shirt" class="product-img default"
                                             width="300">
                                        <img src="./assets/images/products/shirt-2.jpg" alt="Pure Garment Dyed Cotton Shirt" class="product-img hover"
                                             width="300">

                                        <p class="showcase-badge angle black">sale</p>

                                        <div class="showcase-actions">
                                            <button class="btn-action">
                                                <ion-icon name="heart-outline"></ion-icon>
                                            </button>

                                            <button class="btn-action">
                                                <ion-icon name="eye-outline"></ion-icon>
                                            </button>

                                            <button class="btn-action">
                                                <ion-icon name="repeat-outline"></ion-icon>
                                            </button>

                                            <button class="btn-action">
                                                <ion-icon name="bag-add-outline"></ion-icon>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="showcase-content">
                                        <a href="#" class="showcase-category">shirt</a>

                                        <h3>
                                            <a href="#" class="showcase-title">Pure Garment Dyed Cotton Shirt</a>
                                        </h3>

                                        <div class="showcase-rating">
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star-outline"></ion-icon>
                                            <ion-icon name="star-outline"></ion-icon>
                                        </div>

                                        <div class="price-box">
                                            <p class="price">$45.00</p>
                                            <del>$56.00</del>
                                        </div>

                                    </div>

                                </div>


                                <c:forEach items="${requestScope.product}" var="product" >
                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <img src="./assets/images/product/${product.imgProduct}" alt="${product.titleProduct}" class="product-img default"
                                                 width="300" style="object-fit: cover; height: 250px">
                                            <img src="./assets/images/product/${product.imgProduct}" alt="${product.titleProduct}" class="product-img hover"
                                                 width="300" style="object-fit: cover; height: 250px">

                                            <p class="showcase-badge angle pink">new</p>

                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>


                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">${product.categoryProduct.titleCategoryProduct}</a>

                                            <h3>
                                                <a href="#" class="showcase-title">${product.titleProduct}</a>
                                            </h3>

                                            <div class="showcase-rating">
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                            </div>

                                            <div class="price-box">
                                                <p class="price"><fmt:formatNumber type="currency" value="${product.priceProduct * 0.9}" pattern="###,###đ" /></p>
                                                <del><fmt:formatNumber type="currency" value="${product.priceProduct}" pattern="###,###đ" /></del>
                                            </div>

                                        </div>

                                    </div>
                                </c:forEach>


                            </div>

                        </div>

                    </div>

                </div>

            </div>

            <nav class="container-paging">
                <ul>                   
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <c:forEach begin="1" end="${endPage}" var="i" >
                    <li class="page-item"><a class="page-link ${tag == i ? "active-paging":""}" href="${pageContext.request.contextPath}/product?cid=${0}&index=${i}">${i}</a></li>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>                   
                </ul>
            </nav>
        </main>

        <!--          - FOOTER-->

        <%@include file="footer.jsp" %>

        <!--          - custom js link-->

        <script src="<c:url value="/assets/js/script.js" />"></script>

        <!--          - ionicon link-->

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    </body>

</html>
