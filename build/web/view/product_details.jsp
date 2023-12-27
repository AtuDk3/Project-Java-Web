<%-- 
    Document   : product_details
    Created on : Dec 13, 2023, 5:10:01 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
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
                                &nbsp${productDetails.categoryProduct.titleCategoryProduct} / 
                            </span></a>
                        <meta itemprop="position" content="2" />
                    </li>
                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                        <span itemprop="item">
                            <strong itemprop="name">
                                &nbsp${productDetails.titleProduct}
                            </strong>
                        </span>
                        <meta itemprop="position" content="3" />
                    </li>
                </ol>
            </div>

            <div class="contain">
                <div class="left">
                    <div class="img_product">
                        <img src="./assets/images/product/${productDetails.imgProduct}" alt="${productDetails.titleProduct}">
                    </div>
                    <div class="desc_product">
                        <div class="desc_product_top">
                            <h4>Category Product: <span>${productDetails.categoryProduct.titleCategoryProduct}</span></h4>
                            <h2>${productDetails.titleProduct}</h2>
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
                                <h2><fmt:formatNumber type="currency" value="${productDetails.priceProduct}" pattern="###,###₫" /></h2>
                            </div>
                        </div>
                        <div class="desc_product_bottom">
                            <h3>Describe Product:</h3>
                            <div class="desc_product_main">
                                ${productDetails.descProduct}
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
                    <div class="payment">
                        <div class="payment_quantity">
                            Quantity: <span>${productDetails.quantityProduct}</span>
                            <br>(Status: Còn hàng)
                        </div>
                        <div class="quantity-container">
                            <button class="quantity-btn" id="decrement">-</button>
                            <input type="text" class="quantity-input" id="quantity" value="1" oninput="updateTotal()">
                            <button class="quantity-btn" id="increment">+</button>
                        </div>
                        <h3>Total amount:</h3>
                        <h2 id="totalAmount"><fmt:formatNumber type="currency" value="${productDetails.priceProduct}" pattern="###,###₫" /></h2>
                        <button class="btn_buy">Buy Now</button>
                        <button  type="button" class="btn_add_to_cart" onclick="addToCart()" >Add To Cart</button>
                    </div>

                </div>
            </div>

            <div class="product-container">

                <div class="container">

                    <!--                          - PRODUCT GRID-->                       

                    <div class="product-main">

                        <h2 class="title">Related Products</h2>

                        <div class="product-grid" id="related-product">
                            <c:forEach items="${requestScope.listTop4RelatedProduct}" var="listTop4RelatedProduct" >
                                <div class="showcase product_related">

                                    <div class="showcase-banner">
                                        <img src="${pageContext.request.contextPath}/assets/images/uploads/product/${listTop4RelatedProduct.imgProduct}" alt="${productRelated.titleProduct}" class="product-img default"
                                             width="300" style="object-fit: cover; height: 250px">
                                        <img src="${pageContext.request.contextPath}/assets/images/uploads/product/${listTop4RelatedProduct.imgProduct}" alt="${productRelated.titleProduct}" class="product-img hover"
                                             width="300" style="object-fit: cover; height: 250px">

                                        <c:choose>
                                                <c:when test="${listTop4RelatedProduct.hotProduct == 1}">
                                                    <p class="showcase-badge angle black">hot</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="showcase-badge angle pink">sale</p>
                                                </c:otherwise>
                                            </c:choose>

                                        <div class="showcase-actions">
                                            <a href="#">
                                            <button class="btn-action">
                                                <ion-icon name="heart-outline"></ion-icon>
                                            </button></a>
                                            
                                            <a href="${pageContext.request.contextPath}/product_details?pid=${listTop4RelatedProduct.idProduct}&cid=${listTop4RelatedProduct.categoryProduct.idCategoryProduct}">
                                            <button class="btn-action">
                                                <ion-icon name="eye-outline"></ion-icon>
                                            </button></a>

                                            <a href="#">
                                            <button class="btn-action">
                                                <ion-icon name="repeat-outline"></ion-icon>
                                            </button></a>

                                            <a href="${pageContext.request.contextPath}/member/cart_add?pid=${listTop4RelatedProduct.idProduct}&quantity=1"><button class="btn-action">
                                                <ion-icon name="bag-add-outline"></ion-icon>
                                            </button></a>
                                        </div>
                                    </div>


                                    <div class="showcase-content">
                                        <a href="#" class="showcase-category">${listTop4RelatedProduct.categoryProduct.titleCategoryProduct}</a>

                                        <h3>
                                            <a href="#" class="showcase-title">${listTop4RelatedProduct.titleProduct}</a>
                                        </h3>

                                        <div class="showcase-rating">
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                        </div>

                                        <div class="price-box">
                                            <p class="price"><fmt:formatNumber type="currency" value="${listTop4RelatedProduct.priceProduct * 0.9}" pattern="###,###đ" /></p>
                                            <del><fmt:formatNumber type="currency" value="${listTop4RelatedProduct.priceProduct}" pattern="###,###đ" /></del>
                                        </div>

                                    </div>

                                </div>
                            </c:forEach>
                          
                        </div>
                        <button class="btn_see_more" onclick="loadMore()">See more</button>

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
    <script>
                                // Lấy các phần tử
                                var quantityInput = document.getElementById('quantity');
                                var totalAmountElement = document.getElementById('totalAmount');
                                var incrementButton = document.getElementById('increment');
                                var decrementButton = document.getElementById('decrement');

                                function addToCart() {
                                    //const quantityInput = document.getElementById('quantity');
                                    const selectedQuantity = quantityInput.value;

                                    // Xử lý chuyển hướng đến trang "Add To Cart" với giá trị số lượng mới
                                    const productId = "${product_details.idProduct}";
                                    const url = "${pageContext.request.contextPath}/member/cart_add?pid=" + productId + "&quantity=" + selectedQuantity;
                                    window.location.href = url;
                                }


                                // Thêm lắng nghe sự kiện
                                incrementButton.addEventListener('click', function () {
                                    updateTotal();
                                    incrementQuantity();
                                });

                                decrementButton.addEventListener('click', function () {
                                    decrementQuantity();
                                    updateTotal();
                                });

                                // Hàm tăng số lượng
                                function incrementQuantity() {
                                    quantityInput.value = parseInt(quantityInput.value) + 1;
                                }

                                // Hàm giảm số lượng
                                function decrementQuantity() {
                                    if (parseInt(quantityInput.value) > 1) {
                                        quantityInput.value = parseInt(quantityInput.value) - 1;
                                    }
                                }

                                // Hàm cập nhật tổng cộng
                                function updateTotal() {
                                    var quantity = parseInt(quantityInput.value);
                                    var price = parseFloat("${product_details.priceProduct}");
                                    var totalAmount = quantity * price;

                                    // Định dạng và cập nhật phần tử tổng cộng
                                    totalAmountElement.innerHTML = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(totalAmount);
                                }

                                function loadMore() {
                                    // Lấy ra coi có bao nhiêu sản phẩm 
                                    let amount = document.getElementsByClassName("product_related").length;
                                    let urlSearchParams = new URLSearchParams(window.location.search);

                                    // Lấy giá trị của tham số 'cid' từ URL
                                    let cid = urlSearchParams.get('cid');

                                    // Lấy giá trị của tham số 'pid' từ URL
                                    let pid = urlSearchParams.get('pid');
                                    $.ajax({
                                        url: "/Ecommer_Website/load",
                                        type: "get",
                                        data: {
                                            exits: amount,
                                            cid: cid,
                                            pid: pid

                                        },
                                        success: function (data) {
                                            let row = document.getElementById("related-product");
                                            row.innerHTML += data;
                                        },
                                        error: function (xhr) {

                                        }
                                    })
                                }
    </script>

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script_cart.js"></script>
</body>

</html>
