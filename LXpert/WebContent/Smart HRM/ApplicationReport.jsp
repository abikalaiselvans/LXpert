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
<script language="JavaScript" src="../JavaScript/HRM/Applicant.js"></script>
<script language="javascript" src="../JavaScript/HRM/JobTitle.js"></script>
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
<body  onpaste='return false;'>
<form  AUTOCOMPLETE = "off" action="ApplicationReportView.jsp" name="report" method="post"  >
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
          <TD width=425 valign="top"><table width="425" border="0" class="BackGround"   align="center" cellpadding="2" cellspacing="2"  >
              <!--DWLayoutTable-->
              <tr align="center" valign="middle">
                <!--          <td height="28" colspan="2" class="BackGround"  >Demand</td> -->
                <td height="28" colspan="2" class="tablesubhead" >Application  Report </td>
              </tr>
              <tr class="bolddeepblue">
                <td height="18" colspan="2" valign="middle" class="bolddeepblue"><!--DWLayoutEmptyCell-->&nbsp;</td>
              </tr>
              <tr class="bolddeepblue">
                <td width="145" height="29" valign="middle" class="boldEleven"><div align="left">Job Grade<font color='red'> *</font></div></td>
                <td width="266"><select name="jobgrade" class="formText135" id="jobgrade" onChange="loadComboJobTitleAll(this)" style="width:200" >
                      <option value="0">All</option>
                      <option value="Top">Group-1</option>
                      <option value="Middle">Group-2</option>
                      <option value="Bottom">Group-3</option>
                    </select></td>
              </tr>
              <tr >
                <td height="29" valign="middle" class="boldEleven"><div align="center" class="boldEleven">
                  <div align="left">Job Title <span class="style3"><font color="red">*</font></span></div>
                </div></td>
                <td><select name="jobtitle" id="jobtitle" class="formText135"  style="width:200" >  
                      <option value="0">All</option>
                    </select>                </td>
              </tr>
              <tr >
                <td height="29" valign="middle" class="boldEleven"><div align="left">Office <span class="style3"><font color="red">*</font></span></div></td>
                <td><select name="office" class="formText135" id="office"  style="width:200"   >
                     <option value="0">All</option>
                     <%
				   	String offdata[][]=com.my.org.erp.common.CommonInfo.RecordSetArray(" SELECT INT_OFFICEID,CHR_OFFICENAME FROM   com_m_office ORDER BY CHR_OFFICENAME ");
					for(int c=0;c<offdata.length;c++)
						out.println("<option value='"+offdata[c][0]+"'  >"+offdata[c][1]+"</option>");	
					
				
				   %>
                   </select></td>
              </tr>
              <tr >
                <td height="29" valign="middle" class="boldEleven"><div align="left">Month <span class="style3"><font color="red">*</font></span></div></td>
                <td>
				
				<select name="Month" class="formText135" id="Month" style="width:100">
	<option value="0">All</option>
	<option value="January">January</option>
	<option value="February">February</option>
	<option value="March">March</option>
	<option value="April">April</option>
	<option value="May">May</option>
	<option value="June">June</option>
	<option value="July">July</option>
	<option value="August">August</option>
	<option value="September">September</option>
	<option value="October">October</option>
	<option value="November">November</option>
	<option value="December">December</option>
</select>

 
<script language='JavaScript' type="text/javascript">
				<!--			
						
						var today = new Date();
						var monthnum = today.getMonth();
						var monthname=new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
						var day=today.getDate();
						setOptionValue('Month',monthname[monthnum]);
					
				//-->
          </script>
				</td>
              </tr>
              <tr >
                <td height="29" valign="middle" class="boldEleven"><div align="left">Year <span class="style3"><font color="red">*</font></span></div></td>
                <td><jsp:include page="../JavaScript/year.jsp" flush="true" />&nbsp;</td>
              </tr>
              
              <tr class="bolddeepblue">
                <td colspan="2" valign="middle" class="bolddeepblue"><table align="center" cellpadding="3" cellspacing="3">
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
    <td height="19">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>

<tr><td><%@ include file="../footer.jsp"%></td></tr>
</table>
</form>
</body>
</html>