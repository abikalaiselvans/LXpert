       <%@ page import="java.sql.*,java.io.*,java.util.*,com.my.org.erp.ServiceLogin.*"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ page import="java.util.*"%>
 <head>
<link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
<link rel="shortcut icon" href="../images/ERP.ico"></link>

<meta name="resource-type" content="document" />
<meta http-equiv="content-type" content="text/html; charset=US-ASCII" />
<meta http-equiv="content-language" content="en-us" />
<meta name="author" content="KALAISELVAN K" />
<meta name="contact" content="abikalaiselvan@yahoo.co.in" />
<meta name="copyright" content="Copyright (c)2006-2011 KALAISELVAN K. All Rights Reserved." />
<meta name="description" content="Office Automation ERP Products." />
<meta name="keywords" content="HRM, Human Resource Management, HR Planning, Job Design, Job Analysing, Applicant, Company, Branch, Division,Model,Color,Office, Qualification, Attendance, Biometric, Finger Print, Forms, Leave, Holiday, Common Holiday, Shift Master, Shift Allocation. Proximity, Smart Card, Manual attendance, personal inforamtion , Basic, Allowance, Payroll, Salary Slab, Allowance, Recovery, Professional Tax, Employee attendance, Promotion, Trainning, Ressigner, Email, Jonners, PF, ESI, CTC, CTC, Take Home, Admin charge, Attendance, Payroll, Inventory, Product, Item, Customer, Vendor, vendor group, customer group, Purchase, sales, purchase paymeny, vendor payment, Sales return,purchase return, Quotation , Po, Purchase report, sales report, Tax, service tax, vat, c-form, taxes, user, employee id, payslip, consolidation, Attendance, stock, stock book , stock view, stock transfer, consumables, Serial number tracking, " />
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<title>:: INVENTORY ::</title>

<style type="text/css" media="all">
      @import url("../JavaScript/css/maven-base.css");
      @import url("../JavaScript/css/maven-theme.css");
      @import url("../JavaScript/css/site.css");
      @import url("../JavaScript/css/screen.css");
  </style> 
  
   
</head>
<body >

<%
try
{
 		String reportheader="EXPORT PURCHASE PAYMENTS TO TALLY "; 
		String sql ="";
		String Branch=request.getParameter("Branch");
		String division = ""+request.getParameter("division");
		String type=request.getParameter("type");
		String fromdate = ""+request.getParameter("fromdate");
		String todate = request.getParameter("todate");
		String invoicetype = request.getParameter("invoicetype");
		Vector mn = new Vector();
	 	Vector child= null;
		if(("1".equals(type)) || ("0".equals(type) ))
		{
			sql = "  SELECT b.INT_PAYMENTID TRXN,  a.CHR_PURCHASEORDERNO VENDORREFNUMBER, a.CHR_VENDORPO VENDORPO ,CONCAT('CR-',a1.INT_VENDORID) LEDGERCODE,  ";
			sql = sql + " a1.CHR_VENDORNAME 1STLEDGERNAMEPARTYLEDG,    ";
			sql = sql + " a1.CHR_GSTNO VENDORGSTINNO  ,  c.CHR_DEPOSITNAME PAYMENTMODE, b.CHR_DDNUMBER PAYMENTREFNUMBER,  ";
			sql = sql + " DATE_FORMAT(b.DAT_DDDATE,'%d-%b-%Y')  CHEQUE_DD_DATE,  DATE_FORMAT(b.DAT_PAYMENTDATE ,'%d-%b-%Y') ISSUE_ENTRYDATE , ";
			sql = sql + " b.CHR_PAYMENTDESC NARRATION, a.DOU_TOTALAMOUNT PO_NETAMOUNT, ";
			sql = sql + " UPPER(c.CHR_DEPOSITNAME) 2NDLEDGERNAME, ";
			sql = sql + " IF( b.INT_TRANSACTIONTYPE =1,'+','-') TTYPE, ";
			sql = sql + " b.DOU_PAIDAMOUNT PAIDAMOUNT,  DATE_FORMAT(b.DT_UPDATEDATE ,'%d-%b-%Y') SYSTEM_ENTRYDATE, IF( b.INT_TRANSACTIONTYPE =1,'PY','JV')TRAN_TYPE ,";
			sql = sql + " IF(a.CHR_CANCEL='Y', 'CANCELED', 'LIVE') CANCELINVOICE ";
			sql = sql + " FROM inv_t_directpurchase a, inv_m_vendorsinformation a1, inv_t_vendorpurchasepayment b, com_m_deposit_to c  ";
			sql = sql + " WHERE   a.CHR_FLAG='Y' AND a.CHR_PURCHASEORDERNO =b.CHR_PURCHASEORDERNO  AND a.INT_VENDORID = a1.INT_VENDORID  ";
			sql = sql + " AND b.INT_BANKID =  c.INT_DEPOSITID ";
			
			if(!"0".equals(Branch))
				sql = sql + " AND a.INT_BRANCHID = "+Branch;
			if(!"0".equals(division))
				sql = sql + " AND a.INT_DIVIID = "+division;
			if(!"0".equals(invoicetype))
				sql = sql + " AND a.CHR_CANCEL = '"+invoicetype+"' ";
				
			sql = sql + " AND b.DAT_DDDATE >= '" +DateUtil.FormateDateSQL(fromdate)+"' ";
			sql = sql + " AND b.DAT_DDDATE <= '" +DateUtil.FormateDateSQL(todate)+"' "; 
			sql = sql + " ORDER BY b.INT_PAYMENTID, b.DAT_DDDATE ";
			out.println(sql);
			
				 
				String data[][] = CommonFunctions.QueryExecute(sql);
				if(data.length>0)
				{
					 
					for(int u=0;u<data.length;u++)
					{
						 
						child = new Vector();
						child.addElement(data[u][0]);
						child.addElement(data[u][1]);
						child.addElement(data[u][2]);
						child.addElement(data[u][3]);
						child.addElement(data[u][4]);
						child.addElement(data[u][5]);
						child.addElement(data[u][6]);
						child.addElement(data[u][7]);
						child.addElement(data[u][8]);
						child.addElement(data[u][9]);
						child.addElement(data[u][10]);
						child.addElement(data[u][11]);
						child.addElement(data[u][12]);
						child.addElement(data[u][13]);
						child.addElement(data[u][14]);
						child.addElement(data[u][15]);
						child.addElement(data[u][16]);  
						child.addElement(data[u][17]);  
						mn.add(child); 
					}
				}
				 
		}
		 
		request.setAttribute("table",mn);
		System.out.println(mn);
%>

<display:table   id="_table" name="table"   export="true" pagesize="25">
 
	 				<display:caption><%=reportheader.toUpperCase()%></display:caption>
	 				<display:setProperty name="basic.empty.showtable" value="true"/><%Vector temp= (Vector)_table;%>
					<display:column title="TRXN"   sortable="true"><%=temp.elementAt(0)%></display:column>
					<display:column title="VENDORREFNUMBER"   sortable="true"><%=temp.elementAt(1)%></display:column>
					<display:column title="VENDORPO" sortable="true"><%=temp.elementAt(2)%></display:column>
					<display:column title="LEDGERCODE"   sortable="true"><%=temp.elementAt(3)%></display:column>
					<display:column title="1STLEDGERNAMEPARTYLEDG"   sortable="true"><%=temp.elementAt(4)%></display:column>
					<display:column title="VENDORGSTINNO"   sortable="true"><%=temp.elementAt(5)%></display:column>
					<display:column title="PAYMENTMODE"   sortable="true"><%=temp.elementAt(6)%></display:column>
					<display:column title="PAYMENTREFNUMBER"   sortable="true"><%=temp.elementAt(7)%></display:column>
					<display:column title="CHEQUE_DD_DATE"   sortable="true"><%=temp.elementAt(8)%></display:column>
					<display:column title="ISSUE_ENTRYDATE"  sortable="true"><%=temp.elementAt(9)%></display:column>
					
					<display:column title="NARRATION"   sortable="true"><%=temp.elementAt(10)%></display:column>
					<display:column title="PO_NETAMOUNT" style="text-align:right"   sortable="true"><%=temp.elementAt(11)%></display:column>
					<display:column title="2NDLEDGERNAME"   sortable="true"><%=temp.elementAt(12)%></display:column>
					<display:column title="TTYPE"   sortable="true"><%=temp.elementAt(13)%></display:column>
					<display:column title="PAIDAMOUNT"  style="text-align:right"  sortable="true"><%=temp.elementAt(14)%></display:column>
					<display:column title="SYSTEM_ENTRYDATE"  style="text-align:right" sortable="true"><%=""%></display:column>
					<display:column title="TRAN_TYPE"   sortable="true"><%=temp.elementAt(16)%></display:column>  
					<display:column title="STATUS"   sortable="true"><%=temp.elementAt(17)%></display:column>  	
		 	
					<display:setProperty name="export.excel.filename" value="Purchase_Payments_Template.xls"/>
					<display:setProperty name="export.pdf.filename" value="Purchase_Payments_Template.pdf"/>
					<display:setProperty name="export.csv.filename" value="Purchase_Payments_Template.csv"/>
					<display:setProperty name="export.pdf"  value="true" />
					 
					 
</display:table> 
    
<br />	<center>	<a href='Rept_PurchasePayments_ExportTally.jsp'> CLOSE</a>
</center>
 <%
}
catch(Exception e)
{
	out.println(e.getMessage());
	System.out.println(e.getMessage());
}
%>		 
</body>
</html>

