<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>编辑[${readerInfo.reader_id}]</title>
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
                <h1 class="m-0 text-dark">编辑[${readerInfo.reader_id}]</h1>
            </div><!-- /.container-fluid -->
        </div> <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="card card-gray">
                            <!-- form start -->
                            <form action="reader_info_edit_ado.html?reader_id=${readerInfo.reader_id}" method="post" id="readeredit" >
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <span class="input-group-addon">卡号</span>
                                                <input type="text" readonly="readonly" class="form-control" name="reader_id" id="reader_id" value="${readerInfo.reader_id}">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">姓名</span>
                                                <input type="text" class="form-control" name="name" id="name" value="${readerInfo.name}">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">性别</span>
                                                <input type="text" class="form-control" name="sex" id="sex" value="${readerInfo.sex}">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">单位</span>
                                                <input type="text" class="form-control" name="company" id="company" value="${readerInfo.company}">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">类型</span>
                                                <input type="text" class="form-control" name="type" id="type" value="${readerInfo.type}">
                                            </div>
                                            <div class="form-group">
                                                <span class="input-group-addon">级别</span>
                                                <input type="text" class="form-control" name="level" id="level" value="${readerInfo.level}">
                                            </div>
                                            <input type="submit" value="确定" class="btn btn-info btn-sm" class="text-left">
                                            <script>
                                                $("#readeredit").submit(function () {
                                                    if($("#reader_id").val()==''||$("#name").val()==''||$("#sex").val()==''||$("#company").val()==''||$("#type").val()==''||$("#level").val()==''){
                                                        alert("请填入完整信息！");
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