<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的借还</title>
    <jsp:include page="/WEB-INF/jsp/resources.jsp" />
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <jsp:include page="/WEB-INF/jsp/reader_layout.jsp" />
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <h1 class="m-0 text-dark">我的借还日志</h1>
            </div><!-- /.container-fluid -->
        </div> <!-- /.content-header -->
        <div style="position: relative;padding-top: 100px">
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
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>书号</th>
                                        <th>借出日期</th>
                                        <th>归还日期</th>
                                        <th>状态</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list}" var="alog">
                                        <tr>
                                            <td><c:out value="${alog.ser_num}"></c:out></td>
                                            <td><c:out value="${alog.book_id}"></c:out></td>
                                            <td><c:out value="${alog.lend_data}"></c:out></td>
                                            <td><c:out value="${alog.back_data}"></c:out></td>
                                            <c:if test="${empty alog.backDate}">
                                                <td>未还</td>
                                            </c:if>
                                            <c:if test="${!empty alog.backDate}">
                                                <td>已还</td>
                                            </c:if>
                                            <c:if test="">
                                                <td>超期</td>
                                            </c:if>
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