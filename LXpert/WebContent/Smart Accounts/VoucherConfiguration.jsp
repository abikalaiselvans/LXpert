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
<script language="JavaScript">

function Validate()
  {
	
 
	
	if(checkNullSelect("group","Select Group","0")
	&& checkNull( "desc","Enter Description" )
	&& checkNull( "incomedate","Enter Date" )
	&& checkNull( "Amount","Enter Total amount" )
	)
		return true;
	else
		return false;				
		
	
 } 	
</script>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
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
                <td colspan="2" class="bold1">&nbsp;</td>
              </tr>
              <tr>
                <td width="39%" class="boldEleven">Numbering type </td>
                <td width="61%" class="boldEleven"><select name="select" class="formText135">
				<option value="0">Select</option>
				<option value="1">Manual </option>
				<option value="2">Automatic</option>
				 
				
                </select></td>
              </tr>
              <tr>
                <td class="boldEleven">Duplicate Voucher No   </td>
                <td class="boldEleven"><input name="textfield" type="text" class="formText135"></td>
              </tr>
              <tr>
                <td valign="top" class="boldEleven">Blank Voucher NUmber  </td>
                <td class="boldEleven"><input name="textfield2" type="text" class="formText135"></td>
              </tr>
              <tr>
                <td class="boldEleven">PrefiX</td>
                <td class="boldEleven"><input name="textfield3" type="text" class="formText135"></td>
              </tr>
              <tr>
                <td class="boldEleven">Suffix </td>
                <td class="boldEleven"> 
                  <a
									href="javascript:cal2.popup();">
                  <input name="textfield4" type="text" class="formText135">
</a></td>
              </tr>
              <tr>
                <td class="boldEleven">Starting Number  </td>
                <td class="boldEleven"><input name="textfield5" type="text" class="formText135"></td>
              </tr>
              <tr>
                <td class="boldEleven">Reassign Starting Number </td>
                <td class="boldEleven"><input name="checkbox" type="checkbox" class="formText135" value="checkbox"></td>
              </tr>
              <tr>
                <td class="boldEleven">Maintain Ledger </td>
                <td class="boldEleven"><input name="checkbox2" type="checkbox" class="formText135" value="checkbox"></td>
              </tr>
              <tr>
                <td class="boldEleven">&nbsp;</td>
                <td class="boldEleven"><input name="filename"
									type="hidden" value="Receipts" />
                  <input name="actionS"
									type="hidden" value="ACCReceiptsAdd" /></td>
              </tr>
              <tr>
                <td colspan="2" class="boldEleven"><table width="112" border="0" align="center" cellpadding="1"
									cellspacing="1">
                  <tr>
                    <td><input name="Submit" type="submit"
											class="buttonbold13" value="Submit"   accesskey="s"   ></td>
                    <td><input name="Close" type="button"
											class="buttonbold13" id="Close"  value="Close"   accesskey="c" 
											onClick="redirect('Receipts.jsp')"></td>
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