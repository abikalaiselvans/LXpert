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
 
<title> :: COMMON ::</title>




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
 
<body  onpaste='return false;'><br> 
<%
 

 	 String reportheader="STAFF ACCOUNT INFORMATIONS ";
	 String company = request.getParameter("company");
	 String branch = request.getParameter("branch");
	 String Office = request.getParameter("Office");
	 String dept = request.getParameter("dept");
	 String category = request.getParameter("category");
	 String resigned = request.getParameter("resigned");
	 
 	 String sql="";
 	  
	  
	
	 
	
	sql = " SELECT a.CHR_EMPID,a.CHR_STAFFNAME,a.CHR_STAFFFNAME, ";
	sql = sql + " b.CHR_COMPANYNAME,c.CHR_BRANCHNAME, d.CHR_OFFICENAME, e.CHR_DEPARTNAME, ";
	sql = sql + " f.CHR_DESIGNAME,g.CHR_CATEGORYNAME, a.CHR_GENDER,  DATE_FORMAT(a.DT_DOJCOLLEGE,'%d-%b-%Y'),  ";
	sql = sql + " a.CHR_EMAILID, a.CHR_PERMAILID,a.CHR_MOBILE,a.CHR_PPHONE,a.CHR_SPHONE,  ";
	sql = sql + " IF(a.CHR_TYPE ='T',CONCAT('RESIGNED',' / ', DATE_FORMAT(a.DAT_RESIGNDATE,'%d-%b-%Y')),'LIVE')  "; 
	sql = sql + " FROM  com_m_staff a,com_m_company b,com_m_branch c,com_m_office d, ";
	sql = sql + " com_m_depart e,com_m_desig f , com_m_employeecategory g   ";
	sql = sql + " WHERE a.INT_COMPANYID = b.INT_COMPANYID  "; 
	sql = sql + " AND a.INT_BRANCHID = c.INT_BRANCHID   ";
	sql = sql + " AND a.INT_OFFICEID = d.INT_OFFICEID   ";
	sql = sql + " AND a.INT_DEPARTID = e.INT_DEPARTID   ";
	sql = sql + " AND a.CHR_CATEGORY = g.INT_EMPLOYEECATEGORYID  ";
	sql = sql + " AND a.INT_DESIGID = f.INT_DESIGID  ";
	 
    if(!"0".equals(company))
	 	sql = sql +" AND a.INT_COMPANYID="+company;
	if(!"0".equals(branch))
	 	sql = sql +" AND a.INT_BRANCHID="+branch;
	if(!"0".equals(Office))
		sql = sql +" AND a.INT_OFFICEID="+Office;
	if(!"0".equals(dept))
	 	sql = sql +" AND a.INT_DEPARTID="+dept;
	if(!"0".equals(category))
		 	sql = sql +" AND a.a.CHR_GATEGORY ="+category;

	if(!"0".equals(resigned))
	 	if("N".equals(resigned))
		 	sql = sql +" AND  a.CHR_TYPE !='T'  ";
	sql = sql +" ORDER BY  a.CHR_STAFFNAME ";
	 //out.println(sql); 
 	 
     String data[][] = CommonFunctions.QueryExecute(sql);
     Vector mn = new Vector();
	 Vector child= null;
     for(int u=0; u<data.length;u++)
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
			child.addElement(data[u][8]);
			child.addElement(data[u][9]);
			child.addElement(data[u][10]);
			child.addElement(data[u][11]);
			child.addElement(data[u][12]);
			child.addElement(data[u][13]);
			child.addElement(data[u][14]);
			child.addElement(data[u][15]);
			child.addElement(data[u][16]);
			mn.add(child);
     } 
   
	 
	request.setAttribute("table",mn);
	 
  
  
 
%>



<display:table   id="_table" name="table"   export="true" pagesize="25">
	 
	 
	 
	 				<display:caption><%=reportheader.toUpperCase()%></display:caption>
					<display:setProperty name="basic.empty.showtable" value="true"/><%Vector temp= (Vector)_table;%>
					<display:column title="S.NO" sortable="true"><%=temp.elementAt(0)%></display:column>
					<display:column title="EMP ID" sortable="true"><%=temp.elementAt(1)%></display:column>
					<display:column title="EMP NAME" sortable="true"><%=temp.elementAt(2)%></display:column>
					<display:column title="FATHER NAME" sortable="true"><%=temp.elementAt(3)%></display:column>
					<display:column title="COMPANY " sortable="true"><%=temp.elementAt(4)%></display:column>
					<display:column title="BRANCH" sortable="true"><%=temp.elementAt(5)%></display:column>
					<display:column title="OFFICE" sortable="true"><%=temp.elementAt(6)%></display:column>
					<display:column title="DEPARTMENT" sortable="true"><%=temp.elementAt(7)%></display:column>
					<display:column title="DESIGNATION" sortable="true"><%=temp.elementAt(8)%></display:column>
					<display:column title="CATEGORY" sortable="true"><%=temp.elementAt(9)%></display:column>
					<display:column title="GENDER" sortable="true"><%=temp.elementAt(10)%></display:column>
					<display:column title="DOJ" sortable="true"><%=temp.elementAt(11)%></display:column>
					<display:column title="OFFICE MAILID" sortable="true"><%=temp.elementAt(12)%></display:column>
					<display:column title="PERSONAL MAILID" sortable="true"><%=temp.elementAt(13)%></display:column>
					<display:column title="MOBILE" sortable="true"><%=temp.elementAt(14)%></display:column>
					<display:column title="PHONE-1" sortable="true"><%=temp.elementAt(15)%></display:column>
					<display:column title="PHONE-2" sortable="true"><%=temp.elementAt(16)%></display:column>
					<display:column title="STATUS" sortable="true"><%=temp.elementAt(17)%></display:column>
					 
					<display:setProperty name="export.excel.filename" value="Rept_Mobileinformations.xls"/>
					<display:setProperty name="export.pdf.filename" value="Rept_Mobileinformations.pdf"/>
					<display:setProperty name="export.csv.filename" value="Rept_Mobileinformations.csv"/>
					<display:setProperty name="export.pdf"  value="true" />
					 
</display:table>     
<br />	<center>	<a href='Rept_Staff.jsp'> CLOSE</a></center>
 
	 		
			
			

 
</body>
<%
}
catch(Exception e)
{
}
%>
 