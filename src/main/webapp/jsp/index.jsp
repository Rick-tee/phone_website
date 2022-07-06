<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>信息表单填写</title>
    <link rel="stylesheet" id="templatecss" type="text/css"
          href="${pageContext.request.contextPath}/static/css/basic-grey.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
    <%--引入jquery--%>
    <script type="application/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
</head>

<body style="background-image: url('${pageContext.request.contextPath}/static/img/bg.jpeg')">
<br><br>
<form id="payment" action="${pageContext.request.contextPath}/font/getFormInfo.do">
    <div>

        <legend>学员信息登记表</legend>

        <ol>

            <li>

                <label>业务类型：</label>

                <select name="BKId" id="kind" onchange="getBusiness(this)">
                    <option value="0">--请选择业务类型--</option>
                </select>

            </li>

            <li>

                <label>机构名称：</label>

                <select name="BId" id="business" onchange="getIntroduction(this)">
                    <option value="0">--请选择具体报名机构--</option>
                </select>

            </li>

            <li>

                <label>机构介绍：</label>

                <textarea id="introduction"  type="text" placeholder="机构介绍" disabled></textarea>

            </li>

            <li>

                <label for="name">姓名：</label>

                <input id="name" name="name" type="text" placeholder="请输入姓名" required autofocus>

            </li>

            <li style="flex: revert">
                <label>性别：</label>
                <div>
                    <input name="sex" type="radio" value="1">男
                </div>
                <div>
                    <input name="sex" type="radio" value="0" checked>女
                </div>
            </li>

            <li>

                <label for="tel">联系电话：</label>

                <input id="tel" name="tel" type="tel" placeholder="请填写电话信息" required>

            </li>

            <li>

                <label for="add">联系地址：</label>

                <textarea id="add" name="add" type="text" placeholder="请填写联系地址" required></textarea>

            </li>

        </ol>

    </div>

    <div class="row">
        <button type="button" class="btn btn-info col-md-3" style="margin-left: 12%" onclick="formInfoSubmit()">登记提交</button>&nbsp;&nbsp;
        <button type="reset" class="btn btn-warning col-md-3">信息重置</button>&nbsp;&nbsp;
        <button type="button" class="btn btn-primary col-md-3" onclick="window.location.href='jsp/login.jsp'">管理员登录</button>
    </div>

</form>
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
