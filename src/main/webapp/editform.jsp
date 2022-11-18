<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.WordDAO, com.example.bean.WordVO"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<meta charset="UTF-8">
<title>Edit Form</title>
	<style>
		#list {
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}
		#list td, #list th {
			border: 1px solid #ddd;
			padding: 8px;
			text-align:center;
		}
		#list tr:nth-child(even){background-color: #f2f2f2;}
		#list tr:hover {background-color: #ddd;}
		#list th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: center;
			background-color: #006bb3;
			color: white;
		}
		#styled-select {
			width: 150px;
		}
		.photo {
			width: 100px;
			height: 100px;
		}
	</style>
</head>
<body>

<%
	WordDAO wordDAO = new WordDAO();
	String id=request.getParameter("id");	
	WordVO u=wordDAO.getWord(Integer.parseInt(id));
	request.setAttribute("vo",u);
%>

<main>
	<div class="container">
		<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
			<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
				<span class="fs-2 fa fa-book" style="font-weight: bold;"> English Vocabulary</span>
			</a>
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li>
				<li class="nav-item"><a href="#" class="nav-link">NoStyle</a></li>
				<li class="nav-item"><a href="#" class="nav-link">Example</a></li>
				<li class="nav-item"><a href="#" class="nav-link">About</a></li>
			</ul>
		</header>
	</div>

	<header class="p-3">
		<div class="container">
			<table class="table table-striped table-hover">
				<thead>
				<tr>
					<th>Level</th>
					<th>Word</th>
					<th>Type</th>
					<th>Definition(Kor)</th>
					<th>Definition(Eng)</th>
					<th>Sentence</th>
					<th>Writer</th>
				</tr>
				</thead>
			</table>
			<form name="form1" action="editpost.jsp" onsubmit="return validateForm()" method="post" enctype="multipart/form-data">
				<input type="hidden" name="wordID" value="<%=u.getId() %>"/>
				<div class="row">
					<div class="col">
						<select class="form-select me-lg-4" id="styled-select2" name="level" value="<%= u.getLevel()%>">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select></p>
					</div>
					<div class="col">
						<input type="text" name="name" class="form-control" style="width:150px;" value="<%= u.getName()%>">
					</div>
					<div class="col">
						<input type="text" name="type" class="form-control" style="width:150px;" value="<%= u.getType()%>">
					</div>
					<div class="col">
						<input type="text" name="definitionK" class="form-control" style="width:150px;" value="<%= u.getDefinitionK()%>">
					</div>
					<div class="col">
						<input type="text" name="definitionE" class="form-control" style="width:150px;" value="<%= u.getDefinitionE()%>">
					</div>
					<div class="col">
						<input type="text" name="sentence" class="form-control" style="width:150px;" value="<%= u.getSentence()%>">
					</div>
					<div class="col">
						<input type="text" name="writer" class="form-control" style="width:150px;" value="<%= u.getWriter()%>">
					</div>
					<div class="col">
						<input type="file" name="photo" class="form-control" style="width:250px;" value="${vo.getPhoto()}">
						<c:if test="${vo.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo"></c:if>
					</div>
				</div>
				<a href="posts.jsp" type="submit button" class="btn btn-light" style="width:100px; margin-right:80px; margin-top:30px;">View All Records</a>
				<button type="submit" class="btn btn-light" style="width:100px; margin-right:80px; margin-top:30px;">Submit</button>
				<button type="button" class="btn btn-light" style="width:100px; margin-top:30px;" onclick="history.back();">Cancel</button>
			</form>
		</div>
	</header>
</main>
</body>
</html>