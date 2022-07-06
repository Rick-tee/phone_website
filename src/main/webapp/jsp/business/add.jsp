<%@ page language="java" pageEncoding="UTF-8"%>

<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<LINK href="${pageContext.request.contextPath}/static/css/admin.css" type="text/css" rel="stylesheet">
	<script type="application/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
</HEAD>
<script type="application/javascript">
	/**
	 * 获取业务种类ajax
	 */
	function getKind(){
		$.ajax({
			url:"${pageContext.request.contextPath}/font/getKind.do",
			async:false,
			type:"get",
			success:function (data) {
				for (let i = 0; i < data.length; i++) {
					$("#kind").append("<option value=\""+data[i]['bkid']+"\">"+data[i]['bkName']+"</option>")
				}
			},
			error:function () {
				window.history.back();location.reload();
			}
		})
	}

	/**
	 * 业务机构提交
	 */
	function submitInfo(){
		//获得业务机构编号
		var bid = $("#bid").val()

		//获得业务机构名称
		var bName = $("#bName").val().trim()

		//获得业务类型编号
		var bkid = $("#kind option:selected").val()

		//获得描述信息
		var comment = $("#comment").val().trim()

		//逻辑判断
		if (bid == ""){
			alert("业务机构编号必须填写！")
			return;
		}

		if (bName == ""){
			alert("业务机构名称必须填写！")
			return;
		}

		if (bkid == "0"){
			alert("请选择有效业务类型名称")
			return;
		}

		//发起请求，提交数据
		$("#Form1").submit()
	}
</script>
<body onload="getKind()">
<form id="Form1" action="${pageContext.request.contextPath}/business/addBusinessBySelect.do" method="post">
	<table cellSpacing="1" cellPadding="5" width="100%" align="center"
		   bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
		<tr>
			<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="26">
				<strong>添加业务机构 <font color="red">${msg}</font></strong>
			</td>
		</tr>
		<tr>
			<td align="center" bgColor="#f5fafe" class="ta_01">业务机构编号：</td>
			<td class="ta_01" bgColor="#ffffff">
				<input type="number" class="bg" name="bid" id="bid"/>
			</td>
			<td align="center" bgColor="#f5fafe" class="ta_01">业务机构名称：</td>
			<td class="ta_01" bgColor="#ffffff">
				<input type="text" class="bg" id="bName" name="bName"/>
			</td>
		</tr>
		<tr>
			<td height="22" align="center" bgColor="#f5fafe" class="ta_01">业务类型名称</td>
			<td class="ta_01" bgColor="#ffffff">
				<select name="bkid" id="kind">
					<option value="0">--请选择业务类型--</option>
				</select>
			</td>

			<td align="center" bgColor="#f5fafe" class="ta_01">业务机构描述：</td>
			<td class="ta_01" bgColor="#ffffff">
				<textarea name="comment" class="bg" id="comment"></textarea>
			</td>
		</tr>
		<tr>
			<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
				<input type="button" class="button_ok" value="确定" onclick="submitInfo()">
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