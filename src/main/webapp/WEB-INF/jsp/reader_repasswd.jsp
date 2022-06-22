<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${reader.name}的主页</title>
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
                <h1 class="m-0 text-dark">密码修改</h1>
            </div><!-- /.container-fluid -->
        </div> <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card card-gray">
                            <!-- form start -->
                            <form method="post" action="reader_repasswd_do" class="form-inline" id="repasswd">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <input type="password" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码" class="form-control">
                                            </div>
                                            <div class="input-group">
                                                <input type="password" id="newPasswd" name="newPasswd" placeholder="输入新密码" class="form-control">
                                            </div>
                                            <div class="input-group">
                                                <input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码" class="form-control">
                                            </div>
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
                                            </>
                                            <em  id="info" style="color: red;"></em>
                                            <div>
                                                <input type="submit" value="提交" class="btn btn-default">
                                            </div>
                                        </div>
                                        <script>
                                            $(document).keyup(function () {
                                                if ($("#newPasswd").val() != $("#reNewPasswd").val() && $("#newPasswd").val() != "" && $("#reNewPasswd").val() != "" && $("#newPasswd").val().length == $("#reNewPasswd").val().length) {
                                                    $("#info").text("提示：两次输入的新密码不同，请检查!");
                                                } else {
                                                    $("#info").text("");
                                                }
                                            })

                                            $("#repasswd").submit(function () {
                                                if ($("#oldPasswd").val() == '' || $("#newPasswd").val() == '' || $("#reNewPasswd").val() == '') {
                                                    $("#info").text("提示：请填写完整!");
                                                    return false;
                                                } else if ($("#newPasswd").val() != $("#reNewPasswd").val()) {
                                                    $("#info").text("提示：两次输入的新密码不同，请检查!");
                                                    return false;
                                                }
                                            })
                                        </script>
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