<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%> 
 
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

<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>

<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



<link href="../DropDown - Image/msdropdown/dd.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../DropDown - Image/msdropdown/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../DropDown - Image/msdropdown/js/uncompressed.jquery.dd.js"></script>
<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/common/SelectChangesCountry.js"></script>
</head>

<script language="JavaScript">

 
function Validate()
  {
	
   	if(  
   		 checkNullSelect( "country","Select Country",'0') 
   		 && checkNullSelect( "state","Select State",'0' ) 
   		 && checkNullSelect( "reportType","Select Export Type" ,'0')
		
	  )
		return true;
	else
		return false;				
 } 	
</script>
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
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
	 <form  AUTOCOMPLETE = "off"   action="../SmartLoginAuth" method="post" name="frm" id="frm" onSubmit="return Validate()">
	<table class="BackGround1" cellspacing="0" cellpadding="0" width="300"
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
                <td colspan="2" class="bold1"><div align="center">CITY REPORTING HEAD  </div></td>
                </tr>
                <tr>
				<td class="boldEleven">
				 Country <font
																class="bolddeepred" align="absmiddle">*</font></td>
				<td align="left" valign="top"><select name="country" class="formText135" id="country" style="width:170px" onChange="LoadSelectState()">
	<option value=""> Select Country</option>
	
                  <%
		 			
	String BData[][] = CommonFunctions.QueryExecute("SELECT INT_COUNTRYID ,CHR_COUNTRYNAME FROM  com_m_country ORDER BY CHR_COUNTRYNAME");
	if (BData.length>0)
		for (int i=0; i<BData.length; i++) 
			out.println("<option value="+BData[i][0]+">"+BData[i][1] +"</option>");			
	
	
					%>
	
	</select>
				</td>
				</tr>
				<tr>
				<td class="boldEleven">
				 State <font
																class="bolddeepred" align="absmiddle">*</font></td>
				<td align="left" valign="top"><select name="state" class="formText135" id="state" onChange="LoadSelectDistricts()" style="width:170px">
	<option value="">Select State</option>
	<option value="0"> All</option>
	</select>
				</td>
				</tr>
				<tr>
				<td class="boldEleven">
				 District <font
																class="bolddeepred" align="absmiddle">*</font></td>
				<td align="left" valign="top"><select name="district" class="formText135" id="district" style="width:170px">
	<option value="n"> Select District</option>
	<option value="0"> All</option>
	</select>
				</td>
				</tr>
              <tr>
                <td width="39%" height="30" class="boldEleven">Export Type <font
																class="bolddeepred" align="absmiddle">*</font></td>
                <td width="61%" align="left" valign="top" class="boldEleven"><script language="javascript" type="text/javascript">
	$(document).ready(function() 
	{
		try 
		{
			$("#reportType").msDropDown();
			
		} 
		catch(e) 
		{
				
		}
	}
	)
</script>
  <select name="reportType" id="reportType" style="width:170px;" >
    <option value="0" title="../DropDown - Image/icons/export.jpg" selected="selected">Export Type</option>
    <option value="csv" title="../DropDown - Image/icons/csv.jpg">CSV </option>
    <option value="xls" title="../DropDown - Image/icons/excel.jpg">Excel </option>
    <option value="html" title="../DropDown - Image/icons/html.jpg">Html </option>
    <option value="pdf" title="../DropDown - Image/icons/pdf.jpg">Pdf </option>
    <option value="rtf" title="../DropDown - Image/icons/rtf.jpg">Rtf </option>
    <option value="txt" title="../DropDown - Image/icons/txt.jpg">Txt </option>
    <option value="xml" title="../DropDown - Image/icons/xml.jpg">Xml </option>
  </select></td>
              </tr>
               
              
              
              <tr>
                <td class="boldEleven">&nbsp;</td>
                <td align="left" valign="top" class="boldEleven"><input name="filename" type="hidden" id="filename"
										value="City">
                  <input name="actionS"
										type="hidden" id="actionS"
										value="RPTCity">
                  <input name="rptfilename" type="hidden" id="rptfilename" value="PageWidth640"></td>
              </tr>
              <tr>
                <td colspan="2" class="boldEleven"><table width="112" border="0" align="center" cellpadding="1"
									cellspacing="1">
                  <tr>
                     <td><input name="Submit" id="Submit" type="submit" 	class="buttonbold13" value="Submit"   accesskey="s"   ></td>
                    
                    <td><input name="Close" type="button"   class="buttonbold13" id="Close"  value="Close"   accesskey="c"  	  onClick="javascript:window.close()"  ></td>
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
