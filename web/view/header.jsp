<%-- 
    Document   : header
    Created on : Dec 9, 2023, 10:38:32 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>

    <div class="header-main">

        <div class="container">

            <a href="${pageContext.request.contextPath}/home" class="header-logo">
                <img src="<c:url value="/assets/images/logo/logo.png" />" alt="logo" width="80" height="80">
            </a>

            <div class="header-search-container">
                <form action="search"> <!--Nếu ko ghi method gì thì mặc định là get, get và post khác nhau ở chỗ get sẽ truyền lên url txtSearch , post sẽ ko hiển thị trên url nên post bảo mật nên -->
                    <input type="text" oninput="searchByName(this)" name="txtSearch" value="${txtS}" class="search-field" placeholder="Enter your product name...">

                    <button type="submit" class="search-btn">
                        <ion-icon name="search-outline"></ion-icon>
                    </button>
                </form>
            </div>

            <div class="header-user-actions">
                <c:choose>
                    <c:when test="${sessionScope.account == null}">               

                        <a href="${pageContext.request.contextPath}/login"><button class="action-btn">
                                <ion-icon name="log-in-outline"></ion-icon>
                                <p>Log In</p>
                            </button></a>

                        <a href="${pageContext.request.contextPath}/register"><button class="action-btn">
                                <ion-icon name="add-circle-outline"></ion-icon>
                                <p>Register</p>
                            </button></a>

                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/profile"><button class="action-btn">
                                <ion-icon name="person-outline"></ion-icon>
                                <p>${sessionScope.account.userName}</p>
                            </button></a>

                        <a href="${pageContext.request.contextPath}/heart">
                            <button class="action-btn">
                                <ion-icon name="heart-outline"></ion-icon>
                                <span class="count">0</span>
                                <p>Heart</p>
                            </button> 
                        </a>

                        <a href="${pageContext.request.contextPath}/member/cart"><button class="action-btn">
                                <ion-icon name="bag-handle-outline"></ion-icon>
                                <c:set var="count" value="${0}"></c:set>
                            <c:forEach items="${sessionScope.cart}" var="cart" >
                                <c:set var="count" value="${count + cart.value.quantity}"></c:set>
                            </c:forEach>
                                <span class="count">${count}</span>
                                <p>Cart</p>
                            </button></a>

                        <a href="${pageContext.request.contextPath}/logout"><button class="action-btn">
                                <ion-icon name="log-out-outline"></ion-icon>
                                <p>Log Out</p>
                            </button></a>
                        </c:otherwise>
                    </c:choose>
            </div>

        </div>

    </div>

    <nav class="desktop-navigation-menu">

        <div class="container">

            <ul class="desktop-menu-category-list">

                <li class="menu-category">
                    <a href="${pageContext.request.contextPath}/home" class="menu-title">Home</a>
                </li>

                <li class="menu-category">
                    <a href="introduce" class="menu-title">Introduce</a>
                </li>


                <li class="menu-category">
                    <a href="${pageContext.request.contextPath}/product?cid=${0}" class="menu-title">Category Product</a>
                    <ul class="dropdown-list">
                        <c:forEach items="${requestScope.categoryProduct}" var="cateProduct" >
                            <li class="dropdown-item">
                                <a href="product?cid=${cateProduct.idCategoryProduct}">${cateProduct.titleCategoryProduct}</a>
                            </li>
                        </c:forEach>
                    </ul>

                </li>

                <li class="menu-category">
                    <a href="${pageContext.request.contextPath}/product?cid=${0}" class="menu-title">Products</a>
                </li>

                <li class="menu-category">
                    <a href="#" class="menu-title">News</a>
                    <ul class="dropdown-list">
                        <c:forEach items="${requestScope.categoryProduct}" var="cateProduct" >
                            <li class="dropdown-item">
                                <a href="#">${cateProduct.titleCategoryProduct}</a>
                            </li>
                        </c:forEach>
                    </ul>

                </li>

            </ul>

        </div>

    </nav>

    <div class="mobile-bottom-navigation">

        <button class="action-btn" data-mobile-menu-open-btn>
            <ion-icon name="menu-outline"></ion-icon>
        </button>

        <button class="action-btn">
            <ion-icon name="bag-handle-outline"></ion-icon>

            <span class="count">0</span>
        </button>

        <button class="action-btn">
            <ion-icon name="home-outline"></ion-icon>
        </button>

        <button class="action-btn">
            <ion-icon name="heart-outline"></ion-icon>

            <span class="count">0</span>
        </button>

        <button class="action-btn" data-mobile-menu-open-btn>
            <ion-icon name="grid-outline"></ion-icon>
        </button>

    </div>

    <nav class="mobile-navigation-menu  has-scrollbar" data-mobile-menu>

        <div class="menu-top">
            <h2 class="menu-title">Menu</h2>

            <button class="menu-close-btn" data-mobile-menu-close-btn>
                <ion-icon name="close-outline"></ion-icon>
            </button>
        </div>

        <ul class="mobile-menu-category-list">

            <li class="menu-category">
                <a href="#" class="menu-title">Home</a>
            </li>

            <li class="menu-category">
                <a href="#" class="menu-title">Introduce</a>
            </li>

            <li class="menu-category">

                <button class="accordion-menu" data-accordion-btn>
                    <p class="menu-title">Accessories</p>

                    <div>
                        <ion-icon name="add-outline" class="add-icon"></ion-icon>
                        <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                    </div>
                </button>

                <ul class="submenu-category-list" data-accordion>
                    <c:forEach items="${requestScope.categoryAccessories}" var="cateAccessories" >
                        <li class="submenu-category">
                            <a href="#" class="submenu-title">${cateAccessories.titleCategoryProduct}</a>
                        </li>
                    </c:forEach>


                </ul>

            </li>

            <li class="menu-category">

                <button class="accordion-menu" data-accordion-btn>
                    <p class="menu-title">Posters</p>

                    <div>
                        <ion-icon name="add-outline" class="add-icon"></ion-icon>
                        <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                    </div>
                </button>

                <ul class="submenu-category-list" data-accordion>
                    <c:forEach items="${requestScope.categoryPosters}" var="catePosters" >
                        <li class="submenu-category">
                            <a href="#" class="submenu-title">${catePosters.titleCategoryProduct}</a>
                        </li>
                    </c:forEach>


                </ul>

            </li>

            <li class="menu-category">

                <button class="accordion-menu" data-accordion-btn>
                    <p class="menu-title">Figures & Toys</p>

                    <div>
                        <ion-icon name="add-outline" class="add-icon"></ion-icon>
                        <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                    </div>
                </button>

                <ul class="submenu-category-list" data-accordion>
                    <c:forEach items="${requestScope.categoryFiguresToys}" var="cateFiguresToys" >
                        <li class="submenu-category">
                            <a href="#" class="submenu-title">${cateFiguresToys.titleCategoryProduct}</a>
                        </li>
                    </c:forEach>

                </ul>

            </li>

            <li class="menu-category">

                <button class="accordion-menu" data-accordion-btn>
                    <p class="menu-title">Clothers</p>

                    <div>
                        <ion-icon name="add-outline" class="add-icon"></ion-icon>
                        <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                    </div>
                </button>

                <ul class="submenu-category-list" data-accordion>
                    <c:forEach items="${requestScope.categoryClothers}" var="categoryClothers" >
                        <li class="submenu-category">
                            <a href="#" class="submenu-title">${categoryClothers.titleCategoryProduct}</a>
                        </li>
                    </c:forEach>
                </ul>

            </li>

        </ul>



    </nav>

</header>
