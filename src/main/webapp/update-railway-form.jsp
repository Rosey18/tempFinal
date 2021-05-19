<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>Update Train</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
</head>

<body class="container-fluid">
	<div class="row">
		<div class="col-sm-4">
			<div class="card mt-3">
				<div class="card-body">
					<h3 class="card-title text-center">Админ орталық</h3>
					<a href="<%=request.getContextPath()%>/AdminServlet" class="d-block">Тізімге оралу</a>
					<a href="<%=request.getContextPath()%>/add-railway-form.jsp">Жаңа бағыт еңгізу</a>
					<form method="get" action="<%= request.getContextPath() %>/AdminServlet">
						<input type="hidden" name="command" value="LOGOUT">
						<input type="submit" class="btn btn-link w-30 m-0 p-0" value="Жүйеден шығу">
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="card mt-3">
				<div class="card-body">
					<h5 class="card-title text-center">Таңдалған бағытты өзгерту</h5>
					<form action="AdminServlet" method="GET" class="form">
						<div class="input-group mt-3">
							<input type="hidden" name="command" value="UPDATE" />
							<input type="hidden" name="trainId" value="${THE_TRAIN.id}" />
						</div>
						<div class="input-group mt-3">
							<div class="form-text-prepend" style="width: 150px;">
								<span class="input-group-text">
								Поезд:
								</span>
							</div>
							<input type="text" name="trainNum" class="form-control" style="width:75%;" value="${THE_TRAIN.trainNum}"/>
						</div>
						<div class="input-group mt-3">
							<div class="form-text-prepend" style="width: 150px;">
								<span class="input-group-text">
								Қайдан:
								</span>
							</div>
							<input type="text" name="departure" class="form-control" style="width:75%;" value="${THE_TRAIN.departure}"/>
						</div>
						<div class="input-group mt-3">
							<div class="form-text-prepend" style="width: 150px;">
								<span class="input-group-text">
								Қайда:
								</span>
							</div>
							<input type="text" name="arrival" class="form-control" style="width:75%;" value="${THE_TRAIN.arrival}"/>
						</div>
						<div class="input-group mt-3">
							<div class="form-text-prepend" style="width: 150px;">
								<span class="input-group-text">
								Вагон түрі:
								</span>
							</div>
							<input type="text" name="carriage" class="form-control" style="width:75%;" value="${THE_TRAIN.carriage}"/>
						</div>
						<div class="input-group mt-3">
							<div class="form-text-prepend" style="width: 150px;">
								<span class="input-group-text">
								Орындар:
								</span>
							</div>
							<input type="text" name="seat" class="form-control" style="width:75%;" value="${THE_TRAIN.seat}"/>
						</div>
						<div class="input-group mt-3">
							<div class="form-text-prepend" style="width: 150px;">
								<span class="input-group-text">
								Бағасы:
								</span>
							</div>
							<input type="text" name="price" class="form-control" style="width:75%;" value="${THE_TRAIN.price}"/>
						</div>
						<div class="form-group mt-3">
							<input type="submit" value="Сақтау" class="btn btn-primary d-block mx-auto w-25" class="save" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>

