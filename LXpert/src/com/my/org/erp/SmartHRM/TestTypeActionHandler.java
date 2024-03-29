package com.my.org.erp.SmartHRM;

import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
import com.my.org.erp.ServiceLogin.AbstractActionHandler;
 
 
public class TestTypeActionHandler extends AbstractActionHandler 
{
	
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			String action = request.getParameter("actionS");
			HttpSession session = request.getSession();
			String user  = (String) session.getAttribute("USRID");
			if (action.equals("HRMTestTypeDelete")) 
			{
				String ids[] = request.getParameterValues("id");
				acs = con.prepareCall("{call  HRM_PRO_TESTTYPE(?,?,?,?,? )}");
				for (int i = 0; i < ids.length; i++) 
				{
					acs.setString(1, "DELETE");
					acs.setString(2, ids[i]);
					acs.setString(3, "");
					acs.setString(4, null);
					acs.setString(5, null);
					acs.addBatch();
				}
				System.out.println(""+acs);
				acs.executeBatch();
				acs.close();
				con.close();   
				response.sendRedirect("Smart HRM/TestType.jsp");
			}
			else if ( "HRMTestTypeAdd".equals(action) ) 
			{
				String name=request.getParameter("Name");
				String desc=request.getParameter("desc");
				name=name.trim();
				acs = con.prepareCall("{call  HRM_PRO_TESTTYPE(?,?,?,?,? )}");
				acs.setString(1, "INSERT");
				acs.setString(2, " ");
				acs.setString(3, name);
				acs.setString(4, desc);
				acs.setString(5, user);
				System.out.println(""+acs);
				acs.execute();
				acs.close();
				con.close();   
				response.sendRedirect("Smart HRM/TestType.jsp");
			} 
			else if (action.equals("HRMTestTypeEdit")) 
			{
				String id=request.getParameter("id");
				String name=request.getParameter("Name");
				String desc=request.getParameter("desc");
				name=name.trim();
				acs = con.prepareCall("{call  HRM_PRO_TESTTYPE(?,?,?,?,? )}");
				acs.setString(1, "UPDATE");
				acs.setString(2, id);
				acs.setString(3, name);
				acs.setString(4, desc);
				acs.setString(5, user);
				System.out.println(""+acs);
				acs.execute();
				acs.close();
				con.close();   
				response.sendRedirect("Smart HRM/TestType.jsp");
			}
			
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
