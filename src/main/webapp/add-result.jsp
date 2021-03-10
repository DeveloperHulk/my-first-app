<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
The result is rendered here : <br>
<h1>Addition result :</h1> <h2> <%=request.getAttribute("result") %> </h2>
<h1>Subtraction result :</h1> <h2> <%=request.getAttribute("results") %> </h2>

</body>
</html>