<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/style_add.css">

        <title>Add Category</title>
    </head>
    <body>

         <%@include file="../slide_bar.jsp" %>
        
        <!-- NAVBAR -->
        <section id="content">
             <%@include file="../header.jsp" %>

            <!-- MAIN -->
            <main>
                <div class="container-form-add-category-product">
                    <h4>Add New Category Product</h4>
                    <form action="${pageContext.request.contextPath}/admin/category_product/add" method="post">
                        <div class="form-group">
                            <label for="nameCategory">Name Category Product</label>
                            <input type="text" class="form-control" placeholder="Enter name category product" name="titleCategoryProduct" required>
                        </div>
                        <div class="form-group">
                            <label for="describeCategory">Describe Category Product</label>
                            <textarea type="text" name="descCategoryProduct" placeholder="Enter describe category product here ..." class=" form-control" required></textarea>

                        </div>
                        <button id="btn" type="submit" class="btn btn-primary">Add new category product</button>
                    </form>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- NAVBAR -->

         <%@include file="../footer.jsp" %>
