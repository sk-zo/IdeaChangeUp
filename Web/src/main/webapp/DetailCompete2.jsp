<%@page import="Model.CompeteDTO"%>
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
	CompeteDTO compete = (CompeteDTO)session.getAttribute("compete");
	String []files = (String[]) session.getAttribute("file");
	String root_path = ".\\img\\competition\\" + Integer.toString(compete.getNum()) + "\\";
	String img_file = root_path + files[0];
	String doc_file = root_path + files[1];
%>
<table>
	<tbody>
		<tr><%=compete.getTitle()%> <br> <%=compete.getPrice() %></tr>
		<tr><img src=<%=img_file%>><br><%=img_file%></tr>
		<tr></tr>
	</tbody>
</table>
</body>
</html>