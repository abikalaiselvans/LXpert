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
				String division=request.getParameter("division");
				String fdt = DateUtil.FormateDateSQL(fromdate);
				String tdt = DateUtil.FormateDateSQL(todate);
				String sql="";
						
sql = "  ";
 

sql = sql +" SELECT c.CHR_DIVICODE, ";
sql = sql +" if(b.CHR_TYPE ='I','Item','Product') type, ";
sql = sql +" if( b.CHR_TYPE ='I' , ";
sql = sql +"     (SELECT a1.CHR_ITEMNAME FROM inv_m_item a1  WHERE  a1.CHR_ITEMID =b.CHR_ITEMID), ";
sql = sql +"     (SELECT a2.CHR_PRODUCTCODE FROM inv_m_produtlist a2  WHERE  a2.CHR_PRODUCTID =b.CHR_ITEMID)  ";
sql = sql +"  ) productcode, ";
 
sql = sql +"   if( b.CHR_TYPE ='I' , ";
sql = sql +"     (SELECT aa1.CHR_DES FROM inv_m_item aa1  WHERE  aa1.CHR_ITEMID =b.CHR_ITEMID), ";
sql = sql +"     (SELECT sa2.CHR_PRODUCTDESC FROM inv_m_produtlist sa2  WHERE  sa2.CHR_PRODUCTID =b.CHR_ITEMID)  ";
sql = sql +"  ) productdescription,  ";

sql = sql +" SUM(b.INT_QUANTITY), ";
sql = sql +" SUM(b.DOU_UNITPRICE)  ";
sql = sql +" FROM inv_t_directpurchase a ,inv_t_directpurchaseitem b, inv_m_division c ";
sql = sql +" WHERE a.CHR_PURCHASEORDERNO =b.CHR_PURCHASEORDERNO ";
sql = sql +" AND a.CHR_FLAG ='Y' AND a.CHR_CANCEL='N' ";
sql = sql +" AND a.INT_DIVIID =c.INT_DIVIID ";
 
if(!"0".equals(Branch))
	sql = sql+" AND a.INT_BRANCHID ="+Branch;
if(!"0".equals(division))
	sql = sql +" AND d.INT_DIVIID="+division+" ";
sql = sql +" AND a.DAT_ORDERDATE<='"+tdt+"' ";
sql = sql +" AND a.DAT_ORDERDATE>='"+fdt+"'  ";	
	
sql = sql +"GROUP BY a.INT_DIVIID,b.CHR_ITEMID,b.CHR_TYPE   ";
sql = sql +"ORDER BY  a.INT_DIVIID,b.CHR_TYPE,b.CHR_ITEMID   ";
 
						 		
				 
				String reportheader="DIRECT PURCHASE QUANTITY  [ FROM -"+fromdate +"  TO-  "+ todate +" ] "; 
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
						mn.add(child);
					}
				}
				 
	request.setAttribute("table",mn);
	out.println("<br><center><h3> "+reportheader+" </h3></center> ");
  
		 
%>

<display:table   id="_table" name="table"   export="true" pagesize="25">
	 
	 				<display:setProperty name="basic.empty.showtable" value="true"/><%Vector temp= (Vector)_table;%>
					<display:column title="S.NO" sortable="true"><%=temp.elementAt(0)%></display:column>
					<display:column title="DIVISION" sortable="true"><%=temp.elementAt(1)%></display:column>
					<display:column title="TYPE" sortable="true"><%=temp.elementAt(2)%></display:column>
					<display:column title="CODE" sortable="true"><%=temp.elementAt(3)%></display:column>
					<display:column title="DESCRIPTION" sortable="true" ><%=temp.elementAt(4)%></display:column>
					<display:column title="QUANTITY" sortable="true"  style="text-align:right"><%=temp.elementAt(5)%></display:column>
					<display:column title="PRICE" sortable="true"  style="text-align:right"><%=temp.elementAt(6)%></display:column>
					<display:setProperty name="export.excel.filename" value="PurchaseQuantity.xls"/>
					<display:setProperty name="export.pdf.filename" value="PurchaseQuantity.pdf"/>
					<display:setProperty name="export.csv.filename" value="PurchaseQuantity.csv"/>
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
