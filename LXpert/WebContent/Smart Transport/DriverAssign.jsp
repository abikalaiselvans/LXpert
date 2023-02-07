  <%@ page import="java.sql.*,java.util.*,java.io.*"%>
  <%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ page import="org.apache.commons.lang.ArrayUtils"%> 


<%
try
{
%>

<html>
<head>
<link rel="icon" type="image/ico" href="images/ERP.ico"></link>
<link rel="shortcut icon" href="images/ERP.ico"></link>

<title> :: TRANSPORT ::</title>


<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>

<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>



</head>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript" src="../JavaScript/Transport/SelectChanges.js"></script>
<script language="javascript" src="../JavaScript/Transport/DriverAssignAjax.js"></script>

<script language="JavaScript">

 function Add()
	{ 
			document.frm.action="DriverAssignAction.jsp";
 	}


	function BEdit()
 	{		
		var count;
		count=0;
		coffee1=document.forms[0].id
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
			if (document.forms[0].id.checked) { count=1;}
		}
		if(count==1){			
			document.frm.action="DriverAssignAction.jsp";
			return true;
		}
		else
		{
		    alert("Select Only one Value");
		    return false;
		}
		
 	}	

 	function FDelete()
 	{		
		var count;
		count=0;
		 
		coffee1=document.forms[0].id
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
			if (document.forms[0].id.checked) { count=1;}
		}
		 
		if(count>0)
		{			
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
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >
 <%@ include file="index.jsp"%>
<form name='frm'   method="post">

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>
	
	
	<table width="90%" height="227" align="center" cellpadding="1" cellspacing="1" class="TableDesign"  >
      <!--cellpadding="0" cellspacing="0"  
			 >-->
      <tr  >
        <td height="31"  ><div align="center" class="whiteMedium">DRIVER INFORMATION </div></td>
      </tr>
      <tr  >
        <td height="31"  ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="whiteMedium">
          <tr>
            <td  >Type</td>
            <td>
<select name="vehicletype" class="formText135"  id="vehicletype" onChange="LoadSelectHomeMake()" onBlur="LoadDriverAssign('0')"  >
			<option value="0">All</option>
			<%
			
			String	readData[][]=com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT INT_VEHICLETYPEID,CHR_VEHICLETYPENAME FROM   veh_m_vehicletype ORDER BY CHR_VEHICLETYPENAME");
			for(int u=0;u<readData.length;u++)
				out.println("<option value='"+readData[u][0]+"'>"+readData[u][1]+"</option>");
			%>
            </select>            </td>
            <td  >Make</td>
            <td><select name="vehiclemake" class="formText135"  id="vehiclemake" onChange="LoadSelectHomeModel( )"  onBlur="LoadDriverAssign('0')" >
                <option value="0" selected>All</option>
                <%
			
			String	readData1[][]=com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT INT_MAKEID,CHR_MAKENAME FROM   veh_m_make ORDER BY CHR_MAKENAME");
			for(int u=0;u<readData1.length;u++)
				out.println("<option value='"+readData1[u][0]+"'>"+readData1[u][1]+"</option>");
			%>
                          </select>            </td>
            <td  >Model</td>
            <td><select name="vehiclemodel" class="formText135"  id="vehiclemodel" onChange="LoadSelectVarriant()"  onBlur="LoadDriverAssign('0')" >
                <option value="0">All</option>
                <%
			
			String	readData2[][]=com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT INT_MODELID,CHR_MODELNAME FROM   veh_m_model ORDER BY CHR_MODELNAME");
			for(int u=0;u<readData2.length;u++)
				out.println("<option value='"+readData2[u][0]+"'>"+readData2[u][1]+"</option>");
			%>
              </select>            </td>
            <td height="29" valign="middle" class="boldEleven"><span  >Variant</span></td>
                  <td valign="top" class="boldEleven">
				  <select name="varriant" class="formText135"  id="varriant" style="white-space:100"  onBlur="LoadDriverAssign('0')"  >
                    <option value="0">All</option>
                    <%
			
			String	readData3[][]=com.my.org.erp.common.CommonFunctions.QueryExecute("SELECT INT_VARRIANTID,CHR_VARRIANTNAME FROM   veh_m_varriant ORDER BY CHR_VARRIANTNAME");
			for(int u=0;u<readData3.length;u++)
				out.println("<option value='"+readData3[u][0]+"'>"+readData3[u][1]+"</option>");
			%>
                  </select> </td>
          </tr>
        </table></td>
      </tr>
      <tr  >
        <td height="31"  ><div align="center">
             <table width="100%" border="0" cellpadding="0" cellspacing="0" class="whiteMedium">
  <tr>
    <td  ><div align="center">S.No</div></td>
    <td  ><div align="center">Reg.No</div></td>
    <td  ><div align="center">Vehicletype</div></td>
    <td  ><div align="center">Make</div></td>
    <td  ><div align="center">Model</div></td>
    <td  ><div align="center">Varriant</div></td>
    <td  ><div align="center">Fuel</div></td>
    <td  ><div align="center">Color</div></td>
	<td  ><div align="center">Empid</div></td>
	<td  ><div align="center">Staff Name</div></td>
	<td  ><div align="center">Status</div></td>
	<td  ><div align="center">Date</div></td>
  </tr>
</table>

        </div></td>
      </tr>
      <tr class="MRow1">
        <td height="127" valign="top" class="footermenu"><table width="100%">
         
            <tr>
              <td class="bolddeepblue" align="center" bgcolor="#efefef"></td>
            </tr>
            <tr>
              <td  >
			  <div id="divscroll" style="OVERFLOW:auto;width:100%;height:250px">
                  <div id="GroupTable"></div>
              </div></td>
            </tr>
			   <tr>
              <td class="bolddeepblue" align="center"><div align="center" id="totalrec"></div></td>
            </tr>
        </table></td>
      </tr>
    </table>	</td>
  </tr>
  <tr>
    <td height="15">&nbsp;</td>
  </tr>
  <tr>
    <td><table border="0" align="center" cellpadding="1"
			cellspacing="1" class="TableDesign"  >
			<tr class="para">
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('0')">All</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('A')">A</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('B')">B</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('C')">C</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('D')">D</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('E')">E</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('F')">F</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('G')">G</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('H')">H</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('I')">I</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('J')">J</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('K')">K</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('L')">L</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('M')">M</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('N')">N</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('O')">O</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('P')">P</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('Q')">Q</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('R')">R</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('S')">S</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('T')">T</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('U')">U</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('V')">V</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('W')">W</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('X')">X</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('Y')">Y</a></div>				</td>
				<td class="boldEleven">
				<div align="center"><a class="whiteMedium" href="javascript:LoadDriverAssign('Z')">Z</a></div>				</td>
			</tr>
		</table></td>
  </tr>
  <tr>
    <td height="15"><input type="hidden" name="filename" value="DriverAssign">
      <input type="hidden" name="actionS" value="TRSDriverAssignDelete"></td>
  </tr>
  <tr>
    <td><table border="0" align="center" cellpadding="1" cellspacing="1">
      <tr>
        <td width="56"><input type="submit" class="ButtonHead"
					onClick="Add()" name="action1" value="Add"></td>
        <td width="56"><input type="submit" class="ButtonHead" id="Edit"
					onClick="return BEdit()" name="action1" value="Edit"></td>
       
	   <%
	  String usertype=""+session.getAttribute("USRTYPE");
	  if("F".equals(usertype)|| ArrayUtils.contains(CommonFunctions.QueryExecute("SELECT CHR_DELETEUSER  FROM m_inventorysetting  WHERE INT_ROWID=1")[0][0].split(","), session.getAttribute("USRID").toString()))
	  {
	  %>
				<td width="56"><input type="submit" class="ButtonHead"
					name="Delete" id="Delete" value="Delete"
					onClick="return FDelete()" /></td>
				<%
		}
		else
		{ 
			out.println("<input type='hidden'  name ='Delete' id='Delete'>");
		}


		%>

 
        <td width="56"><input type="button" class="ButtonHead"
					name="submit"  value="Close"   accesskey="c"  onClick="redirect('Transportmain.jsp')"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
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
