package com.my.org.erp.Account;

import java.io.IOException;

import java.sql.Statement;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.org.erp.ServiceLogin.AbstractActionHandler;
import com.my.org.erp.ServiceLogin.DateUtil;

public class CreditActionHandler extends AbstractActionHandler 
{
	public void handle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		try 
		{
			String action = request.getParameter("actionS");
			HttpSession session = request.getSession();
			String user  = (String) session.getAttribute("USRID");
			String branchid=(String)session.getAttribute("ACCBRANCH");
			String sql="";
			Statement st = con.createStatement();
			if ("ACCCreditAdd".equals(action))
			{
				String customer=request.getParameter("customer");
				String desc =request.getParameter("desc");
				String date =request.getParameter("date");
				String amount=request.getParameter("amount");
				
				sql = "INSERT INTO acc_t_credit  (INT_BRANCHID,INT_CUSTOMERID,DOU_AMOUNT,CHR_DESC,DAT_DATE,CHR_USRNAME,DT_UPDATEDATE,CHR_UPDATESTATUS) VALUES ";
				sql = sql +"(" ;
				sql = sql +""+branchid+" , ";
				sql = sql +""+customer+" , ";
				sql = sql +"'"+amount+"' , ";
				sql = sql +"'"+desc+"' , ";
				sql = sql +"'"+DateUtil.FormateDateSQL(date)+"' , ";
				sql = sql +" '"+user+"',NOW(),'Y'";
				sql = sql +")";
				st.execute(sql);
				st.close();
				response.sendRedirect("Smart Accounts/Credit.jsp");
			}
			else if ("ACCCreditEdit".equals(action))
			{
				String id=request.getParameter("id");
				String customer=request.getParameter("customer");
				String desc =request.getParameter("desc");
				String date =request.getParameter("date");
				String amount=request.getParameter("amount");
			 
				sql = "UPDATE  acc_t_credit  SET  " ;
				sql = sql +"INT_CUSTOMERID ="+customer+" , ";
				sql = sql +"DOU_AMOUNT ="+amount+" , ";
				sql = sql +"CHR_DESC ='"+desc+"' , ";
				sql = sql +"DAT_DATE ='"+DateUtil.FormateDateSQL(date)+"'   ";
				sql = sql +" WHERE INT_CREDITID= "+id;
				st.execute(sql);
				st.close();
				response.sendRedirect("Smart Accounts/Credit.jsp");
			}
			else if ("ACCCreditDelete".equals(action))
			{
				String ids[] = request.getParameterValues("id");
				for(int u=0;u<ids.length;u++)
				{
					st.execute("DELETE FROM acc_t_credit WHERE INT_CREDITID="+ids[u]);
				}
				st.close();
				response.sendRedirect("Smart Accounts/Credit.jsp");
			}
			
			st.close();
		} 
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
			 System.out.println(e.getMessage());
			response.sendRedirect("error/index.jsp?error=" + e.getMessage());
		}
	}

}
