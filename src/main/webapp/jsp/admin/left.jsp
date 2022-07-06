<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>菜单</title>
	<link href="${pageContext.request.contextPath}/static/css/left.css" rel="stylesheet" type="text/css">
</head>
	<body>
		<table width="100" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td height="12"></td>
		  </tr>
		</table>
		<table width="100%" border="0">
			  <tr>
			  	<td><a href="${pageContext.request.contextPath}/admin/getCusInfoAll.do" target="mainFrame" class="left_list">顾客管理</a></td>
			  </tr>
			<tr>
				<td><a href="${pageContext.request.contextPath}/admin/getKindAll.do" target="mainFrame" class="left_list">业务类型管理</a></td>
			</tr>
			<tr>
				<td><a href="${pageContext.request.contextPath}/admin/getBusinessAll.do" target="mainFrame" class="left_list">业务机构管理</a></td>
			</tr>
		</table>
	</body>
</html>
