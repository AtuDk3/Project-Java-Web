<%-- 
    Document   : product_details
    Created on : Dec 13, 2023, 5:10:01 PM
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

        <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">
        <link rel="stylesheet" href="<c:url value="/assets/css/style_product_details.css" />">

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
                        <a itemprop="item" href="">
                            <span itemprop="name">
                                &nbsp${product_details.categoryProduct.titleCategoryProduct} / 
                            </span></a>
                        <meta itemprop="position" content="2" />
                    </li>
                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <span itemprop="item">
                            <strong itemprop="name">
                                &nbsp${product_details.titleProduct}
                            </strong>
                        </span>
                        <meta itemprop="position" content="3" />
                    </li>
                </ol>
            </div>

            <div class="contain">
                <div class="left">
                    <div class="img_product">
                        <img src="./assets/images/product/${product_details.imgProduct}" alt="${product_details.titleProduct}">
                    </div>
                    <div class="desc_product">
                        <div class="desc_product_top">
                            <h4>Category Product: <span>${product_details.categoryProduct.titleCategoryProduct}</span></h4>
                            <h2>${product_details.titleProduct}</h2>
                            <div class="rating">
                                <div class="number_rating">4.5&nbsp</div>
                                <div class="showcase-rating">
                                    <ion-icon name="star"></ion-icon>
                                    <ion-icon name="star"></ion-icon>
                                    <ion-icon name="star"></ion-icon>
                                    <ion-icon name="star-outline"></ion-icon>
                                    <ion-icon name="star-outline"></ion-icon>
                                </div>
                            </div>
                            <div class="price">
                                <h2><fmt:formatNumber type="currency" value="${product_details.priceProduct}" pattern="###,###₫" /></h2>
                            </div>
                        </div>
                        <div class="desc_product_bottom">
                            <h3>Describe Product:</h3>
                            <div class="desc_product_main">
                                ${product_details.descProduct}
                            </div>
                            <div class="desc_content">
                                <h4>Note:</h4>
                                Product prices on One Piece Shop include taxes according to current law. 
                                In addition, depending on the type of product, form and delivery address, 
                                additional costs may arise such as shipping fees, bulky goods surcharges, 
                                import taxes (for orders delivered from abroad, there may be value over 1 million VND)......
                            </div>
                        </div>
                    </div>
                </div>
                <div class="right">
                    <form class="payment">
                        <div class="payment_quantity">
                            Quantity: <span>${product_details.quantityProduct}</span>
                            <br>(Status: Còn hàng)
                        </div>
                        <div class="custom pull-left">
                            <button onclick="var result = document.getElementById('qty');
                                    var qty = result.value;
                                    if (!isNaN(qty) && qty > 0)
                                        result.value--;
                                    return false;" class="reduced items-count" type="button">-</button>
                            <input type="text" class="input-text qty" title="Qty" value="1" maxlength="12" id="qty" name="qty">
                            <button onclick="var result = document.getElementById('qty');
                                    var qty = result.value;
                                    if (!isNaN(qty))
                                        result.value++;
                                    return false;" class="increase items-count" type="button">+</button>
                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                        <h3>Total amount:</h3>
                        <h2><fmt:formatNumber type="currency" value="${product_details.priceProduct}" pattern="###,###₫" /></h2>
                        <button class="btn_buy">Buy Now</button>
                        <button class="btn_add_to_cart">Add To Cart</button>
                    </form>
                </div>
            </div>

            <div class="product-container">

                <div class="container">

                    <!--                          - PRODUCT GRID-->                       

                    <div class="product-main">

                        <h2 class="title">Related Products</h2>

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

</body>

</html>
