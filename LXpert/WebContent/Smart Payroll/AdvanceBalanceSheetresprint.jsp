<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage=""%>
<html>
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


<title> :: PAYROLL ::</title>


 
<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
</head>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<body  onpaste="return false;" onLoad="javascript:window.print()">


<%
String staffid = "" + request.getParameter("ename");
String ksql="SELECT a.CHR_STAFFNAME,b.CHR_COMPANYNAME FROM com_m_staff a,com_m_company b  WHERE a.INT_COMPANYID= b.INT_COMPANYID ";
ksql = ksql +" AND a.CHR_EMPID='"+staffid+"'";
String pdata[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(ksql);
String sql="";
double sum=0.0;
double sum1=0.0;
double sum2=0.0;
%>
 <br>
<br>
<table width="80%" align="center"    cellpadding=2 cellspacing=1 bgcolor='#9900CC' >
	<tr>
	  <td colspan="2" bgcolor="#FFFFFF"><div align="center">
	    <h1><%=pdata[0][1].toUpperCase()%></h1>
	  </div></td>
  </tr>
	<tr>
		<td colspan="2" bgcolor="#FFFFFF">
		<div align="center" class="boldThirteen">Advance Informations ::
	  <%=staffid%> / <%=pdata[0][0].toUpperCase()%></div>		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td width="48%" class="boldThirteen">
	  <div align="center">Advance</div>		</td>
		<td width="52%" class="boldThirteen">
	  <div align="center">Deduction</div>		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td class="boldEleven">
		<div align="center" id="divscroll"
			style="OVERFLOW: auto;width:400x;height:200px">
		<%
			sql=" SELECT  INT_ADVAMT,CHR_MONTH,INT_YEAR  FROM pay_m_advance WHERE CHR_EMPID='"+staffid+"'";
			String datas[][] = com.my.org.erp.common.CommonFunction.RecordSetArray(sql);
			if(datas.length>0)
			{
				out.println("<table cellpadding=3 cellspacing=2 border=0>");
				out.println("<tr><td><b>S.No<td><b>Month<td><b>Year<td><b>Amount");
				for(int u=0;u<datas.length;u++)
				{
					if(u%2==0)
						out.println("<tr class='MRow1'>");
					else
						out.println("<tr class='MRow2'>");
					out.println("<td>"+(u+1)+"<td>"+datas[u][1]+"<td>"+datas[u][2]+"<td align=right>"+datas[u][0]);	
					sum1=sum1+Double.parseDouble(datas[u][0]);
				}
				out.println("</table>");
			}	
		%>
	  </div>		</td>
		<td class="boldEleven">
		<div align="center" id="divscrol2"
			style="OVERFLOW: auto;width:400x;height:200px">
		  <!--<div align="center" id="divscrol2"
			style="OVERFLOW: auto;width:400x;height:200px">-->
          <%
			sql=" SELECT  INT_DUEAMT,CHR_MONTH,INT_YEAR,INT_ID,CHR_TYPE  FROM pay_t_advance WHERE CHR_EMPID='"+staffid+"'";
			String Rdatas[][] = com.my.org.erp.common.CommonFunction.RecordSetArray(sql);
			String f="";
			if(Rdatas.length>0)
			{
				out.println("<table cellpadding=3 cellspacing=2 border=0>");
				out.println("<tr><td class='boldEleven'><b>S.No<td class='boldEleven'><b>Month<td class='boldEleven'><b>Year<td class='boldEleven'><b>Type<td class='boldEleven'><b>Amount");
				for(int u=0;u<Rdatas.length;u++)
				{
					f="";
					if(u%2==0)
						out.println("<tr class='MRow1'>");
					else
						out.println("<tr class='MRow2'>");
					
					if((u+1) == Rdatas.length)
					{
						if("Y".equals(Rdatas[u][4]))
							f ="Salary Deduction";
						else
							f = "Cash Return"	;
						out.println("<td class='boldEleven'>"+(u+1)+"<td class='boldEleven'>"+Rdatas[u][1]+"<td class='boldEleven'>"+Rdatas[u][2]+"<td class='boldEleven'>"+f+"<td class='boldEleven' align=right><a href='#'>"+Rdatas[u][0]+"</a>");	
					}
					else
					{
						if("Y".equals(Rdatas[u][4]))
							f ="Salary Deduction";
						else
							f = "Cash Return"	;
						out.println("<td class='boldEleven'>"+(u+1)+"<td class='boldEleven'>"+Rdatas[u][1]+"<td class='boldEleven'>"+Rdatas[u][2]+"<td class='boldEleven'>"+f+"<td align=right class='boldEleven'>"+Rdatas[u][0]);		
					}	
					sum2=sum2+Double.parseDouble(Rdatas[u][0]);
				}
				out.println("</table>");
			}	
		%>
          <!--</div>	-->
</div>		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td class="boldEleven">
	  <div align="right"><%=sum1%></div>		</td>
		<td class="boldEleven">
	  <div align="right"><%=sum2%></div>		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td class="boldEleven">&nbsp;</td>
		<td class="boldEleven">&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td class="boldEleven"><div align="right">Balance</div></td>
		<td class="boldEleven">
	  <div align="right"><%=(sum1-sum2)%></div>		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td colspan="2" class="boldEleven">&nbsp;<!--<a href='javascript:window.print()'>Print</a>--></td>
	</tr>
</table>
 
</body>
</html>
