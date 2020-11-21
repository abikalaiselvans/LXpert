<%@ page import="java.io.*,java.util.*"%>
<%@ page import="DBConnection.*"%>
<%@ page import="sun.net.smtp.SmtpClient"%>

<html>
<head>
<title>:: INVENTORY ::</title>
<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
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
 <script language="javascript" src="../JavaScript/Inventory/AccountDirectPurchase.js"></script>
</script>

<script language="javascript">
	function  Print(pono)
		{
			
			var width="800", height="400";
			var left = (screen.width/2) - width/2;
			var top = (screen.height/2) - height/2;
			var styleStr = 'toolbar=no,location=no,directories=no,status=no,menubar=yes,scrollbars=yes,resizable=yes,copyhistory=no,width='+width+',height='+height+',left='+left+',top='+top+',screenX='+left+',screenY='+top;
			var f ="AccDirectPurchaseStatusUpdate.jsp?gdreceiveno="+pono  ;
			newWindow = window.open(f,"subWind",styleStr);
			newWindow.focus( );
	}
	
	
	function  DCUpload(pono)
	{
		var f ="AccDCUploadUpload.jsp?pono="+pono+"&mode=DirectPurchase";
		newWindow = window.open(f,"subWind",",,height=400,width=600,top=0,left=0");
		newWindow.focus( );
	}
</script>
<body    onLoad="AccloadDirectPurchase('0')">
<%@ include file="indexinv.jsp"%>
<form  AUTOCOMPLETE = "off"   name="frm" method="post" action="">
<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>
		<td>&nbsp;</td>
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
		<table height="227" border="0" align="center"
			cellpadding="0" cellspacing="0" class="TableDesign"  
			 >
			<tr  >
				<td height="31"  >
				<div align="center" class="whiteMedium"><span >Direct
				Purchase ( Account ) </span></div>				</td>
			</tr>
			<tr  >
				<td  >
				<table width='100%'  class='whiteMedium'  id='myTable'     cellpadding=2 cellspacing=1 >
					<tr>
						<td  >Branch</td>
						<td ><select name="Accbranch" style="width:200"
							id="Accbranch" onChange="AccloadDirectPurchase('0')">
							<option value="0">All</option>
							<%
			   	String branchid=""+session.getAttribute("INVCOMPANY"); 
				 String sq=" Select a.INT_BRANCHID,a.CHR_BRANCHNAME ,b.CHR_COMPANYNAME from  com_m_branch  a  ,com_m_company b where  a.INT_COMPANYID = b.INT_COMPANYID and  a.INT_BRANCHID not in("+Integer.parseInt(branchid)+")";

				String shipids[][] = com.my.org.erp.common.CommonFunctions.QueryExecute(sq);
				for(int u=0; u<shipids.length; u++)
					out.print("<option value='"+shipids[u][0]+"'>"+shipids[u][2]+ "  @  " +shipids[u][1] +"</option>");
						 
			   %>
						</select>
						
				<script language="javascript">setOptionValue('Accbranch','<%=""+session.getAttribute("INVBRANCH")%>')</script>						
		
						</td>
						<td  >Division</td>
						<td ><select name="division"
							class="formText135" id="division" tabindex="1"
							onChange="AccloadDirectPurchase('0')">
							<option value='0'>All</option>
							<%
								String division[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select INT_DIVIID,CHR_DIVICODE from inv_m_division   WHERE INT_DIVIID >0 AND CHR_OFFICEIDS LIKE '%"+session.getAttribute("INVOFFICEID")+"%'  ORDER BY CHR_DIVICODE"); 
								for(int u=0; u<division.length; u++)
									out.print("<option value='"+division[u][0]+"'>"+division[u][1]  +"</option>");
							%>
						</select></td>
						<td  >Vendor</td>
						<td ><select name="vendor" id="vendor" style="width:200"
							class="formText135" onChange="AccloadDirectPurchase('0')">
							<option value="0">All</option>
							<jsp:include page="LoadVendor.jsp" />
						</select></td>
					</tr>
					<tr >
						<td width="105"  >Month</td>
						<td width="70" ><select name="month"
							id="month" onBlur="AccloadDirectPurchase('0')">
							<option value="0">All</option>
							<%@ include file="../JavaScript/Inventory/month.jsp"%>
						</select></td>
						<td width="99"  >Year </td>
						<td width="82" ><select name="year"
							id="year" onBlur="AccloadDirectPurchase('0')">
							<%@ include file="../JavaScript/Inventory/year.jsp"%>
						</select> <script language='JavaScript' type="text/javascript">
				<!--			
						var d=new Date()
						var month1=d.getMonth() + 1
						if(month1<10) month1="0"+month1;
						var year1=d.getFullYear();
						setOptionValue('month',month1);
						setOptionValue('year',year1);							
				//-->
                 </script></td>
						<td width="91"  ><span  >Status</span></td>
						<td width="191" ><select name="Aflag"
							id="Aflag" onBlur="AccloadDirectPurchase('0')">
							<option value="2" >All</option>
							<option value="0">Received</option>
							<option value="1" selected>Not Received</option>
							
						</select></td>
					</tr>
				</table>				</td>
			</tr>
			<tr  >
				<td height="31"  >
				<div align="center">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="whiteMedium">
					<tr  >
						<td width='12%'><div align="center">Purchase No</div></td>
						<td width='12%'><div align="center">Division</div></td>
						<td width='12%'><div align="center">Branch</div></td>
						<td width='12%'><div align="center">Date</div></td>
						<td width='12%'><div align="center">Vendor Name</div></td>
						<td width='12%'><div align="center">Net Amount</div></td>
						<td width='12%'><div align="center">Payment Status</div></td>
						<td width='12%'><div align="center">Invoice Status</div></td>
						<td width='12%'><div align="center"></div></td>
					</tr>
				</table>
				</div>				</td>
			</tr>
			<tr class="MRow1">
				<td height="127" valign="top" class="footermenu">
				 
				<div id="DirectPurchaseTable" style="OVERFLOW:auto;width:100%;height:300px"  ></div><br>
				<div align="center" id="totRec"></div><br>				</td>
			</tr>
		</table>		</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
    </tr>
	<tr>
		<td>
		<table border="0" align="center" cellpadding="1"
			cellspacing="1" class="TableDesign"  >
			<tr   >
				<td  > 
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('0')">All</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('A')">A</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('B')">B</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('C')">C</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('D')">D</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('E')">E</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('F')">F</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('G')">G</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('H')">H</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('I')">I</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('J')">J</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('K')">K</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('L')">L</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('M')">M</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('N')">N</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('O')">O</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('P')">P</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('Q')">Q</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('R')">R</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('S')">S</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('T')">T</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('U')">U</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('V')">V</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('W')">W</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('X')">X</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('Y')">Y</a></div>				</td>
				<td  >
				<div align="center"><a class="whiteMedium"
					href="javascript:AccloadDirectPurchase('Z')">Z</a></div>				</td>
			</tr>
		</table>		</td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
    </tr>
	<tr>
		<td>
		<div align="center"><input name="Submit2" type="button"
			class="ButtonHead" value="  Close  "
			onClick="redirect( 'InventoryMains.jsp')" />
		</div>		</td>
	</tr>
	<tr>
		<td> 
		
		
		
		

<%
		String sql =  "  SELECT COUNT(*) FROM inv_t_directpurchase a ,  inv_m_vendorsinformation  b , com_m_branch d  where  a.INT_VENDORID = b.INT_VENDORID AND a.INT_BRANCHID =d.INT_BRANCHID  AND a.CHR_ACCOUNTFLAG ='N'  AND a.INT_BRANCHID = "+session.getAttribute("INVBRANCH");
		 
		String bybackdata[][] = CommonFunctions.QueryExecute(sql);
		if(bybackdata.length>0)
		{
			out.println("<script type='text/javascript'  src='jquery.js'></script>");
			
		 
		  %>
<script language="javascript">

$(document).ready(function() 
{	

		var id = '#dialog';
	
		//Get the screen height and width
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
	
		//Set heigth and width to mask to fill up the whole screen
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		
		//transition effect		
		$('#mask').fadeIn(1000);	
		$('#mask').fadeTo("slow",0.8);	
	
		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();
              
		//Set the popup window to center
		$(id).css('top',  winH/2-$(id).height()/2);
		$(id).css('left', winW/2-$(id).width()/2);
	
		//transition effect
		$(id).fadeIn(2000); 	
	
	//if close button is clicked
	$('.window .close').click(function (e) {
		//Cancel the link behavior
		e.preventDefault();
		
		$('#mask').hide();
		$('.window').hide();
	});		
	
	//if mask is clicked
	$('#mask').click(function () {
		$(this).hide();
		$('.window').hide();
	});		
	
});

</script>

<style type="text/css">


#mask {
  position:absolute;
  left:0;
  top:0;
  z-index:9000;
  background-color:#000;
  display:none;
}  
#boxes .window {
  position:absolute;
  left:0;
  top:0;
  width:440px;
  height:200px;
  display:none;
  z-index:9999;
  padding:20px;
}
#boxes #dialog {
  width:375px; 
  height:203px;
  padding:10px;
  background-color:#ffffff;
}
</style>
</head><body>
 

<div id="boxes">  
<div style="top: 199.5px; left: 551.5px; display: none; OVERFLOW:auto;width:60%; "  id="dialog" class="window">
<br> 
<br><br><center>
 <b><%=bybackdata[0][0]%> - PURCHASE INVOICE ARE NOT COLLECTED  
</b></center>
<br><a href="#" class="close">Close it</a>
</div>
<!-- Mask to cover the whole screen -->
<div style="width: 1478px; height: 602px; display: none; opacity: 0.8;" id="mask"></div>
</div>

</script>
<%
	}
%>
 
 	
 </td>
	</tr>
</table>
<%@ include file="../footer.jsp"%></form>
</body>
</html>
