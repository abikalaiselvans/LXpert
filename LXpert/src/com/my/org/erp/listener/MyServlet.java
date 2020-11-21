package com.my.org.erp.listener;

import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
 
public class MyServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    		ServletConfig conf = getServletConfig();
    		ServletContext ctx = conf.getServletContext();
            ctx.setAttribute("User", "Pankaj");
            String user = (String) ctx.getAttribute("User");
            ctx.removeAttribute("User");
             
            HttpSession session = request.getSession();
            session.invalidate();
             
            PrintWriter out = response.getWriter();
            out.write("Hi "+user);
    }
 
}