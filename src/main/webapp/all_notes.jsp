<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.entities.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%><br>
		<h1 class="text-uppercase text-center">all notes</h1>
		<br>
		<div class="row">
		<div class="col-12">
		<%
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd MMMMM, yyyy");
    		Session session1 = FactoryProvider.getSessionFactory().openSession();
    	Query q = session1.createQuery("FROM Note");
    	List<Note> listofnote = q.list();
    	for(Note n:listofnote){%>
		<div class="card mt-3" >
			<img class="card-img-top mx-auto m-4" style="max-width:100px" src="img/notes.png" alt="Card image cap">
			<div class="card-body px-5">
				<h5 class="card-title"><%= n.getTitle() %></h5>
				<p class="card-text"><%= n.getContent() %></p>
				<p><b class="text-primary"><%= simpleDateFormat.format(n.getAddedDate()) %></b></p>
				<div class="container text-center mt-2">
				<a href="DeleteServlet?id=<%= n.getId() %>" class="btn btn-danger">Delete</a>
				<a href="update.jsp?id=<%=n.getId() %>" class="btn btn-primary" onclick>Update</a>
				</div>
			</div>
		</div>
		<% 
    	}
    	
    		session1.close();
    	%>
		</div>
		</div>
		
	</div>

</body>
</html>