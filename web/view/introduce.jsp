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
        <title>Introduce</title>

        <!--          - favicon-->

        <link rel="shortcut icon" href="<c:url value="/assets/images/logo/logo.png" />" type="image/x-icon">

        <!--          - custom css link-->

        <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">
        <link rel="stylesheet" href="<c:url value="/assets/css/style_introduce.css" />">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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

            <%@include file="banner.jsp" %>

            <div class="container_introduce">
                <div class="container_iframe">
                    <iframe src="home" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <div class="container_content">
                <h1 class="title">Introduce One Piece Shop</h1>
                <h2 class="desc_title"><span><a href="#">One Piece Shop</a></span> is a paradise for Manga Anime fans, so the shop gathers most typical products of Japanese comics and animation.</h2>
                <p>
                    One Piece Shop's booth stands out with products such as figures, 
                    assembled figures (nendoroid, figma), set figures, accessories such as airpod cases, 
                    phone cases, keychains, mouse pads. In addition, the shop also has products such as t-shirts 
                    and posters of Anime Manga.
                    <br>
                    At One Piece Shop, we have meticulously curated a range of One Piece merchandise to please even the most discerning collectors. 
                    Dive into a sea of ​​treasures, including high-quality figures, clothing, accessories and more, each inspired by the vibrant and captivating world of Eiichiro Oda's masterpiece.
                    <br>
                    Quality is our compass and we navigate the sea of ​​goods with a commitment to excellence. Every product at One Piece Shop is precision crafted, 
                    capturing the spirit and essence of the characters you love. Expect nothing but the finest materials, vibrant details and a touch of pirate flair in every item.
                </p>
                <p>The shop has been operating since 2023. You can purchase products at the website:</p>
         
                </div>
            </div>
            
             <div class="info">
                    <div class="info_contact">
                        <h3 class="title">CONTACT INFO</h3>
                        <ul>
                            <li>
                                <i class="fa-solid fa-location-dot"></i>
                                <strong>&nbspLocation: </strong>
                                <br>
                                <span>&nbsp &nbsp &nbsp &nbspDa Nang, Viet Nam</span>
                            </li>
                            <li>
                                <i class="fa-solid fa-phone"></i>
                                <strong>&nbspPhone: </strong>
                                <br>
                                <span>&nbsp &nbsp &nbsp &nbsp0123.456.789</span>
                            </li>
                            <li>
                                <i class="fa-regular fa-envelope"></i>
                                <strong>&nbspEmail: </strong>
                                <br>
                                <span>&nbsp &nbsp &nbsp &nbsponepieceshop@gmail.com</span>
                            </li>
                            <li>
                                <i class="fa-regular fa-clock"></i>
                                <strong>&nbspWorking time: </strong>
                                <br>
                                <span>&nbsp &nbsp &nbsp &nbspEvery day of the week</span>
                            </li>
                        </ul>
                    </div>

                    <div class="info_know">
                        <h3 class="title">NECESSARY INFORMATION</h3>
                        <ul>
                            <li>
                                <i class="fa-solid fa-chevron-right"></i>
                                <span><a href="#">&nbsp One piece model shipping price list & payment instructions</a></span>
                            </li>
                            <li>
                                <i class="fa-solid fa-chevron-right"></i>
                                <span><a href="#">&nbsp Information security policy</a></span>
                            </li>
                            <li>
                                <i class="fa-solid fa-chevron-right"></i>
                                <span><a href="#">&nbsp Introduce One Piece Shop</a></span>
                            </li>
                            <li>
                                <i class="fa-solid fa-chevron-right"></i>
                                <span><a href="#">&nbsp Instructions for retail ordering - Payment - Return</a></span>
                            </li>
                            <li>
                                <i class="fa-solid fa-chevron-right"></i>
                                <span><a href="#">&nbsp Promotion on shipping prices (not for model items)</a></span>
                            </li>
                        </ul>
                    </div>

                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d245367.87556112287!2d107.91331202962834!3d16.072075932295352!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219c792252a13%3A0x1df0cb4b86727e06!2sDa%20Nang%2C%20Vietnam!5e0!3m2!1sen!2s!4v1702614109822!5m2!1sen!2s" 
                            width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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
