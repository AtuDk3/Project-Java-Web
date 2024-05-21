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
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>      

        <!--          - custom css link-->

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">


        <!--          - google font link-->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

    </head>

    <body>


        <!--        <div class="overlay" data-overlay></div>-->

        <!--          - MODAL-->

        <!--        <div class="modal" data-modal>
        
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
        
                </div>-->


        <!--          - NOTIFICATION TOAST-->


        <!--        <div class="notification-toast" data-toast>
        
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
        
                </div>-->


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

                            <div class="sidebar-category">

                                <div class="sidebar-top">
                                    <h2 class="sidebar-title">SEARCH FILTER</h2>

                                    <button class="sidebar-close-btn" data-mobile-menu-close-btn>
                                        <ion-icon name="close-outline"></ion-icon>
                                    </button>
                                </div>


                                <ul class="sidebar-menu-category-list">
                                    <form class="form-filter" action="${pageContext.request.contextPath}/search" method="post">
                                        <input type="hidden" name="action" value="filter">

                                        <!-- Filter by price range -->
                                        <div class="form-group">
                                            <label class="showcase-title" for="minPrice">Min Price:</label>
                                            <input type="number" name="minPrice" id="minPrice" style="font-size: 0.8rem;" placeholder="Enter min price ..." required>
                                        </div>
                                        <div class="form-group">
                                            <label class="showcase-title" for="maxPrice">Max Price:</label>
                                            <input type="number" name="maxPrice" id="maxPrice" style="font-size: 0.8rem;" placeholder="Enter max price ..." required>
                                        </div>

                                        <!-- Sort options -->
                                        <div class="form-group">
                                            <label class="showcase-title" for="sort">Sort By:</label>
                                            <select name="sort" id="sort">
                                                <option value="title_product">Name Product</option>
                                                <option value="price_product">Price Product</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="order" class="showcase-title">Order:</label>
                                            <select name="order" id="order">
                                                <option value="asc">Low to High</option>
                                                <option value="desc">High to Low</option>
                                            </select>
                                        </div>

                                        <button class="btn_filter" type="submit">Filter Product</button>
                                    </form>

                                </ul>

                            </div>  

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
                                                <a href="${editURL}" class="menu-title">${item.titleCategoryProduct}</a>

                                                <div class="menu-title">
                                                    10
                                                </div>

                                            </button>

                                        </li>
                                    </c:forEach>

                                </ul>



                            </div>   

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

                                                <a href="${pageContext.request.contextPath}/product_details?pid=${proModel.idProduct}&cid=${proModel.categoryProduct.idCategoryProduct}" class="showcase-img-box">
                                                    <img src="${pageContext.request.contextPath}/assets/images/product/${proModel.imgProduct}" alt="running & trekking shoes - white" class="showcase-img"
                                                         width="70" height="70">
                                                </a>

                                                <div class="showcase-content">

                                                    <a href="${pageContext.request.contextPath}/product_details?pid=${proModel.idProduct}&cid=${proModel.categoryProduct.idCategoryProduct}">
                                                        <h4 class="showcase-title">${proModel.titleProduct}</h4>
                                                    </a>

                                                    <a href="${pageContext.request.contextPath}/product_details?pid=${proModel.idProduct}&cid=${proModel.categoryProduct.idCategoryProduct}" class="showcase-category">${proModel.categoryProduct.titleCategoryProduct}</a>

                                                    <div class="price-box">
                                                        <p class="price"><fmt:formatNumber type="currency" value="${proModel.priceProduct * 0.9}" pattern="###,###đ" /></p>
                                                        <del><fmt:formatNumber type="currency" value="${proModel.priceProduct}" pattern="###,###đ" /></del>
                                                    </div>

                                                </div>

                                            </div>
                                        </c:forEach>
                                    </div>                                

                                </div>

                            </div>

                            <div class="product-showcase">

                                <h2 class="title">Best Seller</h2>

                                <div class="showcase-wrapper  has-scrollbar">

                                    <div class="showcase-container">
                                        <c:forEach items="${requestScope.top5BestSellerProduct}" var="top5BestSellerProduct" >
                                            <div class="showcase">

                                                <a href="${pageContext.request.contextPath}/product_details?pid=${top5BestSellerProduct.idProduct}&cid=${top5BestSellerProduct.categoryProduct.idCategoryProduct}" class="showcase-img-box">
                                                    <img src="${pageContext.request.contextPath}/assets/images/product/${top5BestSellerProduct.imgProduct}" alt="running & trekking shoes - white" class="showcase-img"
                                                         width="70" height="70">
                                                </a>

                                                <div class="showcase-content">

                                                    <a href="${pageContext.request.contextPath}/product_details?pid=${top5BestSellerProduct.idProduct}&cid=${top5BestSellerProduct.categoryProduct.idCategoryProduct}">
                                                        <h4 class="showcase-title">${top5BestSellerProduct.titleProduct}</h4>
                                                    </a>

                                                    <a href="${pageContext.request.contextPath}/product_details?pid=${top5BestSellerProduct.idProduct}&cid=${top5BestSellerProduct.categoryProduct.idCategoryProduct}" class="showcase-category">${top5BestSellerProduct.categoryProduct.titleCategoryProduct}</a>

                                                    <div class="price-box">
                                                        <p class="price"><fmt:formatNumber type="currency" value="${top5BestSellerProduct.priceProduct * 0.9}" pattern="###,###đ" /></p>
                                                        <del><fmt:formatNumber type="currency" value="${top5BestSellerProduct.priceProduct}" pattern="###,###đ" /></del>
                                                    </div>

                                                </div>

                                            </div>
                                        </c:forEach>
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
                                            <img src="${pageContext.request.contextPath}/assets/images/uploads/product/16CM Roronoa Zoro Action Figure.webp" alt="16CM Roronoa Zoro Action Figure" class="showcase-img">
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
                                                <h3 class="showcase-title">Roronoa Zoro Action Figure</h3>
                                            </a>

                                            <p class="showcase-desc">
                                                Zoro is the first mate and swordsman of the Straw Hat Pirates and one of the main protagonists of the One Piece series. He also serves as the co-vice captain of the group after the promotion in the timeskip. He has a bounty of over 30,000,000 Berries due to his actions at Enies Lobby that led to the downfall of Baroque Works.
                                            </p>

                                            <div class="price-box">
                                                <p class="price">897,000₫</p>

                                                <del>950,000₫</del>
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

                                <img src="${pageContext.request.contextPath}/assets/images/logo/logo.png" alt="One Piece Shop" class="testimonial-banner" width="80" height="80">

                                <p class="testimonial-name">One Piece Shop</p>

                                <p class="testimonial-title">Online Model Store</p>

                                <img src="${pageContext.request.contextPath}/assets/images/icons/quotes.svg" alt="quotation" class="quotation-img" width="26">

                                <p class="testimonial-desc">
                                    One Piece Shop is a paradise for Manga Anime fans, so the shop gathers most typical products of Japanese comics and animation.
                                </p>

                            </div>

                        </div>




                        <!--                          - CTA-->


                        <div class="cta-container">

                            <img src="${pageContext.request.contextPath}/assets/images/banner2.webp" alt="summer collection" class="cta-banner">

                            <a href="#" class="cta-content">

                                <p class="discount">25% Discount</p>

                                <h2 class="cta-title">Summer collection</h2>

                                <p class="cta-text">Starting @ 99k</p>

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


        </main>


        <!--          - FOOTER-->


        <%@include file="footer.jsp" %>



        <!--          - custom js link-->

        <script src="<c:url value="/assets/js/script.js" />"></script>
        <script>
            var myIndex = 0;
            carousel();

            function carousel() {
                var i;
                var x = document.getElementsByClassName("slider-item");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                myIndex++;
                if (myIndex > x.length) {
                    myIndex = 1
                }
                x[myIndex - 1].style.display = "block";
                setTimeout(carousel, 5000); // Change image every 2 seconds
            }
        </script>



        <!--          - ionicon link-->

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="OnePieceShop"
        agent-id="0a938ee0-485f-4ef4-abf3-b8de81e8cc6a"
        language-code="vi"
        ></df-messenger>

</body>

</html>
