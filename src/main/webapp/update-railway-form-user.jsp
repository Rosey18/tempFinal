<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<title>Selected ticket</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript"> 
function showAlert(){ 
alert("Билет сәтті ресімделді"); 
} 
</script> 
<body class="container-fluid">
<div class="row">
	<div class="col-sm-4">
		<div class="card mt-3">
			<div class="card-body">
				<h3 class="card-title">Қолданышу парағы</h3>
				<a href="<%=request.getContextPath() %>/UserServlet">Тізімге қайта оралу</a>
				<form action="<%=request.getContextPath()%>/UserServlet" method="GET">
					<input type="hidden" name="command" value="LOGOUT">
					<input type="submit" class="btn btn-link m-0 p-0" value="Жүйеден шығу">
				</form>
			</div>
		</div>
	</div>
	<div class="col-sm-8">
		<div class="card mt-3">
			<div class="card-body">
				<h5 class="card-title text-center">Билетті рәсімдеу</h5>
				<form action="UserServlet" method="GET">
					<input type="hidden" name="command" value="UPDATE" />
					<input type="hidden" name="trainId" value="${SELECTED.id}" />
					<div class="row">
						<div class="col-sm-7">
							<c:if test="${SELECTED.carriage.equals('compartment')}">
								<img src="<%= request.getContextPath()%>/assets/compartment.jpg" class="img-fluid w-80">
							</c:if>
							<c:if test="${SELECTED.carriage.equals('reserved')}">
								<img src="<%= request.getContextPath()%>/assets/reserved.jpg" class="img-fluid w-80">
							</c:if>
						</div>
						<div class="col-sm-5 my-auto">
							<c:url var="decreaseSeat" value="UserServlet">
								<c:param name="command" value="DECREASE" />
								<c:param name="trainId" value="${SELECTED.id }" />
							</c:url>
							<table class="table table-responsive mx-auto d-block text-center" style="width:100%;">
								<tbody class="text-justify d-block text-center" style="width: 250px;">
									<tr>
										<td>Поезд:</td>
										<td>${SELECTED.trainNum}</td>
									</tr>
									<tr>
										<td>Қайдан:</td>
										<td>${SELECTED.departure}</td>
									</tr>
									<tr>
										<td>Қайда:</td>
										<td>${SELECTED.arrival}</td>
									</tr>
									<tr>
										<td>Вагон түрі:</td>
										<td>${SELECTED.carriage}</td>
									</tr>
									<tr>
										<td>Орын:</td>
										<td>${SELECTED.seat}</td>
									</tr>
									<tr>
										<td>Бағасы:</td>
										<td>${SELECTED.price}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm">
							<div class="input-group mt-3">
								<div class="form-text-prepend" style="width: 170px;">
								<span class="input-group-text">
								Аты:
								</span>
								</div>
								<input type="text" name="firstName" class="form-control" style="width:75%;"/>
							</div>
							<div class="input-group mt-3">
								<div class="form-text-prepend" style="width: 170px;">
								<span class="input-group-text">
								Тегі:
								</span>
								</div>
								<input type="text" name="lastName" class="form-control" style="width:75%;"/>
							</div>
							<div class="input-group mt-3">
								<div class="form-text-prepend" style="width: 170px;">
								<span class="input-group-text">
								Электронды пошта:
								</span>
								</div>
								<input type="text" name="email" class="form-control" style="width:75%;"/>
							</div>
							<div class="form-group mt-3">
								<a class="btn btn-primary w-50 d-block mx-auto" href="${decreaseSeat}" data-toggle="tooltip" title="Билетті сақтау">Сақтау</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>

