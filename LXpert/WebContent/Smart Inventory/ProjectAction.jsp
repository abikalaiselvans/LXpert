   <%@ page import="java.sql.*,java.util.*,java.io.*"%>
 <%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%
try
{
%>
<html>
<head>
<title>:: INVENTORY ::</title> 
<link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
<link rel="shortcut icon" href="../images/ERP.ico"></link>

<meta name="resource-type" content="document" />
<meta http-equiv="content-type" content="text/html; charset=US-ASCII" />
<meta http-equiv="content-language" content="en-us" />
<meta name="author" content="KALAISELVAN K" />
<meta name="contact" content="abikalaiselvan@yahoo.co.in" />
<meta name="copyright" content="Copyright (c)2006-2011 KALAISELVAN K. All Rights Reserved." />
<meta name="description" content="Office Automation ERP Products." />
<meta name="keywords" content="HRM, Human Resource Management, HR Planning, Job Design, Job Analysing, Applicant, Company, Branch, Division,Model,Color,Office, Qualification, Attendance, Biometric, Finger Print, Forms, Leave, Holiday, Common Holiday, Shift Master, Shift Allocation. Proximity, Smart Card, Manual attendance, personal inforamtion , Basic, Allowance, Payroll, Salary Slab, Allowance, Recovery, Professional Tax, Employee attendance, Promotion, Trainning, Ressigner, Email, Jonners, PF, ESI, CTC, CTC, Take Home, Admin charge, Attendance, Payroll, Inventory, Product, Item, Customer, Vendor, vendor group, customer group, Purchase, sales, purchase paymeny, vendor payment, Sales return, purchase return, Quotation , Po, Purchase report, sales report, Tax, service tax, vat, c-form, taxes, user, employee id,payslip, consolidation, Attendance, stock, stock book , stock view, stock transfer, consumables, Serial number tracking, " />

<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>

<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
 <script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/ComAJAX.js"></script>
<script language="JavaScript">

function Validate()
  {
	
   
	if(checkNull( "projectname","Enter The Project Name ..." ) && checkNullSelect('status','Select status','0') 
)
		return true;
	else
		return false;				
		
	
 } 	
 
  

</script>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<%@ include file="indexinv.jsp"%>
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
    <td>
	 <form  AUTOCOMPLETE = "off"   action="../SmartLoginAuth" method="post" name="frm" id="frm" onSubmit="return Validate()">
	<table class="BackGround1" cellspacing="0" cellpadding="0" width="424"
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
		 
		    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="3">
              <tr>
                <td colspan="2" class="bold1"><div align="center">PROJECT
                    <%
							String action=request.getParameter("action1");
							String id="",name="",desc="",actionS="",value="",status="";
							String sql="";
							String link="";
							String taxValue="";
							String tr="";
							String fal="";	
							if("Add".equals(action))
							{
								id="";name=""; desc="";
								actionS="INVProjectAdd";
								value="Add";taxValue="";
								link="  onKeyUp=\"CheckUnique(this,'divunitname','inv_m_project','CHR_PROJECTNAME')\" ";
								
							}
							else
							{
								id="";name="";status="";tr="";fal=""; 
								id=request.getParameter("rowid");
								sql = "SELECT INT_PROJECTID,CHR_PROJECTNAME,CHR_STATUS FROM inv_m_project WHERE INT_PROJECTID= "+id;
								String data[][]=CommonFunctions.QueryExecute(sql);
								id=data[0][0];name=data[0][1];status=data[0][2]; 
								actionS="INVProjectEdit";
								value="Update";
								link=" onKeyUp=\"CheckUnique(this,'divunitname','inv_m_project','CHR_PROJECTNAME')\" ";
								//link=" onBlur=\"upperMe(this)\"";
							}
							
						%>	
                  
                </div></td>
                </tr>
              <tr>
                <td width="31%" class="boldEleven">Project Name <span class="boldred">*</span> </td>
                <td width="69%" class="boldEleven"><input name="projectname" type="text" class="formText135" id="projectname" <%=link%> onBlur="upperMe(this)"  value="<%=name%>" size="40" maxlength="70" >
				<div id='divunitname'></div>											</td>
              </tr>
			  <tr>
                <td width="31%" class="boldEleven">Status <span class="boldred">*</span> </td>
                <td width="69%" class="boldEleven">
				
				<select name="status" class="formText135" style="width: 157" id="status" >
                  <option value='0'>Select Status</option>
                  <option value="Y">Yes</option>
                  <option value="N">No</option>
                </select>
				
				</td><script language="javascript">setOptionValue('status','<%=status%>')</script>
			  </tr>
              <tr>
                <td class="boldEleven">&nbsp;</td>
                <td class="boldEleven">
				<input type="hidden" name="filename" value="Project" />
				<input type="hidden" name="actionS"  value="<%=actionS%>" />
				<input name="projectid" type="HIDDEN" id="projectid" value="<%=id%>">				 </td>
              </tr>
              <tr>
                <td colspan="2" class="boldEleven"><table width="112" border="0" align="center" cellpadding="1"
									cellspacing="1">
                  <tr>
                    <td><input name="Submit" id="Submit" type="submit" 	class="buttonbold13" value="<%=value%>"></td>
                    <td><input name="Close" type="button"   class="buttonbold13" id="Close"  value="Close"   accesskey="c"  	onClick="redirect('ProjectView.jsp')"></td>
                  </tr>
                </table></td>
                </tr>
            </table>
		 </td>
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
    </table> </form></td>
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

 <%	
 
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
%>
</body>
</html>
