<%@ page language="java" pageEncoding="UTF-8"%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/static/css/admin.css" rel="stylesheet" type="text/css" />
	<script type="application/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script type="text/javascript">
	    //添加顾客信息
		function addProduct() {
			window.location.href = "${pageContext.request.contextPath}/admin/products/add.jsp";
		}
		//删除顾客
		function p_del() {
			var msg = "您确定要删除该顾客信息吗？";
			if (confirm(msg)==true){
			return true;
			}else{
			return false;
			}
		}

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
		 * 获得业务各个具体名称
		 * @param obj 对象
		 */
		function getBusiness(obj){
			$("#business").empty()
			if ($("#" + obj.id + " option:selected").val() == 0){
				//清空内容
				$("#business").append("<option value=\"0\">--请选择机构名称--</option>")
				return;
			}

			//获得业务具体名
			$.ajax({
				url:"${pageContext.request.contextPath}/font/getBusiness.do",
				type:"get",
				data:{
					BKId:$("#" + obj.id + " option:selected").val()
				},
				success:function (data) {
					introduction = data
					for (let i = 0; i < data.length; i++) {
						$("#business").append("<option value=\""+data[i]['bid']+"\">"+data[i]['bName']+"</option>")
					}
				},
				error:function () {
					alert("发现未知错误！")
				}
			})
		}

		/**
		 * 手机号码规则判断
		 * @param phone 传入的手机号码
		 * @returns {boolean} 正确：true；错误：false
		 */
		function phoneExp(phone) {
			return /^1[345789]\d{9}$/.test(phone)
		}

		/**
		 * 搜索
		 */
		function search(){
			//如果所有查询条件都是空，则给出提示
			if ($("#id").val().trim().length == 0 && $("#userName").val().trim().length == 0 &&
					$("#tel").val().trim().length == 0&& $("#business option:selected").val() == 0){
				alert("至少给出一项参数")
				return;

			}
			if ($("#tel").val().trim().length != 0 && !phoneExp($("#tel").val())){
				alert("手机号码不正确！")
				return;
			}
			//查询
			$("#Form1").submit()
		}
	</script>
</HEAD>
<body onload="getKind();">
	<br />
	<form id="Form1"
		action="${pageContext.request.contextPath}/admin/getCusInfo.do"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>查 询 条 件</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">顾客编号</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="number" name="id" size="20" placeholder="编号" id="id" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">手机号码</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="tel" name="tel" size="11" placeholder="联系电话" id="tel" class="bg" />
								</td>
							</tr>
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">顾客姓名</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="userName" size="10" placeholder="顾客姓名" id="userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">业务选择</td>
								<td class="ta_01" bgColor="#ffffff" colspan="2">
									<select name="bkid" id="kind" onchange="getBusiness(this)">
										<option value="0">--请选择业务类型--</option>
									</select>
									<select name="bid" id="business">
										<option value="0">--请选择机构名称--</option>
									</select>
								</td>
							</tr>

							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe" class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff">
									<font face="宋体" color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<br /><br />
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<input type="button" value="查询" class="button_view" onclick="search()" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" value="重置" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>顾 客 列 表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="5%">顾客编号</td>
								<td align="center" width="5%">顾客姓名</td>
								<td align="center" width="5%">性别</td>
								<td align="center" width="10%">手机号码</td>
								<td align="center" width="5%">业务类别</td>
								<td align="center" width="15%">业务描述</td>
								<td align="center" width="10%">机构名称</td>
								<td align="center" width="15%">机构描述</td>
								<td align="center" width="15%">联系人地址</td>
								<td width="8%" align="center">删除</td>
							</tr>
							
							<c:forEach items="${allInfoList}" var="all">
							
							<tr style="FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="5%">${all.id}</td>
								<td align="center" width="5%">${all.name}</td>
								<td align="center" width="5%">${all.sex}</td>
								<td align="center" width="10%">${all.tel}</td>
								<td align="center" width="5%">${all.bkName}</td>
								<td align="center" width="15%">${all.comment}</td>
								<td align="center" width="9%">${all.bName}</td>
								<td align="center" width="15%">${all.busAddr}</td>
								<td align="center" width="15%">${all.addr}</td>
								<td width="8%" align="center"><a href="${pageContext.request.contextPath}/admin/deleteCusById.do?id=${all.id}">删除</a></td>
							</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>