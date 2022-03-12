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
<meta name="keywords" content="HRM, Human Resource Management, HR Planning, Job Design, Job Analysing, Applicant, Company, Branch, Division,Model,Color,Office, Qualification, Attendance, Biometric, Finger Print, Forms, Leave, Holiday, Common Holiday, Shift Master, Shift Allocation. Proximity, Smart Card, Manual attendance, personal inforamtion , Basic, Allowance, Payroll, Salary Slab, Allowance, Recovery, Professional Tax, Employee attendance, Promotion, Trainning, Ressigner, Email, Jonners, PF, ESI, CTC, CTC, Take Home, Admin charge, Attendance, Payroll, Inventory, Product, Item, Customer, Vendor, vendor group, customer group, Purchase, sales, purchase paymeny, vendor payment, Sales return, purchase return, Quotation , Po, Purchase report, sales report, Tax, service tax, vat, c-form, taxes, user, employee id, payslip, consolidation, Attendance, stock, stock book , stock view, stock transfer, consumables, Serial number tracking, " />
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
 		java.text.SimpleDateFormat datetime = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = new java.util.Date();
		String updatedate = "" + datetime.format(date);
		String division=request.getParameter("division");
		String divisionname="&nbsp;";
		
		
		String reportheader="<b>STOCK ( "+ DateUtil.FormateDateSys(updatedate)+" ) </b>"; 
		String sql =" ";
		
		sql = " SELECT  ";
		sql = sql+ " FUN_GET_BRANCH_NAME(a.INT_BRANCHID),  ";
		sql = sql+ " if( a.CHR_TYPE ='I' ,'ITEM','PRODUCT' ),  ";
		sql = sql+ " if( a.CHR_TYPE ='I' ,  ";
		sql = sql+ " (SELECT a1.CHR_ITEMNAME FROM inv_m_item a1  WHERE  a1.CHR_ITEMID =a.CHR_ITEMID),  ";
		sql = sql+ " (SELECT a2.CHR_PRODUCTCODE FROM inv_m_produtlist a2  WHERE  a2.CHR_PRODUCTID =a.CHR_ITEMID)   ";
		sql = sql+ " ) productcode,  ";
		sql = sql+ " if( a.CHR_TYPE ='I' ,  ";
		sql = sql+ " (SELECT aa1.CHR_DES FROM inv_m_item aa1  WHERE  aa1.CHR_ITEMID =a.CHR_ITEMID),  ";
		sql = sql+ " (SELECT sa2.CHR_PRODUCTDESC FROM inv_m_produtlist sa2  WHERE  sa2.CHR_PRODUCTID =a.CHR_ITEMID)   ";
		sql = sql+ " ) productdescription ,  ";
		sql = sql+ " b.CHR_DIVICODE ,   ";
		sql = sql+ " COUNT(*) , SUM(a.DOU_UNITPRICE) , SUM(a.DOU_UNITPRICE) /COUNT(*)  ";
		sql = sql+ " FROM  inv_t_vendorgoodsreceived a , inv_m_division b   ";
		sql = sql+ " WHERE a.INT_DIVIID  = b.INT_DIVIID  ";
		sql = sql+ " AND a.CHR_FLAG !='Y' AND a.CHR_SERIALNO is not null AND a.CHR_GRTFLAG!='Y'    ";
		if(!"0".equals(division))
			sql = sql+ " AND a.INT_DIVIID  = "+ division;
			
		sql = sql+ " GROUP BY a.CHR_TYPE,a.CHR_ITEMID,a.INT_BRANCHID  ";
		sql = sql+ " ORDER BY FUN_GET_BRANCH_NAME(a.INT_BRANCHID),b.CHR_DIVICODE  ";
		//out.println(sql);
		String data[][] =  CommonFunctions.QueryExecute(sql);
		
		Vector mn = new Vector();
	 	Vector child= null;
				
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
				child.addElement(data[u][7]);
				mn.add(child); 
			}
		} 
		
		request.setAttribute("table",mn);
%>
<display:table   id="_table" name="table"   export="true" pagesize="25">
 
	 				<display:caption><%=reportheader.toUpperCase()%></display:caption>
	 				<display:setProperty name="basic.empty.showtable" value="true"/><%Vector temp= (Vector)_table;%>
					<display:column title="S.NO" sortable="true"><%=temp.elementAt(0)%></display:column>
                    <display:column title="Branch"   sortable="true"><%=temp.elementAt(1)%></display:column>
					<display:column title="Type"   sortable="true"><%=temp.elementAt(2)%></display:column>
                    <display:column title="Item / Product Code"   sortable="true"><%=temp.elementAt(3)%></display:column>
                    <display:column title="Description"   sortable="true"><%=temp.elementAt(4)%></display:column>
                    <display:column title="Division"   sortable="true"><%=temp.elementAt(5)%></display:column>
                    <display:column title="Quantity"   sortable="true"><%=temp.elementAt(6)%></display:column>
                    <display:column title="Average Unit Price "   sortable="true"><%=temp.elementAt(7)%></display:column>
                    <display:column title="Total Price "   sortable="true"><%=temp.elementAt(8)%></display:column>
                     
					<display:setProperty name="export.excel.filename" value="Rept_DivisionStock.xls"/>
					<display:setProperty name="export.pdf.filename" value="Rept_DivisionStock.pdf"/>
					<display:setProperty name="export.csv.filename" value="Rept_DivisionStock.csv"/>
					<display:setProperty name="export.pdf"  value="true" />
					 
					 
</display:table> 
    
<br />	<center>	<a href='javascript:window.close()'> CLOSE</a>
</center>
 <%
}
catch(Exception e)
{
}
%>		 
</body>
</html>
