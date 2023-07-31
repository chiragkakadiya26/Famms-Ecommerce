<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- inner page section -->
	<section class="inner_page_head">
		<div class="container_fuild">
			<div class="row">
				<div class="col-md-12">
					<div class="full">
						<h3>Create Account</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end inner page section -->

	<div class="container p-5">

		<h6 style="text-align: center;" class="bg-success text-white">
			<%
			if (request.getAttribute("msg") != null) {

				out.println(request.getAttribute("msg"));
			}
			%>
		</h6>
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						  <!--  <p class="fs-4 text-center">Create Account</p> -->	

						<form action="UserController" method="post">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" id="inlineCheckbox1" name="usertype" value="user">User &nbsp;
	  							<input class="form-check-input" type="radio" id="inlineCheckbox1" name="usertype" value="seller">Seller &nbsp;
							</div>
							<div class="mb-3">
								<label class="form-label">First Name</label> <input required
									name="fname" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Last Name</label> <input required
									name="lname" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control"
									style="text-transform: lowercase;">
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No</label> <input required
									name="mobile" type="text" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Confirm Password</label> <input
									required name="cpassword" type="password" class="form-control">
							</div>
							<div class="form-check form-check-inline">
								<label class="form-label mb-3">Gender</label> <input
									class="form-check-input" type="radio" name="gender"
									id="inlineRadio1" value="male">Male
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="inlineRadio2" value="female"> Female
							</div>
							<table>
								<tr>
									<td><label for="exampleFormControlTextarea1">Address</label></td>
									<td><textarea class="form-control"
											id="exampleFormControlTextarea1" name="address"></textarea></td>

								</tr>
							</table>
							<button type="submit" class="btn bg-success text-white col-md-12">Sing
								Up</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	</footer>
	<!-- footer section -->
	<!-- jQery -->
	<script src="js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>

</body>
</html>