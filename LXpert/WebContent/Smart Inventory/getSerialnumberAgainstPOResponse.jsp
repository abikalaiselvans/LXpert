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
<%
try
{
%>
 
<body ><br> 
<%
 

 	String reportheader="SERIAL NUMBER AGAINST P.O Ref   ";
	String serials = request.getParameter("serials");
	String serial[] = serials.split(",");
	serials ="";
	if(serial.length >0)
		 for(int u=0;u<serial.length;u++)
		 	serials = serials +"'"+serial[u].trim() +"' ,";
			
	String sql="";
	Vector mn = new Vector();
	Vector child= null;
	if(serial.length >0)
	{
		sql = "   SELECT  ";  
		sql = sql + " if( a.CHR_TYPE ='I' ,'ITEM','PRODUCT' ) ptype,    ";
		sql = sql + " FUN_INV_PRODUCTCODE(a.CHR_TYPE,a.CHR_ITEMID) pcode,   ";  
		sql = sql + " FUN_INV_PRODUCTDESCRIPTION(a.CHR_TYPE,a.CHR_ITEMID) pdescription,   ";
		sql = sql + " a.CHR_PURCHASEORDERNO,  a.CHR_SERIALNO, FUN_INV_DIVISION(a.INT_DIVIID),    ";
		sql = sql + " DATE_FORMAT(a.DAT_RECIVEDDATE,'%d-%b-%Y'),  ";
		sql = sql + " if(a.CHR_FLAG='Y' ,'sold' ,  if(a.CHR_FLAG ='N','Stock Available','Stock Transfer')  )  statuss ,  ";
		sql = sql + "  if(a.CHR_FLAG='Y',a.CHR_SALESNO ,'-') salno  ";
		sql = sql + " FROM inv_t_vendorgoodsreceived a , inv_t_directpurchase b    ";
		sql = sql + " WHERE  a.CHR_PURCHASEORDERNO = b.CHR_PURCHASEORDERNO AND a.CHR_SERIALNO is not NULL     ";
		sql = sql + " AND   a.CHR_PURCHASEORDERNO IN ( "+serials+" '0') ";
		sql = sql + "  ORDER BY a.CHR_PURCHASEORDERNO ";
		//out.println(sql);
        String data[][] =CommonFunctions.QueryExecute(sql);
		 
		if(data.length>0)
			for(int u=0;u<data.length;u++)
			{
				child = new Vector();
				child.addElement((u+1)+".");
				child.addElement(data[u][0]);
				child.addElement(data[u][1]);
				child.addElement(data[u][2]);
				child.addElement(data[u][3]);
				child.addElement(data[u][4]);
				child.addElement(data[u][5]);
				child.addElement(data[u][6]);
				child.addElement(data[u][7]);
				child.addElement(data[u][8]);
				mn.add(child); 
			}
	 }
	request.setAttribute("table",mn);
	out.println("<br><center><h3> "+reportheader+" </h3></center> ");
%>
<display:table   id="_table" name="table"   export="true" pagesize="25">
	<display:setProperty name="basic.empty.showtable" value="true"/><%Vector temp= (Vector)_table;%>
					
	<display:column title="S.NO" sortable="true"><%=temp.elementAt(0)%></display:column>
	<display:column title="TYPE " sortable="true"><%=temp.elementAt(1)%></display:column>
	<display:column title="PCODE " sortable="true"><%=temp.elementAt(2)%></display:column>
	<display:column title="DESCRIPTION " media="html" sortable="true"><%=temp.elementAt(3)%></display:column>
	<display:column title="P.O " sortable="true"><%=temp.elementAt(4)%></display:column>
	<display:column title="SERIAL " sortable="true"><%=temp.elementAt(5)%></display:column>
	<display:column title="DIVISION " sortable="true"><%=temp.elementAt(6)%></display:column>
	<display:column title="DATE  " sortable="true"><%=temp.elementAt(7)%></display:column>
	<display:column title=" STATUS" sortable="true"><%=temp.elementAt(8)%></display:column>
	<display:column title="SALES " sortable="true"><%=temp.elementAt(9)%></display:column>
	<display:setProperty name="export.excel.filename" value="getSerialnumberAgainstPO.xls"/>
	<display:setProperty name="export.pdf.filename" value="getSerialnumberAgainstPO.pdf"/>
	<display:setProperty name="export.csv.filename" value="getSerialnumberAgainstPO.csv"/>
	<display:setProperty name="export.pdf"  value="true" />
	
					
</display:table> 
			
<br />	<center>	<a href='getSerialnumberAgainstPO.jsp'> CLOSE</a></center>
			

 
</body>
<%
}
catch(Exception e)
{
}
%>
 
 