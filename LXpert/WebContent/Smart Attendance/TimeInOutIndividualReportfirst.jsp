<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<html>
<head>
<script src="../JavaScript/common/StaffloadAjax.js"></script>
<script language="JavaScript" src="../JavaScript/calendar1.js"></script>
<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<script language="JavaScript">
function Validate()
{
 	if( checkNull("ename","Select Staff") )
		return true;
	else
		return false;
} 
</script>


<title> :: ATTENDANCE ::</title>


 
<style type="text/css">
<!--
.style3 {color: #FF0000}
-->
</style>
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="init()">
<%@ include file="index.jsp"%>
<table width="100%" border="0" cellspacing="1" cellpadding="2">
	<tr>
		<td width="100"></td>
	</tr>
	<tr>
		<td>
		<form  AUTOCOMPLETE = "off"   name="StaffManualAttendanceEditfrm" method="post"
			action="TimeInOutIndividualResponse.jsp">
		<table width="598" border="0" align="center" cellpadding="1"
			cellspacing="1">
			<tr>
				<td width="594">
				<table width="591" border="0" align="center" cellpadding="0"
					cellspacing="0" bgcolor="#dce4f9" class="BackGround">
					<tbody>
						<tr>
							<td colspan="2" rowspan="2"><img height="7"
								src="../Image/General/TLCorner.gif" width="7" /></td>
							<td class="BorderLine" height="1"><spacer height="1"
								width="1" type="block" /></td>
							<td colspan="2" rowspan="2"><img height="7"
								src="../Image/General/TRCorner.gif" width="7" /></td>
						</tr>
						<tr>
							<td height="6"><spacer height="1" width="1" type="block" /></td>
						</tr>
						<tr>
							<td class="BorderLine" width="1"><spacer height="1"
								width="1" type="block" /></td>
							<td width="6"><spacer height="1" width="1" type="block"></td>
							<td width="577" valign="top">
							<table width="577" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="2">
									<div align="center" class="boldEleven"><strong>Time In - Out Individual Report  </strong></div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<div align="right"><font color="#FF0000">* </font><span
										class="changePos">Mandatory</span></div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<div align="center"><%@ include
										file="../JavaScript/ajax.jsp"%></div>
									</td>
								</tr>
								<tr>
									<td colspan="2"></td>
								</tr>
                     <tr>
                        <td height="28" colspan="3" valign="middle" class="bolddeepblue"><table width="404" border="0" cellpadding="1" cellspacing="1">
                          <tr>
                            <td><div align="center"><span class="boldEleven">From&nbsp;&nbsp;&nbsp;&nbsp; :</span>
                              <input name="fdate" type=text class="formText135" id="fdate" onKeyPress="dateOnly(this)" size=15>
                              <a href="javascript:cal3.popup();"><img src="../JavaScript/img/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the date"></a></div><script language="JavaScript">
	var cal3 = new calendar1(document.forms['StaffManualAttendanceEditfrm'].elements['fdate']);
	cal3.year_scroll = true;
	cal3.time_comp = false;
	setCurrentDate('fdate');				
 </script> </td>
                            <td><div align="center"><span class="boldEleven">To&nbsp; &nbsp;&nbsp;&nbsp; :</span>
                              <input name="tdate"  id="tdate" type=text class="formText135" onKeyPress="dateOnly(this)" size=15>
                              <a href="javascript:cal4.popup();"><img src="../JavaScript/img/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the date"></a> </div></td>
                          </tr> <script language="JavaScript">
			var cal4 = new calendar1(document.forms['StaffManualAttendanceEditfrm'].elements['tdate']);
			cal4.year_scroll = true;
			cal4.time_comp = false;
			setCurrentDate('tdate');				
	</script>  
                        </table></td>
                      </tr>

								<tr>
									<td width="49%" height="19"><input name="filename"
										type="hidden" id="filename" value="Password"> <input
										name="actionS" type="hidden" id="actionS"
										value="ATTPasswordReset"></td>
									<td width="51%">&nbsp;</td>
								</tr>
								<tr>
									<td height="19" colspan="2">
									<table border="0" align="center" cellpadding="2"
										cellspacing="2">
										<tr>
											<td width="56"><input type="submit" name="Submit"
												id="submit_btn" class="buttonbold" value="Submit"   accesskey="s"   
												onClick="return Validate()" /></td>
											<td width="56"><input type="button" name="submit"
												class="buttonbold"  value="Close"   accesskey="c" 
												onClick="redirect('AttendanceMain.jsp')" /></td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
							</td>
							<td nowrap="nowrap" width="6"><spacer height="1" width="1"
								type="block" /></td>
							<td width="1" class="BorderLine"><spacer height="1"
								width="1" type="block" /></td>
						</tr>
						<tr>
							<td colspan="2" rowspan="2"><img height="7"
								src="../Image/General/BLCorner.gif" width="7" /></td>
							<td height="6"><spacer height="1" width="1" type="block" /></td>
							<td colspan="2" rowspan="2" valign="bottom">
							<div align="right"><img height="7"
								src="../Image/General/BRCorner.gif" width="7" /></div>
							</td>
						</tr>
						<tr>
							<td class="BorderLine" height="1"><spacer height="1"
								width="1" type="block" /></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
	<tr>
		<td><%@ include file="../footer.jsp"%></td>
	</tr>
</table>