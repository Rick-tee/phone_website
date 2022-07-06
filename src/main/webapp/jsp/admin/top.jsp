<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        BODY {
            MARGIN: 0px;
            BACKGROUND-COLOR: #ffffff
        }

        BODY {
            FONT-SIZE: 12px;
            COLOR: #000000
        }

        TD {
            FONT-SIZE: 12px;
            COLOR: #000000
        }

        TH {
            FONT-SIZE: 12px;
            COLOR: #000000
        }

        .height1 {
            width: 100%;
            height: 74px;
        }

        .img_logo {
            min-width: 100%;
            max-width: 100%;
            height: 74px;
        }

    </style>
    <link href="${pageContext.request.contextPath}/static/css/admin.css"
          rel="stylesheet" type="text/css">

    <script type="application/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript">
        function exitSys() {
            var flag = window.confirm("确认退出系统吗?");
            if (flag) {
                window.top.open('${pageContext.request.contextPath}', '_parent', '');
                window.top.close();
            }
        }
    </script>
    <script language="JavaScript">

        //获得用户名
        $("#getUserName").text(localStorage.getItem("userName"))

        // 获取实时时间
        function getDate(){
            //清除
            $("#time").empty()

            //拼接
            tmpDate = new Date();
            date = tmpDate.getDate();
            month = tmpDate.getMonth() + 1;
            year = tmpDate.getFullYear();

            myArray = new Array(6);
            myArray[0] = "星期日"
            myArray[1] = "星期一"
            myArray[2] = "星期二"
            myArray[3] = "星期三"
            myArray[4] = "星期四"
            myArray[5] = "星期五"
            myArray[6] = "星期六"
            weekday = tmpDate.getDay();

            //星期
            var week = '';

            if (weekday == 0 | weekday == 6) {
                week = myArray[weekday]
            } else {
                week = myArray[weekday]
            }

            $("#time").text(year + "年" + month + "月" + date + "日" + week + "    "
                + tmpDate.getHours() + "时" + tmpDate.getMinutes() + "分"
                + tmpDate.getSeconds() + "秒");
        }

        //一秒调用一次
        setInterval("getDate()",1000);
    </script>
</HEAD>
<body>
<div class="height1" style="background-color: #bedfda;text-align: center">
    <font color="#ffe4c4" size="60px">表单后台系统</font>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="26" valign="bottom">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="85%" align="left">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <font color="red" id="time">
                        </font>
                    </td>
                    <td width="15%">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="155" valign="bottom">
                                    <font color="blue"><a href="javascript:void(0)"
                                                          onclick="exitSys()">退出系统</a>
                                    </font>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <font color="blue" id="getUserName">
                                        欢迎登录！
                                    </font>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="right" width="5%"></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</HTML>
