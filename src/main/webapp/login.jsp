<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Authorization page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<body class="container-fluid">
	<div class="row">
		<div class="col-sm-7">
			<img src="<%=request.getContextPath()%>/assets/login_page_icon.jpg"
				alt="Login Page" class="img-fluid w-100">
		</div>
		<div class="col-sm-5 my-auto mx-auto">
			<div class="row">
				<div class="col-sm mx-auto">
					<h1 class="display-3 d-block text-center">Кіру</h1>
				</div>
			</div>
			<div class="row mt-3">
				<div class="login-content mx-auto">
					<form name="form"
						action="<%=request.getContextPath()%>/RailwayControllerServlet"
						method="post">
						<h6 class="text-danger d-block text-center">
							<span style="color: red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
						</h6>
						<div class="input-div one">
							<div class="i">
								<i class="fas fa-user"></i>
							</div>
							<div class="div">
								<input type="text" name="user_name" class="input"
									placeholder="Пайдаланушының аты">
							</div>
						</div>
						<div class="input-div pass">
							<div class="i">
								<i class="fas fa-lock"></i>
							</div>
							<div class="div">
								<input type="password" name="password" class="input"
									placeholder="Пайдаланушының құпия сөзі">
							</div>
						</div>
						<div class="form-group mx-auto">
							<input type="submit" value="Кіру"
								class="btn btn-primary d-block mx-auto w-50">
						</div>
						<div class="form-group mx-auto">
							<span class="d-block mx-auto text-center">Деректер
								жарамсыз ба? <input type="reset" value="Жою"
								class="btn btn-link m-0 p-0">
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>