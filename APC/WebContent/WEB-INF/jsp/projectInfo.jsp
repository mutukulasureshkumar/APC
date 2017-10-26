<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>ACP</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Information</title>
<link rel="STYLESHEET" type="text/css" href="css/projectInfo.css">

<script>
	var bodyArray = new Array();
	var count = 0;
	var formCheck = false;
	var fieldsEdited = false;
	var rowEdited;
	var headerRow = true;
	function validateHeaderForm() {
		var beanName = document.forms["headerForm"]["txtBeanName"].value;
		if (beanName == null || beanName == "") {
	        document.getElementById("lblError").innerHTML = "*BeanName is mandatory field.";
	        return false;
	    }else if(document.all.txtRelease.value == null || document.all.txtRelease.value == "" || isNaN(document.all.txtRelease.value) ){
			document.getElementById("lblError").innerHTML = "*Release is mandatory and numbers only field.";
			return false;
		}else if(document.all.txtEntry.checked == false && document.all.txtFind.checked == false && document.all.txtUpdate.checked == false && document.all.txtDelete.checked == false ){
			document.getElementById("lblError").innerHTML = "*Any one of the Modes is mandatory field.";
			return false;
		}else if(document.all.txtScreenTitle.value == null || document.all.txtScreenTitle.value == ""){
			document.getElementById("lblError").innerHTML = "*ScreenTitle is mandatory field.";
			return false;
		}else if(document.all.txtdbTables.value == null || document.all.txtdbTables.value == ""){
			document.getElementById("lblError").innerHTML = "*dbTables is mandatory field.";
			return false;
		}else{
			document.getElementById("lblError").innerHTML = "";
			if(count ==0){
				var modes = "[";
				if(document.all.txtEntry.checked == true){
					modes = modes + "E,";
				} 
				if(document.all.txtFind.checked == true){
					modes = modes + "F,";
				} 
				if(document.all.txtUpdate.checked == true){
					modes = modes + "U,";
				} 
				if( document.all.txtDelete.checked == true){
					modes = modes + "D";
				}
				modes = modes + "]";
					
				var headerData= document.all.txtBeanName.value + "~" + 
								document.all.txtRelease.value + "~" + 
								modes + "~" + 
								document.all.txtAASecurity.value + "~" + 
								document.all.txtIsGrid.value + "~" + 
								document.all.txtScreenTitle.value + "~" + 
								document.all.txtdbTables.value + "|";
				bodyArray[count] = headerData;
				count++;
				headerForm.submit();
			}
		}
	}
	
	function disableHeaderData(){
		document.all.txtBeanName.className = "DisplayGray";
		document.all.txtBeanName.readOnly = true;
		document.all.txtRelease.className = "DisplayGray";
		document.all.txtRelease.readOnly = true;
		document.all.txtEntry.disabled = true;
		document.all.txtFind.disabled = true;
		document.all.txtUpdate.disabled = true;
		document.all.txtDelete.disabled = true;
		document.all.txtAASecurity.disabled = true;
		document.all.txtIsGrid.disabled = true;
		document.all.txtScreenTitle.className = "DisplayGray";
		document.all.txtScreenTitle.readOnly = true;
		document.all.txtdbTables.className = "DisplayGray";
		document.all.txtdbTables.readOnly = true;	
		document.all.btnSubmitHeader.disabled = true;
	}
	
	
	function validateBodyForm() {
		if (document.all.txtfieldName.value == null || document.all.txtfieldName.value == "") {
	        document.getElementById("lblBodyError").innerHTML = "*Field Name is mandatory field.";
	        return false;
	    }else if(document.all.txtfieldType.value == null || document.all.txtfieldType.value == ""){
			document.getElementById("lblBodyError").innerHTML = "*Field Type is mandatory field.";
			return false;
		}else if(document.all.txtfieldLength.value == null || document.all.txtfieldLength.value == "" || isNaN(document.all.txtfieldLength.value)){
			document.getElementById("lblBodyError").innerHTML = "*Field Length is mandatory and numbers only field.";
			return false;
		}else if(document.all.txtIsDropDown.value == null || document.all.txtIsDropDown.value == ""){
			document.getElementById("lblBodyError").innerHTML = "*IsDropDown is mandatory field.";
			return false;
		}/*else if(document.all.txtDBColumn.value == null || document.all.txtDBColumn.value == ""){
			document.getElementById("lblBodyError").innerHTML = "*DBColumn is mandatory field.";
			return false;
		}*/else if(document.all.txtIsSearchable.value == null || document.all.txtIsSearchable.value == ""){
			document.getElementById("lblBodyError").innerHTML = "*IsSearchable is mandatory field.";
			return false;
		}else{
			if(document.all.txtIsGridField.value == "Y"){
				if(document.all.txtGridfieldName.value == null || document.all.txtGridfieldName.value == ""){
					document.getElementById("lblBodyError").innerHTML = "*GridfieldName is mandatory field.";
					return false;
				}
			}
			var modes = "[";
			if(document.all.txtEntryRequiredField.checked == true){
				modes = modes + "E-";
			} 
			if(document.all.txtFindRequiredField.checked == true){
				modes = modes + "F-";
			} 
			if(document.all.txtUpdateRequiredField.checked == true){
				modes = modes + "U";
			} 
			modes = modes + "]";
			
			var dg = "[";
			if(document.all.txtEntryDisplayGray.checked == true){
				dg = dg + "E-";
			} 
			if(document.all.txtFindDisplayGray.checked == true){
				dg = dg + "F-";
			} 
			if(document.all.txtUpdateDisplayGray.checked == true){
				dg = dg + "U";
			} 
			dg = dg + "]";
			var bodyData = 	document.all.txtfieldName.value + "~" + 
							document.all.txtfieldType.value + "~" + 
							document.all.txtfieldLength.value + "~" + 
							modes + "~" + 
							dg + "~" + 
							document.all.txtIsDropDown.value + "~" + 
							document.all.txtDBColumn.value + "~" + 
							document.all.txtIsSearchable.value + "~" + 
							document.all.txtIsGridField.value + "~" + 
							document.all.txtGridfieldName.value;
			count++; formCheck = true;
			var tempCount = count;
			if(fieldsEdited){
				bodyArray.splice(rowEdited, 1, bodyData);
				var table = document.getElementById("myTable");
				var row = document.getElementById("myTr"+rowEdited);
				table.removeAttribute(row);
				table.removeChild(row);
				count = rowEdited;
			}else{
				bodyArray[count] = bodyData;
			}
			var x; var y;
			if(headerRow){
				x = document.createElement("TABLE");
				    x.setAttribute("id", "myTable");
				    x.setAttribute("border", "1");
				    document.body.appendChild(x);
				var y = document.createElement("TR");
				y.setAttribute("id", "myTr");
				document.getElementById("myTable").appendChild(y);
				var z = document.createElement("TH");
				z.appendChild(document.createTextNode("Field Name"));
				document.getElementById("myTr").appendChild(z);
				var z1 = document.createElement("TH");
				z1.appendChild(document.createTextNode("Field Type"));
				document.getElementById("myTr").appendChild(z1);
				var z2 = document.createElement("TH");
				z2.appendChild(document.createTextNode("Field Size"));
				document.getElementById("myTr").appendChild(z2);
				var z3 = document.createElement("TH");
				z3.appendChild(document.createTextNode("Requuired Field"));
				document.getElementById("myTr").appendChild(z3);
				var z4 = document.createElement("TH");
				z4.appendChild(document.createTextNode("Readonly Field"));
				document.getElementById("myTr").appendChild(z4);
				var z5 = document.createElement("TH");
				z5.appendChild(document.createTextNode("Dropdown Field"));
				document.getElementById("myTr").appendChild(z5);
				var z6 = document.createElement("TH");
				z6.appendChild(document.createTextNode("DB Column"));
				document.getElementById("myTr").appendChild(z6);
				var z7 = document.createElement("TH");
				z7.appendChild(document.createTextNode("Searchable Field"));
				document.getElementById("myTr").appendChild(z7);
				var z8 = document.createElement("TH");
				z8.appendChild(document.createTextNode("Grid Field"));
				document.getElementById("myTr").appendChild(z8);
				var z9 = document.createElement("TH");
				z9.appendChild(document.createTextNode("Grid Field Name"));
				document.getElementById("myTr").appendChild(z9);
				headerRow = false;
			}
			var y = document.createElement("TR");
		    y.setAttribute("id", "myTr"+count);
		    document.getElementById("myTable").appendChild(y);
			var z = document.createElement("TD");
			z.appendChild(document.createTextNode(document.all.txtfieldName.value));
			document.getElementById("myTr"+count).appendChild(z);
			var z1 = document.createElement("TD");
			z1.appendChild(document.createTextNode(document.all.txtfieldType.value));
			document.getElementById("myTr"+count).appendChild(z1);
			var z2 = document.createElement("TD");
			z2.appendChild(document.createTextNode(document.all.txtfieldLength.value));
			document.getElementById("myTr"+count).appendChild(z2);
			var z3 = document.createElement("TD");
			z3.appendChild(document.createTextNode(modes));
			document.getElementById("myTr"+count).appendChild(z3);
			var z4 = document.createElement("TD");
			z4.appendChild(document.createTextNode(dg));
			document.getElementById("myTr"+count).appendChild(z4);
			var z5 = document.createElement("TD");
			z5.appendChild(document.createTextNode(document.all.txtIsDropDown.value));
			document.getElementById("myTr"+count).appendChild(z5);
			var z6 = document.createElement("TD");
			z6.appendChild(document.createTextNode(document.all.txtDBColumn.value));
			document.getElementById("myTr"+count).appendChild(z6);
			var z7 = document.createElement("TD");
			z7.appendChild(document.createTextNode(document.all.txtIsSearchable.value));
			document.getElementById("myTr"+count).appendChild(z7);
			var z8 = document.createElement("TD");
			z8.appendChild(document.createTextNode(document.all.txtIsGridField.value));
			document.getElementById("myTr"+count).appendChild(z8);
			var z9 = document.createElement("TD");
			z9.appendChild(document.createTextNode(document.all.txtGridfieldName.value));
			document.getElementById("myTr"+count).appendChild(z9);
			var z10 = document.createElement("TD");
			var inputTag = document.createElement("div");
			inputTag.innerHTML = "<input type = 'button' value = 'Edit' onClick = 'EditField(" +count+ ")'>";    
			z10.appendChild(inputTag);
			document.getElementById("myTr"+count).appendChild(z10);
			clearFields();
			if(fieldsEdited){
				count = tempCount;
				fieldsEdited = false;
			}
			//document.getElementById("lblFieldsInfo").innerHTML = count + " Field's data saved..!";
			return false;
		}
	}
	
	
	function EditField(rowNo){
		var fieldString = bodyArray[rowNo];
		var fieldValues = fieldString.split("~");
			document.all.txtfieldName.value = fieldValues[0]; 
			document.all.txtfieldType.value = fieldValues[1]; 
			document.all.txtfieldLength.value = fieldValues[2]; 
			document.all.txtIsDropDown.value = fieldValues[5]; 
			document.all.txtDBColumn.value = fieldValues[6]; 
			document.all.txtIsSearchable.value = fieldValues[7]; 
			document.all.txtIsGridField.value = fieldValues[8]; 
			document.all.txtGridfieldName.value = fieldValues[9];
			fieldsEdited = true;
			rowEdited = rowNo;
	}
	
	function clearFields(){
		document.all.txtfieldName.value = ""; 
		document.all.txtfieldType.value = ""; 
		document.all.txtfieldLength.value = ""; 
		document.all.txtEntryRequiredField.checked = false;
		document.all.txtFindRequiredField.checked = false;
		document.all.txtUpdateRequiredField.checked = false;
		document.all.txtEntryDisplayGray.checked = false;
		document.all.txtFindDisplayGray.checked = false;
		document.all.txtUpdateDisplayGray.checked = false;
		document.all.txtIsDropDown.value = ""; 
		document.all.txtDBColumn.value = ""; 
		document.all.txtIsSearchable.value = ""; 
		document.all.txtIsGridField.value = ""; 
		document.all.txtGridfieldName.value = "";
	}
	
	function finalSubmit() {
		if(formCheck){
			document.getElementById("BodySubmitted").value = bodyArray;
		}else{
			document.getElementById("lblError").innerHTML = "*Minimum one field info required to submit the form.";
			return false;
		}
	}
	
	function GridFieldAction(){
		if(document.all.txtIsGridField.value == "N"){
			document.all.txtGridfieldName.disabled = true;
		}else{
			document.all.txtGridfieldName.disabled = false;
		}
	}
</script>
<%
	if(session.getAttribute("HeaderData") != null)
		session.removeAttribute("HeaderData");
%>
</head>
<body>
	<SPAN id=lblError> </SPAN><SPAN id=successMsg> </SPAN>
	<form name="headerForm" action="projectInfo.jsp" onsubmit="return validateHeaderForm()" method="post">
		<div id=HeaderImg Align ="LEFT">
			<img src="images/Header.png" width="890" height="90" align="left">
		</div>
	 	<DIV id=lblHeading  Align ="LEFT"  >--------------------------------------------------------------------| <b>Header Section</b> |-------------------------------------------------------------------------  </DIV>
		<DIV id=lblBeanName  Align ="LEFT"  > Bean Name </DIV>
		<INPUT size=07 type="TEXT" id=txtBeanName name=txtBeanName TabIndex=1 Align="LEFT" maxlength=07 value="${param.txtBeanName}"/>
		<DIV id=lblRelease  Align ="LEFT"  > Release</DIV>
		<INPUT size=2 type="TEXT" id=txtRelease name=txtRelease TabIndex=2 Align="LEFT" maxlength=2 value="${param.txtRelease}" />
		<DIV id=lblModes Align ="LEFT"  > Modes </DIV>
		<DIV id=lblEntry  Align ="LEFT"  > <i> E </i> </DIV>
		<INPUT size=5 type="checkbox" id=txtEntry name=txtEntry value="Y" ${param.txtEntry == 'Y' ? 'checked' : ''} TabIndex=3 Align="LEFT"  />
		<DIV id=lblFind  Align ="LEFT"  > <i> F </i> </DIV>
		<INPUT size=5 type="checkbox" id=txtFind name=txtFind value="Y" ${param.txtFind == 'Y' ? 'checked' : ''} TabIndex=4 Align="LEFT"  />
		<DIV id=lblUpdate  Align ="LEFT"  > <i> U </i> </DIV>
		<INPUT size=5 type="checkbox" id=txtUpdate name=txtUpdate value="Y" ${param.txtUpdate == 'Y' ? 'checked' : ''} TabIndex=5 Align="LEFT"  />
		<DIV id=lblDelete  Align ="LEFT"  > <i> D </i> </DIV>
		<INPUT size=5 type="checkbox" id=txtDelete name=txtDelete value="Y" ${param.txtDelete == 'Y' ? 'checked' : ''} TabIndex=6 Align="LEFT"  />
		<DIV id=lblAASecurity  Align ="LEFT"  > AA Security </DIV>
		<select id=txtAASecurity name=txtAASecurity TabIndex=7  >
			  <option value="Y" ${param.txtAASecurity == 'Y' ? 'selected' : ''}>Yes</option>
			  <option value="N" ${param.txtAASecurity == 'N' ? 'selected' : ''}>No</option>
		</select>
		<DIV id=lblIsGrid  Align ="LEFT"  > IsGrid Screen </DIV>
		<select id=txtIsGrid  name=txtIsGrid  TabIndex=8 >
			  <option value="Y" ${param.txtIsGrid == 'Y' ? 'selected' : ''}>Yes</option>
			  <option value="N" ${param.txtIsGrid == 'N' ? 'selected' : ''}>No</option>
		</select>
		<DIV id=lblScreenTitle  Align ="LEFT"  > Screen Title </DIV>
		<INPUT size=100 type="TEXT" id=txtScreenTitle name=txtScreenTitle TabIndex=9 Align="LEFT" maxlength=100 value="${param.txtScreenTitle}" />
		<DIV id=lbldbTables  Align ="LEFT"  > DB Table </DIV>
		<INPUT size=100 type="TEXT" id=txtdbTables name=txtdbTables TabIndex=10 Align="LEFT" maxlength=100 value="${param.txtdbTables}" />
		<input type="submit" id="btnSubmitHeader" value="Add Header" name=btnSubmitHeader />
		<INPUT type="hidden" value ="HeaderSubmitted" name="HiddenFld"/>
	</form>
	<%
		if(request.getParameter("btnSubmitHeader") != null){
			String hiddenVal = request.getParameter("btnSubmitHeader");
			boolean db_check = true;
			if(hiddenVal.equals("Add Header"))
			{
				String beanName = request.getParameter("txtBeanName");
				String release = request.getParameter("txtRelease");
				String entryMode = request.getParameter("txtEntry");
				String findMode = request.getParameter("txtFind");
				String updateMode = request.getParameter("txtUpdate");
				String deleteMode = request.getParameter("txtDelete");
				String AASecurity = request.getParameter("txtAASecurity");
				String isGridScreen = request.getParameter("txtIsGrid");
				String screenTitle = request.getParameter("txtScreenTitle");
				String DBTable = request.getParameter("txtdbTables");
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("beanName",beanName);
				map.put("release",release);
				map.put("entryMode",entryMode);
				map.put("findMode",findMode);
				map.put("updateMode",updateMode);
				map.put("deleteMode",deleteMode);
				map.put("AASecurity",AASecurity);
				map.put("isGridScreen",isGridScreen);
				map.put("screenTitle",screenTitle);
				map.put("DBTable",DBTable);
				session.setAttribute("HeaderData", map);
				
				ArrayList<String> columnList = new ArrayList<String>();
				Connection connection = null;
				Statement statement = null;
				ResultSet resultSet = null;
				try{
					if(DBTable.trim().length()>0){
						String DBTables="'";
						String[] mulDBTables=DBTable.trim().split(",");
						for(String DBTab:mulDBTables){
							DBTables=DBTables+DBTab+"','";
						}
						Class.forName("oracle.jdbc.driver.OracleDriver");  
						String DB_URL = "jdbc:oracle:thin:@dsthp70:1521:aa"+release.trim();
						String DB_USER = "qauser";
						String DB_PASS = "qapass";
						System.out.println(DB_URL +" - "+DB_USER+" - "+DB_PASS);
						connection=DriverManager.getConnection(DB_URL,DB_USER,DB_PASS);
						if(connection != null){
							System.out.println("Connection Established");
							statement = connection.createStatement();
							String sqlQuery="SELECT COLUMN_NAME FROM ALL_TAB_COLUMNS WHERE TABLE_NAME IN("+DBTables.substring(0,DBTables.length()-2).toUpperCase()+")";
							System.out.println(sqlQuery);
							resultSet = statement.executeQuery(sqlQuery);
							columnList.add(" ");
							while(resultSet.next())
								columnList.add(resultSet.getString("COLUMN_NAME"));
						}else{
							System.out.println("Connection Not Established");
						}
					}
				}catch(Exception ex){
				%> <SPAN id=lblError> <%=ex.getMessage()%> </SPAN> <%
					ex.printStackTrace();
					db_check = false;
				}finally{
					if(resultSet != null)
						resultSet.close();
					if(statement != null)
						statement.close();
					if(connection != null)
						connection.close();
				}
				if(db_check){
				%>
						<script type="text/javascript">
							disableHeaderData();
						</script>
						<span id="lblBodyError"></span>
						<form name="bodyForm" action="AAUI_Elements.jsp" onsubmit="return validateBodyForm()" method="post">
							<DIV id=lblBody  Align ="LEFT"  > --------------------------------------------------------------------| <b>Body Section</b> |---------------------------------------------------------------------------- </DIV>
						   	<DIV id=lblfieldName  Align ="LEFT"  > Field Name </DIV>
							<INPUT size=50 type="TEXT" id=txtfieldName name=txtfieldName TabIndex=11 Align="LEFT" maxlength=50 />
							<DIV id=lblfieldType  Align ="LEFT"  > Field Type </DIV>
							<select id=txtfieldType  name=txtfieldType  TabIndex=12 >
								  <option value="char">Char</option>
								  <option value="int">Int</option>
								  <option value="double">Double</option>
								  <option value="Date">Date</option>
							</select>
							<DIV id=lblfieldLength  Align ="LEFT"  > Field Length </DIV>
							<INPUT size=2 type="TEXT" id=txtfieldLength name=txtfieldLength TabIndex=13 Align="LEFT" maxlength=2 />
							<DIV id=lblIsRequiredField  Align ="LEFT"  > Req. Field in Mode </DIV>
							<DIV id=lblEntryRequiredField  Align ="LEFT"  > <i> E </i> </DIV>
							<INPUT size=5 type="checkbox" id=txtEntryRequiredField name=txtEntryRequiredField value="Y" TabIndex=14 Align="LEFT" />
							<DIV id=lblFindRequiredField  Align ="LEFT"  > <i> F </i> </DIV>
							<INPUT size=5 type="checkbox" id=txtFindRequiredField name=txtFindRequiredField value="Y" TabIndex=15 Align="LEFT" />
							<DIV id=lblUpdateRequiredField  Align ="LEFT"  > <i> U </i> </DIV>
							<INPUT size=5 type="checkbox" id=txtUpdateRequiredField name=txtUpdateRequiredField value="Y" TabIndex=16 Align="LEFT" />
							<DIV id=lblIsDisplayGray  Align ="LEFT"  > Read-Only Field in Mode </DIV>
							<DIV id=lblEntryDisplayGray  Align ="LEFT"  > <i> E </i> </DIV>
							<INPUT size=5 type="checkbox" id=txtEntryDisplayGray name=txtEntryDisplayGray value="Y" TabIndex=17 Align="LEFT" />
							<DIV id=lblFindDisplayGray  Align ="LEFT"  > <i> F </i> </DIV>
							<INPUT size=5 type="checkbox" id=txtFindDisplayGray name=txtFindDisplayGray value="Y" TabIndex=18 Align="LEFT" />
							<DIV id=lblUpdateDisplayGray  Align ="LEFT"  > <i> U </i> </DIV>
							<INPUT size=5 type="checkbox" id=txtUpdateDisplayGray name=txtUpdateDisplayGray value="Y" TabIndex=19 Align="LEFT" />
							<DIV id=lblIsDropDown  Align ="LEFT"  > IsDrop Down </DIV>
							<select id=txtIsDropDown  name=txtIsDropDown  TabIndex=20 >
								  <option value="Y">Yes</option>
								  <option value="N">No</option>
							</select>
							<DIV id=lblDBColumn  Align ="LEFT"  > DBColumn Name </DIV>
							<%if(DBTable.trim().length()>0){ %>
								<select id=txtDBColumn  name=txtDBColumn  TabIndex=21 >
								<% for(int i=0; i<columnList.size(); i++){ %>
									  <option value=<%=columnList.get(i)%>><%=columnList.get(i)%></option>
								<%}%>
								</select>
							<%}else{ %>
								<select id=txtDBColumn  name=txtDBColumn  TabIndex=21 disabled>
								</select>
							<%} %>
							<DIV id=lblIsSearchable  Align ="LEFT"  > IsSearchable </DIV>
							<select id=txtIsSearchable  name=txtIsSearchable  TabIndex=22 >
								  <option value="Y">Yes</option>
								  <option value="N">No</option>
							</select>
							<%if(isGridScreen.equalsIgnoreCase("Y")){ %>
								<DIV id=lblIsGridField  Align ="LEFT"  > Is Grid Field  </DIV>
								<select id=txtIsGridField   name=txtIsGridField  TabIndex=23 onchange = "GridFieldAction()">
									  <option value="Y">Yes</option>
									  <option value="N">No</option>
								</select>
								<DIV id=lblGridfieldName  Align ="LEFT"  > Grid Field Name </DIV>
								<INPUT size=20 type="TEXT" id=txtGridfieldName  name=txtGridfieldName TabIndex=24 Align="LEFT" maxlength=20 />
							<%}else{%>
								<DIV id=lblIsGridField  Align ="LEFT"  > Is Grid Field  </DIV>
								<select id=txtIsGridField   name=txtIsGridField   TabIndex=25 disabled>
									  <option value="NA"></option>
									  <option value="Y">Yes</option>
									  <option value="N">No</option>
								</select>
								<DIV id=lblGridfieldName  Align ="LEFT"  > Grid Field Name </DIV>
								<INPUT size=20 type="TEXT" id=txtGridfieldName  name=txtGridfieldName TabIndex=26 Align="LEFT" maxlength=20 readonly class="DisypalyGray"/>
							<%}%>
							<INPUT type="submit" id=btnAddAnotherField  name=btnSubmit TabIndex=27 value="Add Another Field" Align="LEFT" />
						</form>
						
						<form name="finalForm" action="projectInfo" onsubmit="return finalSubmit()" method="post">
							<INPUT type="hidden" id ="BodySubmitted" name="BodySubmitted"/>
							<INPUT type="submit" id=btnReset  name=btnReset TabIndex=25 value="Reset" Align="LEFT" />
							<INPUT type="submit" id=btnFinal  name=btnFinal TabIndex=26 value="Submit" Align="LEFT" />
						</form>
					<%
				}
			}
		}
		%>		
</body>
</html>