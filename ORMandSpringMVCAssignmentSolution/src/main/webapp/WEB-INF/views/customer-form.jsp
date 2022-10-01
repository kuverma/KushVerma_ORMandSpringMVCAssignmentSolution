<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Save Customer details</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<c:if test="${action=='add'}">
			<h5>Save Customer</h5>

			<form
				action="/ORMandSpringMVCAssignmentSolution/Customerrmgnt/saveCustomerDetails"
				method="post">
				<input type="hidden" name="customerID"
					value="${customer.customerID}"> <input type="hidden"
					name="action" value="add">


				<div class="form-inline">
					<h6>First Name :</h6>
					<input type="text" name="firstName" value="${customer.firstName}"
						placeholder="Customer First Name"
						class="form-control mb-4 ml-2 col-5">
				</div>

				<div class="form-inline">
					<h6>Last Name :</h6>
					<input type="text" name="lastName" value="${customer.lastName}"
						placeholder="Customer Last Name"
						class="form-control mb-4 ml-2 col-5">
				</div>

				<div class="form-inline">
					<h6>Email :</h6>
					<input type="text" name="email" value="${customer.email}"
						placeholder="Customer Email" class="form-control mb-4 ml-2 col-5">
				</div>
				<button type="submit" class="btn btn-info col-4">Save
					Customer Details</button>
			</form>

		</c:if>
		<c:if test="${action=='update'}">
			<h5>Update Customer</h5>

			<form
				action="/ORMandSpringMVCAssignmentSolution/Customerrmgnt/saveCustomerDetails"
				method="post">
				<input type="hidden" name="action" value="update"> <input
					type="hidden" name="customerID" value="${customerID}">

				<div class="form-inline">
					<h6>First Name :</h6>
					<input type="text" name="firstName" value="${customer.firstName}"
						placeholder="${customerDetails.firstName}"
						class="form-control mb-4 ml-2 col-4">
				</div>
				<div class="form-inline">
					<h6>Last Name :</h6>
					<input type="text" name="lastName" value="${customer.lastName}"
						placeholder="${customerDetails.lastName}"
						class="form-control mb-4 ml-2 col-4">
				</div>
				<div class="form-inline">
					<h6>Email :</h6>
					<input type="text" name="email" value="${customer.email}"
						placeholder="${customerDetails.email}"
						class="form-control mb-4 ml-2 col-4">
				</div>
				<button type="submit" class="btn btn-info col-4">Update
					Customer details</button>
			</form>

		</c:if>

		<a href="/ORMandSpringMVCAssignmentSolution/Customerrmgnt/list">Back
			to Customer List</a>
	</div>
</body>
</html>