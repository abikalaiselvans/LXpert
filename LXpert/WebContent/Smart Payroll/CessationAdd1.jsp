<%@ page import="java.io.*,java.util.*"%>
<%@ page import="com.my.org.erp.bean.payroll.*"%>
<%@ page import="com.my.org.erp.SmartPayroll.*"%>
<jsp:useBean id="conbean" class="DBConnection.DBCon"></jsp:useBean>

<%
try
{
String dojlock =CommonFunctions.QueryExecute("SELECT  INT_CESSATIONDATELOCK  FROM pay_m_basicsettings  WHERE INT_ID=1")[0][0];

%>
<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>
<html>
<head>

<title> :: PAYROLL ::</title>


 
 

<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/jquery/jquery-1.7.1.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.core.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.widget.js"></script>
<script language="javascript" src="../JavaScript/jquery/ui/jquery.ui.datepicker.js"></script> 
<link href="../JavaScript/jquery/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
<script language="javascript">


 var dojlock = "<%=dojlock%>";

	  $(function() {
				var dates = $( "#cessdate, #pfdate" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,changeYear: true,
			maxDate: "+0D" ,showOn: "button",
			buttonImage: "../JavaScript/jquery/images/calendar.gif",
			numberOfMonths: 1,
			buttonImageOnly: true,
			onSelect: function( selectedDate ) 
			{
				var option = this.id == "cessdate" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" ),
					date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings );
					dates.not( this ).datepicker( "option", option, date );
			}
		});
	});  
	
	</script> 
	
  
<link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
<link rel="shortcut icon" href="../images/ERP.ico"></link>


<script src="../JavaScript/common/StaffloadAjax.js"></script>
<meta name="resource-type" content="document" />
<meta http-equiv="content-type" content="text/html; charset=US-ASCII" />
<meta http-equiv="content-language" content="en-us" />
<meta name="author" content="KALAISELVAN K" />
<meta name="contact" content="abikalaiselvan@yahoo.co.in" />
<meta name="copyright" content="Copyright (c)2006-2011 KALAISELVAN K. All Rights Reserved." />
<meta name="description" content="Office Automation ERP Products." />
<meta name="keywords" content="HRM, Human Resource Management, HR Planning, Job Design, Job Analysing, Applicant, Company, Branch, Division,Model,Color,Office, Qualification, Attendance, Biometric, Finger Print, Forms, Leave, Holiday, Common Holiday, Shift Master, Shift Allocation. Proximity, Smart Card, Manual attendance, personal inforamtion , Basic, Allowance, Payroll, Salary Slab, Allowance, Recovery, Professional Tax, Employee attendance, Promotion, Trainning, Ressigner, Email, Jonners, PF, ESI, CTC, CTC, Take Home, Admin charge, Attendance, Payroll, Inventory, Product, Item, Customer, Vendor, vendor group, customer group, Purchase, sales, purchase paymeny, vendor payment, Sales return, purchase return, Quotation , Po, Purchase report, sales report, Tax, service tax, vat, c-form, taxes, user, employee id, payslip, consolidation, Attendance, stock, stock book , stock view, stock transfer, consumables, Serial number tracking, " />
 
</head>
 <body  onpaste="return false;" onLoad="init() ">
<%@ include file="index.jsp"%>
<form  AUTOCOMPLETE = "off"   name="Cessation" action="../SmartLoginAuth" onSubmit="return validate()">
<table width="100%" border="0" align="center" cellpadding="2"
	cellspacing="2">
	<tr>
		<td></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td height="54">
		<table width="563" border="0" align="center" cellpadding="0"
			cellspacing="0" bgcolor="#dce4f9" class="BackGround">
			<tbody>
				<tr>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/TLCorner.gif" width="7" /></td>
					<td class="BorderLine" height="1"><spacer height="1" width="1"
						type="block" /></td>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/TRCorner.gif" width="7" /></td>
				</tr>
				<tr>
					<td height="6"><spacer height="1" width="1" type="block" /></td>
				</tr>
				<tr>
					<td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
					<td width="6"><spacer height="1" width="1" type="block"></td>
					<td width="549" valign="top">
					<table width="549" border="0" cellspacing="0" cellpadding="0">
						<tr class="boldEleven">
							<td height="20" colspan="2">
							<div align="center" class="boldEleven"><span
								class="boldEleven"><strong>EMPLOYEE CESSATION </strong></div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<div align="right"><span class="boldEleven">* </span><span
								class="changePos">Mandatory</span></div>
							</td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>

						<tr>
							<td width="49%" height="19">&nbsp;</td>
							<td width="51%">&nbsp;</td>
						</tr>
						<tr>
							<td height="19" colspan="2">
							<div align="center"><%@ include
								file="../JavaScript/ajax.jsp"%></div>
							</td>
						</tr>
						<tr>
							<td height="19" colspan="2">
							<table width="337" border="0" align="center" cellpadding="2"
								cellspacing="0">
								<tr>
									<td width="140" valign="middle"  
										class="boldEleven">Type of Cessation</td>
									<td width="180">
									<select name="cessation"  id="cessation">
									<option value="Abscond">Abscond</option>
									<option value="Terminate">Terminate</option>
									<option value="Resigned" selected="selected">Resigned</option>
									<option value="Long Leave">Long Leave</option>
									<option value="Better Opportunity">Better Opportunity</option>
									<option value="Foriegn Job">Foriegn Job</option>
									<option value="Family Problem">Family Problem</option>
									<option value="Start a business">Start a business</option>
									<option value="Personal Problem">Personal Problem</option>
									<option value="Health Problem">Health Problem</option>
									<option value="Higher Education">Higher Education</option>
									<option value="Manger Problem">Manger Problem</option>
									<option value="Double Entry Problem">Double Entry Problem</option>
									 
									</select>
									 </td>
								</tr>
								<tr>
									<td valign="middle"   class="boldEleven">Date
									of Cessation<font color="#CC0000">*</font></td>
									<td><input name="cessdate" type="text" class="formText135"
										id="cessdate" maxlength="11"> 
	<script language="JavaScript"> setCurrentDate('cessdate');</script></td>
								</tr>
								<tr>
								  <td valign="top"   class="boldEleven">PF Date
								  of Cessation<font color="#CC0000">*</font></td>
								  <td><input name="pfdate" type="text" class="formText135"
										id="pfdate" maxlength="11">
                                    
                                  <script language="JavaScript"> setCurrentDate('pfdate'); </script></td>
							  </tr>
								<tr>
									<td valign="top"   class="boldEleven">Reason<font color="#CC0000">*</font></td>
									<td><textarea name="reason" cols="25" rows="5"
										class="formText135" id="reason" onKeyPress="textArea('reason','500')">RESIGNED</textarea></td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td height="19" colspan="2" align="left"class="boldred">
                            <%
							out.println("<br><b>Note *</b>");
							out.println("<br>Please check date of Joining <= date of Resigning ");
							out.println("<br>Attendance register should be mark for the month of resigning date");
							out.println("<br>Should be change whose are reporting to him or her");
							 
							%>
							
							</td>
						</tr>
						<tr>
							<td height="19" colspan="2">
							<div align="center"><input name="filename" type="hidden"
								id="filename" value="StaffCessation" /> <input name="actionS"
								type="hidden" id="actionS" value="PAYStaffCessationAdd" />
							  <input name="mode" type="hidden" id="mode" value="D">
							</div>
							</td>
						</tr>
						<tr>
							<td height="19" colspan="2">
							<table border="0" align="center" cellpadding="2" cellspacing="2">
								<tr>
									<td width="56"><input type="submit" name="Submit"
										id="submit_btn" class="buttonbold14" value="Submit"   accesskey="s"    /></td>
									<td width="56"><input type="button" name="submit"
										class="buttonbold14"  value="Close"   accesskey="c" 
										onClick="redirect('EmployeeCessation.jsp')" /></td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</td>
					<td nowrap="nowrap" width="6"><spacer height="1" width="1"
						type="block" /></td>
					<td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/General/BLCorner.gif" width="7" /></td>
					<td height="6"><spacer height="1" width="1" type="block"></td>
					<td colspan="2" rowspan="2" valign="bottom">
					<div align="right"><img height="7"
						src="../Image/General/BRCorner.gif" width="7" /></div>
					</td>
				</tr>
				<tr>
					<td class="BorderLine" height="1"><spacer height="1" width="1"
						type="block" /></td>
				</tr>
			</tbody>
		</table>
		</td>
	</tr>
	<tr>
		<td height="23"><div align="center" class="bolddeepred">
							<div align="center">
							<%
					  String er=request.getParameter("er");
					  
					  if(!(er == null))
					  {
					  
					  	out.println(er);
						out.println("<script language='javascript'>alert('"+er+"')</script>");
						
					}
					  
					  %>
					   </div>
							</div></td>
	</tr>
	<tr>
		<td height="40"><%@ include file="../footer.jsp"%></td>
	</tr>
</table>
</form>

<script language="javascript">
function validate() 
{
    if(
	    checkNull("ename","Select Employee ") 
		&& checkNull("cessation","Type of Cessation ")
		&& checkNull("date","Date of Cessation")
		&& checkNull("pfdate","PF-Date of Cessation")
		&& checkNull("reason","Reason")
		 
	)
	{
    	
		return true;
	}
    else
    	return false;
}

  
</script>

<%
}
catch(Exception e)
{
		out.println(e.getMessage());
}
%>