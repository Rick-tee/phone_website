<%@ page language="java" pageEncoding="UTF-8"%>

<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/static/css/admin.css" type="text/css" rel="stylesheet">
	<script type="application/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
</HEAD>
<script type="application/javascript">

	//表单提交
	function formInfo(){
		//获得业务类型编号
		var bkid = $("#bkid").val()

		//获得业务类型名称
		var bkName = $("#bkName").val().trim()

		//获得描述
		var comment = $("#comment").val().trim()

		if (bkid.length == 0){
			alert("业务类型编号必须填写！")
			return;
		}

		if (bkName.length == 0){
			alert("业务类型名称必须填写！")
			return;
		}

		//提交数据
		$("#form1").submit();
	}

</script>
<body>
<form id="form1" name="Form1" action="${pageContext.request.contextPath}/kind/addKind.do" method="post">
	<table cellSpacing="1" cellPadding="5" width="100%" align="center"
		   bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
				<strong>添加业务类型 <font color="red">${msg}</font></strong>
			</td>
		</tr>
		<tr>
			<td align="center" bgColor="#f5fafe" class="ta_01">业务类型编号：</td>
			<td class="ta_01" bgColor="#ffffff">
				<input type="number" class="bg" name="bkid" id="bkid" value=""/>
			</td>
			<td align="center" bgColor="#f5fafe" class="ta_01">业务类型名称：</td>
			<td class="ta_01" bgColor="#ffffff">
				<input type="text" class="bg" id="bkName" name="bkName"/>
			</td>
		</tr>
		<tr>
			<td align="center" bgColor="#f5fafe" class="ta_01">业务机构描述：</td>
			<td class="ta_01" bgColor="#ffffff">
				<textarea name="comment" id="comment" class="bg"></textarea>
			</td>
		</tr>
		<tr>
			<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
				<input type="button" class="button_ok" value="确定" onclick="formInfo()">
				<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
				<input type="reset" value="重置" class="button_cancel" />
				<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
				<input class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
				<span id="Label1"> </span>
			</td>
		</tr>
	</table>
</form>
</body>
</HTML>