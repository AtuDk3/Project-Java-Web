<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_dashboard.css">      
 
        <title>Dashboard</title>
        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">
    </head>
    <body>

        <%@include file="slide_bar.jsp" %>

        <!-- NAVBAR -->
        <section id="content">
            <%@include file="header.jsp" %>

            <!-- MAIN -->
            <main>
                <h1 class="title">Dashboard</h1>
                <ul class="breadcrumbs">
                    <li><a href="#">Home</a></li>
                    <li class="divider">/</li>
                    <li><a href="#" class="active">Dashboard</a></li>
                </ul>
                <div class="info-data">
                    <div class="card">
                        <div class="head">
                            <div>
                                <h2>1500</h2>
                                <p>Traffic</p>
                            </div>
                            <i class='bx bx-trending-up icon' ></i>
                        </div>
                        <span class="progress" data-value="40%"></span>
                        <span class="label">40%</span>
                    </div>
                    <div class="card">
                        <div class="head">
                            <div>
                                <h2>234</h2>
                                <p>Sales</p>
                            </div>
                            <i class='bx bx-trending-down icon down' ></i>
                        </div>
                        <span class="progress" data-value="60%"></span>
                        <span class="label">60%</span>
                    </div>
                    <div class="card">
                        <div class="head">
                            <div>
                                <h2>465</h2>
                                <p>Pageviews</p>
                            </div>
                            <i class='bx bx-trending-up icon' ></i>
                        </div>
                        <span class="progress" data-value="30%"></span>
                        <span class="label">30%</span>
                    </div>
                    <div class="card">
                        <div class="head">
                            <div>
                                <h2>235</h2>
                                <p>Visitors</p>
                            </div>
                            <i class='bx bx-trending-up icon' ></i>
                        </div>
                        <span class="progress" data-value="80%"></span>
                        <span class="label">80%</span>
                    </div>
                </div>
                <div class="data">
                    <div class="content-data">
                        <div class="head">
                            <h3>Sales Report</h3>
                            <div class="menu">
                                <i class='bx bx-dots-horizontal-rounded icon'></i>
                                <ul class="menu-link">
                                    <li><a href="#">Edit</a></li>
                                    <li><a href="#">Save</a></li>
                                    <li><a href="#">Remove</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="chart">
                            <div id="chart"></div>
                        </div>
                    </div>

                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->


        <%@include file="footer.jsp" %>