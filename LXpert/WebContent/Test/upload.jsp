<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Page</title>
</head>
<body  onpaste='return false;'>
	<form name="form1" id="form1" action="../test" method="post" enctype="multipart/form-data">
	<input type="hidden" name="hiddenfield1" value="ok">
	Files to upload:
	<br/><br/>
	<!--<input type="file" size="50" name="file1">
	<br/><br/>
	<input type="file" size="50" name="file2">
	<br/><br/>
	<input type="file" size="50" name="file3">
	<br/><br/>-->
	<input type="submit" value="Upload">
	</form>
</body>
</html>