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

<!-- 对医生进行编更新出现的模态框 -->
	<div class="modal fade" id="doctorUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" >编辑医生</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">doctorName</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="doctorName_update_static">l</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">男</label> 
								<label class="radio-inline"> <input type="radio" name="gender" id="gender2_update_input" value="F">女</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">age</label>
							<div class="col-sm-10">
								<input type="text" name="age" class="form-control" id="age_update_input" placeholder="age">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">phone</label>
							<div class="col-sm-10">
								<input type="text" name="phone" class="form-control" id="phone_update_input" placeholder="phone">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" name="email" class="form-control" id="email_update_input" placeholder="xxxxx@163.com">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">address</label>
							<div class="col-sm-10">
								<input type="text" name="address" class="form-control" id="address_update_input" placeholder="address">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">idcard</label>
							<div class="col-sm-10">
								<input type="text" name="idcard" class="form-control" id="idcard_update_input" placeholder="18位居民身份证">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">sId</label>
							<div class="col-sm-10">
								<input type="text" name="sId" class="form-control" id="sId_update_input" placeholder="病人ID">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">cmyName</label>
							<div class="col-sm-3">
								<select class="form-control" name="cId" id="community_update_select">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="doctor_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>







<!-- 医生添加的Modal 学名模态框  详情见bootstrap-->
	<div class="modal fade" id="doctorAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加医生</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">doctorName</label>
							<div class="col-sm-10">
								<input type="text" name="doctorName" class="form-control" id="doctorName_add_input" placeholder="doctorName">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked">男</label> 
								<label class="radio-inline"> <input type="radio" name="gender" id="gender2_add_input" value="F">女</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">age</label>
							<div class="col-sm-10">
								<input type="text" name="age" class="form-control" id="age_add_input" placeholder="age">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">phone</label>
							<div class="col-sm-10">
								<input type="text" name="phone" class="form-control" id="phone_add_input" placeholder="phone">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" name="email" class="form-control" id="email_add_input" placeholder="xxxxx@163.com">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">address</label>
							<div class="col-sm-10">
								<input type="text" name="address" class="form-control" id="address_add_input" placeholder="address">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">idcard</label>
							<div class="col-sm-10">
								<input type="text" name="idcard" class="form-control" id="idcard_add_input" placeholder="18位居民身份证">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">sId</label>
							<div class="col-sm-10">
								<input type="text" name="sId" class="form-control" id="sId_add_input" placeholder="病人ID">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">cmyName</label>
							<div class="col-sm-3">
								<select class="form-control" name="cId" id="community_add_select">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="doctor_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>


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
				<button class="btn btn-info" id="doctor_add_model_btn">新增</button>
				<button class="btn btn-danger" id="doctor_delete_all_model_btn">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="doctors_table">
				<thead>
					<tr>
						<th><input type="checkbox" id="check_all"/></th>
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
		var totalRecord, currentPage;
		//1.页面加载完成以后，使用ajax获取分页信息
		$(function () {
			to_page(1);
		});
		function to_page(pn) {
			$.ajax({
				url:"${APP_PATH}/doctors",
				data:"pn="+pn,
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
		}
		
		function build_doctors_table(result) {
			$("#doctors_table tbody").empty();
			var doctors = result.extend.pageInfo.list;
			$.each(doctors,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>")
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
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-xs edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加自定义的属性，便于显示doctor的id
				editBtn.attr("doctor-id",item.doctorId);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-xs delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性便于删除
				delBtn.attr("delete-id",item.doctorId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(checkBoxTd).append(doctorIdTd).append(doctorNameTd).append(genderTd).append(ageTd).append(phoneTd).append(emailTd).append(addressTd).append(idcardTd).append(cIdTd).append(sIdTd).append(cmyNameTd).append(btnTd).appendTo("#doctors_table tbody");
			});
		}
		
		//解析显示分页信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum +"页,共"+result.extend.pageInfo.pages+"页,存在"+result.extend.pageInfo.total+"条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		
		//解析显示分页条
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else {
				
			firstPageLi.click(function () {
				to_page(1);
			});
			prePageLi.click(function () {
				to_page(result.extend.pageInfo.pageNum - 1);
			});
			}
			
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else {
				
			lastPageLi.click(function () {
				to_page(result.extend.pageInfo.pages);
			});
			nextPageLi.click(function () {
				to_page(result.extend.pageInfo.pageNum + 1);
			});
			}
			
			
			//添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);
			//遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function () {
					to_page(item);
				});
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			//把ul加入nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		//封装一个清空表单的的方法	清空所有的表单样式及内容
		function reset_form(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-success has-error");
			$(ele).find(".help-block").text("");
		}
		//点击新增按钮，弹出模态框
		$("#doctor_add_model_btn").click(function () {
			//清除表单数据，即表单重置
			reset_form("#doctorAddModal form");
			//发送ajax请求，查出部门信息，显示下拉列表
			getCommunitys("#doctorAddModal select");
			
			//弹出模态框
			$("#doctorAddModal").modal({
				backdrop:"static"
			});
		});
		//查出所有社区信息并显示在下拉框
		function getCommunitys(ele) {
			//先清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/communitys",
				type:"GET",
				success:function(result){
					/* 返回的json字符串:{"code":100,"msg":"处理成功","extend":{"communitys":[{"cmyId":1,"cmyName":"开源社区"},{"cmyId":2,"cmyName":"apple社区"}]}} */
					//使其显示在下拉列表中
					//$("#doctorAddModal select").append("")
					$.each(result.extend.communitys,function(){
						var optionEle = $("<option></option>").append(this.cmyName).attr("value",this.cmyId);
						optionEle.appendTo(ele);
					});
				}
			});
		}
		//按照格式校验表单数据
		function validate_add_form() {
			var doctorName = $("#doctorName_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,4})$/;
			if (!regName.test(doctorName)) {
				show_validate_msg("#doctorName_add_input","error","姓名可以是2-4个汉字或者6-16英文数字组合");
				return false;
			}else {
				show_validate_msg("#doctorName_add_input","success","");
			};
			//电话验证
			var phone = $("#phone_add_input").val();
			var regPhone = /^[1][3,4,5,7,8][0-9]{9}$/;
			if (!regPhone.test(phone)) {
				show_validate_msg("#phone_add_input","error","手机号必须是13/5/7/8开头的十一位数字");
				return false;
			}else {
				show_validate_msg("#phone_add_input","success","");
			};
			//邮箱验证
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_add_input","error","邮箱格式不正确");
				return false;
			}else {
				show_validate_msg("#email_add_input","success","");
			}
			
			
			return true;
		}
		
		//封装的校验方法
		function show_validate_msg(ele,status,msg) {
			//清除校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		$("#doctorName_add_input").change(function () {
			var doctorName = this.value;
				$.ajax({
					url:"${APP_PATH}/checkuse",
					data:"doctorName="+doctorName,
					type:"POST",
					success:function(result){
						if (result.code == 100) {
							show_validate_msg("#doctorName_add_input","success","用户名可用");
							$("#doctor_save_btn").attr("ajax-va","success");
						}else {
							show_validate_msg("#doctorName_add_input","error",result.extend.va_msg);
							$("#doctor_save_btn").attr("ajax-va","error");
						}
					}
				});
		});
		
		$("#doctor_save_btn").click(function () {
			//1.将模态框中填写的数据交给服务器保存,POST请求就是保存,需要先进性数据校验
			if (!validate_add_form()) {
				return false;
			}
			//判断ajax的校验是否成功
			if ($(this).attr("ajax-va") == "error") {
				return false;
			}
			//2.发送ajax请求保存
			  $.ajax({
				url:"${APP_PATH}/doctor",
				type:"POST",
				data:$("#doctorAddModal form").serialize(),
				success:function(result){
					if (result.code == 100) {
					//doctor保存成功后，需要关闭添加框，同时回到最后一页显示刚才添加的数据
					$("#doctorAddModal").modal('hide');
					to_page(totalRecord);
					}else {
						//即使绕过前端校验,也可以显示错误信息
						if (undefined != result.extend.errorFields.email) {
							show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
						}
						if (undefined != result.extend.errorFields.phone) {
							show_validate_msg("#phone_add_input","error",result.extend.errorFields.phone);			
						}
						if (undefined != result.extend.errorFields.doctorName) {
							show_validate_msg("#doctorName_add_input","error",result.extend.errorFields.doctorName);			
						}
						
					}
				}
			});  
			
		});
		
		//为删除按钮绑定点击事件
		$(document).on("click",".delete_btn",function(){
			var doctorName = $(this).parents("tr").find("td:eq(2)").text();
			var doctorId = $(this).attr("delete-id");
			if (confirm("确认删除【" + doctorName + "】吗？")) {
				$.ajax({
					url:"${APP_PATH}/doctor/"+doctorId,
					type : "DELETE",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});
		
		//可以再创建按钮的时候添加单击事件，但是代码耦合度太高，所以可以使用jQuery的live方法绑定，但是新版的jQuery方法废除了这个live,目前只能用on来绑定
		$(document).on("click",".edit_btn",function () {
			//弹出模态框
			//先查出员工的id
			getCommunitys("#doctorUpdateModal select");
			getDoctor($(this).attr("doctor-id"));
			$("#doctor_update_btn").attr("doctor-id",$(this).attr("doctor-id"));
			$("#doctorUpdateModal").modal({
				backdrop:"static"
			});
		});
		function getDoctor(id) {
			$.ajax({
				url:"${APP_PATH}/doctor/"+id,
				type:"GET",
				success:function(result){
					var doctorData = result.extend.doctor;
					$("#doctorName_update_static").text(doctorData.doctorName);
					$("#doctorUpdateModal input[name=gender]").val([doctorData.gender]);
					$("#age_update_input").val(doctorData.age);
					$("#phone_update_input").val(doctorData.phone);
					$("#email_update_input").val(doctorData.email);
					$("#address_update_input").val(doctorData.address);
					$("#idcard_update_input").val(doctorData.idcard);
					$("#sId_update_input").val(doctorData.sId);
					$("#doctorUpdateModal select").val([doctorData.cId]);
				}
			});
		}
		
		
		//为更新按钮绑定事件
		$("#doctor_update_btn").click(function () {
			//邮箱验证
			var email = $("#email_update_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_update_input","error","邮箱格式不正确");
				return false;
			}else {
				show_validate_msg("#email_update_input","success","");
			}
			//发送ajax请求来保存更新
			$.ajax({
				url:"${APP_PATH}/doctor/"+$(this).attr("doctor-id"),
				type:"PUT",
				data:$("#doctorUpdateModal form").serialize(),
				success:function(result){
					//doctor保存成功后，需要关闭添加框，同时回到最后一页显示刚才添加的数据
					$("#doctorUpdateModal").modal('hide');
					to_page(currentPage);
				}
			});
			
		});
		
		//完成全选/全不选的功能
		$("#check_all").click(function () {
			//推荐使用prop代替attr来获取dom的值
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//check_item绑定事件
		$(document).on("click",".check_item",function(){
			var flag = $(".check_item:checked").length == $(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		
		
		//点击全部删除，尽心批量删除
		$("#doctor_delete_all_model_btn").click(function () {
			var doctorNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"), function () {
				doctorNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				//组装doctor的ID的字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			doctorNames = doctorNames.substring(0,doctorNames.length-1);
			del_idstr = del_idstr.substring(0,del_idstr.length-1);
			if (confirm("确认删除【" + doctorNames + "】吗？")) {
				//确认以后发送ajax请求
				$.ajax({
					url:"${APP_PATH}/doctor/"+del_idstr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});
		
		
	</script>

</body>
</html>