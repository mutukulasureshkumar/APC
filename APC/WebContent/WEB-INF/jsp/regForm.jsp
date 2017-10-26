<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Registration</h2>
<form action="regform" method="post">
<table>
<tr><td>Name</td><td><input type="text" name="studentName"><form:errors path="student1.studentName"/></td></tr> 
<tr><td>Roll No</td><td><input type="text" name="rollNo"><form:errors path="student1.rollNo"/></td></tr> 
<tr><td>Stream</td><td><input type="text" name="stream"><form:errors path="student1.stream"/></td></tr> 
<tr><td>DOB</td><td><input type="text" name="dob"><form:errors path="student1.dob"/></td></tr> 
<tr><td>Door No</td><td><input type="text" name="address.doorNo"><form:errors path="student1.address.doorNo"/></td></tr> 
<tr><td>Street</td><td><input type="text" name="address.street"><form:errors path="student1.address.street"/></td></tr> 
<tr><td>City</td><td><input type="text" name="address.city"><form:errors path="student1.address.city"/></td></tr> 
<tr><td>Pin Code </td><td><input type="text" name="address.pin"><form:errors path="student1.address.pin"/></td></tr> 
<tr><td></td><td><input type="submit" value="submit"> </td></tr> 
</table>
</form>
</body>
</html>