<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>User Page</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("User")== null) )
{
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%} %>
<body class="container-fluid">

	<div class="row">
		<div class="col-sm-4">
			<div class="card mt-3">
				<div class="card-body">
					<h3 class="card-title">Қолданышу парағы</h3>
					<form action="<%=request.getContextPath()%>/UserServlet" method="GET">
						<input type="hidden" name="command" value="LOGOUT">
						<input type="submit" class="btn btn-link m-0 p-0" value="Жүйеден шығу">
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-8 mx-auto">
			<div class="card mt-3 mx-auto">
				<div class="card-body mx-auto">
					<h4 class="card-title text-center">Билет сатып алу</h4>
					<table class="table table-responsive w-100 mx-auto text-center">
						<thead class="table-head thead-dark">
							<th>Поезд</th>
							<th>Қайдан</th>
							<th>Қайда</th>
							<th>Вагон түрі</th>
							<th>Орындар</th>
							<th>Бағасы</th>
							<th>Әрекет</th>
						</thead>
						<tbody class="text-center">
							<c:forEach var="tempRailway" items="${railway_list }">

								<c:url var="tempLink" value="UserServlet">
									<c:param name="command" value="LOAD_USER" />
									<c:param name="trainId" value="${tempRailway.id }" />
								</c:url>

								<tr>
									<td> ${tempRailway.trainNum} </td>
									<td> ${tempRailway.departure} </td>
									<td> ${tempRailway.arrival} </td>
									<td> ${tempRailway.carriage} </td>
									<td> ${tempRailway.seat} </td>
									<td> ${tempRailway.price} </td>
									<td> <a href="${tempLink}"><button class="btn btn-link">Таңдау</button></a></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<br/>
</body>
</head>
</html>