<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册页面</title>
	<link rel="stylesheet" href="css/registrationPage.css" />
</head>
<body>
	<div class="back">
		<a href="#" class="fanghui" id="esc"><返回登录</a>
		<img src="images/网易云音乐-01.png">
		<form action="" class="register">
			<p class="information">
			<table>
				<tr>
					<td><input type="text" class="user" required placeholder="请输入你的用户名"></td>
				</tr>
				<tr>
					<td><input type="text" class="password" required placeholder="请输入你的密码"></td>
				</tr>
			</table>
			<p><input type="submit" value="注册"></p>
			</p>
		</form>
		<form action="" class="denlu">
			<p class="information">
				<table>
					<tr>
						<td><input type="text" class="user" required placeholder="请输入你的用户名"></td>
					</tr>
					<tr>
						<td><input type="text" class="password" required placeholder="请输入你的密码"></td>
					</tr>
				</table>
				<p><input type="submit" value="登录"></p>
				<a href="#" class="zhuche">注册</a>
			</p>
		</form>
		<br/><br/>
		<p class="chk">
		<input type="checkbox" class="checkbox">同意<a href="https://st.music.163.com/official-terms/service">《服务条款》</a> </p>
	</div>
	<script type="text/javascript" src="libs/jquery-3.1.1.min.js"></script>
	<script>
		$(function(){
			$(".register").hide();
			$(".fanghui").hide();
			$(".zhuche").click(function(){
				if($(".checkbox").get(0).checked){
					$(".register").show();
					$(".fanghui").show();
					$(".denlu").hide();
					$(".chk").hide();
				}else{
					alert("请先勾选相关《契约》");
				}
			})
			$(".fanghui").click(function(){
				$(".register").hide();
				$(".fanghui").hide();
				$(".denlu").show();
				$(".chk").show();
			})
			$(".denlu").submit(function(){
				if($(".denlu .user").val().length<6){
					return false;
				}
			})
			$(".register").submit(function(){
				showTipBox("info", "注册！");
			});
		});
	</script>
</body>
</html>