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
 

 	 String reportheader="STAFF QUALIFICATION LIST";
	 String company = request.getParameter("company");
	 String branch = request.getParameter("branch");
	 String Office = request.getParameter("Office");
	 String category = request.getParameter("category");
	 String resigned = ""+request.getParameter("resigned");
	 String hold = ""+request.getParameter("hold");
	 String dept = request.getParameter("dept");
	 String qualificationid = request.getParameter("qualification");
	 String sql="";
	 String ids="";
	 
sql = " SELECT A.CHR_EMPID,A.CHR_STAFFNAME,B.CHR_DEPARTNAME,C.CHR_DESIGNAME,D.CHR_OFFICENAME,F.CHR_CATEGORYNAME,A.CHR_GENDER, DATE_FORMAT(A.DT_DOJCOLLEGE,'%d-%b-%Y') ,    "; 
sql = sql +" E.CHR_QUALIFICATIONNAME,A.CHR_MOBILE ,if(A.CHR_TYPE ='T','Resigned','Live') , "; 
sql = sql +" FLOOR(PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM NOW()),EXTRACT(YEAR_MONTH FROM a.DT_DOJCOLLEGE))/ 12)  ";  
sql = sql +" FROM  com_m_staff  A,  com_m_depart   B, com_m_desig  C , com_m_office D,com_m_qualification E , com_m_employeecategory F  "; 
sql = sql +" WHERE   A.INT_DEPARTID=B.INT_DEPARTID    "; 
sql = sql +" AND A.INT_DESIGID=C.INT_DESIGID    "; 
sql = sql +" AND A.CHR_CATEGORY=F.INT_EMPLOYEECATEGORYID    "; 
sql = sql +" AND A.INT_OFFICEID= D.INT_OFFICEID   "; 
sql = sql +" AND A.CHR_QUALIFICATION = E.INT_QUALIFICATIONID   "; 
if(!"0".equals(qualificationid)) 
{
	String qualification[] = request.getParameterValues("qualification");
	 if(qualification.length>0)
	 	for(int i=0;i<qualification.length;i++)
			ids = ids+qualification[i]+",";
 	sql = sql +" AND E.INT_QUALIFICATIONID  IN( "+ids+"0) ";
}	

if(!"Y".equals(resigned))
	sql = sql +" AND A.CHR_TYPE !='T' " ; 
if(!"Y".equals(hold))
	sql = sql +" AND A.CHR_HOLD !='Y' " ; 
	
	
if(!"0".equals(company))
	sql = sql +" AND A.INT_COMPANYID="+company;
 if(!"0".equals(branch))
	sql = sql +" AND A.INT_BRANCHID="+branch;
 if(!"0".equals(Office))
	sql = sql +" AND A.INT_OFFICEID="+Office;
	
 if(!"0".equals(category))
	sql = sql +" AND A.CHR_CATEGORY="+category;
 if(!"0".equals(dept))
	sql = sql +" AND  A.INT_DEPARTID="+dept;
  
 sql = sql +" ORDER BY A.CHR_STAFFNAME ";
 	 
 	 
   String data[][] =com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
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
			mn.add(child);
     } 
  
	 
	request.setAttribute("table",mn); 
   
 
%>


<center>
<display:table   id="_table" name="table"   export="true" pagesize="25">
	 
	 				<display:caption><%=reportheader.toUpperCase()%></display:caption>
					<display:setProperty name="basic.empty.showtable" value="true"/><%Vector temp= (Vector)_table;%>
					<display:column title="S.NO" sortable="true"><%=temp.elementAt(0)%></display:column>
					<display:column title="EMPID" sortable="true"><%=temp.elementAt(1)%></display:column>
					<display:column title="NAME" sortable="true"><%=temp.elementAt(2)%></display:column>
					<display:column title="DEPART" sortable="true"><%=temp.elementAt(3)%></display:column>
					<display:column title="DESIGNATION" sortable="true"><%=temp.elementAt(4)%></display:column>
					<display:column title="OFFICE" sortable="true"><%=temp.elementAt(5)%></display:column>
					<display:column title="CATEGORY" sortable="true"><%=temp.elementAt(6)%></display:column> 
					<display:column title="GENDER" sortable="true"><%=temp.elementAt(7)%></display:column>
					<display:column title="DOJ" sortable="true"><%=temp.elementAt(8)%></display:column>
					 <display:column title="QUALIFICATION" sortable="true"><%=temp.elementAt(9)%></display:column>
					<display:column title="MOBILE" sortable="true"><%=temp.elementAt(10)%></display:column>
					<display:column title="STATUS" sortable="true"><%=temp.elementAt(11)%></display:column>
                    <display:column title="EXperience" sortable="true"><%=temp.elementAt(12)%></display:column>
					<display:setProperty name="export.excel.filename" value="Rept_Qualification.xls"/>
					<display:setProperty name="export.pdf.filename" value="Rept_Qualification.pdf"/>
					<display:setProperty name="export.csv.filename" value="Rept_Qualification.csv"/>
					<display:setProperty name="export.pdf"  value="true" />
					 
</display:table> 
			
<br />	<center>	<a href='Rept_Qualificationwise.jsp'> CLOSE</a></center>
</center>			

 
</body>
<%
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
%>
</html>
