<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>:: INVENTORY ::</title><%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<script language="JavaScript"
	src="../../JavaScript/Inventory/InvenAJAX.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0in;
	margin-top: 1.25in;
}
-->
</style>
</head>
<%
	String Saleno=request.getParameter("Saleno");
	String sql=" SELECT a.CHR_QUOTATIONNO,FIND_A_CUSTOMER_NAME(b.INT_CUSTOMERID),a.CHR_CUSTPURCHASENO,a.CHR_SALESORDERNO,a.CHR_SALEBY,a.DAT_SALEDATE,";
	sql = sql +" a.CHR_DELIVERYSTATUS,a.CHR_BILLINGADDRESS,a.CHR_SHIPINGADDRESS,a.INT_ONHOLD,";
	sql = sql +" a.INT_CONDITIONID,a.INT_PAYMENTTERMID,a.CHR_DES,a.CHR_REF,a.INT_TAXID,a.DOU_AMOUNT,a.DOU_DISCOUNT,";
	sql = sql +" a.DOU_TAXAMOUNT,a.DOU_TOTALAMOUNT,a.CHR_PAYMENTSTATUS from  inv_t_customersalesorder   a ,inv_m_customerinfo b ";
	sql = sql +" where a.CHR_SALESORDERNO='"+Saleno+"' AND a.INT_CUSTOMERID =b.INT_CUSTOMERID order by a.DAT_SALEDATE";
	//out.print(sql);  
	String SalenoInfo[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sql);	
	String branchId=""+session.getAttribute("BRANCHID");
	String Dcno=request.getParameter("Dcno");
	sql = "SELECT DT_DELIVERYDATE FROM  inv_t_customersalesorderitemserial   WHERE CHR_SALESORDERNO='"+Saleno+"' AND CHR_DELIVERYNO='"+Dcno+"' group by DT_DELIVERYDATE";
	String dcdate[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sql); 
	
	sql = " SELECT b.CHR_ITEMNAME,a.CHR_ITEMID,a.CHR_SERIALNO,a.CHR_WARRANTY FROM  inv_t_customersalesorderitemserial   a ,inv_m_item b ";
	sql = sql +" WHERE a.CHR_SALESORDERNO='"+Saleno+"' ";
	sql = sql +" AND a.CHR_DELIVERYNO='"+Dcno+"' ";
	sql = sql +" AND b.CHR_ITEMID =a.CHR_ITEMID ";
	String dcdata[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sql); 
	String dcnumber =Dcno;
%>
<body >
<br />
<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>

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
                        		out.println("Hold");
                        	else
                        		out.println("-");
                        %>
									</td>
								</tr>
								<tr>
									<td class="boldEleven">
									<div align="left"><strong>Customer Id / Name</strong></div>
									</td>
									<td class="boldEleven"><%=SalenoInfo[0][1] %></td>
									<td class="boldEleven"><strong>Billing To </strong></td>
									<td class="boldEleven">
									<div align="left"><%=SalenoInfo[0][7]%>
									<div align="left"></div>
									</td>
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
									<td class="boldEleven"><%=Dcno%></td>
								</tr>
								<tr>
									<td height="22" class="boldEleven">
									<div align="left"><strong>Sale Date </strong></div>
									</td>
									<td class="boldEleven"><%=SalenoInfo[0][5] %></td>
									<td class="boldEleven"><strong>Delivery Date </strong></td>
									<td class="boldEleven"><%=dcdate[0][0] %></td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td>
							<%
					  
					sql = " select CHR_TYPE,CHR_ITEMID, count(*) from  inv_t_customersalesorderitemserial ";
					sql = sql + " WHERE CHR_SALESORDERNO = '"+Saleno+"'  ";
					sql = sql + " AND CHR_DELIVERYNO ='"+dcnumber+"' group by CHR_TYPE ";
					String saledata[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
					String iname="";
					String itemname="";
					out.println("<table width='100%'  border='1' cellspacing=0 cellpadding=0 >");
					out.println("<td   class='boldEleven'><b>Type</b></td>");
					out.println("<td   class='boldEleven'><b>Item / Product</b></td>");
					out.println("<td   class='boldEleven'><b>Order Qty</b></td>");
					out.println("<td   class='boldEleven'><b>Delivery Qty </b></td>");
					
					for(int u=0; u<saledata.length;u++)
					{
						if(saledata[u][0].equals("I"))
						{
							iname="Item";
							sql = "SELECT CHR_ITEMNAME FROM inv_m_item WHERE CHR_ITEMID='"+saledata[u][1]+"'";
							itemname = com.my.org.erp.common.CommonInfo.stringGetAnySelectField(sql, "CHR_ITEMNAME");
						}	
						if(saledata[u][0].equals("P"))
						{
						  iname="Product";
						  sql= "SELECT CHR_PRODUCTCODE FROM inv_m_produtlist WHERE CHR_PRODUCTID='"+saledata[u][1]+"'";
						  itemname=com.my.org.erp.common.CommonInfo.stringGetAnySelectField(sql, "CHR_PRODUCTCODE");
						}	
						out.println("<tr><td   class='boldEleven' >"+iname+"</td>");
						out.println("<td  class='boldEleven' >"+itemname+"</td>");
						
						
						sql = " select count(*) from  inv_t_customersalesorderitemserial  ";
						sql = sql +" WHERE CHR_SALESORDERNO = '"+Saleno+"'  AND  CHR_ITEMID = '"+saledata[u][1]+"' ";
						int Ordqty = com.my.org.erp.common.CommonFunction.intRecordCount(sql);
						

						out.println("<td  class='boldEleven' >"+Ordqty+"</td>");
						out.println("<td  class='boldEleven' >"+saledata[0][2]+"</td>");
						
						 
					}	
					out.println("</table>");
					
						%>
							</td>
						</tr>
						<tr>
							<td>
							<%
						sql = " select CHR_TYPE,CHR_ITEMID,CHR_SERIALNO,CHR_WARRANTY ,INT_ID from  inv_t_customersalesorderitemserial  WHERE CHR_SALESORDERNO = '"+Saleno+"'  AND CHR_DELIVERYNO ='"+dcnumber+"' order by CHR_ITEMID ";
						String serialdata[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
						out.print("<table border=0 cellspacing=3 cellpadding=3 width='100%'>");
						out.println("<tr><td class='boldEleven'><b>S.No. </b></td><td   class='boldEleven'><b>Type</b></td>");
						out.println("<td   class='boldEleven'><b>Item / Product</b></td>");
						out.println("<td   class='boldEleven'><b>Serial Number</b></td>");
						out.println("<td   class='boldEleven'><b>Warranty</b></td>");
						for(int u=0; u<serialdata.length;u++)
						{
							if(u%2 == 0)
								out.println("<tr class='MRow1'>");
							else
								out.println("<tr class='MRow2'>");
							
							 	
							if(serialdata[u][0].equals("I"))
							{
								iname="Item";
								sql = "SELECT CHR_ITEMNAME FROM inv_m_item WHERE CHR_ITEMID='"+serialdata[u][1]+"'";
								itemname = com.my.org.erp.common.CommonInfo.stringGetAnySelectField(sql, "CHR_ITEMNAME");
							}	
							if(serialdata[u][0].equals("P"))
							{
							  iname="Product";
							  sql= "SELECT CHR_PRODUCTCODE FROM inv_m_produtlist WHERE CHR_PRODUCTID='"+serialdata[u][1]+"'";
							  itemname=com.my.org.erp.common.CommonInfo.stringGetAnySelectField(sql, "CHR_PRODUCTCODE");
							}	
							out.println("<td   class='boldEleven' >"+(u+1)+"</td>");
							out.println("<td   class='boldEleven' >"+iname+"</td>");
							out.println("<td class='boldEleven' >"+itemname);
							out.println("<td class='boldEleven' >"+serialdata[u][2]+"</td>");
							out.println("<td class='boldEleven' >"+serialdata[u][3]+"</td>");
						}
						out.print("</table>");
					  %>
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td valign="top" class="boldEleven">&nbsp;</td>
						</tr>
						<tr>

						</tr>
						<tr>
							<td valign="top" class="boldEleven">&nbsp;</td>
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

		<table width="100" border="0" align="center" cellpadding="3"
			cellspacing="3">
			<tr>
				<td valign="top" class="boldEleven">
				<div align="center"><a href="javascript:window.print()">Print</a></div>
				</td>
			</tr>
		</table>
		<p>&nbsp;</p>
		</td>
	</tr>
	<tr>
		<td></td>
	</tr>
</table>
</body>
</html>

