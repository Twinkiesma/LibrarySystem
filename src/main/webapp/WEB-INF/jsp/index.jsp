<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书馆登录</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <style>
        #login {
            width: 25%;
            height: 40%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 3%;
            display: block;
            position: center;
        }
    </style>
</head>

<body background="img/login.jpg"
      style="background-attachment: fixed;background-position: center;background-repeat: no-repeat;background-size: cover;">

<h2 style="text-align: center; color: white;font-size: 500%;margin-top: 5%;">图 书 馆</h2>

<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #e9e9e9;">
        <h3 class="panel-title" style="font-size: 100%;">用户登录</h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <label for="id">账号</label>
            <input type="text" class="form-control" id="id" placeholder="请输入账号">
        </div>
        <div class="form-group">
            <label for="passwd">密码</label>
            <input type="password" class="form-control" id="passwd" placeholder="请输入密码">
        </div>
        <p style="text-align: right;color: red;" id="info"></p><br/>
        <div style=" text-align: center;">
            <button id="loginButton" class="btn btn-primary" style="width: 50%;">登录</button>
        </div>
    </div>
</div>

<script>
    $("#loginButton").click(function () {
        var id = $("#id").val();                    // 返回账号
        var passwd = $("#passwd").val();            // 返回密码
        if (id == '') {                             // 判断账号是否为空
            $("#info").text("提示：账号不能为空");
        } else if (passwd == '') {                  // 判断密码是否为空
            $("#info").text("提示：密码不能为空");
        } else if (isNaN(id)) {                     // 判断id是否为非数字值
            $("#info").text("提示：账号必须为数字");
        } else {
            $.ajax({
                type: "POST",
                url: "loginCheck",
                data: {
                    id: id,
                    passwd: passwd
                },
                dataType: "json",                   // 返回json数据
                success: function (data) {
                    if (data.stateCode.trim() === "0") {
                        $("#info").text("提示：账号或密码错误！");
                    } else if (data.stateCode.trim() === "1") {
                        $("#info").text("提示：管理员登录成功，跳转中...");
                        window.location.href = "admin_main.html";
                    } else if (data.stateCode.trim() === "2") {
                        $("#info").text("提示：读者登录成功，跳转中...");
                        window.location.href = "reader_main.html";
                    }
                }
            });
        }
    })
</script>
</body>
</html>