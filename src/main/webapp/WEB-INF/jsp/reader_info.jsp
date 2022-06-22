<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${readerinfo.name}的主页</title>
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
                <h1 class="m-0 text-dark">我的信息</h1>
            </div><!-- /.container-fluid -->
        </div> <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card card-gray">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <table class="table table-hover">
                                            <tr>
                                                <th>读者卡号</th>
                                                <td>${readerinfo.reader_id}</td>
                                            </tr>
                                            <tr>
                                                <th>姓名</th>
                                                <td>${readerinfo.name}</td>
                                            </tr>
                                            <tr>
                                                <th>性别</th>
                                                <td>${readerinfo.sex}</td>
                                            </tr>
                                            <tr>
                                                <th>单位</th>
                                                <td>${readerinfo.company}</td>
                                            </tr>
                                            <tr>
                                                <th>类型</th>
                                                <td>${readerinfo.type}</td>
                                            </tr>
                                            <tr>
                                                <th>级别</th>
                                                <td>${readerinfo.level}</td>
                                            </tr>
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
                                            </tbody>
                                        </table>
                                        <a class="btn btn-info" href="reader_info_edit.html" role="button">修改</a>
                                    </div><!-- /.col-md-6 -->
                                </div><!-- /.row -->

                            </div><!-- /.card-body -->
                        </div><!-- /.card card-gray -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div><!-- /.content -->
    </div><!-- /.content-wrapper -->
</div><!-- /.wrapper -->
</body>
</html>
