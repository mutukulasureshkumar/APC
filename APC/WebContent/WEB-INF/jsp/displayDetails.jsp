<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>${message}</h2>
<table border="1">
<tr><td>Name		</td><td>     	${student1.studentName}
<tr><td>Roll No  </td><td>   		${student1.rollNo}
<tr><td>Stream  	</td><td>     ${student1.stream}
<tr><td>DOB  	</td><td>     ${student1.dob}
<tr><td>Door No  </td><td>     ${student1.address.doorNo}
<tr><td>Street  	</td><td>     ${student1.address.street}
<tr><td>City  	</td><td>     ${student1.address.city}
<tr><td>Pin Code </td><td>     ${student1.address.pin}
</table>
</body>
</html>