<%@ page import="java.io.*,java.util.*" errorPage="../error/index.jsp"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>

<script language="javascript" src="../JavaScript/comfunction.js"></script>
 <%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<style type="text/css">
<!--
@import url("../JavaScript/SmartStyles.css");
-->
</style>
<body >
<script language="javascript">
 function Print(query)
	{
		var width="600", height="400";
  		var left = (screen.width/2) - width/2;
		var top = (screen.height/2) - height/2;
  		var styleStr = 'menubar=yes,scrollbars=yes,resizable=yes,copyhistory=yes,width='+width+',height='+height+',left='+left+',top='+top+',screenX='+left+',screenY='+top;
		newWindow = window.open(query,"subWind",styleStr);
		newWindow.focus( );
	}
	
</script>
<%@ include file="indexinv.jsp"%>
<form method="post" action="Rept_StockinDay.jsp" >
<table width="56" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table class="BackGround1" cellspacing="0" cellpadding="0" width="300"
			align="center" border="0">
      <tbody>
        <tr>
          <td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/Smart Inventory/TLCorner.gif" width="7" /></td>
          <td class="BorderLine" height="0"><spacer height="1" width="1"
						type="block" /></td>
          <td colspan="2" rowspan="2" valign="top"><img height="7"
						src="../Image/Smart Inventory/TRCorner.gif" width="7" /></td>
        </tr>
        <tr>
          <td height="6"><spacer height="1" width="1" type="block" /></td>
        </tr>
        <tr>
          <td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
          <td width="6"><spacer height="1" width="1" type="block" /></td>
          <td width="412"><table cellspacing="2" cellpadding="2" width="298" align="center"
						border="0">
              <!--DWLayoutTable-->
              <tbody>
                <tr>
                  <td height="16" colspan="3" align="center" valign="top"
									class="boldThirteen">Stock</td>
                </tr>
                <tr>
                  <td height="19" colspan="3" align="right" valign="top"><span
									class="bolddeepred">* </span><span class="fairyHead">Mandatory </span></td>
                </tr>
                 
                <tr>
                  <td width="199" height="17" class="boldEleven">Branch</td>
                  <td width="287" colspan="2" align="left">
				  <select name="Branch" class="formText135" id="Branch" tabindex="6" style="width:200">
										<option value="0">All</option>
										<%
								String branchid=""+session.getAttribute("BRANCHID");
								String sql ="Select a.INT_BRANCHID,a.CHR_BRANCHNAME ,b.CHR_COMPANYNAME from  com_m_branch  a  ,com_m_company b where  a.INT_COMPANYID = b.INT_COMPANYID ";	
				if("N".equals(CommonFunctions.QueryExecute("SELECT  CHR_DISPLAYINACTIVECOMPANY FROM m_institution  WHERE INT_ID=1")[0][0]))			  
					sql = sql + " AND b.INT_ACTIVE =1 ";
								
				String shipids[][] =  CommonFunctions.QueryExecute(sql);
								for(int u=0; u<shipids.length; u++)
									out.print("<option value='"+shipids[u][0]+"'>"+shipids[u][2]+ "  @  " +shipids[u][1] +"</option>");
							%>
						</select>				  </td>
                </tr>
                <tr>
                  <td height="17" class="boldEleven">Division</td>
                  <td colspan="2" align="left"><select name="division"
									class="formText135" id="division" tabindex="1">
                      <option value='0'>All</option>
                      <%
								String division[][] = com.my.org.erp.common.CommonFunctions.QueryExecute("Select INT_DIVIID,CHR_DIVICODE from inv_m_division   WHERE INT_DIVIID >0 AND CHR_OFFICEIDS LIKE '%"+session.getAttribute("INVOFFICEID")+"%'  ORDER BY CHR_DIVICODE"); 
								for(int u=0; u<division.length; u++)
									out.print("<option value='"+division[u][0]+"'>"+division[u][1]  +"</option>");
							%>
                  </select></td>
                </tr>
                <tr>
                  <td height="17" class="boldEleven">Product Type</td>
                  <td colspan="2" align="left"><select name="Producttype" id="Producttype"  style="width:200">
                    <option value="0">All</option>
                    <option value="P">Product</option>
                    <option value="I">Item</option>
                  </select></td>
                </tr>
                <tr>
                  <td height="17" colspan="3" class="boldEleven"><table id="s2" width="249" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td class="boldEleven">Days</td>
                                  <td class="boldEleven">&gt;=</td>
                                  <td class="boldEleven"><input name="from" type="text" class="formText135" id="from" onKeyPress="numericValue('from','6')" value="0" size="10" maxlength="6"></td>
                                  <td class="boldEleven">&lt;=</td>
                                  <td class="boldEleven"><input name="to" type="text" class="formText135" id="to" onKeyPress="numericValue('to','6')" value="999" size="10" maxlength="6"></td>
                                </tr>
                              </table> </td>
                  </tr>
                <tr>
                  <td height="17" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
                  <td colspan="2" align="left"><!--DWLayoutEmptyCell-->&nbsp;</td>
                </tr>
                <tr>
                  <td height="17" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
                  <td colspan="2" align="left"><!--DWLayoutEmptyCell-->&nbsp;</td>
                </tr>
                 
                <tr>
                  <td height="17" colspan="3" class="boldEleven"><table width="112" border="0" align="center" cellpadding="1"
									cellspacing="1">
                      <tr>
                        <td><input name="Submit" type="submit"
											class="buttonbold13" value="Submit"   accesskey="s"   ></td>
                        <td><input name="Close" type="button"
											class="buttonbold13" id="Close"  value="Close"   accesskey="c" 
											onClick="javascript:window.close()"></td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="17" class="boldEleven"><!--DWLayoutEmptyCell-->&nbsp;</td>
                  <td colspan="2" align="left"><!--DWLayoutEmptyCell-->&nbsp;</td>
                </tr>
              </tbody>
              <input type="hidden" name="mobileBookingOption" />
          </table></td>
          <td nowrap="nowrap" width="4"><spacer height="1" width="1"
						type="block" /></td>
          <td class="BorderLine" width="1"><spacer height="1" width="1"
						type="block" /></td>
        </tr>
        <tr>
          <td colspan="2" rowspan="2"><img height="7"
						src="../Image/Smart Inventory/BLCorner.gif" width="7" /></td>
          <td height="6"><spacer height="1" width="1" type="block" /></td>
          <td colspan="2" rowspan="2"><img height="7"
						src="../Image/Smart Inventory/BRCorner.gif" width="7" /></td>
        </tr>
        <tr>
          <td class="BorderLine" height="0"><spacer height="1" width="1"
						type="block" /></td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</form><%@ include file="../footer.jsp"%>
</body>
</html>
