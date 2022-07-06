<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员后台登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/login.js"></script>
</head>
<body style="background-image: url('${pageContext.request.contextPath}/static/img/bg.jpeg')">
<div class="page">
    <div class="loginwarrp">
        <div class="logo">管理员登陆&nbsp;&nbsp;<button type="button" class="btn btn-primary btn-xs " onclick="window.location.href='${pageContext.request.contextPath}'">返回</button></div>
        <div class="login_form">
            <form id="login" action="${pageContext.request.contextPath}/admin/login.do" method="post">
                <li class="login-item">
                    <span>用户名：</span>
                    <input type="text" id="username" name="userName" class="login_input" autofocus >
                </li>
                <li class="login-item">
                    <span>密　码：</span>
                    <input type="password" id="password" name="password" class="login_input" >
                </li>
                <div class="clearfix"></div>
                <li class="login-sub">
                    <div id="errorMsg" class="error" style="color: red">${msg}</div>
                    <input type="button" value="登录" onclick="login()"/>
                    <input type="reset" value="重置" />
                </li>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    window.onload = function() {
        var config = {
            vx : 4,
            vy : 4,
            height : 2,
            width : 2,
            count : 100,
            color : "121, 162, 185",
            stroke : "100, 200, 180",
            dist : 6000,
            e_dist : 20000,
            max_conn : 10
        }
        CanvasParticle(config);
    }
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/canvas-particle.js"></script>
</body>
</html>