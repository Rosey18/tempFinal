<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
		table.dataTable thead .sorting:after,
		table.dataTable thead .sorting:before,
		table.dataTable thead .sorting_asc:after,
		table.dataTable thead .sorting_asc:before,
		table.dataTable thead .sorting_asc_disabled:after,
		table.dataTable thead .sorting_asc_disabled:before,
		table.dataTable thead .sorting_desc:after,
		table.dataTable thead .sorting_desc:before,
		table.dataTable thead .sorting_desc_disabled:after,
		table.dataTable thead .sorting_desc_disabled:before {
			bottom: .5em;
		}
	</style>
</head>
<% //In case, if Admin session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Admin")== null) )
{
%>
 <jsp:forward page="login.jsp"></jsp:forward> 
<%} %>
<body class="container-fluid">
<div class="row">
	<div class="col-sm-4">
		<div class="card mt-3">
			<div class="card-body">
				<h3 class="card-title text-center">Админ орталық</h3>
				<a href="<%=request.getContextPath()%>/add-railway-form.jsp" class="btn btn-outline-dark mb-2 w-50 m-10 p-10">Жаңа бағыт еңгізу</a>
				<form method="get" action="<%= request.getContextPath() %>/AdminServlet">
					<input type="hidden" name="command" value="LOGOUT">
					<input type="submit" class="btn btn-outline-dark w-50 m-10 p-10 " value="Жүйеден шығу">
				</form>
			</div>
		</div>
	</div>
	<div class="col-sm-8 mx-auto">
		<div class="card mt-3 mx-auto">
			<div class="card-body mx-auto">
				<h5 class="card-title text-center">Бағыттар бойынша деректер</h5>
				<table class="table table-responsive d-block mx-auto table-striped" cellspacing="0" width="100%" id="sortedTable">
					<thead class="table-head thead-dark text-center">
						<tr>
							<th>Поезд</th>
							<th>Қайдан</th>
							<th>Қайда</th>
							<th>Вагон түрі</th>
							<th>Орындар</th>
							<th>Бағасы</th>
							<th>Әрекет</th>
							<th>Жою</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach var="tempRailway" items="${railway_list }">

						<c:url var="tempLink" value="AdminServlet">
							<c:param name="command" value="LOAD" />
							<c:param name="trainId" value="${tempRailway.id }" />
						</c:url>

						<c:url var="deleteLink" value="AdminServlet">
							<c:param name="command" value="DELETE" />
							<c:param name="trainId" value="${tempRailway.id }" />
						</c:url>

						<tr>
							<td> ${tempRailway.trainNum} </td>
							<td> ${tempRailway.departure} </td>
							<td> ${tempRailway.arrival} </td>
							<td> ${tempRailway.carriage} </td>
							<td> ${tempRailway.seat} </td>
							<td> ${tempRailway.price} </td>
							<td> <a href="${tempLink}"><button class="btn btn-info">Өзгерту</button></a>
								</td>
							<td> <a href="${deleteLink}" onClick="if (!(confirm('Бұл билетті жойғыңыз келетініне сенімдісіз бе?'))) return false"><button class="btn btn-danger">&times;</button></a>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function () {
		$('#sortedTable').DataTable({
			"ordering": true
		});
		$('.dataTables_length').addClass('bs-select');
	});
</script>
</body>
</html>