package com.my.org.erp.image;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBConnection.DBCon;
@WebServlet("/DownloadStaffImage")
public class DownloadStaffImage extends HttpServlet 
{
 
	private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,  ServletException 
  {
	  try 
	    {
		    
		  String myid = ""+request.getParameter("myid");
		  DBCon con = new DBCon();
		  Connection conn = con.getConnection();
		  Blob photo = null;
		  Statement stmt = null;
		  ResultSet rs = null;
		  String query = "select IMG_IMAGE from com_m_staffaddressproof  where  CHR_EMPID = '"+myid+"'";
		  ServletOutputStream out = response.getOutputStream();
		  stmt = conn.createStatement();
		  rs = stmt.executeQuery(query);
		  if (rs.next()) 
			 photo = rs.getBlob(1);
          response.setContentType("image/jpg");
          response.setHeader("Content-disposition","attachment; filename=" +myid);
	      InputStream in = photo.getBinaryStream();
	      int length = (int) photo.length();
	
	      int bufferSize = 1024;
	      byte[] buffer = new byte[bufferSize];
	
	      while ((length = in.read(buffer)) != -1) 
	      {
	        out.write(buffer, 0, length);
	      }
	
	      in.close();
	      out.flush();
	      rs.close();
	      stmt.close();
	      conn.close();
	      
    } 
	
	  catch (Exception e) 
	  {
		  	System.out.println(e.getMessage());
		  	request.setAttribute("error", e.getMessage() );
		  	RequestDispatcher dispatchers = request.getRequestDispatcher("/error/index.jsp");
		  	dispatchers.forward(request, response); 
	  } 
	
  }
}
