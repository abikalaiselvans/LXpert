<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%@ include file="index.jsp"%>
<jsp:useBean id="conbean" class="DBConnection.DBCon" />
<%!

	Connection con ;
	Statement st,strec;
	ResultSet rs,allrs,recrs;
	String sql,allid,sqlrec;
	String driver;
	String url,month,allsql;
	int i,year;	
%>
<%
	month=request.getParameter("month");
	//System.out.println(month);
	year=Integer.parseInt(request.getParameter("year"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title> :: PAYROLL ::</title>


 
 
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

<style type="text/css">
<!--
.style8 {
	font-family: Verdana;
	font-size: 12px;
}
.style51 {font-family: Verdana; font-size: 12px; color: #FFFFFF; }
.style52 {font-size: 10px}
.style53 {font-family: Verdana; font-size: 10px; color: #FFFFFF; }
.style54 {font-family: Verdana}
a:visited {
	color: #663366;
}
a:hover {
	color: #FF0000;
}
a:active {
	color: #0000FF;
}
-->
</style>
</head>

<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1000">
	<!--DWLayoutTable-->
	<tr>
		<td width="56" height="92">&nbsp;</td>
		<td width="11">&nbsp;</td>
		<td width="801" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
		<td width="49">&nbsp;</td>
		<td width="49">&nbsp;</td>
	</tr>
	<tr>
		<td height="76">&nbsp;</td>
		<td colspan="3" valign="top">
		<table width="867" border="1" cellpadding="0" cellspacing="1"
			 >
			<!--DWLayoutTable-->
			<tr>
				<td height="24" colspan="12" align="center" valign="middle"
					  class="tablehead">
				<CENTER>Allowance Details - Month Wise</CENTER>
				</td>
			</tr>
			<tr>
				<td colspan="100%">
				<table width="100%"  >
					<tr>
						<td align="center" valign="middle" 
							class="tablehead">Month</td>
						<td align="center" valign="middle" 
							class="tablehead"><%=month%></td>
						<td align="center" valign="middle" 
							class="tablehead">Year</td>
						<td colspan="2" align="center" valign="middle" 
							class="tablehead"><%=year%></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td width="69" height="24" align="center" valign="middle"
					bgcolor="6E8FBC" class="tablehead">Emp Id</td>
				<td width="103" align="center" valign="middle" bgcolor="6E8FBC"
					class="tablehead">Name</td>
				<td width="111" align="center" valign="middle" bgcolor="6E8FBC"
					class="tablehead">Department</td>
				<td width="107" align="center" valign="middle" bgcolor="6E8FBC"
					class="tablehead">Designation</td>
				<%   
     try
        {
	   	con =conbean.getConnection();
	   	st=con.createStatement();
		allsql="SELECT * FROM PAY_M_ALLOWANCE";
		allrs = st.executeQuery(allsql);
	    while(allrs.next())
		{
           out.print("<td width='50' align='center' valign='middle' bgcolor='6E8FBC' class='tablehead'>"+allrs.getString("CHR_ANAME")+"</td>");
         }
	    allrs.close();
        out.println("</tr>");

		sql="SELECT A.CHR_EMPID,A.CHR_STAFFNAME,C.CHR_DEPARTNAME,D.CHR_DESIGNAME,B.CHR_MONTH,B.A001,B.A002,B.A003,B.A003,B.A004,B.A005,B.A006,B.A007 ";
		sql=sql+" FROM  com_m_staff  A,PAY_T_SALARYALLOWANCE B,  com_m_depart   C, com_m_desig  D WHERE A.CHR_EMPID=B.CHR_EMPID";
		sql=sql+" AND A.INT_DESIGID=D.INT_DESIGID AND A.INT_DEPARTID=C.INT_DEPARTID AND B.CHR_MONTH='"+month+"'AND B.INT_YEAR="+year;
		rs = st.executeQuery(sql);
	  while(rs.next())
		{
%>
			
			<tr>
				<td height="19" align="center" valign="middle">
				<% out.println(rs.getString("CHR_EMPID")); %>
				</td>
				<td align="center" valign="middle"><span
					class="style54 style52"> <% out.println(rs.getString("CHR_STAFFNAME")); %>
				</span></td>
				<td align="center" valign="middle"><span
					class="style54 style52"> <% out.println(rs.getString("CHR_DESIGNAME")); %>
				</span></td>
				<td align="center" valign="middle"><span
					class="style54 style52"> <% out.println(rs.getString("CHR_DEPARTNAME")); %>
				</span></td>

				<%
        try
        {
             strec=con.createStatement();
		     sqlrec="SELECT * FROM PAY_M_ALLOWANCE";
		     recrs = strec.executeQuery(sqlrec);
	         while(recrs.next())
		     {
	        	
	        	out.println("<td align='center' valign='middle'>"); 
	        	allid=recrs.getString("CHR_ACODE");
	        	out.println(rs.getString(allid));
	            out.println("</span></td>");
            }
          }
          catch(Exception e)
          {
             //System.out.println(e);
          }
		}
	    st.close();
		rs.close();
		 
		}
        catch(Exception e)
        {
        	//System.out.println(e);
        }
	%>
			
		</table>
		</td>
		<td>&nbsp;</td>
	</tr>
</table>
<br>
<br>
<br>
<br>
<br>
</td>
<%@ include file="../footer.jsp"%>
</body>
</html>