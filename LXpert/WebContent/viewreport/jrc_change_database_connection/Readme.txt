________________________________________________________________ 

Business Objects Support - jrc_change_database_connection

Web Site: 
http://www.businessobjects.com

Support Website:
http://support.businessobjects.com

________________________________________________________________ 

PRODUCT

This Java Server Pages (JSP) sample application is for use only with the Crystal Reports (CR) Java Reporting Component (JRC). 

________________________________________________________________ 

DESCRIPTION

This sample demonstrates how to change the database that a report uses at runtime in the JRC.
NOTES: To help determine what connection properties need to be changed at runtime through code, create
a copy of your original report and use the Crystal Reports designer to change this report to new datasource
manually.  Then use the jrc_display_connection_info helper sample to compare the connection information 
between the original report and the copy of that report pointing at the new datasource.  
The connection information properties from the output generated by the jrc_display_connection_info 
sample that are different in the report pointing at the new datasource from the original can 
then be set through code to help ensure that the database connection properties are changed correctly. 

________________________________________________________________ 

FILES
		
jrc_change_database_connection.jsp 
jrc_change_database_connection.rpt
CrystalReportViewer.jsp

________________________________________________________________ 

INSTALLATION

1. Setup an application context on your application server to host a web application. For assistance with setting up and deploying a web application using the Java Reporting Component, refer to this whitepaper:

http://support.businessobjects.com/communityCS/TechnicalPapers/cr_xi_r2_jrc_deployment.pdf

2. Extract the contents of this folder into your web application's context root.

3. In a browser window, launch the file jrc_change_database_connection.jsp as follows: 

http://<computer name>:<port number>/<web app>/jrc_change_database_connection.jsp 

________________________________________________________________

Last updated December 2005
________________________________________________________________ 