 <select name="category" class="formText135" id="category"  style="width:170">
	<option value="0">Select</option>
	<%
	String empcategorysql=" SELECT INT_EMPLOYEECATEGORYID,CHR_CATEGORYNAME  FROM   com_m_employeecategory WHERE CHR_STATUS='Y'   ORDER BY CHR_CATEGORYNAME ";
	String empcategoryData[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(empcategorysql);
	if (empcategoryData.length>0)
		for (int i=0; i<empcategoryData.length; i++) 
			out.println("<option value="+empcategoryData[i][0]+">"+empcategoryData[i][1] +"</option>");			
	
						%>

</select>
