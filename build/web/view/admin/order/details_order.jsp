<%-- 
    Document   : details_order
    Created on : Dec 9, 2023, 7:14:23 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_details_order.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo/logo.png" type="image/x-icon">
        <title>Dashboard | Detail Order</title>
    </head>
    <body>

        <%@include file="../slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
            <div class="row" style="margin-bottom: 40px; margin-top: 50px;">
                <div class="col-md-12">
                    <div class="card mb-4 mb-md-0">
                        <div class="card-body">

                                    <div class="card-header p-4">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>                              

                                                <p class="text-muted mb-2"> Details Order: <span class="fw-bold text-body">${cid}</span></p>
                                                
                                                <div class="d-flex flex-row mb-4 pb-2">
                                                    <c:forEach items="${requestScope.listCartItems}" var="cartItems" varStatus="no" >
                                                        <c:if test="${no.index eq 0}">
                                                    <div class="flex-fill">
                                                        <p class="bold">Name Customer: <span class="fw-bold text-body">${cartItems.cart.buyer.fullName}</span></p>
                                                        <p class="text-muted">Phone: <span class="fw-bold text-body">${cartItems.cart.buyer.phone}</span></p>
                                                        <p class="text-muted">Address: <span class="fw-bold text-body">${cartItems.cart.buyer.address}</span></p>
                                                        <p class="text-muted">Email: <span class="fw-bold text-body">${cartItems.cart.buyer.email}</span></p>
                                                    </div>

                                                    </c:if>
                                                     </c:forEach>
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                    <div class="card-body p-4">
                                        <c:set var="total" value="${0}"></c:set>
                                        <c:forEach items="${requestScope.listCartItems}" var="cartItems" varStatus="no" >
                                            <c:set var="total" value="${total + cartItems.quantity * cartItems.unitPrice}"></c:set>

                                        <div class="d-flex flex-row mb-4 pb-2">
                                            <div class="flex-fill">
                                                <h5 class="bold">Name Product: ${cartItems.product.titleProduct}</h5>
                                                <p class="text-muted">Quantity: ${cartItems.quantity}</p>
                                                <h6 class="mb-3">Unit Price: <fmt:formatNumber type="currency" value="${cartItems.unitPrice}" pattern="###,###₫" />/1</h6>
                                                <h5 class="mb-3"> The total amount: <fmt:formatNumber type="currency" value="${cartItems.unitPrice * cartItems.quantity}" pattern="###,###₫" /></h5>
                                                <p class="text-muted">Time Order: <span class="text-body">${cartItems.cart.buyDate}</span></p>
                                            </div>
                                            <div>
                                                <img class="align-self-center img-fluid" id="image" src="${pageContext.request.contextPath}/assets/images/uploads/product/${cartItems.product.imgProduct}" width="250">
                                            </div>
                                        </div>
                                        </c:forEach>

                                        <ul id="progressbar-1" class="mx-0 mt-0 mb-5 px-0 pt-0 pb-4">
                                            <li class="step0 active" id="step1"><span style="margin-left: 22px; margin-top: 12px;">PLACED</span></li>
                                            <li class="step0 active text-center" id="step2"><span>SHIPPED</span></li>
                                            <li class="step0 text-muted text-end" id="step3"><span style="margin-right: 22px;">DELIVERED</span></li>
                                        </ul>
                                    </div>
                                    <div class="card-footer p-4">
                                        <h6 class="text-muted mb-2"> Total amount: <span class="fw-bold text-body"><fmt:formatNumber type="currency" value="${total}" pattern="###,###₫" /></span></h6>
                                        <button type="submit" class="btn btn-warning"><a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath}/admin/order/processed?cid=${cid}">Processed</a></button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

        <%@include file="../footer.jsp" %>
