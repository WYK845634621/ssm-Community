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
				<table class="table table-hover" id="doctors_table">
				<thead>
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
					</thead>
					<tbody>					
					
					</tbody>
				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页数据 -->
			<div class="col-md-6" id="page_info_area">			</div>
			<!-- 分页条 -->
			<div class="col-md-6" id="page_nav_area">			</div>
		</div>

	</div>

	<script type="text/javascript">
		//1.页面加载完成以后，使用ajax获取分页信息
		$(function () {
			$.ajax({
				url:"${APP_PATH}/doctors",
				data:"pn=1",
				type:"GET",
				success:function(result){
					//console.log(result);
					//1.解析并显示doctor信息
					build_doctors_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.解析显示分页条信息
					build_page_nav(result);
				}
			});
		});
		
		function build_doctors_table(result) {
			var doctors = result.extend.pageInfo.list;
			$.each(doctors,function(index,item){
				var doctorIdTd = $("<td></td>").append(item.doctorId);
				var doctorNameTd = $("<td></td>").append(item.doctorName);
				var genderTd = $("<td></td>").append(item.gender == 'M'?'男':'女');
				var ageTd = $("<td></td>").append(item.age);
				var phoneTd = $("<td></td>").append(item.phone);
				var emailTd = $("<td></td>").append(item.email);
				var addressTd = $("<td></td>").append(item.address);
				var idcardTd = $("<td></td>").append(item.idcard);
				var cIdTd = $("<td></td>").append(item.cId);
				var sIdTd = $("<td></td>").append(item.sId);
				var cmyNameTd = $("<td></td>").append(item.community.cmyName);
				/*
				<button class="btn btn-danger btn-xs">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								删除
							</button>
								*/
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-xs").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-xs").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(doctorIdTd).append(doctorNameTd).append(genderTd).append(ageTd).append(phoneTd).append(emailTd).append(addressTd).append(idcardTd).append(cIdTd).append(sIdTd).append(cmyNameTd).append(btnTd).appendTo("#doctors_table tbody");
			});
		}
		
		//解析显示分页信息
		function build_page_info(result) {
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum +"页,共"+result.extend.pageInfo.pages+"页,存在"+result.extend.pageInfo.total+"条记录");
		}
		
		//解析显示分页条
		function build_page_nav(result) {
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			//添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);
			//遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			//把ul加入nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
	</script>

</body>
</html>