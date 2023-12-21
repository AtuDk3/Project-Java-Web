<%-- 
    Document   : slidebar
    Created on : Dec 9, 2023, 2:17:47 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_slide_bar.css">

<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="${pageContext.request.contextPath}/admin" class="brand">&nbsp &nbsp <ion-icon name="finger-print-outline"></ion-icon>&nbsp Dashboard</a>
		<ul class="side-menu">
			<li><a href="#" class="active"><i class='bx bxs-dashboard icon' ></i> Dashboard</a></li>
			<li class="divider" data-text="main">Main</li>
			<li>
				<a href="#"><i class='bx bxs-inbox icon' ></i> Category <i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="${pageContext.request.contextPath}/admin/category_product/list">List Category</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/category_product/add">Add Category</a></li>
				</ul>
			</li>
                        
                        <li>
				<a href="#"><i class='bx bxs-inbox icon' ></i> Product <i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="${pageContext.request.contextPath}/admin/product/list">List Product</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/product/add">Add Product</a></li>
				</ul>
			</li>

			<li>
				<a href="#"><i class='bx bxs-notepad icon' ></i> Order <i class='bx bx-chevron-right icon-right' ></i></a>
				<ul class="side-dropdown">
					<li><a href="#">List Order</a></li>
				</ul>
			</li>
		</ul>
		<div class="ads">
			<div class="wrapper">
				<a href="#" class="btn-upgrade">Upgrade</a>
				<p>Become a <span>PRO</span> member and enjoy <span>All Features</span></p>
			</div>
		</div>
	</section>
	<!-- SIDEBAR -->
