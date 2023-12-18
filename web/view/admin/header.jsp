<%-- 
    Document   : header
    Created on : Dec 9, 2023, 1:44:26 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_header.css">

<nav>
    <i class='bx bx-menu toggle-sidebar' ></i>
    <form action="#">
        <div class="form-group">
            <input type="text" placeholder="Search...">
            <i class='bx bx-search icon' ></i>
        </div>
    </form>
    <a href="#" class="nav-link">
        <i class='bx bxs-bell icon' ></i>
        <span class="badge">5</span>
    </a>
    <a href="#" class="nav-link">
        <i class='bx bxs-message-square-dots icon' ></i>
        <span class="badge">8</span>
    </a>
    <span class="divider"></span>
    <div class="profile">
        <img src="${pageContext.request.contextPath}/assets/images/upload/avatar/${sessionScope.account.avatar}" alt="">
        <p>${sessionScope.account.userName}</p>
        <ul class="profile-link">
            <li><a href="${pageContext.request.contextPath}/profile"><i class='bx bxs-user-circle icon' ></i> Profile</a></li>
            <li><a href="#"><i class='bx bxs-cog' ></i> Settings</a></li>
            <li><a href="${pageContext.request.contextPath}/logout"><i class='bx bxs-log-out-circle' ></i> Logout</a></li>
        </ul>
    </div>
</nav>

