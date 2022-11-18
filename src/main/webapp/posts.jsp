<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.WordDAO, com.example.bean.WordVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
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
		height: 60px;
	}

	</style>
	<script>
		function delete_ok(id){
			var a = confirm("정말로 삭제하겠습니까?");
			if(a) location.href='deletepost.jsp?id=' + id;
		}
	</script>
</head>
<body>
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
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="#" class="nav-link px-2 text-dark" style="font-size:30px;">Word List</a></li>
				</ul>
				<select class="form-select me-lg-4" id="styled-select" name="levelselect">
					<option selected>Select level</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
				</select>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
					<input type="search" class="form-control form-control-dark" placeholder="Word..." aria-label="Search">
				</form>

				<div class="text-end">
					<button type="button" class="btn btn-outline-secondary">Search</button>
					<button type="button" class="btn btn-outline-success" onclick="location.href='addpostform.jsp'">Add</button>
				</div>
			</div>
		</div>
	</header>

	<div class="container">
		<%
			request.setCharacterEncoding("UTF-8");
			WordDAO wordDAO = new WordDAO();
			List<WordVO> list = wordDAO.getWordList();
			request.setAttribute("list",list);
		%>
		<table class="table table-striped table-hover">
			<thead>
			<tr>
				<th>Id</th>
				<th>Level</th>
				<th>Word</th>
				<th>Type</th>
				<th>Definition(Kor)</th>
				<th>Definition(Eng)</th>
				<th>Sentence</th>
				<th>RegDate</th>
				<th>Writer</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="u">
				<tr>
					<td>${u.getId()}</td>
					<td>${u.getLevel()}</td>
					<td>${u.getName()}</td>
					<td>${u.getType()}</td>
					<td>${u.getDefinitionK()}</td>
					<td>${u.getDefinitionE()}</td>
					<td>${u.getSentence()}</td>
					<td>${u.getRegdate()}</td>
					<td>${u.getWriter()}</td>
					<td><c:if test="${u.getPhoto() ne ''}"><br />
					<img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" class="photo"></c:if></td>
					<td><button class="btn" onclick="location.href='editform.jsp?id=${u.getId()}'"><i class="fa fa-pencil"></i></button></td>
					<td><button class="btn" onclick="javascript:delete_ok('${u.getId()}')"><i class="fa fa-trash"></i></button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
    </div>
    </main>
</body>
</html>