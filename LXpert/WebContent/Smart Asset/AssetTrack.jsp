<%@ page import="java.io.*,java.util.*"%>
<%-- <%@ page import="sun.net.smtp.SmtpClient"%> --%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%> 
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ page import="org.apache.commons.lang.ArrayUtils"%> 


<%
try
{
%>


<html>
<head>
 
<title>:: ASSET ::</title>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  

 



 <style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style> 
</head>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript" src="../JavaScript/calendar1.js"></script>
<script language="javascript" src="../JavaScript/Asset/AssetTrack.js"></script>
<script language="JavaScript">
	 

    function Add()
	{ 
		document.frm.action="AssetTrackAdd.jsp";		
 	}

	function Edit()
 	{		
		var count;
		count=0;
		coffee1=document.forms[0].assetid
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
			if (document.forms[0].assetid.checked) { count=1;}
		}
		if(count==1)
		{			
			 
			document.frm.action="AssetTrackEdit.jsp";
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
		coffee1=document.forms[0].assetid;
		txt=""
		var id="";
		for (i=0;i<coffee1.length;++ i)
		{
			if (coffee1[i].checked)
			{
			count=count+1;
			id=i;
			}
		}
		if(count==0)
		{
			if (document.forms[0].assetid.checked) { count=1;}
		}
		
		if(count>1)
		{
			alert("Kindly select one value");
			return false;
		}
		if(count==1)
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

<body onLoad="LoadAssetTrack('0')">
<%@ include file="index.jsp"%>
<form  AUTOCOMPLETE = "off"   name="frm" method="post" action="../SmartLoginAuth">
<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	 
	<tr>
	  <td>	  </td>
	</tr>
	<tr>
		<td height="291"><table height="307" border="0" align="center"
			cellpadding="0" cellspacing="0" class="TableDesign"
			 >
          <tr >
            <td height="31" class="whiteHead" >ASSET TRACK </td>
          </tr>
          <tr >
            <td height="31" ><table width="100%" border="0" align="center" cellpadding="2" cellspacing="2" class="whiteMedium">
              <tr>
                <td><strong>Branch
                    <%
				String branchid=""+session.getAttribute("BRANCHID");
				String usertype=""+session.getAttribute("USRTYPE");
				String user= ""+session.getAttribute("USRID"); 
				 
			%>
                </strong></td>
                <td><span class="boldThirteen">
                  <select name="Branch" class="formText135"
							id="Branch" tabindex="6"  onChange="LoadAssetTrack('0')" style="width:200">
                    <%
								
				String shipids[][] =  CommonFunctions.QueryExecute("Select a.INT_BRANCHID,a.CHR_BRANCHNAME ,b.CHR_COMPANYNAME from  com_m_branch  a  ,com_m_company b where  a.INT_COMPANYID = b.INT_COMPANYID ");
				if(usertype.equals("F"))
				{
				  for(int u=0; u<shipids.length; u++)
					out.print("<option value='"+shipids[u][0]+"'>"+shipids[u][2]+" @ "+shipids[u][1]+"</option>");
				}
				else
				{
					 
					 for(int u=0; u<shipids.length; u++)
						out.print("<option value='"+shipids[u][0]+"'>"+shipids[u][2]+" @ "+shipids[u][1]+"</option>");
					 					
				}
						
							%>
                  </select>
                  <script language="javascript">
						  	setOptionValue("Branch","<%=branchid%>") 
						  </script>
                </span></td>
                <td><strong>Division</strong></td>
                <td><span class="boldThirteen">
                  <select name="divis"
							class="formText135" id="divis" tabindex="1"  onChange="LoadAssetTrack('0')"
							style="width:200">
                    <option value='0'>All</option>
                    <%
								String division[][] =  CommonFunctions.QueryExecute("Select INT_DIVIID,CHR_DIVICODE from inv_m_division");
								for(int u=0; u<division.length; u++)
									out.print("<option value='"+division[u][0]+"'>"+division[u][1]  +"</option>");
							%>
                  </select>
                </span></td>
              </tr>
              <tr>
                <td>Month</td>
                <td><select name="month" id="month" onChange="LoadAssetTrack('0')" style="width:200">
                  <%@ include file="../JavaScript/Inventory/month.jsp"%>
                </select></td>
                <td>Year</td>
                <td><select name="year" id="year"
							 onChange="LoadAssetTrack('0')" style="width:200">
                  <%@ include file="../JavaScript/Inventory/year.jsp"%>
                </select>
                  <script language='JavaScript' type="text/javascript">
				<!--			
						var d=new Date()
						var month1=d.getMonth() + 1
						if(month1<10) month1="0"+month1;
						var year1=d.getFullYear();
						setOptionValue('month',month1);
						setOptionValue('year',year1);							
				//-->
                      </script></td>
              </tr>
              <tr>
                <td colspan="4"><table width="200" border="0" align="center" cellpadding="0" cellspacing="0" class="whiteMedium">
                  <tr>
                    <td  >Customer</td>
                    <td ><select
							name="customer" id="customer" class="formText135"
							onChange="LoadAssetTrack('0')">
                        <option value="0">All</option>
                        <%-- <jsp:include page="LoadCustomer.jsp" />   --%>                
                    </select></td>
                  </tr>
                </table></td>
                </tr>
            </table></td>
          </tr>
           

          <tr>
            <td height="18" valign="top" class="footermenu">
<table width='100%' border='0'    cellpadding='0' cellspacing='0' class="whiteMedium">
<tr><td ><div align="center"><b>S.No</b></div></td>
<td ><div align="center"><b>Company</b></div></td>
<td ><div align="center"><b>Branch</b></div></td>
<td ><div align="center"><b>Division</b></div></td>
<td ><div align="center"><b>Customer</b></div></td>
<td ><div align="center"><b>Empid</b></div></td>
<td ><div align="center"><b>Empname</b></div></td>
<td ><div align="center"><b>Sale Date</b></div></td>
<td ><div align="center"><b>Sale Invoice</b></div></td>
<td ><div align="center"><b>Status</b></div></td>
</tr></table>			</td>
          </tr>
          <tr class="MRow1">
            <td height="127" valign="top" class="footermenu">
			<div id="divscroll" style="OVERFLOW:auto;width:100%;height:240px" 	class="boldEleven">
						<div id="AssetEntry"></div>
			  </div>			</td>
          </tr>
        </table></td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
    </tr>
	<tr>
	  <td><table border="0" align="center" cellpadding="1"
			cellspacing="1" class="TableDesign">
        <tr class="para">
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('0')">All</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('A')">A</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('B')">B</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('C')">C</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('D')">D</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('E')">E</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('F')">F</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('G')">G</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('H')">H</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('I')">I</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('J')">J</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('K')">K</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('L')">L</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('M')">M</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('N')">N</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('O')">O</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('P')">P</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('Q')">Q</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('R')">R</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('S')">S</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('T')">T</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('U')">U</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('V')">V</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('W')">W</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('X')">X</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('Y')">Y</a></div></td>
          <td class="boldEleven"><div align="center"><a class="whiteMedium" href="javascript:LoadAssetTrack('Z')">Z</a></div></td>
        </tr>
      </table></td>
    </tr>
	<tr>
	  <td>&nbsp;</td>
    </tr>
	 
	<tr>
	  <td><input name="filename" type="hidden" value="AssetTrack" />
        <input
			name="actionS" type="hidden" value="ASSAssetTrackDelete" />
        <table width="224" border="0" align="center" cellpadding="01"
			cellspacing="0">
        <!--DWLayoutTable-->
        <tr>
          <td width="56" valign="top"><input type="submit"
					class="ButtonHead" name="action1"  value="Add"   accesskey="s"   onClick="Add()" /></td>
          <td width="56" valign="top"><input type="submit"
					class="ButtonHead" name="action12" id="btnEdit" value="Edit"
					onclick="return Edit()" /></td>
          
		  

<%
	   
	  if("F".equals(usertype)|| ArrayUtils.contains(CommonFunctions.QueryExecute("SELECT CHR_DELETEUSER  FROM m_inventorysetting  WHERE INT_ROWID=1")[0][0].split(","), session.getAttribute("USRID").toString()))
	  {
	  %>
				<td width="56"><input type="submit" class="ButtonHead"
					name="Delete" id="Delete" value="Delete"
					onClick="return Delete()" /></td>
				<%
		}
		else
		{ 
			out.println("<input type='hidden'  name ='Delete' id='Delete'>");
		}


		%>



		  
          <td width="56"><input type="button" class="ButtonHead"
					name="submit"  value="Close"   accesskey="c"  onClick="redirect('Assetmain.jsp')" /></td>
        </tr>
      </table></td>
    </tr>
</table>
 
  
 <%@ include file="../footer.jsp"%></form>
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
