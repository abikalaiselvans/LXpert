
<html>
<head>

<title> :: PAYROLL ::</title>


 
 
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


<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/ComAJAX.js"></script>


<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<style type="text/css">
<!--
.style3 {color: #000000}
-->
</style>
</head>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="../SmartLoginAuth" method="get"   name="frm" onSubmit="return Validate()"  AUTOCOMPLETE = "off">

<%@ include file="index.jsp"%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="80">&nbsp;</td>
	</tr>
	<tr>
	  <td><table class="BackGround1" cellspacing="0" cellpadding="0" width="424"
			align="center" border="0">
        <tbody>
          <tr>
            <td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/General/TLCorner.gif" width="7" /></td>
            <td class="BorderLine" height="0"><spacer height="1" width="1"
						type="block" /></td>
            <td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/General/TRCorner.gif" width="7" /></td>
          </tr>
          <tr>
            <td height="6"><spacer height="1" width="1" type="block" /></td>
          </tr>
          <tr>
            <td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
            <td width="6"><spacer height="1" width="1" type="block" /></td>
            <td width="412" valign="top"><table width="86%" border="0" align="center" cellpadding="3" cellspacing="3">
                <tr>
                  <td colspan="2" class="bold1"><div align="center"> MINIMUM WAGES
                      <%
							String action=request.getParameter("submit");
							String id="",Name="",actionS="PAYMinimumWagesAdd",value="";
							String sql="";
							String rowid="",stateid="",mini="",maxi=""; 
							if("Add".equals(action))
							{
								id="";Name=""; 
								actionS="PAYMinimumWagesAdd";
								value="Add";
								rowid="";stateid="0";mini="0";maxi="0"; 
							}
							else
							{
								id="";Name=""; 
								id=request.getParameter("rowid");
								sql = "SELECT a.INT_MINIMUMWAGESROWID,a.INT_STATEID,a.DOU_MIN,a.DOU_MAX FROM pay_m_minimumwages a WHERE INT_MINIMUMWAGESROWID="+id;
								String data[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
								rowid=data[0][0];
								stateid=data[0][1];
								mini=data[0][2];
								maxi=data[0][3];
								actionS="PAYMinimumWagesUpdate";
								value="Update";
							}
							
						%>
                  </div></td>
                </tr>
                <tr>
                  <td class="boldEleven">State <span class="errormessage">*</span> </td>
                  <td><select name="state"  id="state" class="formText135" style="width:auto">
                      <option value="0">Select State</option>
                      <%
						String stateData[][] =com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT INT_STATEID,CHR_STATENAME FROM com_m_state WHERE INT_COUNTRYID=1  ORDER BY CHR_STATENAME");
						if(stateData.length>0)
						{
							for(int u=0;u<stateData.length;u++)
								out.println("<option value='"+stateData[u][0]+"'>"+stateData[u][1]+"</option>");
						}
						%>
                    </select> 
					<script language="javascript">setOptionValue('state','<%=stateid%>')</script>
					                 </td>
                </tr>
                <tr>
                  <td width="31%" class="boldEleven">Mini Wages <span class="errormessage">*</span> </td>
                  <td width="69%" class="boldEleven"><input name="mini" type="text" class="formText135" id="mini"  onKeyPress="return numeric_only(event,'mini','10')" value="<%=mini%>" size="20" maxlength="10" style="text-align:right">
                      </td>
                </tr>
                <tr>
                  <td class="boldEleven">Max Wages <span class="errormessage">*</span></td>
                  <td class="boldEleven"><input name="maxi" type="text" class="formText135" id="maxi"  onKeyPress="return numeric_only(event,'maxi','10')" value="<%=maxi%>" size="20" maxlength="10" style="text-align:right"></td>
                </tr>
                <tr>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven"> 
                    <input type="hidden" name="filename" value="MinimumWages">
                    <input type="hidden" name="actionS" id="actionS"   value="<%=actionS%>" />
                    <input name="rowid" type="HIDDEN" id="rowid" value="<%=id%>">                  </td></tr>
                <tr>
                  <td colspan="2" class="boldEleven"><table width="112" border="0" align="center" cellpadding="1"
									cellspacing="1">
                      <tr>
                        <td><input name="Submit" type="submit" 	class="buttonbold13" value="<%=value%>"></td>
                        <td><input name="Close" type="button"   class="buttonbold13" id="Close"  value="Close"   accesskey="c"  	onClick="redirect('Payrollmain.jsp')"></td>
                      </tr>
                  </table></td>
                </tr>
            </table></td>
            <td nowrap="nowrap" width="4"><spacer height="1" width="1"
						type="block" /></td>
            <td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
          </tr>
          <tr>
            <td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/BLCorner.gif" width="7" /></td>
            <td height="6"><spacer height="1" width="1" type="block" /></td>
            <td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/BRCorner.gif" width="7" /></td>
          </tr>
          <tr>
            <td class="BorderLine" height="0"><spacer height="1" width="1"
						type="block" /></td>
          </tr>
        </tbody>
      </table></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
</table></form>

<script language="javascript">
 

function Validate()
{
	
	 //maxi,mini,state		
	 
	if(	
			
			
			checkNullSelect('state','Select State...','0')
			&& checkNull('mini','Enter Minimum Wages...') 
		 	&& checkNull('maxi','Enter Maximum Wages...')
			&& checkDiff()
		)
	{
		return true;  		 
	}
	else
		return false;
}
	
function checkDiff()
{
	var mini= parseFloat(document.getElementById('mini').value);
	var maxi= parseFloat(document.getElementById('maxi').value);
	if(maxi>mini)
		return true;
	else
		{
			alert("Please provide Maxi value greather than the mini value...");
			document.getElementById('maxi').focus();
			return false;
		}
}
 
</script>
</script>
<%@ include file="../footer.jsp"%>
</body>
</html>
