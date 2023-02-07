<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<html>
<head>
<title><%=com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT CHR_MODULETITLE FROM m_projectmodule WHERE CHR_SHORTNAME='STK' ")[0][0]%></title></title>
 
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

</head>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/Stock/Divisionview.js"></script>

<script language="JavaScript">

    function Add()
	{ 
		document.frm.action="DivisionAction.jsp";
 	}

	function Edit()
 	{		
		var count;
		count=0;
		coffee1=document.forms[0].Divisionid
		txt=""
		for (i=0;i<coffee1.length;++ i)
		{
			if (coffee1[i].checked)
			{
			count=count+1;
			}
		}
		if(count==0)
		{
			if (document.forms[0].Divisionid.checked) { count=1;}
		}
		if(count==1){			
			document.frm.action="DivisionAction.jsp";
			return true;
		}
		else
		{
		    alert("Select Only one Value");
		    return false;
		}
 	}	

 	function Delete()
 	{		
		var count;
		count=0;
		coffee1=document.forms[0].Divisionid
		txt=""
		for (i=0;i<coffee1.length;++ i)
		{
			if (coffee1[i].checked)
			{
			count=count+1;
			}
		}
		if(count==0)
		{
			if (document.forms[0].Divisionid.checked) { count=1;}
		}
		if(count>=1){			
			var name=confirm("Confirm to Delete")
			if (name==true)
			{ 
				document.frm.action="../SmartLoginAuth";
				return true;			
			}
			else
				return false;
		}
		else
		{
		    alert("Select Atleast One Value");
		    return false;
		}		
 	}
 	
</script>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="LoadDivision('0')">
<%
try
{
%>
<%@ include file="indexstock.jsp"%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<!--DWLayoutTable-->
	<tr>
		<td height="19">&nbsp;</td>
	</tr>
	<tr>
	  <td height="19">&nbsp;</td>
  </tr>

	<tr>
	  <td height="19"><form  method="post" name="frm" id="frm">
	    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="100%" height="200" border="0" align="center"
			cellpadding="0" cellspacing="0"  
			 >
              <tr class="BackGround">
                <td height="31" class="BackGround"><div align="center" class="boldThirteen">Division</div></td>
              </tr>
              <tr class="BackGround">
                <td height="31" class="BackGround"><table width="100%"    border='0' class='boldEleven' cellspacing=1 cellpadding=2>
                    <tr  class='MRow1'>
                      <td  class='bold1' align='center'><div align='center'>S.No</div></td>
                      <td  class='bold1' align='center'><div align='center'> Name</div></td>
                      <td  class='bold1' align='center'><div align='center'>Short Name</div></td>
                    </tr>
                </table></td>
              </tr>
             
              <tr>
                <td height="127" valign="top" class="footermenu">
				<div id="divscroll" style="OVERFLOW:auto;width:100%;height:250" class="boldEleven"></div>
				<br><br><div id='totalrecord' align="center"></div>
				</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><table width="100%" border="0" align="center" cellpadding="1"
			cellspacing="1"  >
              <tr class="para">
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('0')">All</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('A')">A</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('B')">B</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('C')">C</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('D')">D</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('E')">E</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('F')">F</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('G')">G</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('H')">H</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('I')">I</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('J')">J</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('K')">K</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('L')">L</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('M')">M</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('N')">N</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('O')">O</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('P')">P</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('Q')">Q</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('R')">R</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('S')">S</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('T')">T</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('U')">U</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('V')">V</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('W')">W</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('X')">X</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('Y')">Y</a></div></td>
                <td class="boldEleven"><div align="center"><a
					href="javascript:LoadDivision('Z')">Z</a></div></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><table width="296" border="0" align="center" cellpadding="1"
			cellspacing="1">
              <!--DWLayoutTable-->
              <tr>
                <td width="56" valign="top"><input type="hidden" name="filename" value="Division" />
                    <input type="hidden" name="actionS" value="STKDivisionDelete" /></td>
                <td width="56" valign="top"><input type="submit"	class="buttonbold13" name="action1"  value="Add"   accesskey="s"   onClick="Add()" /></td>
                <td width="56" valign="top"><input type="submit"	class="buttonbold13" name="action1"   value="Edit"	onclick="return Edit()" /></td>
                <%
	  String usertype=""+session.getAttribute("USRTYPE");
	  if("F".equals(usertype))
	  {
	  %>
                <td width="56" valign="top"><input type="submit"	class="buttonbold13" name="Submit"   value="Delete"		onclick="return Delete()" /></td>
                <%
	   }
	   %>
                <td width="56"><input type="button" class="buttonbold13"
					name="submit"  value="Close"   accesskey="c"  onClick="redirect('StockMain.jsp')" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
	  </form>	  </td>
	   
	  
	  	  </td>
  </tr>
	<tr>
	  <td height="19">&nbsp;</td>
  </tr>
	
	
	<tr>
		<td><%@ include file="../footer.jsp"%></td>
	</tr>
</table>
<%
}
catch(Exception e)
{
}
%>
</body>
</html>
