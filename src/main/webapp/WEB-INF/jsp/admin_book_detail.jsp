<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>详细《${detail.name}》</title>
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
                <h1 class="m-0 text-dark">《${detail.name}》详细</h1>
            </div><!-- /.container-fluid -->
        </div> <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover">
                                    <tbody>
                                    <tr>
                                        <th>书号</th>
                                        <td>${detail.book_id}</td>
                                    </tr>
                                    <tr>
                                        <th>书名</th>
                                        <td>${detail.name}</td>
                                    </tr>
                                    <tr>
                                        <th>作者</th>
                                        <td>${detail.author}</td>
                                    </tr>
                                    <tr>
                                        <th>价格</th>
                                        <td>${detail.price}</td>
                                    </tr>
                                    <tr>
                                        <th>出版社</th>
                                        <td>${detail.press}</td>
                                    </tr>
                                    <tr>
                                        <th>摘要</th>
                                        <td>${detail.summary}</td>
                                    </tr>
                                    <tr>
                                        <th>数量</th>
                                        <td>${detail.number}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div><!-- /.card-body -->
                        </div><!-- /.card -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div><!-- /.content -->
    </div><!-- /.content-wrapper -->
</div><!-- ./wrapper -->