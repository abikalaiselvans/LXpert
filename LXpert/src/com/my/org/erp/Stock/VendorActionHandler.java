package com.my.org.erp.Stock;
import java.io.IOException;
import java.sql.CallableStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.org.erp.ServiceLogin.AbstractActionHandler;
import com.my.org.erp.ServiceLogin.DateUtil;
public class VendorActionHandler extends AbstractActionHandler
{
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			HttpSession session=request.getSession();			
			String action=request.getParameter("actionS");
			String userid=""+session.getAttribute("USRID");
			String stkbranch=""+session.getAttribute("STKBRANCH");
			
			CallableStatement cs ;
			//branch,customerid,customername,legalname,street,city,state,postal,
			//country,areacode,phone,mobile,fax,email,website,active,sincefrom,
			//groupid,contactmobile,contactperson,tin

			if("STKVendorAdd".equals(action)) 
			{
				String vendorname= request.getParameter("vendorname");
				String legalname= request.getParameter("legalname");
				String street= request.getParameter("street");
				String city= request.getParameter("city");
				String state= request.getParameter("state");
				String postal= request.getParameter("postal");
				String country= request.getParameter("country");
				String areacode= request.getParameter("areacode");
				String phone= request.getParameter("phone");
				String mobile= request.getParameter("mobile");
				String fax= request.getParameter("fax");
				String email= request.getParameter("email");
				String website= request.getParameter("website");
				String active= request.getParameter("active");
				String sincefrom= request.getParameter("sincefrom");
				String vendorgroupid= request.getParameter("vendorgroupid");
				String contactmobile= request.getParameter("contactmobile");
				String contactperson= request.getParameter("contactperson");
				String tin= request.getParameter("tin");
				String cst= request.getParameter("cst");
				cs = con.prepareCall("{call CON_INV_PRO_VENDOR (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
				cs.setString(1, "INSERT");
				cs.setString(2, "1");
				cs.setString(3,stkbranch);
				cs.setString(4,vendorname);
				cs.setString(5,legalname);
				cs.setString(6,street);
				cs.setString(7,city);
				cs.setString(8,state);
				cs.setString(9,postal);
				cs.setString(10,country);
				cs.setString(11,areacode);
				cs.setString(12,phone);
				cs.setString(13,mobile);
				cs.setString(14,fax);
				cs.setString(15,email);
				cs.setString(16,website);
				cs.setString(17,active);
				cs.setString(18,DateUtil.FormateDateSQL(sincefrom));
				cs.setString(19,vendorgroupid);
				cs.setString(20,contactmobile);
				cs.setString(21,contactperson);
				cs.setString(22,tin);
				cs.setString(23,cst);
				cs.setString(24, userid);
				cs.execute();
				cs.close();
				response.sendRedirect("SmartStock/VendorView.jsp");
			}
			else if("STKVendorEdit".equals(action))
			{
				
				
				String vendorid= request.getParameter("vendorid");
				String vendorname= request.getParameter("vendorname");
				String legalname= request.getParameter("legalname");
				String street= request.getParameter("street");
				String city= request.getParameter("city");
				String state= request.getParameter("state");
				String postal= request.getParameter("postal");
				String country= request.getParameter("country");
				String areacode= request.getParameter("areacode");
				String phone= request.getParameter("phone");
				String mobile= request.getParameter("mobile");
				String fax= request.getParameter("fax");
				String email= request.getParameter("email");
				String website= request.getParameter("website");
				String active= request.getParameter("active");
				String sincefrom= request.getParameter("sincefrom");
				String vendorgroupid= request.getParameter("vendorgroupid");
				String contactmobile= request.getParameter("contactmobile");
				String contactperson= request.getParameter("contactperson");
				String tin= request.getParameter("tin");
				String cst= request.getParameter("cst");
				cs = con.prepareCall("{call CON_INV_PRO_VENDOR (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
				cs.setString(1, "UPDATE");
				cs.setString(2, vendorid);
				cs.setString(3,stkbranch);
				cs.setString(4,vendorname);
				cs.setString(5,legalname);
				cs.setString(6,street);
				cs.setString(7,city);
				cs.setString(8,state);
				cs.setString(9,postal);
				cs.setString(10,country);
				cs.setString(11,areacode);
				cs.setString(12,phone);
				cs.setString(13,mobile);
				cs.setString(14,fax);
				cs.setString(15,email);
				cs.setString(16,website);
				cs.setString(17,active);
				cs.setString(18,DateUtil.FormateDateSQL(sincefrom));
				cs.setString(19,vendorgroupid);
				cs.setString(20,contactmobile);
				cs.setString(21,contactperson);
				cs.setString(22,tin);
				cs.setString(23,cst);
				cs.setString(24, userid);
				cs.execute();
				cs.close();
				response.sendRedirect("SmartStock/VendorView.jsp");
			}
			else if("STKVendorDelete".equals(action))
			{
				String data[] =request.getParameterValues("Vendorid");
				try 
				{
					cs = con.prepareCall("{call CON_INV_PRO_VENDOR (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
					for(int y=0;y<data.length;y++)
					{
						cs.setString(1, "DELETE");
						cs.setString(2,data[y]);
						cs.setString(3,stkbranch);
						cs.setString(4,"");
						cs.setString(5,"");
						cs.setString(6,"");
						cs.setString(7,"");
						cs.setString(8,"");
						cs.setString(9,"");
						cs.setString(10,"");
						cs.setString(11,"");
						cs.setString(12,"");
						cs.setString(13,"");
						cs.setString(14,"");
						cs.setString(15,"");
						cs.setString(16,"");
						cs.setString(17,"");
						cs.setString(18,"");
						cs.setString(19,"");
						cs.setString(20,"");
						cs.setString(21,"");
						cs.setString(22,"");
						cs.setString(23,"");
						cs.setString(24, userid);
						cs.addBatch();				
					}
					cs.executeBatch();
					cs.close();
				}
				catch(Exception e)
				{
					
				}

				response.sendRedirect("SmartStock/VendorView.jsp");
				
			}
			 
		} 
		catch (Exception e) 
		{
				 System.out.println(e.getMessage());			
		}
	}	
}
