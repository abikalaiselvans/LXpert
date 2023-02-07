<%@ page import="java.io.*,java.util.*" errorPage="../error/index.jsp"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<html>
<head>
<title>:: INVENTORY ::</title><link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
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
<script language="javascript" src="../JavaScript/Inventory/InvenAJAX.js"></script>
<script language="javascript" src="../JavaScript/AJAX.js"></script>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/calendar1.js"></script>
<script language="JavaScript">

  function Validate()
  {    
	if(
	checkNull("replacementno","Enter Replacement Number") 
	&& checkNull("newserial","Enter Serial Number")
	&& checkNull("newwarranty","Enter Warranty ")
	&& checkNull("replacementdt","Enter Replacement Date") 
	)
	{
		alert(true);
		return true;
		
	}
	else
		return false;		
  } 
 	
</script>

<body >
<%@ include file="indexinv.jsp"%>
<table width="100%" border="0" cellspacing="1" cellpadding="1">
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
		<table class="BackGround1" cellspacing="0" cellpadding="0" width="424"
			align="center" border="0">
			<tbody>
				<tr>
					<td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/Smart Inventory/TLCorner.gif" width="7" /></td>
					<td class="BorderLine" height="0"><spacer height="1" width="1"
						type="block" /></td>
					<td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/Smart Inventory/TRCorner.gif" width="7" /></td>
				</tr>
				<tr>
					<td height="6"><spacer height="1" width="1" type="block" /></td>
				</tr>
				<tr>
					<td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
					<td width="6"><spacer height="1" width="1" type="block" /></td>
					<td width="412">
					<table cellspacing="2" cellpadding="2" width="392" align="center"
						border="0">
						<!--DWLayoutTable-->
						<tbody>
							<tr>
								<td width="384" height="16" align="center" valign="top"
									class="boldThirteen">RETURN ENTRY DETAILS <%
				  String grtn =request.getParameter("grtno");
				  String pid =request.getParameter("pid");
				  String rowid =request.getParameter("rowid");
				  
				  String sql = "SELECT CHR_GRTNO,INT_BRANCHID,CHR_PURCHASEORDERNO,CHR_ITEMID,CHR_RECIVEDID,DAT_RECIVEDDATE,CHR_SERIALNO,CHR_WARRANTY,CHR_FLAG ,INT_ID ,INT_RECEIVEDROWID,CHR_REPLACEMENTNO,DAT_REPLACEMENTDATE,CHR_NEWSERIAL,CHR_NEWWARRANTY ,CHR_TYPE FROM  inv_t_vendorgoodsreturn  WHERE CHR_GRTNO='"+grtn+"' AND INT_ID="+Integer.parseInt(rowid);
				  //out.println(sql);
				  String returnData[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
				  
				  %>
								</td>
							</tr>
							<tr>
								<td height="19" align="right" valign="top"><span
									class="bolddeepred">* </span><span class="fairyHead">Mandatory
								</span></td>
							</tr>
							<tr>
								<td height="17" class="boldEleven">
								<form  AUTOCOMPLETE = "off"   action="../SmartLoginAuth" method="post" name="frm" id="frm" 	onSubmit="return Validate()">
								<table width="343" border="0" align="center" cellpadding="2"
									cellspacing="2">
									<tr>
										<td width="153" class="boldEleven">&nbsp;</td>
										<td width="183" class="boldEleven"><input name="filename"
											type="hidden" id="filename" value="GoodsReturn"> <input
											name="actionS" type="hidden" id="actionS"
											value="INVGoodsReturnReceivedAdd"> <input name="pid"
											type="hidden" id="pid" value="<%=pid%>"> <input
											name="rowid" type="hidden" id="rowid" value="<%=rowid%>">
										<input name="grtn" type="hidden" id="grtn" value="<%=grtn%>">
										<input name="itemid" type="hidden" id="grtn"
											value="<%=returnData[0][3]%>"> <input name="type"
											type="hidden" id="grtn" value="<%=returnData[0][15]%>">
										<input name="flag" type="hidden" id="flag"
											value="<%=returnData[0][8]%>">
										<input
											name="goodsreceivedrowid" type="hidden" id="grtn"
											value="<%=returnData[0][10]%>"></td>
									</tr>
									<tr>
										<td class="boldEleven">Goods Return Number</td>
										<td class="boldEleven"><%=grtn%></td>
									</tr>
									<tr>
										<td class="boldEleven">Purchase Order Number</td>
										<td class="boldEleven"><%=pid%></td>
									</tr>
									<tr>
										<td class="boldEleven">Type</td>
										<td class="boldEleven">
										<%
						String itemname="";
						String iname="";
						if(returnData[0][15].equals("I"))
						{
							sql = "SELECT CHR_ITEMNAME FROM inv_m_item WHERE CHR_ITEMID='"+returnData[0][3]+"'";
							itemname = com.my.org.erp.common.CommonInfo.stringGetAnySelectField(sql, "CHR_ITEMNAME");
							iname="Item";
						}	
						if(returnData[0][15].equals("P"))
						{
							sql = "SELECT CHR_PRODUCTCODE FROM inv_m_produtlist WHERE CHR_PRODUCTID='"+returnData[0][3]+"'";
							itemname=com.my.org.erp.common.CommonInfo.stringGetAnySelectField(sql, "CHR_PRODUCTCODE");
							iname="Product";
						}	
						out.print(iname);
						%>										</td>
									</tr>
									<tr>
										<td class="boldEleven">Item Name</td>
										<td class="boldEleven">
										<%
						
						out.println(itemname);
						%>										</td>
									</tr>
									<tr>
										<td class="boldEleven">Received Id</td>
										<td class="boldEleven"><%=returnData[0][4]%></td>
									</tr>
									<tr>
										<td height="25" class="boldEleven">Old Serial Number</td>
										<td class="boldEleven"><%=returnData[0][6]%></td>
									</tr>
									<tr>
										<td class="boldEleven">Old Warranty</td>
										<td class="boldEleven"><%=returnData[0][7]+" - Years"%></td>
									</tr>
									<tr>
										<td class="boldEleven">Replacement Docu. No</td>
										<td class="boldEleven"><input name="replacementno" type="text"
											class="formText135" id="replacementno"
											value='<%=returnData[0][11]%>' maxlength="30"></td>
									</tr>
									<tr>
										<td class="boldEleven">Replacement Date</td>
										<td class="boldEleven"><input tabindex="2"
											name="replacementdt" type="text" class="formText135"
											id="replacementdt" size="15" readonly="readonly"
											value='<%=returnData[0][12]%>' /> <a
											href="javascript:cal1.popup();"> <img
											src="../JavaScript/img/cal.gif" width="16" height="16"
											border="0" /> </a> <script language='JavaScript'
											type="text/javascript">
		<!--			
				var cal1 = new calendar1(document.forms['frm'].elements['replacementdt']);
				cal1.year_scroll = true;
				cal1.time_comp = false;
				setCurrentDate('replacementdt'); 
		//-->
                          </script></td>
									</tr>
									<tr>
										<td class="boldEleven">New Serial Number</td>
										<td class="boldEleven"><input name="newserial"
											type="text" class="formText135" id="newserial"
											onKeyUp="upperMe(this),LoadUniqueCheckWithData('newserial','soValid','inv_t_vendorgoodsreceived','CHR_SERIALNO','Submit2','<%=returnData[0][6]%>')"
											value='<%=returnData[0][13]%>' maxlength="50">
										<div id=soValid></div>										</td>
									</tr>
									<tr>
										<td class="boldEleven">New Warranty</td>
										<td class="boldEleven">
										<%
						out.print("<select name='newwarranty'  id='newwarranty' class='formText135' >");
		%> <jsp:include page="Warranty.jsp" flush="true" /> <%
		out.println("</select>");
		%> <!--<input name="newwarranty" type="text" value='<%=returnData[0][14]%>' class="formText135" id="newwarranty">--></td>
									</tr>
									<tr>
										<td class="boldEleven">Replacement</td>
										<td class="boldEleven">

										<table border="0" cellspacing="1" cellpadding="1">
											<tr>
												<td class="boldEleven"><input name="Status"
													type="radio" value="Y" checked="checked"></td>
												<td class="boldEleven">Yes</td>
												<%
							  if("N".equals(returnData[0][8]))
							  {
							  %>
												<td class="boldEleven"><input name="Status"
													type="radio" value="N"></td>
												<td class="boldEleven">No</td>
												<%
							  }
							  %>
											</tr>
										</table>										</td>
									</tr>
									<tr>
										<td class="boldEleven">&nbsp;</td>
										<td class="boldEleven">&nbsp;</td>
									</tr>
									<tr>
										<td height="30" colspan="2" class="boldEleven">
										<table border="0" align="center" cellpadding="1"
											cellspacing="1">
											<tr>
												<td width="56"><input name="Submit2" id="Submit2"
													type="submit" class="buttonbold13" value="Replace"></td>
												<td width="56"><input name="Submit" type="button"
													class="buttonbold13"  value="Close"   accesskey="c" 
													onClick="redirect('GoodsReturnEdit.jsp?grtno=<%=grtn%>')"></td>
											</tr>
										</table>										</td>
									</tr>
								</table>
								</form>
								</td>
							</tr>
						</tbody>
						<input type="hidden" name="mobileBookingOption" />
					</table>
					</td>
					<td nowrap="nowrap" width="4"><spacer height="1" width="1"
						type="block" /></td>
					<td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/Smart Inventory/BLCorner.gif" width="7" /></td>
					<td height="6"><spacer height="1" width="1" type="block" /></td>
					<td colspan="2" rowspan="2"><img height="7"
						src="../Image/Smart Inventory/BRCorner.gif" width="7" /></td>
				</tr>
				<tr>
					<td class="BorderLine" height="0"><spacer height="1" width="1"
						type="block" /></td>
				</tr>
			</tbody>
		</table>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<%@ include file="../footer.jsp"%>
</body>
</html>
