<%@ page contentType="text/html; charset=iso-8859-1" language="java"	import="java.sql.*,java.text.*"  %>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ page import="com.my.org.erp.SmartInventory.InventoryFunctions"%>
<%@ page import="com.my.org.erp.SessionFactory.HibernateSessionFactory"%>
 


<%
try
{
String sql ="";

%>
<html>
<head>
 
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" >
function outstanding()
{
	//scrolls.style.visibility="hidden";
}

function outstandingenable()
{
	scrolls.style.visibility="visible";
}
</script>
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
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="cache-control" content="no-store">
<meta http-equiv="cache-control" content="private">
<meta http-equiv="cache-control" content="max-age=0, must-revalidate">
<meta http-equiv="expires" content="now-1">
<meta http-equiv="pragma" content="no-cache">
 
<body>



 
<center>

  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><%@ include file="inv_index.jsp"%></td>
    </tr>
    <tr>
      <td></td>
    </tr>
    <tr>
      <td align="center"  ><br>
          
        <br>
        <br>
        <br>
        <%
		
	 	DecimalFormat myFormatter = new DecimalFormat("0.00");
	 
		Integer counter = (Integer)session.getAttribute("counter");
        String heading = null;
        if (counter == null) {
            counter = new Integer(1);
        } else {
            counter = new Integer(counter.intValue() + 1);
        }

        session.setAttribute("counter", counter);

        Integer applicationCounter = (Integer)application.getAttribute("applicationCounter");
        if (applicationCounter == null) {
            applicationCounter = new Integer(1);
        } else {
            applicationCounter = new Integer(applicationCounter.intValue() + 1);
        }
        application.setAttribute("applicationCounter", applicationCounter);
		String branch=""+session.getAttribute("INVBRANCH"); 
		
		
if( "B".equals(""+session.getAttribute("USRTYPE")) || "F".equals(""+session.getAttribute("USRTYPE"))) 
{		
		String ssql = " SELECT  INT_BRANCHID_FROM ,INT_BRANCHID_TO,  INT_STATUS,INT_DIVIID  FROM inv_t_stocktransfer WHERE INT_BRANCHID_TO="+branch +" AND INT_STATUS=0";
		String stockdata[][] =  CommonFunctions.QueryExecute(ssql);
		String mar="";
		String division="";
		if(stockdata.length>0)
		{
			mar = "<h4>Kindly, Acknowledge the stock transfer...  </h4><br>";
			String bid="";
			for(int y=0; y<stockdata.length;y++)
			{
				ssql=" Select a.CHR_BRANCHNAME ,b.CHR_COMPANYNAME from  com_m_branch  a  ,com_m_company b where  a.INT_COMPANYID = b.INT_COMPANYID  and  a.INT_BRANCHID  in("+stockdata[y][0]+")";
				String stockdatas[][] =  CommonFunctions.QueryExecute(ssql);
				if(Integer.parseInt(stockdata[y][3])>0)
				{
					ssql="SELECT CHR_DIVICODE from inv_m_division where INT_DIVIID=" +stockdata[y][3];
					String dt[][] =  CommonFunctions.QueryExecute(ssql);
					division = " / "+dt[0][0] +" Division    ";
				}	
				mar = mar+ "<h4> From  : "+stockdatas[0][1] +"  @  "+ stockdatas[0][0] +division+" </h4><br>";
			}
			%>
          <script language="javascript">
			alert("Stock Receiving pending...");
			  </script>
          <center>
		  <table   align="center" class='TableDesign' >
		  	<tr class="MRow1">
		  			<td   >
					<br>
						<div id="divscroll" style="OVERFLOW:auto;width:100%;height:200"  ><br>
						  <marquee behavior="alternate" scrolldelay="150" width="98%" class="search" align="absmiddle" >
							 <br><div class="MRow1"> <%=mar%></div><br>
						  </marquee><br>
						</div>	<br><br>				</td>
			</tr>
			</table>
          </center>
        <%
		}
}		
		
        %>      </td>
    </tr>
    <tr>
      <td> 
	  </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td>
      <%
	String vsql =" SELECT COUNT(*) FROM inv_m_customerinfo WHERE CHR_VERIFIED='N' ";
	String vdata[][]=CommonFunctions.QueryExecute(vsql);
	int rcount = Integer.parseInt(vdata[0][0]) ;
	if(rcount>=1)
	{
	%>
    <script language="javascript">alert("<%=rcount%>-nos, Customer address verification pending")</script>
    <%
	}
	%>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><%
		/*Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String path="../webapps/SmartCampus/kalai.xls";
		String myDB ="jdbc:odbc:Driver={Microsoft Excel Driver (*.xls)};DBQ="+path+";DriverID=22;READONLY=false";
		Connection cona = DriverManager.getConnection(myDB,"","");
		Statement sts = cona.createStatement();
		ResultSet rss = sts.executeQuery("SELECT * FROM [Sheet1$]");
		while(rss.next())
		{
			out.println(rss.getString(1));
			out.println(rss.getString(2));
			out.println(rss.getString(3));
			out.println(rss.getString(4));
			out.println(rss.getString(5));
			out.println("<br>");
		}	
		cona.close();*/
		
		
		
		//for(int u=1;u<100;u++)
			//out.print(u+",");
			
			
			
	  
if( !"S".equals(""+session.getAttribute("USRTYPE"))  ) 
{	  
	try
	{	
		sql ="";
		out.println("<center>");
		out.println("<table width=600 class='TableDesign'    cellpadding=2 cellspacing=1  >");
		out.println("<tr class='MRow2'><td class='boldEleven' align='center'  colspan='4'><b>TODAY PAYMENT COMMITMENT</b></td>");
		out.println("<tr class='MRow1'><td  class='boldEleven'><b>S.No</td><td  class='boldEleven'><b>Invoice Type</td><td  class='boldEleven'><b>Total Amount</td><td  class='boldEleven'><b>More Details</td>");
		double commitmentsum=0;
		
		int row=0;
		double customersales=0;
		sql = " SELECT SUM(d.DOU_COMMITMENTAMOUNT ),SUM(a.DOU_TOTALAMOUNT)  ";
		sql = sql + " FROM inv_t_directsales  a ,inv_m_customerinfo b   ,inv_t_paymentcommitment d,inv_m_division e,   "; 
		sql = sql + " com_m_branch f , com_m_company g,com_m_staff h  ";  
		sql = sql + " where  d.CHR_SALESNO =a.CHR_SALESNO   "; 
		sql = sql + " AND a.INT_CUSTOMERID = b.INT_CUSTOMERID   ";  
		sql = sql + " AND a.INT_DIVIID = e.INT_DIVIID   ";  
		sql = sql + " AND a.INT_BRANCHID= f.INT_BRANCHID   "; 
		sql = sql + " AND f.INT_COMPANYID = g.INT_COMPANYID   "; 
		sql = sql + " AND a.CHR_REF=h.CHR_EMPID   "; 
		sql = sql + " AND a.CHR_SALESTYPE='S'   AND a.CHR_PAYMENTSTATUS !='Y'   "; 
		sql = sql + " AND Date(d.DT_COMMITMENTDATE) = date(now())    ";
		String salesData[][] = CommonFunctions.QueryExecute(sql);
		if(salesData.length>0)
			if(!"-".equals(salesData[0][0]))
			{
				row++;
				out.println("<tr class='MRow2'>");			
				out.println("<td class='boldEleven'>"+row+".</td>");		
				customersales =Double.parseDouble(salesData[0][0]);
				out.println("<td class='boldEleven'>Customer Sales</td>");
				out.println("<td class='boldEleven' align='right'>"+customersales+"</td>");	
				out.println("<td class='boldEleven' ><a href='PaymentCommitmentDetailedReport.jsp?type=C' target='_blank' ><font class='boldgreen'> Detail</font></a>");	
			}
			
			
		double directsales=0;
		sql = " SELECT SUM(d.DOU_COMMITMENTAMOUNT ),SUM(a.DOU_AMOUNT)    ";
		sql = sql + " FROM inv_t_directbilling a, inv_m_customerinfo b ,com_m_staff c  ,inv_t_paymentcommitment d ,   ";
		sql = sql + " inv_m_division e,com_m_branch f , com_m_company g      ";
		sql = sql + " WHERE  a.CHR_SALESNO =d.CHR_SALESNO     ";  
		sql = sql + " AND a.INT_CUSTOMERID=b.INT_CUSTOMERID    ";   
		sql = sql + " AND c.CHR_EMPID = a.CHR_REF    ";   
		sql = sql + " AND a.CHR_SALESNO =d.CHR_SALESNO     ";  
		sql = sql + " AND a.INT_DIVIID = e.INT_DIVIID      ";
		sql = sql + " AND a.INT_BRANCHID= f.INT_BRANCHID     ";
		sql = sql + " AND f.INT_COMPANYID = g.INT_COMPANYID       AND a.CHR_PAYMENTSTATUS !='Y'   ";
		sql = sql + " AND Date(d.DT_COMMITMENTDATE) = date(now())   ";
		String directsalesData[][] = CommonFunctions.QueryExecute(sql);
		if(directsalesData.length>0)
			if(!"-".equals(directsalesData[0][0]))
			{
				row++;
				out.println("<tr class='MRow1'>");			
				out.println("<td class='boldEleven'>"+row+".</td>");
				directsales =Double.parseDouble(directsalesData[0][0]);
				out.println("<td class='boldEleven'>Direct Billing</td>");
				out.println("<td class='boldEleven' align='right'>"+directsales+"</td>");	
				out.println("<td class='boldEleven'><a href='PaymentCommitmentDetailedReport.jsp?type=D' target='_blank' ><font class='boldgreen'> Detail</font></a>");	
			}	
		
		
		double servicesales=0;
		sql = " SELECT SUM(d.DOU_COMMITMENTAMOUNT ),sum(a.DOU_NETAMOUNT)     ";
		sql = sql + " FROM inv_t_servicebilling a, inv_m_customerinfo b ,com_m_staff c ,inv_t_paymentcommitment d     "; 
		sql = sql + " ,inv_m_division e,com_m_branch f , com_m_company g     ";   
		sql = sql + " WHERE  a.CHR_SALESNO =d.CHR_SALESNO       "; 
		sql = sql + " AND a.CHR_SALESNO =d.CHR_SALESNO     ";     
		sql = sql + " AND a.INT_CUSTOMERID=b.INT_CUSTOMERID       "; 
		sql = sql + " AND c.CHR_EMPID = a.CHR_REF      ";   
		sql = sql + " AND a.INT_DIVIID = e.INT_DIVIID     ";   
		sql = sql + " AND a.INT_BRANCHID= f.INT_BRANCHID     ";  
		sql = sql + " AND f.INT_COMPANYID = g.INT_COMPANYID       AND a.CHR_PAYMENTSTATUS !='Y'     ";	
		sql = sql + " AND Date(d.DT_COMMITMENTDATE) = date(now())      "; 
		String servicesalesData[][] =  CommonFunctions.QueryExecute(sql);
		if(servicesalesData.length>0)
			if(!"-".equals(servicesalesData[0][0]))
			{
				row++;
				out.println("<tr class='MRow2'>");			
				out.println("<td class='boldEleven'>"+row+".</td>");
				servicesales =Double.parseDouble(servicesalesData[0][0]);
				out.println("<td class='boldEleven'>Service Billing</td>");
				out.println("<td class='boldEleven' align='right'>"+directsales+"</td>");	
				out.println("<td class='boldEleven'><a href='PaymentCommitmentDetailedReport.jsp?type=S' target='_blank' ><font class='boldgreen'> Detail</font></a>");	
			}
			
		commitmentsum = customersales +directsales+servicesales;
		out.println("<tr class='MRow2'><td class='boldEleven' align='right'  colspan='3'>Total</td><td class='boldEleven' align='right'>"+commitmentsum+"</td>");
		out.println("<tr class='MRow2'><td class='boldEleven' align='center'  colspan='4'> ");
		
		%>
		<div id="Rupees"><script language="javascript">numberWord("<%=commitmentsum%>","Rupees")</script></div>	
		<%
		out.println("</td>");
		out.println("</table>");
		out.println("</center>");
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
	 
}			
	%></td>
    </tr>
    <tr>
      <td></td>
    </tr>
    <tr>
      <td>	  </td>
    </tr>
    <tr>
      <td></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr >
      <td>
	  
	
	  </td>
    </tr>
    <tr>
      <td>
	 
	  </td>
    </tr>
  </table> 
  <%@ include file="../footer.jsp"%></center>
</html>
<%
}
catch(Exception e)
{
	out.println(e.getMessage());
	System.out.println(e.getMessage());
}
%>
