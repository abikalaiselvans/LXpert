<%@ page language="java"  import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<link rel="stylesheet" href="compose.css">
<link rel="stylesheet" href="nav.css">
<html>
<head>
<title>Ayush Mail</title>
</head>
<body  onpaste="return false;" topmargin=0 leftmargin=0>
<table border=0 width="780"  align=center cellspacing=0 cellpadding=0>
<tr>
	<td>

<jsp:include page="mailtop2.html" flush="true"/>
<form name=Manage method=post action="new_folder.jsp" >
<table border=0 width="100%" cellspacing=0 cellpadding=0>
<tr>
	<td valign=top width="20%"align=center bgcolor=#ECECFD>
	<br>
				<table border="0" cellpadding=0 cellspacing=0>
					<tr>
						<td><img src="images/dot.gif" height=1 width=1 border=0 alt=""></td>
						<td class="navBorderOut"><img src="images/dot.gif" height=1 width=1 border=0 alt=""></td>
						<td><img src="images/dot.gif" height=1 width=1 border=0 alt=""></td>
					</tr>
					 <table border="0" cellpadding=0 cellspacing=0>
					<tr>
						<td><img src="images/dot.gif" height=1 width=1 border=0 alt=""></td>
						<td class="navBorderOut"><img src="images/dot.gif" height=1 width=1 border=0 alt=""></td>
						<td><img src="images/dot.gif" height=1 width=1 border=0 alt=""></td>
					</tr>
					<tr>
						<td class="navBg">
							<table border="0" cellpadding=0 cellspacing=0 	width="138">
								<tr><td colspan=2 class="navBorderIn"><img src="images/dot.gif" height=1
								 width=1 border=0 alt=""></td></tr>
							<tr><td class="navBg"><img src="images/dot.gif" height=19 width=8 border=0
							 alt=""></td>
							<td width="100%"><font face="Verdana,Sans-serif" color="#FFFFFF" size=1><a href="mail_homepage.jsp" onmouseover="status='Compose';return true" 
							 class="navtxt">MailHome</a></font></td></tr>
							<tr><td colspan=2 class="navBorderOut"><img src="images/dot.gif" height=1 width=1
							 border=0 alt=""></td></tr>
							<tr><td colspan=2 class="navBorderIn"><img src="images/dot.gif" height=1 width=1
							 border=0 alt=""></td></tr>
							 <tr><td class="navBg"><img src="images/dot.gif" height=19 width=8 border=0
							 alt=""></td>
							<td width="100%"><font face="Verdana,Sans-serif" color="#FFFFFF" size=1><a href="read_mail.jsp" onmouseover="status='Compose';return true" 
							 class="navtxt">Inbox</a></font></td></tr>
							<tr><td colspan=2 class="navBorderOut"><img src="images/dot.gif" height=1 width=1
							 border=0 alt=""></td></tr>
							<tr><td colspan=2 class="navBorderIn"><img src="images/dot.gif" height=1 width=1
							 border=0 alt=""></td></tr>
							<tr><td class="navBg"><img src="images/dot.gif" height=19 width=8 border=0
							 alt=""></td>
							<td width="100%"><font face="Verdana,Sans-serif" color="#FFFFFF" size=1><a href="compose_mail.jsp" onmouseover="status='Compose';return true" 
							 class="navtxt">Compose</a></font></td></tr>
							<tr><td colspan=2 class="navBorderOut"><img src="images/dot.gif" height=1 width=1
							 border=0 alt=""></td></tr>
							<tr><td colspan=2 class="navBorderIn"><img src="images/dot.gif" height=1 width=1
							 border=0 alt=""></td></tr>
							<tr><td class="navBg"><img src="images/dot.gif" height=19 width=8 border=0
							 alt=""></td>
							<td width="100%"><font face="Verdana,Sans-serif" color="#FFFFFF" size=1><a href="view_address.jsp" onmouseover="status='Address Book';return true" class="navtxt">Address Book</a></font></td></tr>
							<tr><td colspan=2 class="navBorderOut"><img src="images/dot.gif" height=1 width=1
							 border=0 alt=""></td></tr>
							<tr><td colspan=2 class="navBorderIn"><img src="images/dot.gif" height=1 width=1
							 border=0 alt=""></td></tr>
							<tr><td class="navBg"><img src="images/dot.gif" height=19 width=8 border=0
							 alt=""></td>
							<td width="100%"><font face="Verdana,Sans-serif" color="#FFFFFF" size=1><a href="http://login.mail.lycos.com/bounce.shtml?goto=options&cached=1" onmouseover="status='Options';return true" 
							 class="navtxt">Options</a></font></td></tr>
							<tr><td colspan=2 class="navBorderOut"><img src="images/dot.gif" height=1 width=1
							 border=0 alt=""></td></tr>
							
					</table>
					</td>
					</tr>
				 </table>
				 </td>
				 <td width=80%>
							<font face=verdana size=5 color=#996699><b>Manage Folders</b>	</font><br>
							<br>
					<table border=0 cellspacing=20 width=80%>
					<tr>
						<td>
						<font face=verdana size=2 color=#6600CC>
							Enter Folder Name:
						</td>
						<td><INPUT TYPE=text NAME=foldername maxlength=10><font face=verdana size=2 color=#6600CC>
						</td>
					</tr>
					<TR>
					<td colspan=2 style="border-bottom: solid #6600CC 1px;">&nbsp;<input type=hidden name =redirect value="Manage_Folders.jsp">
					</td>
					</TR>
					<tr>
						<td colspan=2 valign=top><input type="submit" Value="   Ok  " class=sbttn >&nbsp;&nbsp;&nbsp;<input type="button" Value=Cancel class=sbttn >
						</td>
					</tr>
					</table>
				</td>
				</tr>
			</table>
			</form>
<body  onpaste='return false;'>

</html>
<%String error=request.getParameter("error");

if(error!=null){%>
<script>
	window.showModalDialog("Error.jsp?error=<%=error%>",'wname',"dialogWidth:360px;dialogHeight:217px;help:0;scroll:0;status:0;");
</script>
<%}%>