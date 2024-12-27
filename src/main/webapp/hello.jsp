<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String str = "안녕하세여";

out.println(str);
%>

<p>안녕하세요! : <%= str %></p>
</body>
</html>