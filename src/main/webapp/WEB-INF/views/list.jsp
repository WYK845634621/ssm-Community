<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有医生列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- -Web的路径问题：不以/开始的相对路径，找资源时以当前资源的路径为基准，经常容易出错
				以/开始的相对路径，找资源时以服务器的路径为标准(http://localhost:3306/需要加上项目名 -->
<!-- 引入jQuery -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<!-- 引入Bootstrap -->
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 引入jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">

		<!-- 标题 -->
		<div class="row">
			<dir class="col-md-12">
				<h1>SSM-Community</h1>
			</dir>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-info">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>doctorName</th>
						<th>gender</th>
						<th>age</th>
						<th>phone</th>
						<th>email</th>
						<th>address</th>
						<th>idcard</th>
						<th>cId</th>
						<th>sId</th>
						<th>cmyName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="doctor">
					
					<tr>
						<td>${doctor.doctorId }</td>
						<td>${doctor.doctorName }</td>
						<td>${doctor.gender=="M"?"男":"女" }</td>
						<td>${doctor.age }</td>
						<td>${doctor.phone }</td>
						<td>${doctor.email }</td>
						<td>${doctor.address }</td>
						<td>${doctor.idcard }</td>
						<td>${doctor.cId }</td>
						<td>${doctor.sId }</td>
						<td>${doctor.community.cmyName }</td>
						<td>
							<button class="btn btn-primary btn-xs">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								编辑
							</button>
							<button class="btn btn-danger btn-xs">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								删除
							</button>
						</td>
					</tr>
					
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页数据 -->
			<div class="col-md-6">
				当前${pageInfo.pageNum }页,共${pageInfo.pages }页,存在${pageInfo.total }条记录
			</div>
			<!-- 分页条 -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${APP_PATH }/doctors?pn=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
					<li><a href="${APP_PATH }/doctors?pn=${pageInfo.pageNum -1}" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
						<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
						<li><a href="${APP_PATH }/doctors?pn=${page_Num }">${page_Num }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
					<li><a href="${APP_PATH }/doctors?pn=${pageInfo.pageNum +1}" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
					</c:if>
					<li><a href="${APP_PATH }/doctors/?pn=${pageInfo.pages}">末页</a></li>
				</ul>
				</nav>
			</div>
		</div>

	</div>


</body>
</html>