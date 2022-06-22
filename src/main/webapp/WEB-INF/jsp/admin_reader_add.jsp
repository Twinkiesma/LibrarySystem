<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>新增读者</title>
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
                <h1 class="m-0 text-dark">添加读者</h1>
            </div><!-- /.container-fluid -->
        </div> <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card card-gray">
                            <!-- form start -->
                            <form action="reader_add_do.html" method="post" id="readeredit">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <span class="input-group-addon">密码</span>
                                                <input type="password" class="form-control" name="password" id="password" placeholder="请输入读者密码">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">姓名</span>
                                                <input type="text" class="form-control" name="name" id="name" placeholder="请输入读者姓名">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">性别</span>
                                                <input type="text" class="form-control" name="sex" id="sex" placeholder="请输入读者性别">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">单位</span>
                                                <input type="text" class="form-control" name="company" id="company" placeholder="请输入读者单位">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">类型</span>
                                                <input type="text" class="form-control" name="type" id="type" placeholder="请输入读者类型">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">级别</span>
                                                <input type="text" class="form-control" name="level" id="level" placeholder="请输入读者级别">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">金额</span>
                                                <input type="text" class="form-control" name="money" id="money" placeholder="请输入金额" >
                                            </div>
                                            <input type="submit" value="添加" class="btn btn-success btn-sm" class="text-left">
                                            <script>
                                                function mySubmit(flag){
                                                    return flag;
                                                }
                                                $("#readeredit").submit(function () {
                                                    if($("#password").val()==''||$("#name").val()==''||$("#sex").val()==''||$("#company").val()==''||$("#type").val()==''||$("#level").val()==''){
                                                        alert("请填入完整读者信息！");
                                                        return mySubmit(false);
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