<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage="../error/index.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: INVENTORY ::</title><%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/calendar1.js"></script>
<script language="JavaScript" src="../JavaScript/Inventory/InvenAJAX.js"></script>
<style type="text/css">
<!--
.style3 {font-weight: bold}
-->
</style>
</head>
<%
try
{
	String Saleno=request.getParameter("Saleno");
	String sql=" SELECT a.CHR_QUOTATIONNO,FIND_A_CUSTOMER_NAME(b.INT_CUSTOMERID),a.CHR_CUSTPURCHASENO,a.CHR_SALESORDERNO,a.CHR_SALEBY,a.DAT_SALEDATE,";
	sql = sql +" a.CHR_DELIVERYSTATUS,a.CHR_BILLINGADDRESS,a.CHR_SHIPINGADDRESS,a.CHR_ONHOLD,";
	sql = sql +" a.INT_CONDITIONID,a.INT_PAYMENTTERMID,a.CHR_DES,a.CHR_REF,a.INT_TAXID,a.DOU_AMOUNT,a.DOU_DISCOUNT,";
	sql = sql +" a.DOU_TAXAMOUNT,a.DOU_TOTALAMOUNT,a.CHR_PAYMENTSTATUS from  inv_t_customersalesorder   a ,inv_m_customerinfo b ";
	sql = sql +" where a.CHR_SALESORDERNO='"+Saleno+"' AND a.INT_CUSTOMERID =b.INT_CUSTOMERID order by a.DAT_SALEDATE";
	String SalenoInfo[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sql);	
	String branchId=""+session.getAttribute("BRANCHID");
	
%>
<body >
<%@ include file="indexinv.jsp"%>
<form  AUTOCOMPLETE = "off"   method="post" name="frm" id="frm" action="../SmartLoginAuth">
<div align="center"><br />
<table width="100%" border="0" cellspacing="1" cellpadding="1">
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
					<table width="663" border="0" align="center" cellpadding="1"
						cellspacing="1">

						<tr>
							<td width="650"></td>
						</tr>
						<tr>
							<td align="center" class="bolddeeplogin">
							<div align="center">Delivery</div>
							</td>
						</tr>
						<tr>
							<td>
							<table width="673" border="0" align="center" cellpadding="1"
								cellspacing="1">
								<tr>
									<td width="123" class="boldEleven">
									<div align="left"><strong> Quotaion Ref No </strong></div>
									</td>
									<td width="229" class="boldEleven">
									<div align="left"><%=SalenoInfo[0][0] %> <input
										name="salno" type="hidden" id="salno" value="<%=Saleno%>">
									</div>
									</td>
									<td width="107" class="boldEleven">
									<div align="left"><strong>On Hold </strong></div>
									</td>
									<td width="201" class="boldEleven">
									<%
                        	if(SalenoInfo[0][9].equals("1"))
                        		out.println("<input name='hold' type='checkbox' checked='checked' id='hold' value='checkbox'  tabindex='4'/>");
                        	else
                        		out.println("<input name='hold' type='checkbox' id='hold' value='checkbox'  tabindex='4'/>");
                        %>
									</td>
								</tr>
								<tr>
									<td class="boldEleven">
									<div align="left"><strong>Customer Id / Name</strong></div>
									</td>
									<td class="boldEleven"><%=SalenoInfo[0][1] %></td>
									<td class="boldEleven"><strong>Billing To </strong></td>
									<td class="boldEleven"><%=SalenoInfo[0][7]%></td>
								</tr>
								<tr>
									<td class="boldEleven"><strong>Cust Purchase No </strong></td>
									<td class="boldEleven"><%=SalenoInfo[0][2] %></td>
									<td class="boldEleven"><strong>Shipping To </strong></td>
									<td class="boldEleven"><%=SalenoInfo[0][8]%></td>
								</tr>
								<tr>
									<td class="boldEleven"><strong>Sale Order No </strong></td>
									<td class="boldEleven"><%=SalenoInfo[0][3] %></td>
									<td class="boldEleven"><strong>Payment Terms</strong></td>
									<td class="boldEleven">
									<%
		String paymentids[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select INT_PAYMENTTERMID,CHR_PAYMENTNAME from inv_m_paymentterms");
		String pid="";
			for(int u=0; u<paymentids.length; u++){
				if(paymentids[u][0].equals(SalenoInfo[0][11]))
				{
				 out.print(paymentids[u][1]);
				 pid = paymentids[u][0];
				}				
			}
		%>
									</td>
								</tr>
								<tr>
									<td class="boldEleven">
									<div align="left"><strong>Sale By </strong></div>
									</td>
									<td class="boldEleven"><%=SalenoInfo[0][4] %></td>
									<td class="boldEleven"><strong>Delivery No </strong></td>
									<td class="boldEleven">
									<table>
										<tr>
											<td><input name="dcnumber" type="text"
												class="formText135"
												onkeyup="upperMe(this),CheckUniqueNO(this,'dcValid',' inv_t_customersalesorderitemserial  ','CHR_DELIVERYNO')"
												id="dcnumber" size="20" maxlength="50"></td>
											<td>
											<div id="dcValid"></div>
											</td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td height="22" class="boldEleven">
									<div align="left"><strong>Sale Date </strong></div>
									</td>
									<td class="boldEleven"><%=SalenoInfo[0][5] %></td>
									<td class="boldEleven"><strong>Delivery Date </strong></td>
									<td class="boldEleven"><input tabindex="2" name="delDate"
										type="text" class="formText135" id="delDate" size="15"
										readonly="readonly" /> <a href="javascript:cal2.popup();">
									<img src="../JavaScript/img/cal.gif" width="16" height="16"
										border="0" /> </a> <script language='JavaScript'
										type="text/javascript">
		<!--			
				var cal2 = new calendar1(document.forms['frm'].elements['delDate']);
				cal2.year_scroll = true;
				cal2.time_comp = false;
				setCurrentDate('delDate'); 
		//-->
                          </script></td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td>
							<table width='100%' border="1" align="center" cellpadding='1'
								cellspacing='1'>

							</table>
							</td>
						</tr>
						<tr>
							<td>
							<%
							sql = "SELECT CHR_TYPE,CHR_ITEMID,CHR_DESC,INT_QUANTITY, ";
							sql = sql+"	DOU_UNITPRICE,DOU_DISCOUNT,DOU_UNITDISCOUNT,DOU_TOTAL FROM  ";
							sql = sql+" inv_t_customersalesorderitem   WHERE CHR_SALESORDERNO = '"+Saleno+"' ";
							//out.print(sql);
							String stockcheck="";
							String saledata[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
							int prviousstock =0;
							int deliveryqty=0;
							boolean stockflag=false;
							boolean cflag=false;
							String cflags="";
							String checktxtdcqty="dcnumber,delDate,";
							String iname="";
							String itemname="";
							out.println("<table width='100%'  border='1'  cellpadding='1' cellspacing='1'>");
							out.println("<td  class='boldEleven'><b>Type</b></td>");
							out.println("<td  class='boldEleven'><b>Item / Product</b></td>");
							out.println("<td  class='boldEleven'><b>Description</b></td>");
							out.println("<td  class='boldEleven'><b>Stock in Hand</b></td>");
							out.println("<td  class='boldEleven'><b>Order Qty</b></td>");
							out.println("<td  class='boldEleven'><b>P. D.C. Qty</b></td>");
							out.println("<td  class='boldEleven'><b>D.C. Qty</b></td>");
							out.println("<td  class='boldEleven'><b>Unit Price</b></td>");
							out.println("<td  class='boldEleven'><b>Discount(%)</b></td>");
							out.println("<td  class='boldEleven'><b>Unit Discount</b></td>");
							out.println("<td  class='boldEleven'><b>Total</b></td>");
							String chkflag ="";
							for(int u=0; u<saledata.length;u++) 
							{
								if(saledata[u][0].equals("I"))
								{
									iname="Item";
									sql = "SELECT CHR_ITEMNAME FROM inv_m_item WHERE CHR_ITEMID='"+saledata[u][1]+"'";
									itemname = com.my.org.erp.common.CommonInfo.stringGetAnySelectField(sql, "CHR_ITEMNAME");
									prviousstock =0;
									sql="SELECT INT_STOCKINHAND FROM  inv_t_stock WHERE CHR_TYPE='I' AND  CHR_ITEMID ='" +saledata[u][1].trim() 
									+"' AND INT_BRANCHID="+branchId;
									prviousstock = com.my.org.erp.common.CommonInfo.intGetAnySelectField(sql, "INT_STOCKINHAND");
								
								}	
								
								if(saledata[u][0].equals("P"))
								{
								  iname="Product";
								  sql= "SELECT CHR_PRODUCTCODE FROM inv_m_produtlist WHERE CHR_PRODUCTID='"+saledata[u][1]+"'";
								  itemname=com.my.org.erp.common.CommonInfo.stringGetAnySelectField(sql, "CHR_PRODUCTCODE");
								  prviousstock =0;
								  sql="SELECT INT_STOCKINHAND FROM  inv_t_stock WHERE CHR_TYPE='P' AND CHR_ITEMID='"+saledata[u][1].trim() 
								  +"' AND INT_BRANCHID="+branchId;
								  prviousstock = com.my.org.erp.common.CommonInfo.intGetAnySelectField(sql, "INT_STOCKINHAND");
								
								}	
								
								out.println("<tr><td width='51' class='boldEleven'>"+iname+"</td>");
								out.println("<td width='113' class='boldEleven'>"+itemname+"</td>");
								out.println("<td  class='boldEleven' align='right'>"+saledata[u][2]);
								String itmname="item"+(u+1);
								String iitype ="itype"+(u+1);
								String oqty="oqty"+(u+1);
								out.println("<input name='"+itmname+"' id='"+itmname+"' type='hidden' value='"+saledata[u][1]+"'>");
								out.println("<input name='"+iitype+"' id='"+iitype+"' type='hidden' value='"+saledata[u][0]+"'>");
								
								//Stock in Hand
								out.println("<td  class='boldEleven'  align='right'>"+prviousstock+"</td>");
								stockcheck=stockcheck+prviousstock+",";
								
								
								//Order Quantity
								out.println("<td  class='boldEleven'  align='right'>"+saledata[u][3]+"</td>");
								
								//Previous DC Quantity
								out.println("<td  class='boldEleven'>");
								deliveryqty =Integer.parseInt(saledata[u][3]);
								if(deliveryqty>prviousstock)
									stockflag = true;			
								
								int olddcqty = com.my.org.erp.common.CommonInfo.intRecordCount("select count(*) from  inv_t_customersalesorderitemserial    WHERE CHR_TYPE='"+saledata[u][0].trim()+"' AND CHR_SALESORDERNO='"+Saleno+"' AND  CHR_ITEMID='"+saledata[u][1].trim()+"'  AND isNull(CHR_DELIVERYNO)");
								sql="select count(*) from  inv_t_customersalesorderitemserial    WHERE CHR_TYPE='"+saledata[u][0].trim()+"' AND CHR_SALESORDERNO='"+Saleno+"' AND  CHR_ITEMID='"+saledata[u][1].trim()+"'  AND isNull(CHR_DELIVERYNO)";
								//out.print(sql);
								int dcqty	=(deliveryqty-olddcqty);
								out.println("<input name='"+oqty+"'  type='hidden'  value='"+saledata[u][3]+"'>");
								out.println("<font color='red'>"+dcqty+"</font></td>");
								
								
								//DC Quantity
								out.println("<td  class='boldEleven' align='right'>");
								String txtname = "txtname"+(u+1);
								String dctxtname = "dctxtname"+(u+1);
								String vf1 = "onKeyPress=\"numericValue('"+txtname+"','5')\"";
								String vf2 = "onblur=\"CompareValidate('"+txtname+"' , '"+dctxtname+"' )\"";
								out.println("<input name='"+dctxtname+"' id='"+dctxtname+"' type='hidden' value='"+(deliveryqty-dcqty)+"'>");
								 
								if(deliveryqty == dcqty )
								{
								out.println("<input name='"+txtname+"' id='"+txtname+"' type='hidden' value='0'  >");
								
								}
								else
								{
								out.println("<input name='"+txtname+"' id='"+txtname+"' type='text' class='formText135' "+vf1+"     size='10' maxlength='4' value='"+(deliveryqty-dcqty)+"' "+vf2 +" >");
								checktxtdcqty = checktxtdcqty +txtname +",";
								}
								
								if((deliveryqty-dcqty)>prviousstock)
									chkflag = chkflag+"false,";
								
								out.println("<td  class='boldEleven' align='right'>"+saledata[u][4]+"</td>");
								out.println("<td  class='boldEleven' align='right'>"+saledata[u][5]+"</td>");
								out.println("<td  class='boldEleven' align='right'>"+saledata[u][6]+"</td>");
								out.println("<td  class='boldEleven' align='right'>"+saledata[u][7]+" </td>");								 
							}	
							out.println("</table>");
							out.print(chkflag);
							out.println("<input name='dcparam' id='dcparam' type='hidden' value='"+saledata.length+"'>");
							
							
						%>
							</td>
						</tr>
						<tr>
							<td>
							<div align="center" class="bolddeepred">
							<%						  	 
							if(stockflag)
						  %>
							</div>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td height="246" valign="top" class="boldEleven">
							<table width="688" border="0" align="center" cellpadding="1"
								cellspacing="1">
								<tr>
									<td width="114" rowspan="4" valign="top" class="boldEleven">
									<div align="left"></div>
									</td>
									<td width="197" rowspan="4" valign="top" class="boldEleven">
									<div align="left"></div>
									</td>
									<td width="107" valign="top" class="boldEleven">
									<div align="left"><strong>Total</strong></div>
									</td>
									<td width="169" valign="top" class="boldEleven" id="totals1">
									<div align="right"><%=SalenoInfo[0][15] %></div>
									</td>
								</tr>
								<tr>
									<td valign="top" class="boldEleven">
									<div align="left"><strong>Total Discount </strong></div>
									</td>
									<td width="169" valign="top" class="boldEleven"
										id="totaldiscount1">
									<div align="right"><%=SalenoInfo[0][16] %></div>
									</td>
								</tr>
								<tr>
									<td valign="top" class="boldEleven">
									<div align="left"><strong>Tax Group </strong></div>
									</td>
									<td width="169" valign="top" class="boldEleven" id="tax1">
									<%
								String taxids[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select INT_TAXID,CHR_TAXNAME,DOU_VALUE from inv_m_tax");
                              	String taxVal="";
								String tid="";
								for(int u=0; u<taxids.length; u++){
									if(taxids[u][0].equals(SalenoInfo[0][14])){
										out.print("<b>"+taxids[u][1]+"</b>");	
										taxVal=taxids[u][2];
										tid=taxids[u][0];
									}
														
								}									
							 %>
									</td>
								</tr>
								<tr>
									<td valign="top" class="boldEleven">
									<div align="left"><strong>Sales Tax (%) </strong></div>
									</td>
									<td width="169" valign="top" class="boldEleven" id="salestax1">
									<div align="right"><%=taxVal %></div>
									</td>
								</tr>
								<tr>
									<td class="boldEleven">
									<div align="left"><strong>Reference </strong></div>
									</td>
									<td class="boldEleven"><%=SalenoInfo[0][13] %></td>
									<td class="boldEleven">
									<div align="left"><strong>Sales Tax Amount </strong></div>
									</td>
									<td width="169" class="boldEleven" id="salestaxamount1">
									<div align="right"><%=SalenoInfo[0][17] %></div>
									</td>
								</tr>
								<tr>
									<td class="boldEleven">
									<div align="left"><input name="filename" type="hidden"
										value="DelivaryChallan" /> <input name="actionS"
										type="hidden" value="INVDelivaryChallanAdd" /></div>
									</td>
									<td class="boldEleven">
									<div align="left"></div>
									</td>
									<td class="boldEleven">
									<div align="left" class="style3">
									<div align="left">Net Total</div>
									</div>
									</td>
									<td width="169" class="boldEleven" id="nettotal1">
									<div align="right"><%=SalenoInfo[0][18] %></div>
									</td>
								</tr>
								<tr>
									<td colspan="4" class="boldEleven">
									<hr width="100%">
									</td>
								</tr>
								<tr>
									<td colspan="4" class="boldEleven"><strong>Description
									::</strong></td>
								</tr>
								<tr>
									<td colspan="4" class="boldEleven">
									<div align="justify"><%=SalenoInfo[0][12] %></div>
									</td>
								</tr>
								<tr>
									<td colspan="4" class="boldEleven">
									<table width="100" border="0" align="center" cellpadding="3"
										cellspacing="3">
										<tr>
											<td>
											<%
							
								String stockflags[] = stockcheck.split(",");
								String error="";
								boolean sflag = false;
								for(int y=0;y<stockflags.length;y++)
								{
									if("0".equals(stockflags[y].trim()))
										sflag = true;
									 
								}
							
							 
							%> <%
								if((!cflag) && (!sflag) && (chkflag.length() <2) )
								{
								
							%> <input name="Submit" id="Submit" type="submit"
												class="tMLAscreenHead" value="Delivery"
												onClick="return valid()" /> <%}
								else{
								error = "<font class='boldred'>Stock not in hand</font>";
							%> <input name="Submit" id="Submit" type="hidden"
												class="tMLAscreenHead" value="Delivery"
												onClick="return valid()" /> <%		
								}
							%>
											</td>
											<td><input name="Submit2" type="button"
												class="tMLAscreenHead" value="  Close  "
												onClick="redirect('Delivary Challan.jsp')" /></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td colspan="4" class="boldEleven">
									<div align="center" class="bolddeepred">
									<div align="center"><%=error%></div>
									</div>
									</td>
								</tr>
							</table>
							</td>
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
						src="../Image/Smart Inventory/BLCorner.gif" width="7" /></td>
					<td height="6"><spacer height="1" width="1" type="block" />
					<div align="center"></div>
					</td>
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
		<td></td>
	</tr>
</table>
<p><script language="javascript">
	function CompareValidate(v1,v2 )
	{
		var oqty = parseInt(document.getElementById(v2).value);
		var dcqty = parseInt(document.getElementById(v1).value);
		if(oqty <dcqty || dcqty<=0)
		{
			alert("kindly check Delivery Quantity...");
			document.getElementById(v1).value="";
			document.getElementById(v1).focus();
		}
		
	}

	function valid()
	{
		var s = "<%=checktxtdcqty%>";
		var v = s.split(",");
   		var flag =false;
		for( i=0; i<v.length-1; i++)
		{
			var chk =document.getElementById(v[i]).value;
			var ck = "Enter Data..."+v[i];
			if(checkNull(v[i],ck))
			{
				d=1;
			}
			else
			{
				return false;				
			}	
		}
		
	}
	
    </script></p>
<p>&nbsp;</p>
</div>
</form>
<%@ include file="../footer.jsp"%>
</body>
<%
}
catch(Exception e)
{
}
%>
</html>

