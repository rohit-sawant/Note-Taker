<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
<%
Session session1 = FactoryProvider.getSessionFactory().openSession();
Transaction tx = session1.beginTransaction();
int id = Integer.parseInt(request.getParameter("id").trim());
Note note = session1.get(Note.class,id);

%>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		
		
		<div class="container">
		<h3 class="text-center">Edit Your Note</h3>
		<form action="UpdateNoteServlet" method="post" class="p-3 border border-dark">
		<input name="id" value="<%= note.getId()%>" type="hidden">
			<div class="form-group ">
				<label for="title">Note Title:</label> <input required name="title"
					type="text" class="form-control" id="title"
					placeholder="Enter Title" value="<%=note.getTitle() %>">
			</div>
			<div class="form-group">
				<label for="content">Note Content:</label>
				<textarea required name="content" id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px;" ><%=note.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Update</button>
			</div>

		</form>
		</div>
		<br>
	</div>

</body>
</html>