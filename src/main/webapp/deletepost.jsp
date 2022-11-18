<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.WordDAO, com.example.bean.WordVO, com.example.common.FileUpload"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		WordVO u = new WordVO();
		u.setId(id);

		WordDAO wordDAO = new WordDAO();
		String filename = wordDAO.getPhotoFilename(id);
		if (filename != null)
			FileUpload.deleteFile(request, filename);
		wordDAO.deleteWord(u);
	}
	response.sendRedirect("posts.jsp");
%>