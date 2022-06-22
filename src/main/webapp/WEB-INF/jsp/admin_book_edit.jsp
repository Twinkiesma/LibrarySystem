<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>编辑《${detail.name}》</title>
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
                <h1 class="m-0 text-dark">《${detail.name}》编辑</h1>
            </div><!-- /.container-fluid -->
        </div> <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card card-gray">
                            <!-- form start -->
                            <form action="book_edit_do.html?book_id=${detail.book_id}" method="post" id="editbook" >
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <span  class="input-group-addon">书号</span>
                                                <input type="text" readonly="readonly" class="form-control" name="book_id" id="book_id" value="${detail.book_id}">
                                            </div>
                                            <div class="form-group">
                                                <span  class="input-group-addon">书名</span>
                                                <input type="text" class="form-control" name="name" id="name" value="${detail.name}">
                                            </div>
                                            <div class="form-group">
                                                <span  class="input-group-addon">作者</span>
                                                <input type="text" class="form-control" name="author" id="author" value="${detail.author}">
                                            </div>
                                            <div class="form-group">
                                                <span  class="input-group-addon">价格</span>
                                                <input type="text" class="form-control" name="price" id="price" value="${detail.price}">
                                            </div>
                                            <div class="form-group">
                                                <span  class="input-group-addon">出版社</span>
                                                <input type="text" class="form-control" name="press" id="press"  value="${detail.press}" >
                                            </div>
                                            <div class="input-group">
                                                <span  class="input-group-addon">数量</span>
                                                <input type="text" class="form-control" name="number" id="number" value="${detail.number}">
                                            </div>
                                            <div class="form-group">
                                                <span  class="input-group-addon">摘要</span>
                                                <textarea class="form-control" rows="3" name="summary" id="summary" value="${detail.summary}"></textarea>
                                            </div>
                                            <input type="submit" value="确定" class="btn btn-info btn-sm" class="text-left">
                                            <script>
                                                $("#editbook").submit(function () {
                                                    if ($("#name").val() == '' || $("#author").val() == '' || $("#price").val() == '' || $("#press").val() == '' || $("#summary").val() == ''||$("#number").val()=='') {
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