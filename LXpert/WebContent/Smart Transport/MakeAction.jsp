<%@ page import="java.io.*,java.util.*"%>
<%
	try
 	{
%>
		
<html>
<head>
<link rel="icon" type="image/ico" href="images/ERP.ico"></link>
<link rel="shortcut icon" href="images/ERP.ico"></link>

<title> :: TRANSPORT ::</title>


<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<script language="JavaScript" src="../JavaScript/comfunction.js"> </script>
<script language="JavaScript" src="../JavaScript/SmartCommon/CommonAjax.js"> </script>
<style type="text/css">
<!--
	a:visited {
			color: #663366;
			}
	a:hover {
			color: #FF0000;
			}
	a:active {
			color: #0000FF;
			}
-->
</style>
<script language="javascript">
 function validate()
  {
  	if(	
		checkNullSelect('vehicletype','Select vehicletype','0')
		&& 	checkNull('name','Enter  Vehicle Make')	
		
	  )
		return true;
	else
		return false;
		
  }
  
 function upperMe(field)
  {
  		field.value=field.value.toUpperCase();
  }    
  
  </script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%@ include file="index.jsp"%>
<body  onpaste="return false;"    onLoad="document.frm.name.focus()">
<form  AUTOCOMPLETE = "off"   method="get" name='frm' action="../SmartLoginAuth" onSubmit="return validate()">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td></td>
	</tr>
	<tr>
		<td height="80">
		<% 
		 String makename,sql;
		 String msg,action,actionS;
		 String makeid="";
		 String typeid="";
		 		 		  
				msg=""+request.getParameter("msg");	
				action=""+request.getParameter("action1");
				
				if(action.equals("Add"))
				{
					
					actionS="TRSMakeAdd";
					makename="";
					typeid="";
					
				}
				else
				{
					makeid=request.getParameter("id");	
					actionS="TRSMakeEdit";
					sql="SELECT INT_MAKEID,CHR_MAKENAME,INT_VEHICLETYPEID FROM   veh_m_make  WHERE INT_MAKEID="+makeid;
					String	readData[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
					makeid=readData[0][0];
					makename=readData[0][1];
					typeid=readData[0][2];
			  }
		 
		
%>
		</td>
	</tr>
	<tr>
		<td align="center">
		<table class="BackGround" cellspacing="0" cellpadding="0" width="424"
			align="center" border="0">
			<tbody>
				<tr>
					<td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/General/TLCorner.gif" width="7" /></td>
					<td class="BorderLine" height="0">  </td>
					<td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/General/TRCorner.gif" width="7" /></td>
				</tr>
				<tr>
					<td height="6">  </td>
				</tr>
				<tr>
					<td class="BorderLine" width="1">  </td>
					<td width="6">  </td>
					<td width="412">
					<table cellspacing="2" cellpadding="2" width="437" align="center"
						border="0">
						<!--DWLayoutTable-->
						<tbody>
						<tr>
                    <td height="16" colspan="3" align="center" valign="top" class="boldThirteen">VEHICLE MAKE </td>
                  </tr>
					<tr>
                    <td height="19" colspan="3" align="right" valign="top"><span class="bolddeepred">* </span><span class="fairyHead"><span class="changePos">- Mandatory</span> </span> </td>
					</tr>
							<tr>
							  <td class="bolddeepblue">Vehicle type </td>
							  <td><select name="vehicletype" class="formText135"  id="vehicletype" >
                                  <option value="0">Select</option>
                                  <%
			
			String	readDatas[][]=com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT INT_VEHICLETYPEID,CHR_VEHICLETYPENAME FROM   veh_m_vehicletype ORDER BY CHR_VEHICLETYPENAME");
			for(int u=0;u<readDatas.length;u++)
				out.println("<option value='"+readDatas[u][0]+"'>"+readDatas[u][1]+"</option>");
			%>
                                </select>
		<%
		if(!action.equals("Add"))
		{
			%>
			<script language="javascript">setOptionValue('vehicletype','<%=typeid%>')</script>
			<%
		}
		%>
                              </td>
							</tr>
							<tr>
								<td height="29" valign="middle" class="bolddeepblue">Vehicle Make <span class="bolddeepred">*</span></td>
								<td width="246" valign="top">
<input name="name" 	type="text" class="formText135" id="name" onBlur="TxtTrim(this)" 	onKeyPress="charOnly('name','25')"  
value="<%=makename %>" size="35"  onKeyUp="upperMe(this)">								 							</td>
							</tr>
							<tr class="bolddeepblue">
								<td height="29" valign="middle" class="bolddeepblue"><!--DWLayoutEmptyCell-->&nbsp;</td>
								<td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
							</tr>
							<tr>
								<td height="30" colspan="3" valign="top"><input
									type="hidden" name="filename" value="Make" /> 
								<input
									type="hidden" name="actionS" value="<%=actionS %>" /> <input
									type="hidden" name="id" value="<%=makeid %>" />  
									
								<table border="0" align="center" cellpadding="1" cellspacing="1">
									<tr>
										<td width="56"><input name="submit" type="submit"
											id="submit" class="buttonbold" value="Submit"   accesskey="s"   ></td>
										<td width="56">
										<div align="center"><input name="button" type="button"
											class="buttonbold"  value="Close"   accesskey="c" 
											onClick="redirect('Transportmain.jsp')">
										</div>										</td>
									</tr>
								</table>
							<td width="2">							</tr>
						</tbody>
					</table>
					</td>
					<td nowrap="nowrap" width="4">  </td>
					<td class="BorderLine" width="1">  </td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/BLCorner.gif" width="7" /></td>
					<td height="6">  </td>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/BRCorner.gif" width="7" /></td>
				</tr>
				<tr>
					<td class="BorderLine" height="0">  </td>
				</tr>
			</tbody>
		</table>
		</td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
	<td>
	<br><br>
	<%
	try
	{
		 	if(!msg.equals("0") && !msg.equals("null"))
		 	{
				 out.println("<table id='table' width='200' border='1' align='center' cellpadding='1' ");
				 out.println("cellspacing='0' bordercolor='#570CD3'> <td>");
				 out.println("<td align='center' class='boldEleven'><b><font color='green'>"+msg+"</td>");
				 out.println("</tr>");
				 out.println("</table>");
	 		}	
	 }
	 catch(NullPointerException e) 
	 {
	 
	 }
	 
     %>
     <br>
	</td>
	</tr>
	 
	<tr>
		<td><%@ include file="../footer.jsp"%></td>
	</tr>
</table>
 </form>
</body>
</html>

<%
	}
	catch(Exception ex)
	{
		out.println(ex.getMessage());
	}  
		 
 %>
