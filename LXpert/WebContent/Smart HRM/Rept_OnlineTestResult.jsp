 <%@ page import="java.io.*,java.util.*" %>
<%@page import="com.my.org.erp.common.CommonInfo"%>
<html>
<head>

<title>:: HRM ::</title>


<style type="text/css">
<!--
 
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style2 {color: #CC00CC}
-->
</style>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
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
<script language="JavaScript" src="../JavaScript/HRM/Applicant.js"></script>


<script language="javascript">
function Validate()
{

	if(
		checkNull('jobgrade','Enter jobgrade')
		&&	checkNull('jobtitle','Enter jobtitle')
		&&	checkNull('month','Enter month')
		&&	checkNull('year','Enter year')
		&&	checkNull('result','result')
	)
	{
		return true;
	}
	else
	{
		return false;
	}
}
 </script>

<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
<body  onpaste='return false;'>
<form  AUTOCOMPLETE = "off" action="Rept_OnlineTestResultResponse.jsp" name="report" method="post"  onSubmit="return Validate()">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1001"><%@ include file="indexhrm.jsp"%>	</td>
  </tr>
  <tr>
    <td height="19">&nbsp;</td>
  </tr>
  <tr>
    <td height="19">&nbsp;</td>
  </tr>
  <tr>
    <td height="229" align="center"><TABLE width=440 border=0 align=center cellPadding=0 cellSpacing=0 bgcolor="#dce4f9" class=BackGround>
      <TBODY>
        <TR>
          <TD colSpan=2 rowSpan=2><IMG height=7 src="../Image/General/TLCorner.gif" width=7></TD>
          <TD class=BorderLine height=1><SPACER height="1" width="1" type="block" /></TD>
          <TD colSpan=2 rowSpan=2><IMG height=7 src="../Image/General/TRCorner.gif" width=7></TD>
        </TR>
        <TR>
          <TD height=6><SPACER height="1" width="1" type="block"/></TD>
        </TR>
        <TR>
          <TD class=BorderLine width=1><SPACER height="1" 
                        width="1" type="block" /></TD>
          <TD width=6><SPACER height="1" width="1" type="block" 
                      /></TD>
          <TD width=425 valign="top"> <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" class="boldEleven">
            <tr>
              <td>Job Grade </td>
              <td><select name="jobgrade" class="formText135" id="jobgrade"  onChange="loadComboJobTitle(this)" >
                  <option value="0">Select All</option>
                  <option value="Top">Group-1</option>
                  <option value="Middle">Group-2</option>
                  <option value="Bottom">Group-3</option>
              </select></td>
            </tr>
            <tr>
              <td>Job Title </td>
              <td><select name="jobtitle" id="jobtitle" class="formText135"  >
                  <option value="0">All</option>
              </select></td>
            </tr>
            
            <tr>
              <td>Month</td>
              <td><span class="boldThirteen">
                <select name="month" id="month"   >
                  <option value="0">All</option>
                  <%@ include file="../JavaScript/months.jsp" %>
                </select>
              </span> </td>
            </tr>
            <tr>
              <td>Year</td>
              <td><span class="boldThirteen">
                <select name="year" id="year" >
                  <%@ include file="../JavaScript/years.jsp" %>
                </select>
                <script language='JavaScript' type="text/javascript">
							<!--			
								var d=new Date()
								var month1=d.getMonth() + 1
								var day=d.getDate()
						if(day<10) day="0"+day;
								if(month1<10) month1="0"+month1;
								var year1=d.getFullYear();
								setOptionValue('month',month1);
								setOptionValue('year',year1);	
								 				
							//-->
         			  </script>
              </span> </td>
            </tr>
            <tr>
              <td>Result </td>
              <td><span class="boldThirteen">
                <select name="result" id="result"   >
                  <option value="0">All</option>
                  <option value="N">Not Atteding</option>
                  <option value="F">Fail</option>
                  <option value="P">Pass</option>
                </select>
              </span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2"><table align="center" cellpadding="3" cellspacing="3">
                  <tr>
                    <td width="56" align="center" valign="top"><input name="Submit2" id="submit" type="submit"  class="tMLAscreenHead" value="Submit"   accesskey="s"   ></td>
                    <td width="56" valign="top"><input class="tMLAscreenHead" type="button" name="Submit2"  value="Close"   accesskey="c"  onClick="redirect('HRMmain.jsp')"></td>
                  </tr>
              </table></td>
            </tr>
          </table></TD>
          <TD noWrap width=7><SPACER height="1" width="1" 
                        type="block" /></TD>
          <TD class=BorderLine width=1><SPACER height="1" width="1" type="block" /></TD>
        </TR>
        <TR>
          <TD colSpan=2 rowSpan=2><IMG height=7 src="../Image/General/BLCorner.gif" width=7></TD>
          <TD height=6><SPACER height="1" width="1" type="block"/></TD>
          <TD colSpan=2 rowSpan=2 valign="bottom"><div align="right"><IMG height=7 src="../Image/General/BRCorner.gif" width=7></div></TD>
        </TR>
        <TR>
          <TD class=BorderLine height=1><SPACER height="1" width="1" type="block" /></TD>
        </TR>
      </TBODY>
    </TABLE></td>
  </tr>
  <tr>
    <td height="19">&nbsp;</td>
  </tr>
  <tr>
    <td height="19">&nbsp; </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>

<tr><td><%@ include file="../footer.jsp"%></td></tr>
</table>
</form>
</body>
</html>
