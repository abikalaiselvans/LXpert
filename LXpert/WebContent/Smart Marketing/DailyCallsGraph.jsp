 
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ page import="org.apache.commons.lang.ArrayUtils"%> 
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.axis.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import="org.jfree.chart.labels.*" %>
<%@ page  import="org.jfree.chart.plot.*" %>
<%@ page  import="org.jfree.chart.renderer.category.*" %>
<%@ page  import="org.jfree.chart.urls.*" %>
<%@ page  import="org.jfree.data.category.*" %>
<%@ page  import="org.jfree.data.general.*" %>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
<%
try
{
 
 			//String  = request.getParameter();
			//String  = request.getParameter();
			
 
          final DefaultPieDataset data = new DefaultPieDataset();
		  String sql = "";
		  sql = " SELECT  c.CHR_CALLTYPE, COUNT(*) FROM mkt_t_daillycalls a, mkt_k_calltype c WHERE a.CHR_CALLTYPE=c.INT_CALLTYPEID GROUP BY   a.CHR_CALLTYPE ORDER BY  c.CHR_CALLTYPE  ";
		    String[][] datas = CommonFunctions.QueryExecute(sql);
			
			
			for(int u=0;u<datas.length;u++)
				data.setValue(datas[u][0], new Double(datas[u][1]));	
			
			JFreeChart chart = ChartFactory.createPieChart("Pie Chart ", data, true, true, false);
			try 
			{
				final ChartRenderingInfo info = new   ChartRenderingInfo(new StandardEntityCollection());
				final File file1 = new File(request.getRealPath("/")+"Smart Marketing/piechart.png");
				ChartUtilities.saveChartAsPNG(
				file1, chart, 600, 400, info);
			} 
			catch (Exception e) 
			{
				out.println(e.getMessage());
			}
			 

		
%>


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


<title> :: MARKETING ::</title><script language="javascript" src="../JavaScript/comfunction.js"></script>
<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
 <body onselectstart="return false" onpaste="return false;" onCopy="return false"      >
<%@ include file="index.jsp"%>
<form  AUTOCOMPLETE = "off"   action="" method="get" name="frm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
	  <td> <!--<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	      <td><a href="DailyCallsGraphBar.jsp">Bar</a></td>
	      <td><a href="DailyCallsGraph.jsp">Pie</a></td>
	      </tr>
      </table>--> </td>
    </tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	 
	<tr>
		<td align="center"> <IMG SRC="piechart.png" WIDTH="600" HEIGHT="400" BORDER="0" USEMAP="#chart"></td>
	</tr>
	<tr>
		<td>&nbsp; </td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
    </tr>
	<tr>
	  <td> </td>
    </tr>
	<tr>
		<td><table width="70" border="0" align="center" cellpadding="1"
			cellspacing="1">
          <!--DWLayoutTable-->
          <tr>
           <td width="56"><input type="Button" class="ButtonHead" 
					name="submit"  value="Close"   accesskey="c"  onClick="redirect('MarketingMain.jsp')" /></td>
          </tr>
        </table></td>
	</tr>
</table>
</form>
<%@ include file="../footer.jsp"%>
</body>
</html>
<%
}
catch(Exception e)
{
	out.println(e.getMessage());
	System.out.println(e.getMessage());
}
%>