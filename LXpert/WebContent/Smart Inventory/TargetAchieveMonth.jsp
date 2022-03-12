<%@ page import="java.io.*,java.util.*"%>
<%@ page import="sun.net.smtp.SmtpClient"%>

<html>
<head>
<title>:: INVENTORY ::</title><style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
 }
-->
</style> 


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

 <%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
 </head>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/calendar1.js" type="text/javascript"></script>
<script language="javascript" src="../JavaScript/Inventory/TargetAssign.js"></script>
<body >
<%@ include file="indexinv.jsp"%>

<table width="100%" border="0" cellspacing="1" cellpadding="1">
  <tr>
	  <td>&nbsp;</td>
  </tr>
  <tr>
	  <td>&nbsp;</td>
  </tr>
  <tr>
	  <td><table align="center" cellpadding="0" cellspacing="0"   class="TableDesign">
        <tr>
          <td><div align="center"><strong>Month Wise </strong></div></td>
        </tr>
        <tr  >
          <td align="center"><table width="80%" border="0" align="center" cellpadding="5" cellspacing="0" class="whiteMedium">
              <tr>
                <td><strong>Office</strong></td>
                <td>
				
				
				<select name="office" class="formText135"	id="office" tabindex="1" onChange="loadTargetAssignMonth()">
                    <%
			String oficeid=""+session.getAttribute("OFFICEID");
			String usertype=""+session.getAttribute("USRTYPE");
			String deptid=""+session.getAttribute("DEPARTID");	
			if("F".equals(usertype)  || "B".equals(usertype) ) 
				out.print("<option value='0' >All</option>");	
						
	String OfficeData[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(" SELECT b.INT_OFFICEID,b.CHR_OFFICENAME FROM  com_m_office  b WHERE b.INT_OFFICEID IN("+com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT a.CHR_OFFICELIST FROM m_user a WHERE a.CHR_USRNAME='"+session.getAttribute("USRID")+"' ")[0][0]+" )");
 if(OfficeData.length>0)
 	for(int u=0;u<OfficeData.length;u++)
		out.println("<option value='"+OfficeData[u][0]+"'>"+OfficeData[u][1]+"</option>");
 		
			%>
                  </select>
				 <script language="javascript">setOptionValue('office','<%=oficeid%>')</script>				                  </td>
                <td><strong>Department</strong></td>
                <td><select name="dept" class="formText135"	id="dept" tabindex="1" onChange="loadTargetAssignMonth()">
                    <%
					if("F".equals(usertype)  || "B".equals(usertype) ) 
						out.print("<option value='0' >All</option>");
			String deptsql="SELECT INT_DEPARTID,CHR_DEPARTNAME FROM com_m_depart ORDER BY INT_DEPARTID";
			String deptdata[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(deptsql);
			for(int x=0;x<deptdata.length;x++)
				out.println("<option value='"+deptdata[x][0]+"'>"+deptdata[x][1]+"</option>");
			%>
                  </select> 
				   <script language="javascript">setOptionValue('dept','<%=deptid%>')</script>				                 </td>
                <td>Month</td>
                <td><span class="boldEleven">
                    <select name="month" id="month"  onChange="loadTargetAssignMonth()" >
							<%@ include file="../JavaScript/Inventory/month.jsp"%>
					</select>
                </span></td>
                <td><strong>Year</strong></td>
                <td><strong>
                  <select name="year" class="formText135" id="year"  onChange="loadTargetAssignMonth()">
                   <jsp:include page="../JavaScript/accountyears.jsp" flush="true" />
                  </select>
                  <script language='JavaScript' type="text/javascript">
				<!--			
						var d=new Date();
						var month1=parseInt(d.getMonth() + 1);
						var year1=parseInt(d.getFullYear());
						var m="";
						if(month1<4)
							year1 = year1-1;
						if(month1<10) 
							m="0"+month1;
						
						setOptionValue('year',year1);	
						setOptionValue('month',m);						
				//-->
                  </script>
                </strong></td>
              </tr>
          </table></td>
        </tr>
        <tr class="boldEleven">
          <td class="MRow1"><div align="center">
              <div id="TargetTable" style="OVERFLOW:auto;width:100%;height:260px"class="boldEleven"> </div>
			  <br> <div id="totRec"></div>
          </div></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
	  <td><div align="center">
	    <input name="Submit2" type="button"
			class="ButtonHead" value="  Close  "
			onClick="javascript:window.close()" />
	    </div></td>
  </tr>
  <tr>
	  <td>&nbsp;</td>
  </tr>
  <tr>
	  <td>&nbsp;</td>
  </tr>
</table>
<%@ include file="../footer.jsp"%>
</body>
</html>