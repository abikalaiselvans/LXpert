package com.my.org.erp.chats.servlet;

import java.io.*;
import java.util.Enumeration;
import java.util.Properties;
import javax.servlet.*;
import javax.servlet.http.*;
import com.my.org.erp.chats.ChatRoom;
import com.my.org.erp.chats.ChatRoomList;

public class ManageChatServlet extends HttpServlet
{

    /**
	 * 
	 */
	private static final long serialVersionUID = 747153647253485078L;
	ChatRoomList rooms;
    Properties props;

    public void init()
        throws ServletException
    {
        try
        {
            String s = "";
            s = "/WEB-INF/" + getServletContext().getInitParameter("chatpropertyfile");
            String s1 = getServletContext().getRealPath(s);
           
            if(s1 != null)
            {
                FileInputStream fileinputstream = new FileInputStream(s1);
                props = new Properties();
                props.load(fileinputstream);
                String s2;
                String s3;
                for(Enumeration enumeration = props.keys(); enumeration.hasMoreElements(); addNewRoom(rooms, s2, s3))
                {
                    s2 = (String)enumeration.nextElement();
                    s3 = props.getProperty(s2);
                    
                }

                fileinputstream.close();
                getServletContext().setAttribute("chatroomlist", rooms);
                System.err.println("Room List Created");
            } 
            else
            {
                
            	System.out.println("Unable to get realpath of chatproperty file " + s + ".\nCheck that application war file is expanded and file can be read.\nChat appli" +
"cation won't work."
);
            }
        }
        catch(FileNotFoundException filenotfoundexception)
        {
            System.err.println("Properites file not found:" + filenotfoundexception.getMessage());
        }
        catch(IOException ioexception)
        {
            System.out.print("Unable to load Properties File: " + ioexception.getMessage());
        }
    }

    
    
    
    public void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse) throws ServletException, IOException
    {
    	httpservletresponse.setContentType("text/html");
        PrintWriter printwriter = httpservletresponse.getWriter();
        printwriter.println("Room List Created");
        printwriter.close();
    }

    
    
    public void doPost(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse) throws ServletException, IOException
    {
    	String s = httpservletrequest.getParameter("rn");
        String s1 = httpservletrequest.getParameter("rd");
        if(s == null || (s = s.trim()).length() == 0 || s1 == null || (s1 = s1.trim()).length() == 0)
        {
            httpservletrequest.setAttribute("error", "Please specify the room name and room description");
            getServletContext().getRequestDispatcher("/chat/addRoom.jsp").forward(httpservletrequest, httpservletresponse);
            return;
        }
        if(s != null && s.indexOf(" ") != -1)
        {
            httpservletrequest.setAttribute("error", "Room Name cannot contain spaces");
            getServletContext().getRequestDispatcher("/chat/addRoom.jsp").forward(httpservletrequest, httpservletresponse);
            return;
        }
        try
        {
            if(rooms != null)
            {
                addNewRoom(rooms, s, s1);
            }
            String s2 = getServletContext().getInitParameter("saveRooms");
            boolean flag = false;
            if(s2 != null && "true".equals(s2))
            {
                Boolean boolean1 = Boolean.valueOf(s2);
                flag = boolean1.booleanValue();
            }
            if(flag)
            {
                if(props != null)
                {
                    props.put(s, s1);
                    String s3 = "/WEB-INF/" + getServletContext().getInitParameter("chatpropertyfile");
                    String s4 = getServletContext().getRealPath(s3);
                    FileOutputStream fileoutputstream = new FileOutputStream(s4);
                    props.store(fileoutputstream, "List of Rooms");
                    fileoutputstream.close();
                } else
                {
                    httpservletresponse.setContentType("text/html");
                    PrintWriter printwriter = httpservletresponse.getWriter();
                    printwriter.println("Properties are null");
                }
            }
           httpservletresponse.sendRedirect(httpservletrequest.getContextPath() + "/chat/listrooms.jsp");
        }
        catch(Exception exception)
        {
            System.err.println("Exception: " + exception.getMessage());
        }
    }

    public void addNewRoom(ChatRoomList chatroomlist, String s, String s1)
    {
        String s2 = getServletContext().getInitParameter("maxNoOfMessages");
        int i = 25;
        if(s2 != null)
        {
            try
            {
                i = Integer.parseInt(s2);
            }
            catch(NumberFormatException numberformatexception) { }
        }
        ChatRoom chatroom = new ChatRoom(s, s1);
        chatroom.setMaximumNoOfMessages(i);
        rooms.addRoom(chatroom);
    }

    public void destroy()
    {
        System.err.println("Destroying all rooms");
    }

    private final void _mththis()
    {
        rooms = new ChatRoomList();
        props = null;
    }

    public ManageChatServlet()
    {
        _mththis();
    }
}
