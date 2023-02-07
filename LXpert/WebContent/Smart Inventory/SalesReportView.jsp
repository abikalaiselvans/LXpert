<jsp:root version="1.2" xmlns:jsp="http://java.sun.com/JSP/Page"
	xmlns:c="urn:jsptld:http://java.sun.com/jstl/core"
	xmlns:display="urn:jsptld:http://displaytag.sf.net">
	<jsp:directive.page import="java.io.BufferedReader" />
	<jsp:directive.page import="java.io.FileReader" />
	<jsp:directive.page import="com.my.org.erp.SmartInventory.SalesReport" />
	<jsp:directive.page contentType="text/html; charset=UTF-8" />
	<jsp:directive.page import="java.sql.*" />
	<jsp:directive.page import="java.util.*" />

	<jsp:declaration>
  	String reportHeader="";
  </jsp:declaration>
	<jsp:text>
		<![CDATA[<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">]]>
	</jsp:text>

	<jsp:text>
		<![CDATA[<html xmlns="http://www.w3.org/1999/xhtml" lang="en">]]>
	</jsp:text>
	<head>
	<title>:: INVENTORY ::</title>	<meta http-equiv="Expires" content="-1" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style type="text/css" media="all">
      @import url("../JavaScript/css/maven-base.css");
      @import url("../JavaScript/css/maven-theme.css");
      @import url("../JavaScript/css/site.css");
      @import url("../JavaScript/css/screen.css");
  </style>
	<link rel="stylesheet" href="../JavaScript/css/print.css"
		type="text/css" media="print" />
	<link href="../Styles/styles.css" rel="stylesheet" type="text/css" />
	</head>
	<jsp:text>
		<![CDATA[<body    bgcolor="#EFEFEF">
    <embed src="../Image/General/college.swf" width="1000" height="110"/>
    <br><br>
    ]]>
	</jsp:text>
	<jsp:text>
		<![CDATA[<center><br/><br/>]]>
	</jsp:text>
	<jsp:scriptlet>
  	String caption="Sales Report";
  	ArrayList arrList =new ArrayList();	
	FileReader fr = new FileReader("SalesReport.sys");
	BufferedReader br  = new BufferedReader(fr);
	String strfline ="";
	StringTokenizer filecontents;
	String sline="";	
	int fline=1;
	while((strfline=br.readLine())!= null )	
	{	
		if(fline==1) reportHeader=strfline;
		if(fline>=3)
		{
			filecontents = new StringTokenizer(strfline,"^");
			if (! strfline.equalsIgnoreCase("Record not found..."))
			{		
				SalesReport salesRep=new SalesReport();
				while(filecontents.hasMoreElements())
				{
					String salesId=""+filecontents.nextElement();
					if (salesId.equalsIgnoreCase("Record not found..."))	break;
					salesRep.setSalesId(salesId);
					if(filecontents.hasMoreElements())
						salesRep.setCustomerName(""+filecontents.nextElement());
					if(filecontents.hasMoreElements())
 						salesRep.setOrderDate(""+filecontents.nextElement());
					if(filecontents.hasMoreElements())
						salesRep.setAmount(""+filecontents.nextElement());
					if(filecontents.hasMoreElements())
						salesRep.setTaxAmount(""+filecontents.nextElement());
					if(filecontents.hasMoreElements())
						salesRep.setTotalAmount(""+filecontents.nextElement());
					if(filecontents.hasMoreElements())
					{
						String temp=""+filecontents.nextElement();
						temp=temp.trim();
						
						String status="";
						if(temp.equals("0"))
							status="Received";
						else if(temp.equals("1"))
							status="Pending";
						
						salesRep.setOrderStatus(""+status);
					}
					  
					if(filecontents.hasMoreElements())
					{	
						String temp=""+filecontents.nextElement();
						temp=temp.trim();
						String status="";
						if(temp.equals("0"))
							status="Closed";
						else if(temp.equals("1"))
							status="Balance";
						salesRep.setPaymentStatus(""+status);						
					}	
					arrList.add(salesRep);
				}
			}
		}
		fline = fline + 1;
	}	
	br.close();
	fr.close();
	pageContext.setAttribute("tableclass", "");
    request.setAttribute("results", arrList);
  
  </jsp:scriptlet>
	<display:table name="results" pagesize="15" export="true"
		id="currentRowObject">
		<display:caption>
			<jsp:scriptlet>	out.println(reportHeader);</jsp:scriptlet>
		</display:caption>
		<display:setProperty name="export.pdf.filename" value="example.pdf" />
		<display:setProperty name="export.rtf.filename" value="example.rtf" />
		<display:column property="salesId" title="ID" sortable="true"
			headerClass="sortable" />
		<display:column property="customerName" title="Customer Name"
			sortable="true" headerClass="sortable" />
		<display:column property="orderDate" title="Order Date" />
		<display:column property="amount" title="Amount" />
		<display:column property="taxAmount" title="Tax Amount" />
		<display:column property="totalAmount" title="Total Amount" />
		<display:column property="orderStatus" title="Order Status" />
		<display:column property="paymentStatus" title="Payment Status" />
	</display:table>
	<jsp:text>
		<![CDATA[
     		<a href='ReportPrint.jsp' target='_blank'> HTML Print </a>
     		<br/>      		
      		<a href="Sales Datewise.jsp"> Back </a>
      		</center>
      	]]>
	</jsp:text>
</jsp:root>
