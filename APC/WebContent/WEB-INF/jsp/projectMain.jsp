<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<title>Automatic Project Creator</title>
</head>

<%String[] fieldTypes={"TEXT", "PASSWORD", "SELECT", "MULTI-SELECT", "TEXTAREA", "RADIOBUTTON", "CHECKBOX"}; %>
<body>
	<center>
		<h2>Project Information</h2>
		<form:form method="POST" action="projectInfo">
			<table>
				<tr>
					<td><form:label path="projectType">Project Type</form:label></td>
					<td><form:radiobutton path="projectType" value="NEW"
							label="NEW" /> <form:radiobutton path="projectType"
							value="EXISTING" label="EXISTING" /></td>
				</tr>
				<tr>
					<td><form:label path="projectName">Project Name</form:label></td>
					<td><form:input path="projectName" /></td>
				</tr>
				<tr>
					<td><form:label path="patternType">Pattern Type</form:label></td>
					<td><form:select path="patternType">
							<form:option value="NONE" label="Select" />
							<form:options items="${patternType}" />
						</form:select></td>
				</tr>
				<tr>
					<td><form:label path="technologyType">Technology Type</form:label></td>
					<td><form:select path="technologyType">
							<form:option value="NONE" label="Select" />
							<form:options items="${technologyType}" />
						</form:select></td>
				</tr>
				<tr>
					<td><form:label path="databaseType">Database Type</form:label></td>
					<td><form:select path="databaseType">
							<form:option value="NONE" label="Select" />
							<form:options items="${databaseType}" />
						</form:select></td>
				</tr>
				<tr>
					<td><form:label path="databaseURL">Database URL</form:label></td>
					<td><form:input path="databaseURL" /></td>
				</tr>
				<tr>
					<td><form:label path="databaseUserName">Database UserName</form:label></td>
					<td><form:input path="databaseUserName" /></td>
				</tr>
				<tr>
					<td><form:label path="databasePassword">Database Password</form:label></td>
					<td><form:input path="databasePassword" /></td>
				</tr>
				<tr>
					<td><form:label path="webServerType">Web-Server Type</form:label></td>
					<td><form:select path="webServerType">
							<form:option value="NONE" label="Select" />
							<form:options items="${webServerType}" />
						</form:select></td>
				</tr>
				<tr><td><h3>------------- | Screen Details | -------------</h3></td></tr>
				<tr>
					<td><form:label path="screenInfor.packageName">Package Name</form:label></td>
					<td><form:input path="screenInfor.packageName" /></td>
				</tr>
				
				<tr>
					<td><form:label path="screenInfor.screenName">Screen Name</form:label></td>
					<td><form:input path="screenInfor.screenName" /></td>
				</tr>
				
				<tr>
					<td><form:label path="screenInfor.screenTitle">Screen Title</form:label></td>
					<td><form:input path="screenInfor.screenTitle" /></td>
				</tr>
				
				<tr>
					<td><form:label path="screenInfor.screenDBTable">Database Table</form:label></td>
					<td><form:input path="screenInfor.screenDBTable" /></td>
				</tr>
				<tr><td><h3>------------- | Fields Details | -------------</h3></td></tr>
  			 	<tr>
  			 	<table>
  			 		<div id="addinput"/>
  			 	</table>
	    		</tr>
  			 	<tr>
					<td colspan="2"><input type="button" id="addNew" value="Add New field"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Submit" /></td>
				</tr>
			</table>
		</form:form>
	</center>
	
	<script type="text/javascript">
		        $(function() {
		            var addDiv = $('#addinput');
		            var i = $('#addinput p').size();
			        $('#addNew').live('click', function() {
				        $('<tr>'+
					    	'<td><input type="text" name="screenInfor.fieldsInfor['+i+'].fieldName" placeholder="fieldName"/></td>'+
					       	'<td><input type="text" name="screenInfor.fieldsInfor['+i+'].fieldLength" placeholder="fieldLength"/></td>'+
					        '<td><input type="text" name="screenInfor.fieldsInfor['+i+'].fieldDataType" placeholder="fieldDataType"/></td>'+
					        '<td><input type="text" name="screenInfor.fieldsInfor['+i+'].fieldDBColumn" placeholder="fieldDBColumn"/></td>'+
					        '<td>Required<select name="screenInfor.fieldsInfor['+i+'].fieldReqInModes" multiple><option value="NEW">NEW</option>'+
					        '<option value="FIND">FIND</option><option value="UPDATE">UPDATE</option><option value="DELETE">DELETE</option></select></td>'+
					        '<td>ReadOnly<select name="screenInfor.fieldsInfor['+i+'].fieldReadOnlyInModes" multiple><option value="NEW">NEW</option>'+
					        '<option value="FIND">FIND</option><option value="UPDATE">UPDATE</option><option value="DELETE">DELETE</option></select></td>'+
					        '<td><select name="screenInfor.fieldsInfor['+i+'].fieldType"><option value="NONE" label="Field Type" /><option value="TEXT" label="TEXT"/>'+
					        '<option value="SELECT" label="SELECT"/><option value="MULTISELECT" label="MULTISELECT"/><option value="PASSWORD" label="PASSWORD"/>'+
					        '<option value="RADIOBUTTON" label="RADIO"/></select></td>'+
					       	'<td><input type="text" name="screenInfor.fieldsInfor['+i+'].isSearchable" placeholder="isSearchable"/></td>'+
				           '</tr>').appendTo(addDiv);
				        i++;
			        	return false;
			    	});
			    });
  		</script>
</body>
</html>