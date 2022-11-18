<%--
  Created by IntelliJ IDEA.
  User: hannahchun
  Date: 2022/11/18
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.*, java.io.File" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>파일업로드 결과</title>
</head>
<body>
  <%
    String filename="";
    int sizeLimit=15*1024*1024;

    // 실제로 서버에 저장되는 path를 upload로 정함
    String realPath = request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if(!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    // "photo"라는 이름으로 전송되어 업로드된 파일 이름 가져옴
    filename = multipartRequest.getFilesystemName("photo");
  %>
  파일명 : <%=filename%><br />
  <img src="${pageContext.request.contextPath}/upload/<%=filename%>">
</body>
</html>
