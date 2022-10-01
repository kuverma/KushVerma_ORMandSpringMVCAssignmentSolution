<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!-- Stylesheet (CSS) & JSP Tag
     Library -->
<!DOCTYPE html>
<html>
<head>
<title>Customer Relationship Management</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<a
			href="/ORMandSpringMVCAssignmentSolution/Customerrmgnt/addnewCustomer"
			class="btn btn-primary btn-sm mb-3">Add Customer</a>
		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customers}" var="customer">
					<tr>
						<td><c:out value="${customer.firstName}"></c:out></td>
						<td><c:out value="${customer.lastName}"></c:out></td>
						<td><c:out value="${customer.email}"></c:out></td>
						<td><a
							href="/ORMandSpringMVCAssignmentSolution/Customerrmgnt/updateCustomer?customerID=${customer.customerID}"
							class="btn btn-info btn-sm">Update</a> <a
							href="/ORMandSpringMVCAssignmentSolution/Customerrmgnt/deleteCustomer?customerID=${customer.customerID}"
							class="btn btn-danger btn-sm"
							onclick="if(!(confirm('Are you sure to delete this Customer Record?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>