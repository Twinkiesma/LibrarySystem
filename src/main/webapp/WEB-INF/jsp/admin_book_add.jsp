<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>新增图书</title>
    <jsp:include page="/WEB-INF/jsp/resources.jsp" />
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <jsp:include page="/WEB-INF/jsp/admin_layout.jsp" />
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <h1 class="m-0 text-dark">添加图书</h1>
            </div><!-- /.container-fluid -->
        </div> <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card card-gray">
                            <!-- form start -->
                            <form action="book_add_do.html" method="post" id="addbook">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">书名</label>
                                                <input type="text" class="form-control" name="name" id="name" placeholder="请输入书名">
                                            </div>
                                            <div class="form-group">
                                                <label for="author">作者</label>
                                                <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者名">
                                            </div>
                                            <div class="form-group">
                                                <label for="price">价格</label>
                                                <input type="text" class="form-control" name="price" id="price" placeholder="请输入图书价格">
                                            </div>
                                            <div class="form-group">
                                                <label for="press">出版社</label>
                                                <input type="text" class="form-control" name="press" id="press" placeholder="请输入出版社">
                                            </div>
                                            <div class="form-group">
                                                <label for="summary">摘要</label>
                                                <textarea class="form-control" rows="3" name="summary" id="summary" placeholder="请输入图书摘要"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="number">数量</label>
                                                <input type="text" class="form-control" name="number" id="number" placeholder="请输入图书数量">
                                            </div>
                                            <input type="submit" value="添加" class="btn btn-success btn-sm" class="text-left">
                                            <script>
                                                $("#addbook").submit(function () {
                                                    if ($("#name").val() == '' || $("#author").val() == '' || $("#price").val() == '' || $("#press").val() == '' || $("#summary").val() == ''|| $("#number").val() == '') {
                                                        alert("请填入完整图书信息！");
                                                        return false;
                                                    }
                                                })
                                            </script>
                                        </div><!-- /.col-md-6 -->
                                    </div><!-- /.row -->
                                </div><!-- /.card-body -->
                            </form>
                        </div><!-- /.card card-gray -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div><!-- /.content -->
    </div><!-- /.content-wrapper -->
</div><!-- /.wrapper -->
</body>
</html>