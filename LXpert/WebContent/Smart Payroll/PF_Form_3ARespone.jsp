<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.my.org.erp.common.CommonFunctions"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<body  onpaste="return false;" topmargin="0" leftmargin="0">
 
    <%
		int byear=0,cyear=0;
		String form2A="0.00",form3A="0.00",form4A="0.00",form4bA="0.00";
		String form2M="0.00",form3M="0.00",form4M="0.00",form4bM="0.00";
		String form2J="0.00",form3J="0.00",form4J="0.00",form4bJ="0.00";
		String form2L="0.00",form3L="0.00",form4L="0.00",form4bL="0.00";
		String form2U="0.00",form3U="0.00",form4U="0.00",form4bU="0.00";
		String form2S="0.00",form3S="0.00",form4S="0.00",form4bS="0.00";
		String form2O="0.00",form3O="0.00",form4O="0.00",form4bO="0.00";
		String form2N="0.00",form3N="0.00",form4N="0.00",form4bN="0.00";
		String form2D="0.00",form3D="0.00",form4D="0.00",form4bD="0.00";
		String form21="0.00",form31="0.00",form41="0.00",form4b1="0.00";
		String form2F="0.00",form3F="0.00",form4F="0.00",form4bF="0.00";
		String form2R="0.00",form3R="0.00",form4R="0.00",form4bR="0.00";
		String cyend="",byend="",staffid="";
		 
		double form2t=0.00,form3t=0.00,form4t=0.00,form4bt=0.00;
	 
		String year=request.getParameter("Year");
		int yr=Integer.parseInt(year);
		String staff[]=request.getParameterValues("ename");
		
		String empid="";
		for(int k=0;k<staff.length;k++)
		empid=empid+",'"+staff[k]+"'";
		
		staffid=empid.substring(1);
		String cpy  ="";
		String bid  ="";
		String off="";
		String yer="";
		
		byear=(Integer.parseInt(year));
		cyear=Integer.parseInt(year+1);
		cyend=year.substring(2,4);
		byend=((""+byear).trim()).substring(2,4);
			String sql="";
	sql=" SELECT b.CHR_EMPID, b.CHR_PFNO,a.CHR_EMPNAME ";
	sql = sql+"	FROM  com_m_staff b,pay_t_salary a ";                               
	sql = sql+"	WHERE b.CHR_TYPE!='T' AND b.CHR_HOLD!='Y'";
	
	 
	 
	sql = sql+" AND a.CHR_EMPID=b.CHR_EMPID and a.CHR_EMPID in("+staffid+") group BY a.CHR_EMPID";
	 
	String data[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
	
	
	
	sql = " SELECT a.CHR_COMPANYNAME,a.CHR_STREET,f.CHR_CITYNAME,a.INT_PINCODE,a.CHR_PFNUMBER, ";
	sql = sql + " c.CHR_COUNTRYNAME,d.CHR_STATENAME,e.CHR_DISTRICT,f.CHR_CITYNAME  ";
	sql = sql + " FROM com_m_company a, com_m_country c, com_m_state d, com_m_district e, com_m_city f ";
	sql = sql + " WHERE a.INT_COUNTRYID= c.INT_COUNTRYID ";
	sql = sql + " AND a.INT_STATEID = d.INT_STATEID ";
	sql = sql + " AND a.INT_DISTRICTID = e.INT_DISTRICTID ";
	sql = sql + " AND a.INT_CITYID = f.INT_CITYID ";
	sql = sql + " AND a.INT_COMPANYID= 1";
	String datac[][]=CommonFunctions.QueryExecute(sql);
	
	
    String sstaffid="";
	for(int i=0;i<data.length;i++)
	{
	
		form2A="0.00";form3A="0.00";form4A="0.00";form4bA="0.00";
		form2M="0.00";form3M="0.00";form4M="0.00";form4bM="0.00";
		form2J="0.00";form3J="0.00";form4J="0.00";form4bJ="0.00";
		form2L="0.00";form3L="0.00";form4L="0.00";form4bL="0.00";
		form2U="0.00";form3U="0.00";form4U="0.00";form4bU="0.00";
		form2S="0.00";form3S="0.00";form4S="0.00";form4bS="0.00";
		form2O="0.00";form3O="0.00";form4O="0.00";form4bO="0.00";
		form2N="0.00";form3N="0.00";form4N="0.00";form4bN="0.00";
		form2D="0.00";form3D="0.00";form4D="0.00";form4bD="0.00";
		form21="0.00";form31="0.00";form41="0.00";form4b1="0.00";
		form2F="0.00";form3F="0.00";form4F="0.00";form4bF="0.00";
		form2R="0.00";form3R="0.00";form4R="0.00";form4bR="0.00";
		sstaffid=data[i][0];
	
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='March' AND a.INT_YEAR="+byear+" group by a.CHR_EMPID";
		String data1[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data1.length>0)
		{
		   form2A=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data1[0][1]));form3A=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data1[0][2]));form4A=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data1[0][3]));form4bA=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data1[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='April' AND a.INT_YEAR="+byear+" group by a.CHR_EMPID";
		String data2[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data2.length>0)
		{
		   form2M=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data2[0][1]));form3M=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data2[0][2]));form4M=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data2[0][3]));form4bM=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data2[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='May' AND a.INT_YEAR="+byear+" group by a.CHR_EMPID";
		String data3[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data3.length>0)
		{
		   form2J=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data3[0][1]));form3J=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data3[0][2]));form4J=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data3[0][3]));form4bJ=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data3[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='June' AND a.INT_YEAR="+byear+" group by a.CHR_EMPID";
		String data4[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data4.length>0)
		{
		   form2L=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data4[0][1]));form3L=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data4[0][2]));form4L=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data4[0][3]));form4bL=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data4[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='July' AND a.INT_YEAR="+byear+" group by a.CHR_EMPID";
		String data5[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data5.length>0)
		{
		   form2U=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data5[0][1]));form3U=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data5[0][2]));form4U=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data5[0][3]));form4bU=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data5[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='August' AND a.INT_YEAR="+byear+" group by a.CHR_EMPID";
		String data6[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data6.length>0)
		{
		   form2S=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data6[0][1]));form3S=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data6[0][2]));form4S=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data6[0][3]));form4bS=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data6[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='September' AND a.INT_YEAR="+byear+" group by a.CHR_EMPID";
		String data7[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data7.length>0)
		{
		   form2O=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data7[0][1]));form3O=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data7[0][2]));form4O=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data7[0][3]));form4bO=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data7[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='October' AND a.INT_YEAR="+byear+" group by a.CHR_EMPID";
		String data8[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data8.length>0)
		{
		   form2N=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data8[0][1]));form3N=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data8[0][2]));form4N=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data8[0][3]));form4bN=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data8[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='November' AND a.INT_YEAR="+byear+" group by a.CHR_EMPID";
		String data9[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data9.length>0)
		{
		   form2D=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data9[0][1]));form3D=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data9[0][2]));form4D=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data9[0][3]));form4bD=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data9[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='December' AND a.INT_YEAR="+cyear+" group by a.CHR_EMPID";
		String data10[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data10.length>0)
		{
		   form21=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data10[0][1]));form31=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data10[0][2]));form41=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data10[0][3]));form4b1=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data10[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='January' AND a.INT_YEAR="+cyear+" group by a.CHR_EMPID";
		String data11[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data11.length>0)
		{
		   form2F=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data11[0][1]));form3F=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data11[0][2]));form4F=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data11[0][3]));form4bF=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data11[0][4])); 
		}
		sql=" SELECT a.CHR_EMPNAME ,sum(a.DOU_PENBASIC),sum(a.DOU_PF),sum(a.DOU_CPYPF1),sum(a.DOU_CPYPF2) ";
		sql = sql+"	FROM pay_t_salary a ";                               
		sql = sql+"	WHERE a.CHR_EMPID ='"+data[i][0]+"' ";
		sql = sql+" AND a.CHR_MONTH ='February' AND a.INT_YEAR="+cyear+" group by a.CHR_EMPID";
		String data12[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
		if(data12.length>0)
		{
		   form2R=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data12[0][1]));form3R=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data12[0][2]));form4R=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data12[0][3]));form4bR=com.my.org.erp.Math.MathFunction.keep2Digit(Double.parseDouble(data12[0][4])); 
		}
	
	%>
 <br /><table width="80%" height="900" align="center"  cellpadding=2 cellspacing=1 bgcolor='#9900CC'  id='myTable' >
  <tr bgcolor="#FFFFFF">
    <td><table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
      <tr>
        <td><div align="center"><span class="boldEleven"><strong>Form No.3A(Revised) <br />
          Contribution card for the   Currency Period from 1st April <%= byear %> to 31st March <%= (yr+1) %>          (FOR UNEXEMPTED   ESTABLISHMENTS ONLY)</strong></span></div></td>
        <td><a href='<%="../SmartLoginAuth?filename=PF&actionS=PAYForm3A&Year="+year+"&empid="+sstaffid%>' target="_blank"><img border="0" src="../images/icon_pdf.gif" width="47" height="49" /></a></td>
      </tr>
      <tr>
        <td colspan="2"><span class="boldEleven"><strong>Name and address of the Establishment:</strong><br /><b> <%= datac[0][0] %>,<br /><b>
            <%= datac[0][1] %>,<br /><b> <%= datac[0][2] %>-<%= datac[0][3] %></span></td>
      </tr>
      <tr>
        <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boldEleven">
          <tbody>
            <tr>
              <th width="259" height="34" class="boldEleven" scope="col"> <div align="left">1. Account No. </div></th>
              <th width="178" class="boldEleven" scope="col"> <div align="left"><%= data[i][1]%></div></th>
              <th width="351" class="boldEleven" scope="col"> <div align="left">4.Statutory rate of Contribution</div></th>
              <th scope="col" width="165" class="boldEleven"><div align="left">12%</div></th>
            </tr>
            <tr>
              <th height="35" class="boldEleven" scope="row"> <div align="left">2.Name/surname (in Block   Capitals)</div></th>
              <td class="boldEleven"><div align="left"><%= data[i][2]%></div></td>
              <td class="boldEleven">5.Voluntary higher rate of employee's   contribution if any</td>
              <td><div align="left"></div></td>
            </tr>
            <tr>
              <th height="32" class="boldEleven" scope="row"> <div align="left">3.Father's/Husband's   Name:</div></th>
              <td class="boldEleven"><div align="left"></div></td>
              <td class="boldEleven"><div align="left">6.Employer contribution on Hig wages to EPF(ER)   y/n </div></td>
              <td><div align="left"></div></td>
            </tr>
            <tr>
              <th scope="row" height="19">&nbsp;</th>
              <td><div align="left"></div></td>
              <td class="boldEleven"><div align="left"> 7.Voluntary contribution to pension   y/n</div></td>
              <td><div align="left"></div></td>
            </tr>
          </tbody>
        </table></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><table width="100%"   id='myTable'  cellpadding=2 cellspacing=1 bgcolor='#9900CC' >
          <tr  bgcolor='#ffffff' class="bold1">
            <td width="21%"><div align="center" class="bold1">Months</div></td>
            <td colspan="2"><div align="center" class="bold1">Workers Share </div></td>
            <td colspan="2"><div align="center" class="bold1">Employers Share </div></td>
            <td width="11%"><div align="center">&nbsp;</div></td>
            <td width="18%"><div align="center">&nbsp;</div></td>
            <td width="7%"><div align="center">&nbsp;</div></td>
          </tr>
          <tr bgcolor='#ffffff'>
            <td class="boldEleven">&nbsp;</td>
            <td width="11%" class="boldEleven">Amount of Wages </td>
            <td width="10%" class="boldEleven">EPF(12%)</td>
            <td width="10%" class="boldEleven">EPF(3.67%)</td>
            <td width="12%" class="boldEleven">Pension Fund Contri(8.33%) </td>
            <td class="boldEleven">Refund of Advance </td>
            <td class="boldEleven">No of Days/Period of Non Contributing service if any </td>
            <td class="boldEleven">Remark</td>
          </tr>
          <tr bgcolor='#ffffff'>
            <td><div align="center"><strong>1.</strong></div></td>
            <td><div align="center"><strong>2.</strong></div></td>
            <td><div align="center"><strong>3(A).</strong></div></td>
            <td><div align="center"><strong>4(A)</strong></div></td>
            <td><div align="center"><strong>4(B).</strong></div></td>
            <td><strong>5.</strong></td>
            <td><div align="center"><strong>6.</strong></div></td>
            <td><div align="center"><strong>7.</strong></div></td>
          </tr>
          <tr bgcolor='#ffffff'>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr bgcolor='#ffffff'>
            <td class="boldEleven"><div align="right">Mar paid in APR-<%=yr%></div></td>
            <td class="boldEleven"><div align="right"><%=form2A%></div></td>
            <td class="boldEleven"><div align="right"><%=form3A %></div></td>
            <td class="boldEleven"><div align="right"><%=form4bA %></div></td>
            <td class="boldEleven"><div align="right"><%=form4A %></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp; </td>
            <td class="boldEleven">&nbsp; </td>
          </tr>
		  
          <tr bgcolor='#ffffff'>
            <td class="boldEleven"><div align="right">MAY-<%=yr%></div></td>
            <td class="boldEleven"><div align="right"><%=form2M%></div></td>
            <td class="boldEleven"><div align="right"><%=form3M%></div></td>
            <td class="boldEleven"><div align="right"><%=form4bM%></div></td>
            <td class="boldEleven"><div align="right"><%=form4M%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr> 
          <tr bgcolor='#ffffff'>
            <td class="boldEleven"><div align="right">JUN-<%=yr%></div></td>
            <td class="boldEleven"><div align="right"><%=form2J%></div></td>
            <td class="boldEleven"><div align="right"><%=form3J%></div></td>
            <td class="boldEleven"><div align="right"><%=form4bJ%></div></td>
            <td class="boldEleven"><div align="right"><%=form4J%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr> 
          <tr bgcolor='#ffffff'>
            <td class="boldEleven"><div align="right">JUL-<%=yr%></div></td>
            <td class="boldEleven"><div align="right"><%=form2L%></div></td>
            <td class="boldEleven"><div align="right"><%=form3L%></div></td>
            <td class="boldEleven"><div align="right"><%=form4bL%></div></td>
            <td class="boldEleven"><div align="right"><%=form4L%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr>
          <tr bgcolor='#ffffff'> 
            <td class="boldEleven"><div align="right">AUG-<%=yr%></div></td>
            <td class="boldEleven"><div align="right"><%=form2U%></div></td>
            <td class="boldEleven"><div align="right"><%=form3U%></div></td>
            <td class="boldEleven"><div align="right"><%=form4bU%></div></td>
            <td class="boldEleven"><div align="right"><%=form4U%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr>
          <tr bgcolor='#ffffff'> 
            <td class="boldEleven"><div align="right">SEP-<%=yr%></div></td>
            <td class="boldEleven"><div align="right"><%=form2S%></div></td>
            <td class="boldEleven"><div align="right"><%=form3S%></div></td>
            <td class="boldEleven"><div align="right"><%=form4bS%></div></td>
            <td class="boldEleven"><div align="right"><%=form4S%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr>
          <tr bgcolor='#ffffff'> 
            <td class="boldEleven"><div align="right">OCT-<%=yr%></div></td>
            <td class="boldEleven"><div align="right"><%=form2O%></div></td>
            <td class="boldEleven"><div align="right"><%=form3O%></div></td>
            <td class="boldEleven"><div align="right"><%=form4bO%></div></td>
            <td class="boldEleven"><div align="right"><%=form4O%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr>
          <tr bgcolor='#ffffff'> 
            <td class="boldEleven"><div align="right">NOV-<%=yr%></div></td>
            <td class="boldEleven"><div align="right"><%=form2N%></div></td>
            <td class="boldEleven"><div align="right"><%=form3N%></div></td>
            <td class="boldEleven"><div align="right"><%=form4bN%></div></td>
            <td class="boldEleven"><div align="right"><%=form4N%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr>
          <tr bgcolor='#ffffff'> 
            <td class="boldEleven"><div align="right">DEC-<%=yr%></div></td>
            <td class="boldEleven"><div align="right"><%=form2D%></div></td>
            <td class="boldEleven"><div align="right"><%=form3D%></div></td>
            <td class="boldEleven"><div align="right"><%=form4bD%></div></td>
            <td class="boldEleven"><div align="right"><%=form4D%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr>
          <tr bgcolor='#ffffff'> 
            <td class="boldEleven"><div align="right">JAN-<%=(yr+1)%></div></td>
            <td class="boldEleven"><div align="right"><%=form21%></div></td>
            <td class="boldEleven"><div align="right"><%=form31%></div></td>
            <td class="boldEleven"><div align="right"><%=form4b1%></div></td>
            <td class="boldEleven"><div align="right"><%=form41%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr> 
          <tr bgcolor='#ffffff'>
            <td class="boldEleven"><div align="right">FEB-<%=(yr+1)%></div></td>
            <td class="boldEleven"><div align="right"><%=form2F%></div></td>
            <td class="boldEleven"><div align="right"><%=form3F%></div></td>
            <td class="boldEleven"><div align="right"><%=form4bF%></div></td>
            <td class="boldEleven"><div align="right"><%=form4F%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr>
          <tr bgcolor='#ffffff'> 
            <td class="boldEleven"><div align="right">MAR-<%=(yr+1)%></div></td>
            <td class="boldEleven"><div align="right"><%=form2R%></div></td>
            <td class="boldEleven"><div align="right"><%=form3R%></div></td>
            <td class="boldEleven"><div align="right"><%=form4bR%></div></td>
            <td class="boldEleven"><div align="right"><%=form4R%></div></td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
            <td class="boldEleven">&nbsp;</td>
          </tr>
          <tr bgcolor='#ffffff'>
            <td class="boldEleven"><div align="right"><strong>TOTAL</strong></div></td>
            <td class="boldEleven">
			  <div align="right"><strong>
			    <%
			form2t=Double.parseDouble(form2A)+Double.parseDouble(form2M)+Double.parseDouble(form2J)+Double.parseDouble(form2L)+Double.parseDouble(form2U)+Double.parseDouble(form2S)+Double.parseDouble(form2O)+Double.parseDouble(form2N)+Double.parseDouble(form2D)+Double.parseDouble(form21)+Double.parseDouble(form2F)+Double.parseDouble(form2R);
			out.println(com.my.org.erp.Math.MathFunction.keep2Digit(form2t));
			%>
			    </strong></div></td>
            <td class="boldEleven">
			  <div align="right"><strong>
			    <%
			form3t=Double.parseDouble(form3A)+Double.parseDouble(form3M)+Double.parseDouble(form3J)+Double.parseDouble(form3L)+Double.parseDouble(form3U)+Double.parseDouble(form3S)+Double.parseDouble(form3O)+Double.parseDouble(form3N)+Double.parseDouble(form3D)+Double.parseDouble(form31)+Double.parseDouble(form3F)+Double.parseDouble(form3R);
			out.println(com.my.org.erp.Math.MathFunction.keep2Digit(form3t));
			%>
			      </strong></div></td>
            <td class="boldEleven">
			  <div align="right"><strong>
			    <%
			form4bt=Double.parseDouble(form4bA)+Double.parseDouble(form4bM)+Double.parseDouble(form4bJ)+Double.parseDouble(form4bL)+Double.parseDouble(form4bU)+Double.parseDouble(form4bS)+Double.parseDouble(form4bO)+Double.parseDouble(form4bN)+Double.parseDouble(form4bD)+Double.parseDouble(form4b1)+Double.parseDouble(form4bF)+Double.parseDouble(form4bR);
out.println(com.my.org.erp.Math.MathFunction.keep2Digit(form4bt));
			%>
			  </strong></div></td>
            <td class="boldEleven">
			  <div align="right"><strong>
			    <%
			form4t=Double.parseDouble(form4A)+Double.parseDouble(form4M)+Double.parseDouble(form4J)+Double.parseDouble(form4L)+Double.parseDouble(form4U)+Double.parseDouble(form4S)+Double.parseDouble(form4O)+Double.parseDouble(form4N)+Double.parseDouble(form4D)+Double.parseDouble(form41)+Double.parseDouble(form4F)+Double.parseDouble(form4R);
	out.println(com.my.org.erp.Math.MathFunction.keep2Digit(form4t));
			%>
			  </strong></div></td>
            <td class="boldEleven"><div align="right">&nbsp; </div></td>
            <td class="boldEleven"><div align="right"> &nbsp;</div></td>
            <td class="boldEleven"><div align="right">&nbsp; </div></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><div align="justify"><span class="boldEleven">Certified that the total amount of   contribution (both shares) indicated in this card i.e, Rs. <%= com.my.org.erp.Math.MathFunction.keep2Digit(form3t+form4t) %> has already been remitted in full in EPF A/C No. 1 and pension   Fund A/C No. 10 R <%=com.my.org.erp.Math.MathFunction.keep2Digit( form4bt )%> vide below 
        </span></div></td>
      </tr>
      <tr>
        <td colspan="2"><div align="justify"><span class="boldEleven">Certified that the difference   between the total of the contributions shown under columns(3) and 4(a) &amp;   4(b) of the above table and that arrived at on the total wages shown in col(2)   at the prescribed rate is sloely due to rounding off of contribution to the   nearest rupee under the rules.</span></div></td>
      </tr>
      <tr>
        <td colspan="2" class="boldEleven"><div align="right"><strong>For Care Networking Solutions (India) Pvt Ltd.,</strong></div></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="77%" class="boldEleven"><strong>Dated : </strong></td>
            <td width="23%" class="boldEleven"><strong>Authorised signatory</strong></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2"><span class="boldEleven">(See paragraphs 35 and 42 of the employee'   Provident Funds Scheme, 1952)</span></td>
      </tr>
      <tr>
        <td colspan="2"><span class="boldEleven">(See paragraph 19 of the Employee's Pension   Scheme 1995)</span></td>
      </tr>
      <tr>
        <td colspan="2"><div align="justify"><span class="boldEleven">Note:- In respect of Form 3(A) sent to the   Regional Office during the course of the Currency period for the purpose of   final settlement of the accounts of the member who had left service details of   date and reason for leaving service.</span></div></td>
      </tr>
      <tr>
        <td colspan="2"><div align="justify"><span class="boldEleven">Should be furnished under column   7(A)(B)</span></div></td>
      </tr>
      <tr>
        <td colspan="2"><div align="justify"><span class="boldEleven">In respect of those who are not members of the Pension Fund the   employers share of contribution to the EPF will be 8-1/3 or 10% as the may be   and is to be shown under Column   4(a)</span></div></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
      <br />
    <%
	}
%>
 &nbsp; <br />
  &nbsp;<br />
<br />
 
  <br />
  
</body>
</html>