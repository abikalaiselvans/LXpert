<html>

    <body  onpaste='return false;'>

    <br><br>

    <table width="200px" style="border:1px solid #ff0000;background-color:f7f7f7" align="center">

    <tr style="font-weight:bold;">

    <td align="center"  colspan=2 style="border-bottom: 2px solid #000000;">Download Csv File</td>

    </tr>

 <tr style="font-weight:bold;">

       <td align="center" style="border-bottom: 2px solid #000000;">Id</td>

       <td align="center" style="border-bottom: 2px solid #000000;">File</td>

    </tr>

    <%@ page import="java.io.*,java.util.*,java.sql.*" %> 

    <%

    

         String connectionURL = "jdbc:mysql://localhost:3306/smartcampus";

          String url=request.getParameter("WEB_URL");

          String Content=new String("");

          Statement stmt=null;

      Connection con=null;

    try

    {

        Class.forName("com.mysql.jdbc.Driver").newInstance();

        con=DriverManager.getConnection(connectionURL,"root",.mythra.mart"); 

        stmt=con.createStatement();

        String qry = "select INT_OFFICEID,CHR_OFFICENAME,CHR_OFFICESHORTNAME from com_m_office ORDER BY CHR_OFFICENAME ";

        ResultSet rst= stmt.executeQuery(qry);

        while(rst.next())

        {

    %>

         <tr>

      <td align="center"><%=rst.getInt(1)%></td>

      <td align="center">

      <a href="file_download.jsp?id=<%=rst.getInt(1)%>"><%=rst.getString(3)%>.xls</a>

       </td>

    </tr>

    <%

        }

    

    }

    catch(Exception e){

        e.printStackTrace();

    }

    %>

    </table>

    </body>

    </html>