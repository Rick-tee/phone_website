<%@ page language="java" pageEncoding="UTF-8"%>

<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<LINK href="${pageContext.request.contextPath}/static/css/admin.css" type="text/css" rel="stylesheet">
</HEAD>
<body onload="setProductCategory('${p.category}')">
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/editProduct" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="id" value="${p.id}" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
					<strong>编辑业务类型</strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">业务类型编码：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="bkid" class="bg" disabled value="${kind.bkid}" />
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">业务类型名称：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="bkName" class="bg" value="${kind.bkName}" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">业务类型描述：</td>
				<td class="ta_01" bgColor="#ffffff">
					<textarea name="comment" class="bg">${kind.comment}</textarea>
				</td>

			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<input type="submit" class="button_ok" value="确定"> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" class="button_cancel" /> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"> </span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>