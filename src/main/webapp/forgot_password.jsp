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
						<h3>Sing Up</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end inner page section -->

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<!--  	<p class="fs-4 text-center">User Login</p> -->
						
						<%
							if(request.getAttribute("msg")!=null)
							{
								out.print(request.getAttribute("msg"));
							}
						
						%>

						<form action="UserForgotPassword" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input 
									name="email" type="email" class="form-control">
							</div>
							<button type="submit" class="btn bg-success text-white">SEND OTP</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>