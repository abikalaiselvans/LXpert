  <%@ page import="java.io.*,java.util.*,java.text.*"%>
<%@ page import="sun.net.smtp.SmtpClient"%>
<%@ page import="java.sql.*,java.io.*,java.util.*,com.my.org.erp.ServiceLogin.*"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="sun.net.smtp.SmtpClient"%>

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


<style type="text/css" media="all">
      @import url("../JavaScript/css/maven-base.css");
      @import url("../JavaScript/css/maven-theme.css");
      @import url("../JavaScript/css/site.css");
      @import url("../JavaScript/css/screen.css");
  </style> 
</head>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
 <body >
 
 	  <%
	  String link="";
	  	try
			{
	  			
				String fromdate = request.getParameter("fromdate");
				String todate = request.getParameter("todate");
				String Branch = request.getParameter("Branch");
				String itype = request.getParameter("itype");
				String pgroup = request.getParameter("pgroup");
				String item = request.getParameter("item");
				
				
				String fdt = DateUtil.FormateDateSQL(fromdate);
				String tdt = DateUtil.FormateDateSQL(todate);
				String sql="";
						
sql = "  ";
if("1".equals(itype))
{
	sql =" SELECT FUN_GET_BRANCH_WITH_COMPANY_NAME('"+Branch+"'), CONCAT('','ITEM'), b.CHR_GROUPNAME,a.CHR_ITEMNAME,a.CHR_DES,  ";
	sql = sql + " FUN_INV_QTY_ITEM_INWARD(a.CHR_ITEMID,20,'2013-01-01','2014-01-01') inward,  ";
	sql = sql + " FUN_INV_QTY_ITEM_OUTWARD(a.CHR_ITEMID,20,'2013-01-01','2014-01-01') outward  ";
	sql = sql + " FROM inv_m_item a,inv_m_itemgroup b  ";
	sql = sql + " WHERE a.INT_ITEMGROUPID =b.INT_ITEMGROUPID  ";
	if(!"0".equals(pgroup))
		sql = sql + "  AND  a.INT_ITEMGROUPID = "+pgroup;
	if(!"0".equals(item))
		sql = sql + "  AND  a.CHR_ITEMID = "+item;
		
	sql = sql + " ORDER BY a.CHR_ITEMNAME  ";
}
else
{
	sql =   " SELECT FUN_GET_BRANCH_WITH_COMPANY_NAME('"+Branch+"'), CONCAT('','PRODUCT'),  b.CHR_NAME,a.CHR_PRODUCTCODE,a.CHR_PRODUCTDESC,  ";
	sql = sql + " FUN_INV_QTY_PRODUCT_INWARD(a.CHR_PRODUCTID,20,'2013-01-01','2014-01-01') inward,  ";
	sql = sql + " FUN_INV_QTY_PRODUCT_OUTWARD(a.CHR_PRODUCTID,20,'2013-01-01','2014-01-01') outward  ";
	sql = sql + " FROM inv_m_produtlist a,inv_m_productgroup b  ";
	sql = sql + " WHERE a.INT_PRODUCTGROUPID =b.INT_PRODUCTGROUPID  ";
	if(!"0".equals(pgroup))
		sql = sql + "  AND  a.INT_PRODUCTGROUPID = "+pgroup;
	if(!"0".equals(item))
		sql = sql + "  AND  a.CHR_PRODUCTID = "+item;
	
	sql = sql + " ORDER BY a.CHR_PRODUCTCODE  ";

}

 						 		
				 
				String reportheader="DIRECT PURCHASE & SALES  QUANTITY  [ FROM -"+fromdate +"  TO-  "+ todate +" ] "; 
				Vector mn = new Vector();
				Vector child= null; 
				String data[][] = CommonFunctions.QueryExecute(sql);
				if(data.length>0)
				{
					for(int u=0;u<data.length;u++)
					{
						child = new Vector();
						child.addElement((u+1));
						child.addElement(data[u][0]);
						child.addElement(data[u][1]);
						child.addElement(data[u][2]);
						child.addElement(data[u][3]);
						child.addElement(data[u][4]);
						child.addElement(data[u][5]);
						child.addElement(data[u][6]);
						mn.add(child);
					}
				}
				 
	request.setAttribute("table",mn);
	out.println("<br><center><h3> "+reportheader+" </h3></center> ");
  
		 
%>

<display:table   id="_table" name="table"   export="true" pagesize="25">
	 
	 				<display:setProperty name="basic.empty.showtable" value="true"/><%Vector temp= (Vector)_table;%>
					<display:column title="S.NO" sortable="true"><%=temp.elementAt(0)%></display:column>
					<display:column title="Branch" sortable="true"><%=temp.elementAt(1)%></display:column>
					<display:column title="TYPE" sortable="true"><%=temp.elementAt(2)%></display:column>
					<display:column title="GROUP" sortable="true"><%=temp.elementAt(3)%></display:column>
					<display:column title="CODE" sortable="true"><%=temp.elementAt(4)%></display:column>
					<display:column title="DESCRIPTION" sortable="true" ><%=temp.elementAt(5)%></display:column>
					<display:column title="IN" sortable="true"  style="text-align:right"><%=temp.elementAt(6)%></display:column>
					<display:column title="OUT" sortable="true"  style="text-align:right"><%=temp.elementAt(6)%></display:column>
					<display:setProperty name="export.excel.filename" value="PurchaseandSalesQuantity.xls"/>
					<display:setProperty name="export.pdf.filename" value="PurchaseandSalesQuantity.pdf"/>
					<display:setProperty name="export.csv.filename" value="PurchaseandSalesQuantity.csv"/>
					<display:setProperty name="export.pdf"  value="true" />
					
					
					 
					 
</display:table>     
<br />	<center>	<a href='javascript:window.close()'> CLOSE</a>
</center><br /><br />


 
<%		 		 
			}
			catch(Exception e)
			{
			}	
	  %>
	  
 </body>
</html>
