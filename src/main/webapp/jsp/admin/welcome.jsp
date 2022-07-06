<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/static/css/admin.css" type="text/css" rel="stylesheet" />
<style type="text/css">
</style>
<style>
BODY {SCROLLBAR-FACE-COLOR: #cccccc; SCROLLBAR-HIGHLIGHT-COLOR: #ffffFF; SCROLLBAR-SHADOW-COLOR: #ffffff; SCROLLBAR-3DLIGHT-COLOR: #cccccc; SCROLLBAR-ARROW-COLOR:  #ffffff; SCROLLBAR-TRACK-COLOR: #ffffFF; SCROLLBAR-DARKSHADOW-COLOR: #cccccc; }
</style>
</head>
<body>
<form name="Form1" method="post" id="Form1">
	<table width="100%" border="0" height="88" background="${pageContext.request.contextPath}/static/img/bg.jpeg">
		<tr>
			<td colspan=3 class="ta_01" align="center" bgcolor="#f59f1d"><strong>系统首页</strong></td>
		</tr>
		<tr>
			<td width="65%" height="84" align="center" valign="top" >
				<br />
				<font size="200px">登录成功！</font>
			</td>
		</tr>
	</table>
	</form>
</body>
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
</html>