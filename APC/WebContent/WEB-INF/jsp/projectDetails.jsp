<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr><td>Project Type		</td><td>     	${projectInfor.projectType}
<tr><td>Pattern Type </td><td>   		${projectInfor.patternType}
<tr><td>Technology Type  	</td><td>     ${projectInfor.technologyType}
<tr><td>Database Type  	</td><td>     ${projectInfor.databaseType}
<tr><td>Database URL  </td><td>     ${projectInfor.databaseURL}
<tr><td>Database User  	</td><td>     ${projectInfor.databaseUserName}
<tr><td>Database Password  	</td><td>     ${projectInfor.databasePassword}
<tr><td>packageName 	</td><td>     ${projectInfor.screenInfor.packageName}
<tr><td>packageName  	</td><td>     ${projectInfor.screenInfor.packageName}
</table>
</body>
</html>