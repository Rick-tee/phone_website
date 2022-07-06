<%@ page language="java" pageEncoding="UTF-8"%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/static/css/admin.css" rel="stylesheet" type="text/css" />
	<script type="application/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script type="text/javascript">
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
		 * 搜索
		 */
		function search(){
			//如果所有查询条件都是空，则给出提示
			if ($("#id").val().trim().length == 0 && $("#kind option:selected").val() == 0){
				alert("至少给出一项参数")
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
		action="${pageContext.request.contextPath}/admin/getKindBySelective.do"
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
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">业务类型编码</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="number" name="bkid" size="20" placeholder="编号" id="id" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">业务类型名称</td>
								<td class="ta_01" bgColor="#ffffff" colspan="2">
									<select name="bkName" id="kind">
										<option value="0">--请选择业务类型--</option>
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
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>业 务 种 类 列 表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
                        <a href="${pageContext.request.contextPath}/jsp/kind/add.jsp" class="button_view">添加</a>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="10%">业务类型代码</td>
								<td align="center" width="15%">业务类型名</td>
								<td align="center" width="30%">描述</td>
								<td width="8%" align="center">编辑</td>
							</tr>
							
							<c:forEach items="${kindList}" var="kind">
							<tr style="FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="10%">${kind.bkid}</td>
								<td align="center" width="15%">${kind.bkName}</td>
								<td align="center" width="30%">${kind.bkName}</td>
								<td width="8%" align="center"><a href="${pageContext.request.contextPath}/kind/getKindByBKId.do?bkid=${kind.bkid}">
									<img width="18px" height="18px" src="${pageContext.request.contextPath}/static/img/edit.png">
								</a></td>
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