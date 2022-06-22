<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部读者信息</title>
    <jsp:include page="/WEB-INF/jsp/resources.jsp" />
</head>

<body class="hold-transition sidebar-mini">
<c:if test="${!empty info}">
    <script>alert("${info}");window.location.href="allreaders.html"</script>
</c:if>

<div class="wrapper">
    <jsp:include page="/WEB-INF/jsp/admin_layout.jsp" />
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <h1 class="m-0 text-dark">读者列表</h1>
            </div><!-- /.container-fluid -->
        </div> <!-- /.content-header -->

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
                                        <th>读者卡号</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>单位</th>
                                        <th>类型</th>
                                        <th>级别</th>
                                        <th>金额</th>
                                        <th>编辑</th>
                                        <th>删除</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${readers}" var="reader">
                                        <tr>
                                            <td><c:out value="${reader.reader_id}"></c:out></td>
                                            <td><c:out value="${reader.name}"></c:out></td>
                                            <td><c:out value="${reader.sex}"></c:out></td>
                                            <td><c:out value="${reader.company}"></c:out></td>
                                            <td><c:out value="${reader.type}"></c:out></td>
                                            <td><c:out value="${reader.level}"></c:out></td>
                                            <td><c:out value="${reader.money}"></c:out></td>
                                            <td><a href="admin_readerinfo_edit.html?reader_id=<c:out value="${reader.reader_id}"></c:out>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
                                            <td><a href="reader_delete.html?reader_id=<c:out value="${reader.reader_id}"></c:out>"><button type="button" class="btn btn-danger btn-xs">删除</button></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <em>
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
                                </em>
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