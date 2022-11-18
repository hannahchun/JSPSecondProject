<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.WordDAO"%>
<%@page import="com.example.common.FileUpload"%>
<%@ page import="com.example.bean.WordVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	WordDAO wordDAO = new WordDAO();

	FileUpload upload = new FileUpload();
	WordVO u = upload.uploadPhoto(request);

	int i = wordDAO.insertWord(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 실패 !";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>