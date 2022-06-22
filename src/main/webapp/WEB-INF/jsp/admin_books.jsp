<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部图书信息</title>
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
                <h1 class="m-0 text-dark">图书列表</h1>
            </div><!-- /.container-fluid -->
        </div> <!-- /.content-header -->
        <div class="card-header" id="searcher"style="background-color: #f2f4f8;">
            <div class="row">
                <div class="col-md-9">
                    <form method="post" action="querybook.html" class="form-inline" id="searchform">
                        <div class="input-group">
                            <input type="text" placeholder="请输入书名" class="form-control" id="search" name="searchWord">
                            <span class ="input-group-btn">
                                <input type="submit" value="搜索" class="btn btn-default">
                            </span>
                        </div>
                    </form>
                    <script>
                        $("#searchform").submit(function () {
                            var val=$("#search").val();
                            if(val==''){
                                alert("请输入关键字");
                                return false;
                            }
                        })
                    </script>
                </div>
            </div>
        </div>
        <div style="position: relative;top: 10%">
            <c:if test="${!empty succ}">
                <div class="alert alert-success alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert"
                            aria-hidden="true">
                        &times;
                    </button>
                        ${succ}
                </div>
            </c:if>
            <c:if test="${!empty error}">
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert"
                            aria-hidden="true">
                        &times;
                    </button>
                        ${error}
                </div>
            </c:if>
        </div>

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover text-nowrap">
                                    <thead>
                                    <tr>
                                        <th>书号</th>
                                        <th>书名</th>
                                        <th>作者</th>
                                        <th>价格</th>
                                        <th>余量</th>
                                        <th>出版社</th>
                                        <th width="120px" align="center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${books}" var="book">
                                        <tr>
                                            <td><c:out value="${book.book_id}"></c:out></td>
                                            <td><c:out value="${book.name}"></c:out></td>
                                            <td><c:out value="${book.author}"></c:out></td>
                                            <td><c:out value="${book.price}"></c:out></td>
                                            <td><c:out value="${book.number}"></c:out></td>
                                            <td><c:out value="${book.press}"></c:out></td>
                                            <td><div class="btn-group">
                                                <a href="admin_book_detail.html?book_id=<c:out value="${book.book_id}"></c:out>"><button type="button" class="btn btn-warning btn-xs">详情</button></a>
                                                <a href="updatebook.html?book_id=<c:out value="${book.book_id}"></c:out>"><button type="button" class="btn btn-info btn-xs">编辑</button></a>
                                                <a href="deletebook.html?book_id=<c:out value="${book.book_id}"></c:out>"><button type="button" class="btn btn-danger btn-xs">删除</button></a>
                                            </div></td>
                                        </tr>
                                    </c:forEach>
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
</body>
</html>