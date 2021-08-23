<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Home</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<div class="container">
			<h3 class="text-center">Add Note</h3>
			<form action="SaveNoteServlet" method="post"
				class="p-3 border border-dark">
				<input name="id" type="hidden">
				<div class="form-group ">
					<label for="title">Note Title:</label> <input required name="title"
						type="text" class="form-control" id="title"
						placeholder="Enter Title">
				</div>
				<div class="form-group">
					<label for="content">Note Content:</label>
					<textarea required name="content" id="content"
						placeholder="Enter your content here" class="form-control"
						style="height: 300px;"></textarea>
				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-primary">Add</button>
				</div>

			</form>
		</div>
	</div>






</body>
</html>