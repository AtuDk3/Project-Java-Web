<%-- 
    Document   : products
    Created on : Dec 13, 2023, 8:33:48 PM
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
        <title>List Product</title>


        <!--          - favicon-->

        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">


        <!--          - custom css link-->
        <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">


        <!--          - google font link-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
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
                                <c:forEach var="item" items="${categoryProduct}">
                                    <c:url var="editURL" value="/product/list">
                                        <c:param name="cid" value="${item.idCategoryProduct}" /></c:url>
                                    <li class="sidebar-menu-category ${tag == item.idCategoryProduct ? "active":""}">

                                        <button class="sidebar-accordion-menu" data-accordion-btn>
                                            <a href="${editURL}&index1=-2" class="menu-title">${item.titleCategoryProduct}</a>
                                            <c:forEach var="item1" items="${countCate}">
                                                <c:if test="${item1.idCategoryProduct == item.idCategoryProduct && item1.total != 0}">

                                                    <div>
                                                        (${item1.total})
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </button>

                                    </li>
                                </c:forEach>

                            </ul>

                        </div>               

                    </div>

                    <div class="product-box">                                             

                        <!--                          - PRODUCT GRID-->

                        <div class="product-main">
                            <div class="product-main-top">
                                <h2 class="title">All Products</h2>
                                <div class="select-menu">
                                    <div class="select-btn">
                                        <span class="sBtn-text">
                                            <c:choose>
                                                <c:when test="${tag1 == -1}">All Product</c:when>
                                                <c:when test="${tag1 == -2}">Products By Category</c:when>
                                                <c:otherwise>${tag1}</c:otherwise>
                                            </c:choose>
                                        </span>
                                        <i class="fa-solid fa-chevron-down"></i>
                                    </div>

                                    <ul class="options">
                                        <a href="${pageContext.request.contextPath}/product/list?index=${tag}&index1=-1">
                                            <li class="option"><span class="option-text">All Product</span></li>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/product/list?index=${tag}&index1=8">
                                            <li class="option"><span class="option-text">8</span></li>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/product/list?index=${tag}&index1=12">
                                            <li class="option"><span class="option-text">12</span></li>
                                        </a>
                                        <a href="${pageContext.request.contextPath}/product/list?index=${tag}&index1=16">
                                            <li class="option"><span class="option-text">16</span>
                                            </li>
                                        </a>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-grid">

                                <div class="showcase">

                                    <div class="showcase-banner">

                                        <img src="${pageContext.request.contextPath}/assets/images/products/jacket-3.jpg" alt="Mens Winter Leathers Jackets" width="300" class="product-img default">
                                        <img src="${pageContext.request.contextPath}/assets/images/products/jacket-4.jpg" alt="Mens Winter Leathers Jackets" width="300" class="product-img hover">

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
                                        <img src="${pageContext.request.contextPath}/assets/images/products/shirt-1.jpg" alt="Pure Garment Dyed Cotton Shirt" class="product-img default"
                                             width="300">
                                        <img src="${pageContext.request.contextPath}/assets/images/products/shirt-2.jpg" alt="Pure Garment Dyed Cotton Shirt" class="product-img hover"
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


                                <c:forEach items="${requestScope.productList}" var="productList" >
                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <img src="${pageContext.request.contextPath}/assets/images/product/${productList.imgProduct}" alt="${productList.titleProduct}" class="product-img default"
                                                 width="300" style="object-fit: cover; height: 250px">
                                            <img src="${pageContext.request.contextPath}/assets/images/product/${productList.imgProduct}" alt="${productList.titleProduct}" class="product-img hover"
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
                                            <a href="#" class="showcase-category">${productList.categoryProduct.titleCategoryProduct}</a>

                                            <h3>
                                                <a href="#" class="showcase-title">${productList.titleProduct}</a>
                                            </h3>

                                            <div class="showcase-rating">
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                            </div>

                                            <div class="price-box">
                                                <p class="price"><fmt:formatNumber type="currency" value="${productList.priceProduct * 0.9}" pattern="###,###đ" /></p>
                                                <del><fmt:formatNumber type="currency" value="${productList.priceProduct}" pattern="###,###đ" /></del>
                                            </div>

                                        </div>

                                    </div>
                                </c:forEach>


                            </div>

                        </div>

                    </div>

                </div>

            </div>

            <c:if test="${indexP2 != -1}">
                <div class="container-paging">
                    <button class="button" id="startBtn" disabled>
                        <i class="fa-solid fa-angles-left"></i>
                    </button>
                    <button class="button prevNext" id="prev" disabled>
                        <i class="fa-solid fa-angle-left"></i>
                    </button>
                    <div class="links">
                        <c:forEach begin="1" end="${endPage}" var="i" >
                            <a href="${pageContext.request.contextPath}/product/list?index=${i}&index1=${tag1}" class="link ${tag == i ? "active":""}">${i}</a>
                        </c:forEach>
                    </div>
                    <button class="button prevNext" id="next">
                        <i class="fa-solid fa-angle-right"></i>
                    </button>
                    <button class="button" id="endBtn">
                        <i class="fa-solid fa-angles-right"></i>
                    </button>
                </div>
            </c:if>

            <c:choose>
                <c:when test="${indexP2 == -2}">
                    <div class="container-paging">
                        <button class="button" id="startBtn" disabled>
                            <i class="fa-solid fa-angles-left"></i>
                        </button>
                        <button class="button prevNext" id="prev" disabled>
                            <i class="fa-solid fa-angle-left"></i>
                        </button>
                        <div class="links">
                            <c:forEach begin="1" end="${(countProductAll / 8) + ((countProductAll % 8 != 0) ? 1 : 0)}" var="i">
                                <a href="${pageContext.request.contextPath}/product/list?index=${i}&index1=8" class="link ${tag == i ? 'active' : ''}">${i}</a>
                            </c:forEach>
                        </div>
                        <button class="button prevNext" id="next">
                            <i class="fa-solid fa-angle-right"></i>
                        </button>
                        <button class="button" id="endBtn">
                            <i class="fa-solid fa-angles-right"></i>
                        </button>
                    </div>
                </c:when>
                
                <c:when test="${indexP2 != -1}">
                    <div class="container-paging">
                        <button class="button" id="startBtn" disabled>
                            <i class="fa-solid fa-angles-left"></i>
                        </button>
                        <button class="button prevNext" id="prev" disabled>
                            <i class="fa-solid fa-angle-left"></i>
                        </button>
                        <div class="links">
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <a href="${pageContext.request.contextPath}/product/list?index=${i}&index1=${tag1}" class="link ${tag == i ? 'active' : ''}">${i}</a>
                            </c:forEach>
                        </div>
                        <button class="button prevNext" id="next">
                            <i class="fa-solid fa-angle-right"></i>
                        </button>
                        <button class="button" id="endBtn">
                            <i class="fa-solid fa-angles-right"></i>
                        </button>
                    </div>
                </c:when>
                
                <c:otherwise>
                    <!-- Code cho trường hợp khác (nếu cần) -->
                </c:otherwise>
            </c:choose>



        </main>

        <!--          - FOOTER-->

        <%@include file="footer.jsp" %>

        <!--          - custom js link-->

        <script src="<c:url value="/assets/js/script.js" />"></script>
<!--        <script src="${pageContext.request.contextPath}/assets/js/script_pagination.js"></script>-->
        <script src="${pageContext.request.contextPath}/assets/js/script_selection.js"></script>
        <!--          - ionicon link-->

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    </body>

</html>
