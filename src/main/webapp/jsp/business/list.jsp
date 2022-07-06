<%@ page language="java" pageEncoding="UTF-8"%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/static/css/admin.css" rel="stylesheet" type="text/css" />
	<script type="application/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script type="text/javascript">
		//删除业务种类
		function p_del() {
			var msg = "您确定要删除该业务类型吗？";
			if (confirm(msg)==true){
			return true;
			}else{
			return false;
			}
		}

		/**
		 * 获取业务种类ajax
		 */
		function getBusiness(){
			$.ajax({
				url:"${pageContext.request.contextPath}/font/getBusinessAll.do",
				async:false,
				type:"get",
				success:function (data) {
					for (let i = 0; i < data.length; i++) {
						$("#business").append("<option value=\""+data[i]['bid']+"\">"+data[i]['bName']+"</option>")
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
			if ($("#id").val().trim().length == 0 && $("#business option:selected").val() == 0){
				alert("至少给出一项参数")
				return;
			}
			//查询
			$("#Form1").submit()
		}
	</script>
</HEAD>
<body onload="getBusiness();">
	<br />
	<form id="Form1"
		action="${pageContext.request.contextPath}/admin/getBusiness.do"
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
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">业务机构代码</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="number" name="bid" size="20" placeholder="编号" id="id" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">业务机构名称</td>
								<td class="ta_01" bgColor="#ffffff" colspan="2">
									<select name="bName" id="business">
										<option value="0">--请选择业务机构--</option>
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
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>业 务 机 构 列 表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<input type="button" value="添加" class="button_view" onclick="window.location.href='add.jsp'"/>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="10%">业务类型名称</td>
								<td align="center" width="10%">业务机构名称</td>
								<td align="center" width="15%">业务类型名</td>
								<td align="center" width="30%">描述</td>
								<td width="8%" align="center">编辑</td>
							</tr>
							
							<c:forEach items="${businessList}" var="business">
							<tr style="FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="10%">${business.bid}</td>
								<td align="center" width="15%">${business.bkid}</td>
								<td align="center" width="30%">${business.bName}</td>
								<td align="center" width="30%">${business.comment}</td>
								<td width="8%" align="center"><a href="${pageContext.request.contextPath}/business/getBusinessByBId.do?bid=${business.bid}">
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