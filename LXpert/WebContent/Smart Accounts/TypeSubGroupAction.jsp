<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<%
try
{
%>
<html>
<head>

<title>:: ACCOUNTS ::</title>

 
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

<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
</head>
<script language="JavaScript" src="../JavaScript/calendar1.js" type="text/javascript"></script>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/ComAJAX.js"></script>
<script language="JavaScript">

function Validate()
  {
	
 
	
	if( 
	 checkNull( "name","Enter  Group Name" )
	 &&checkNullSelect( "group","Select Under Group",'0' )
	)
		return true;
	else
		return false;				
		
	
 } 	
</script>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  onLoad="document.getElementById('name').focus()" >
<%@ include file="indexacct.jsp"%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
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
          <td width="412" valign="top">
		  <form  AUTOCOMPLETE = "off"   action="../SmartLoginAuth" method="post" name="frm" id="frm" onSubmit="return Validate()">
		    <table width="400" border="0" align="center" cellpadding="3" cellspacing="3">
              <tr>
                <td colspan="2" class="bold1"><div align="center">SUB GROUPS  
                    <%
							String action=request.getParameter("action1");
							String id="",type="",Name="",actionS="",value="";
							 String group ="";
							String sql="";
							if("Create".equals(action))
							{
								id="";type=""; Name=""; 
								actionS="ACCTypeSubGroupAdd";
								value="Create";
								group ="0";
							}
							else
							{
								id="";type="";Name="";
								id=request.getParameter("id");
								sql = "SELECT INT_TYPESUBGROUPID,INT_TYPEGROUPID ,CHR_TYPESUBGROUPNAME FROM  accc_m_typesubgroups  WHERE INT_TYPESUBGROUPID="+id;
								String data[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
								id=data[0][0];type=data[0][1]; Name=data[0][2];
								actionS="ACCTypeSubGroupEdit";
								value="Alter";
							}
							
						%>			
				
				</div></td>
                </tr>
              <tr>
                <td valign="top" class="boldEleven">Sub Group Name </td>
                <td valign="top" class="boldEleven"><input name="name" type="text" class="formText135" id="name" size="30" maxlength="100" onBlur="upperMe(this), CheckUnique(this,'divunitname','accc_m_typesubgroups','CHR_TYPESUBGROUPNAME')"
				 onKeyUp="upperMe(this),CheckUnique(this,'divunitname','accc_m_typesubgroups','CHR_TYPESUBGROUPNAME')" value="<%=Name%>">
				<div id='divunitname'></div>				</td>
              </tr>
              <tr>
                <td class="boldEleven">Under Group</td>
                <td class="boldEleven">
				<select name="group" id="group" class="formText135" >
				<option value="0">Select</option>
				<%
				String ssql = "SELECT INT_TYPEGROUPID,CHR_TYPEGROUPNAME  FROM accc_m_typegroups  ORDER BY CHR_TYPEGROUPNAME" ;
				String sdata[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(ssql);
				for(int u=0;u<sdata.length;u++)
					out.println("<option value='"+sdata[u][0]+"'>"+sdata[u][1]+"</option>");
				%>
              </select>
			  <%
			  if(!"Create".equals(action))
			  {
			  %>
			  <script language="javascript">setOptionValue('group','<%=type%>')</script>
			  <%
			   }
			%>
			
			<%
			  if("Create".equals(action))
			  {
			  %>
			  <script language="javascript">setOptionValue('group','<%=request.getParameter("group")%>')</script>
			  <%
			   }
			%>
			 
			 
			  </td>
              </tr>
              <tr>
                <td class="boldEleven">&nbsp;</td>
                <td class="boldEleven">
				<input type="hidden" name="filename" value="TypeSubGroup" />
                <input type="hidden" name="actionS"  value="<%=actionS%>" />
				<input name="id" type="HIDDEN" id="id" value="<%=id%>">				</td>
              </tr>
              <tr>
                <td colspan="2" class="boldEleven"><table width="112" border="0" align="center" cellpadding="1"
									cellspacing="1">
                  <tr>
                    <td><input name="Submit" id="Submit" type="submit" class="buttonbold13" value="<%=value%>"></td>
                    <td><input name="Close" id="Close" type="button"  class="buttonbold13"    value="Close"   accesskey="c"  onClick="redirect('TypeSubGroup.jsp')"></td>
                  </tr>
                </table></td>
                </tr>
            </table>
		  </form></td>
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
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<%@ include file="../footer.jsp"%>
</body>
</html>
<%
}
catch(Exception e)
{
}
%>