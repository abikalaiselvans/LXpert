 <%@ page import="java.sql.*,java.util.*,java.io.*"%>
<%
try
{
%>
<html>
<head>

<title> :: COMMON ::</title>


 
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
 <script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>

<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
 <body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<%@ include file="index.jsp"%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>      <table class="BackGround1" cellspacing="0" cellpadding="0" width="400"
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
              
              <table width="87%" border="0" align="center" cellpadding="3" cellspacing="3">
                 
                <tr>
                  <td colspan="5" class="boldEleven"><div align="center" class="boldThirteen">GENERAL REPORTS </div></td>
                </tr>
                <tr>
                  <td width="7%" class="boldEleven">1.</td>
                  <td width="2%" class="boldEleven">&nbsp;</td>
                  <td width="124" class="boldEleven"><a href="Rept_JCountry.jsp" target="_blank">Country</a></td>
                  <td width="7%" class="boldEleven">2.</td>
                  <td class="boldEleven"><a href="Rept_JQualification.jsp" target="_blank">Qualification</a></td>
                </tr>
                <tr>
                  <td class="boldEleven">3.</td>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven"><a href="Rept_JState.jsp" target="_blank">State</a></td>
                  <td class="boldEleven">4.</td>
                  <td class="boldEleven"><a href="Rept_JCategory.jsp" target="_blank">Category</a></td>
                </tr>
                <tr>
                  <td class="boldEleven">5.</td>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven"><a href="Rept_JDistrict.jsp" target="_blank">District</a></td>
                  <td class="boldEleven">6.</td>
                  <td class="boldEleven"><a href="Rept_JStafftype.jsp" target="_blank">Staff Type</a></td>
                </tr>
                <tr>
                  <td class="boldEleven">7.</td>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven"><a href="Rept_JCity.jsp" target="_blank">City</a></td>
                  <td class="boldEleven">8.</td>
                  <td class="boldEleven"><a href="Rept_JESI_Dispensary.jsp" target="_blank">ESI Dispensary</a></td>
                </tr>
                <tr>
                  <td class="boldEleven">9.</td>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven"><a href="Rept_JCompany.jsp" target="_blank">Company</a></td>
                  <td class="boldEleven">10.</td>
                  <td class="boldEleven"><a href="Rept_JCertification.jsp" target="_blank">Certification</a></td>
                </tr>
                <tr>
                  <td class="boldEleven">11.</td>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven"><a href="Rept_JBranch.jsp" target="_blank">Branch</a></td>
                  <td class="boldEleven">12.</td>
                  <td class="boldEleven"><a href="Rept_JIdProof.jsp" target="_blank">Id Proof</a></td>
                </tr>
                <tr>
                  <td class="boldEleven">13.</td>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven"><a href="Rept_JOffice.jsp" target="_blank">Office</a></td>
                  <td class="boldEleven">14.</td>
                  <td class="boldEleven"><a href="Rept_JBank.jsp" target="_blank">Bank</a></td>
                </tr>
                <tr>
                  <td class="boldEleven">15.</td>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven"><a href="Rept_JDepartment.jsp" target="_blank">Department</a></td>
                  <td class="boldEleven">16.</td>
                  <td class="boldEleven"><a href="Rept_JBankBranch.jsp" target="_blank">BankBranch</a><a href="Rept_Bank.jsp" target="_blank"></a></td>
                </tr>
                <tr>
                  <td class="boldEleven">17. </td>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven"><a href="Rept_JDesignation.jsp" target="_blank">Designation</a></td>
                  <td class="boldEleven">18.</td>
                  <td class="boldEleven"><a href="Rept_JBloodgroup.jsp" target="_blank">Blood Group</a><a href="Rept_BankBranch.jsp" target="_blank"></a></td>
                </tr>
                 
                 
                 
                <tr>
                  <td class="boldEleven">19 </td>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven"><a href="Rept_JLocation.jsp" target="_blank">Location</a></td>
                  <td class="boldEleven">&nbsp;</td>
                  <td class="boldEleven">&nbsp;</td>
                </tr>
                
                
                <tr>
                  <td colspan="5" class="boldEleven"><table width="112" border="0" align="center" cellpadding="1"
									cellspacing="1">
                    <tr>
                      <td><input name="Close" type="button"   class="buttonbold13" id="Close"  value="Close"   accesskey="c"  	onClick="redirect('commonmain.jsp')"></td>
                    </tr>
                  </table></td>
                </tr>
            </table>		   </td>
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
      </table></td></tr>
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
}
%>
</body>
</html>
