<%@ page 	import="java.lang.*,java.util.*,java.io.*,java.sql.*,com.my.org.erp.ServiceLogin.*"%>
<%@ page 	import="com.my.org.erp.common.CommonFunctions"%>
<script language="javascript" src="../JavaScript/comfunction.js"></script>
<script language="javascript">
  function LoadImage()
    { 
		var fname=document.getElementById("F1").value;
    	document.getElementById("Photo").src=document.getElementById("F1").value; 	
    }	
	
 function Load()
  	{
  		 
		if(  findSize('F1','File should be less than 1MB') && checkNull('F1','Select Scanned document ')  )
  		{
			var file = document.getElementById("F1").value;
			var fileExtn = file.lastIndexOf(".");
			var Extn=file.substring(fileExtn);
			if((Extn == ".PDF") ||(Extn == ".pdf") )
			{
				return true;
			}
			else
			{
				alert("Only possible PDF only");
				return false;
			}
		}
   		else
		{
   			
			return false;
  		}
		
 	}  
	
function findSize(ctr,msg) 
{
    var fileInput =  document.getElementById(ctr);
    try
	{
		var s = fileInput.files[0].size;
		// 1 MB = 1048579 bytes
		if( s <= 1048579)
			return true;
		else
		{
			alert(msg);
			return false;
		}	
        //alert(fileInput.files[0].size); // Size returned in bytes.
    }
	catch(e)
	{
        var objFSO = new ActiveXObject("Scripting.FileSystemObject");
        var e = objFSO.getFile( fileInput.value);
        var fileSize = e.size;
        alert(fileSize);    
		return false;
    }
}



	
 </script>
<HTml>
<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
<title><%=CommonFunctions.QueryExecute("SELECT CHR_MODULETITLE FROM m_projectmodule WHERE CHR_SHORTNAME='CON' ")[0][0]%></title><BODY> <FORM name="frm"  ENCTYPE="multipart/form-data" ACTION= "CopyUploadConveyance_File.jsp?staffid=<%=request.getParameter("Rowid")%>" METHOD="POST" onSubmit="return Load()">
                <br><br><br>
           
		   
		   <table border="0" align="center" cellpadding="2" cellspacing="2"  >
          	   <tr> <td colspan="2"><p align= "center"><B>  UPLOADING SCANNED </B><strong>DOCUMENTS</strong></td></tr>
			   
			   <tr><td><b>Choose the file To Upload:</b></td>
			   <td><INPUT NAME="F1" id="F1"  TYPE="file" onChange="LoadImage()"></td></tr>
			   <tr>
			     <td colspan="2"><div align="center" class="boldElevenlink">( file size should be   &lt;=1MB ) </div></td>
		     </tr>
			   <tr>
			     <td colspan="2"><div align="center"><img src="../StaffPhoto/default.jpg"
			width="100" height="130" border="1" id="Photo"  name="Photo" title="Image should be 100 x 130 pixel" /></div></td>
		     </tr>
			   <tr><td colspan="2"><p align="right"><INPUT TYPE="submit" VALUE="Upload File" >
			   </p></td></tr>
    </table>
            
     </FORM>
</BODY>
</HTML>