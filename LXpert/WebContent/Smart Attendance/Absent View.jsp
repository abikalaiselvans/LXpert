 <%@ page import="java.sql.*,java.io.*,java.util.*,com.my.org.erp.bean.Attendance.*"%>
 <%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ page import="org.apache.commons.lang.ArrayUtils"%> 


<%
try
{
%>
<%@ include file="index.jsp"%>
 
<html>
<head>

<title> :: ATTENDANCE ::</title>



<link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
<link rel="shortcut icon" href="../images/ERP.ico"></link>



<meta name="resource-type" content="document" />
<meta http-equiv="content-type" content="text/html; charset=US-ASCII" />
<meta http-equiv="content-language" content="en-us" />
<meta name="author" content="KALAISELVAN K" />
<meta name="contact" content="abikalaiselvan@yahoo.co.in" />
<meta name="copyright" content="Copyright (c)2006-2011 KALAISELVAN K. All Rights Reserved." />
<meta name="description" content="Office Automation ERP Products." />
<meta name="keywords" content="HRM, Human Resource Management, HR Planning, Job Design, Job Analysing, Applicant, Company, Branch, Division,Model,Color,Office, Qualification, Attendance, Biometric, Finger Print, Forms, Leave, Holiday, Common Holiday, Shift Master, Shift Allocation. Proximity, Smart Card, Manual attendance, personal inforamtion , Basic, Allowance, Payroll, Salary Slab, Allowance, Recovery, Professional Tax, Employee attendance, Promotion, Trainning, Ressigner, Email, Jonners, PF, ESI, CTC, CTC, Take Home, Admin charge, Attendance, Payroll, Inventory, Product, Item, Customer, Vendor, vendor group, customer group, Purchase, sales, purchase paymeny, vendor payment, Sales return, purchase return, Quotation , Po, Purchase report, sales report, Tax, service tax, vat, c-form, taxes, user, employee id, payslip, consolidation, Attendance, stock, stock book , stock view, stock transfer, consumables, Serial number tracking, " />
 
<script language="JavaScript" src="../JavaScript/comfunction.js"> </script>
<script language="JavaScript" src="../JavaScript/Attendance/AbsentAjax.js"></script>
<script language="javascript" src="../JavaScript/common/Staffloadsdependsoffice.js"></script>

<script language="javascript"> 
 
	 
function  Edit()
 	{					
	   obj = findObj("rowid");
		if(obj == null)
		{
			alert("No records  to edit...");
			return false;
		}
 	    var count;
		count=0; 				
		coffee1=document.forms[0].rowid;
		txt="";
		for (i=0;i<coffee1.length;++ i)
		{
			if (coffee1[i].checked)
			{
			count=count+1;
			}
		}
		if(count==0)
		{
			if (document.frm.rowid.checked) { count=1;}
		}
		if(count==1){			
			document.frm.action="AbsentEdit.jsp";			
			return true;
		}
		else
		{
		    alert("Select Only one Value");
		    return false;
		}
	
 	} 



	
  function  Delete()
 	{		
		
		obj = findObj("rowid");
		if(obj == null)
		{
			alert("No records  to edit...");
			return false;
		}
		var count;
		count=0;
		coffee1=document.forms[0].rowid
		txt=""
		for (i=0;i<coffee1.length;++ i)
		{
			if (coffee1[i].checked)
			{
			count=count+1;
			}
		}
		if(count==0)
		{
			if (document.forms[0].rowid.checked) { count=1;}
		}
		if(count>=1){			
			var name=confirm("Confirm to Delete")
			if (name==true)
			{ 
				document.frm.action="../SmartLoginAuth";
				document.frm.submit();
				return true;			
			}
			else
				return false;
		}
		else
		{
		    alert("Select Atleast One Value");
		    return false;
		}		
 	}
	
	
	
	function  Add()
 	{		
		 document.frm.action="AbsentEntryDateWise.jsp";		
 	}	
 	</script>
 
 
<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
</head>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="LoadAbsentDays('0')"   >
<form  AUTOCOMPLETE = "off"   method="get" name="frm"  >
<table width="100%" height="285" align="center">
	<tr>
		<td height="151" align="center"><br>
		<table width="90%" height="120" border="0" align="center"
			cellpadding="0" cellspacing="0" class="TableDesign"  
			 
			 >
			<!--DWLayoutTable-->
			<tr align="center" valign="middle" >
				<td height="28"  
					class="tablehead"><span class="whiteMedium">ABSENT INFORMATIONS </span></td>
			</tr>
			<tr>
				<td height="31" align="center">
				<table width="46%" border="0" align="center" cellpadding="1"
					cellspacing="1" class="whiteMedium"  >
					<tr>
						<td >Office</td>
						<td >
						<%
			   	String branchid=""+session.getAttribute("BRANCHID");
	   			String oficeid=""+session.getAttribute("OFFICEID");
				 String usertype=""+session.getAttribute("USRTYPE");  
			  %> <select name="Office" class="formText135" id="Office"
							tabindex="6" onBlur="LoadAbsentDays('0')"  onChange="loadStaffName() ">
							 
							<option value="0">All</option>	
							<%
	String OfficeData[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(" SELECT b.INT_OFFICEID,b.CHR_OFFICENAME FROM  com_m_office  b WHERE b.INT_OFFICEID IN("+com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT a.CHR_OFFICELIST FROM m_user a WHERE a.CHR_USRNAME='"+""+session.getAttribute("USRID")+"' ")[0][0]+" )");
 if(OfficeData.length>0)
 	for(int u=0;u<OfficeData.length;u++)
		out.println("<option value='"+OfficeData[u][0]+"'>"+OfficeData[u][1]+"</option>");
 %>
	  </select><script language="javascript">setOptionValue('Office','<%=""+session.getAttribute("OFFICEID")%>')</script>
							
							</td>
						<td>Staff </td>
						<td class="bold1">
						
<select name="staffid" class="formText135" id="staffid"  onBlur="LoadAbsentDays('0') ">
<option value="0">All</option>
<%
 String empdata[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(" SELECT  CHR_EMPID,CHR_STAFFNAME FROM com_m_staff WHERE   CHR_TYPE!='T' AND INT_OFFICEID= "+oficeid+" AND CHR_HOLD!='Y'  ORDER BY CHR_STAFFNAME ");
		for(int u=0; u<empdata.length; u++)
			out.print("<option value='"+empdata[u][0]+"'>"+empdata[u][1] +"</option>");
%>				
</select></td>
						<td>Day</td>
						<td class="bold1"><select name="day" id="day"  onBlur="LoadAbsentDays('0') ">
                            <option value="0">All</option>
                            <%
						for(int u=1;u<32;u++)
							out.println("<option value='"+(u)+"'>"+u+"</option>");
						%>
                          </select>                        </td>
						<td >Month</td>
						<td class="bold1">  <select name="month"
							id="month" onBlur="LoadAbsentDays('0')"
							onChange="LoadAbsentDays('0')">
							<%@ include file="../JavaScript/months.jsp"%>
						</select> </td>
						<td> Year </td>
						<td class="bold1"> <select name="year"
							id="year" onBlur="LoadAbsentDays('0')"
							onChange="LoadAbsentDays('0')">
							<%@ include file="../JavaScript/years.jsp"%>
						</select> <script language='JavaScript' type="text/javascript">
				<!--			
						var d=new Date()
						var month1=d.getMonth() + 1;
						var day=d.getDate()
						if(day<10) day="0"+day;
						if(month1<10) month1="0"+month1;
						var year1=d.getFullYear();
						setOptionValue('month',month1);
						setOptionValue('year',year1);	
						setOptionValue('day',day);							
				//-->
          </script>  </td>
					</tr>
				</table>			  </td>
		  </tr>
			<tr  >
				<td height="31" align="left" valign="middle"  ><table width="100%" border="0" class="whiteMedium"
					  >
                  <tr>
                    <td>S.No</td>
                    <td>Staff Id</td>
                    <td>Staff Name</td>
                    <td>Office</td>
                    <td>Date</td>
					<td>Day Type</td>
                  </tr>
                </table></td>
			</tr>
			<tr bgcolor="#FFFFFF">
			  <td height="28" valign="top">
				<div id="AbsentTable" 	style="OVERFLOW: auto;width:100%;height:200px"></div><br><br>
					<div id="totRec"></div><br>			  </td>
		</table>		</td>
	</tr>
	<tr>
	  <td height="17">&nbsp;</td>
  </tr>
	<tr>
		<td height="17"><input name="filename" type="hidden"
			id="filename" value="StaffAbsent"> 
		<input name="actionS"
			type="hidden" id="actionS" value="ATTAbsensDelete">
		<table width="90%" border="0" align="center" cellpadding="1"
			cellspacing="1" class="TableDesign"  >
			<tr class="para">
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('0')">All</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('A')">A</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('B')">B</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('C')">C</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('D')">D</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('E')">E</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('F')">F</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('G')">G</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('H')">H</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('I')">I</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('J')">J</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('K')">K</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('L')">L</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('M')">M</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('N')">N</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('O')">O</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('P')">P</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('Q')">Q</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('R')">R</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('S')">S</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('T')">T</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('U')">U</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('V')">V</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('W')">W</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('X')">X</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('Y')">Y</a></div>				</td>
				<td>
				<div align="center"><a class="whiteMedium"
					href="javascript:LoadAbsentDays('Z')">Z</a></div>				</td>
			</tr>
		</table>		</td>
	</tr>
	<tr>
	  <td height="17" align="center">    
  <tr>
	  <td height="17" align="center">
		<div align="center">
          <%
			out.println("<table   border='0' align='center' cellpadding='1' cellspacing='1'>");
			out.println("<tr>");
			 
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_ADD_ATT FROM m_user_privilege WHERE CHR_USRNAME ='"+session.getAttribute("USRID").toString()+"'")[0][0]))
				out.println("<input class='ButtonHead' type='submit' onClick='Add()' name='action1' id='action1' value='Add'>");
			else	
				out.println("<input type='hidden' name='action1' id='action1' value='Add'>");
			out.println("</td>");
			
			
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_EDIT_ATT FROM m_user_privilege WHERE CHR_USRNAME ='"+session.getAttribute("USRID").toString()+"'")[0][0]))
			 out.println("<input class='ButtonHead' type='submit' onClick='return Edit()' name='action1' id='action1' value='Edit'>");
			else	
				out.println("<input type='hidden'  name='Edit' id='Edit' value='Edit'>");
			out.println("</td>");
			
			out.println("<td ' valign='top'>");
			if("Y".equals(CommonFunctions.QueryExecute("SELECT CHR_DELETE_ATT FROM m_user_privilege WHERE CHR_USRNAME = '"+session.getAttribute("USRID").toString()+"'")[0][0]))
				out.println("<input class='ButtonHead' type='submit' onClick='return  Delete()' name='Submit' id='Submit' value='Delete'>");
			else	
				out.println("<input type='hidden'  name='Delete' id='Delete' value='Delete'>");
			out.println("</td>");	
			
			out.println("<td ' valign='top'>");
			out.println("<input type='button' class='ButtonHead' name='Button' value='Close' onClick=\"redirect('AttendanceMain.jsp')\" />");
			out.println("</td>");
			
			out.println("</tr>");	
			out.println("</table>");
			
			%>
        </div>
		<center>
		<tr>
		<td height="20"><%@ include file="../footer.jsp"%></td>
	</tr>
</table>
</body>
</html>




<%
}
catch(Exception e)
{
	out.println(e.getMessage());
	System.out.println(e.getMessage());
}
%>

