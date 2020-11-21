package com.my.org.erp.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.my.org.erp.setting.CommonData;

public class EmailTest {

	public static void main(String[] args) {

		String mailSmtpHost = "192.168.0.25";

		String mailTo = "gaa@careind.net";
		String mailCc = ""+CommonData.mailid;
		String mailFrom = ""+CommonData.mailid;
		String mailSubject = "Email from Java";
		String mailText = "This is an email from Java";

		sendEmail(mailTo, mailCc, mailFrom, mailSubject, mailText, mailSmtpHost);
	}

	public static void sendEmail(String to, String cc, String from, String subject, String text, String smtpHost) {
		try 
		{
			 
			    
			String host ="192.168.0.5"   ;
            String user ="connect"  ;
            String password ="connect"   ;
            from =CommonData.mailid  ;
             
            System.out.println(host);
            System.out.println(user);
            System.out.println(password);
            
            Properties properties = new Properties();
            properties.setProperty("mail.transport.protocol", "smtp");
            properties.setProperty("mail.host", ""+host);
            properties.setProperty("mail.user", ""+user);
            properties.setProperty("mail.password", ""+password);
  	        
  	        
			Session emailSession = Session.getDefaultInstance(properties);
			System.out.println("=========");
			Message emailMessage = new MimeMessage(emailSession);
			emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			emailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress(cc));
			emailMessage.setFrom(new InternetAddress(from));
			emailMessage.setSubject(subject);
			emailMessage.setText(text);
			System.out.println("=========");
			emailSession.setDebug(true);

			Transport.send(emailMessage);
		} catch (AddressException e) {
			 System.out.println(e.getMessage());
		} catch (MessagingException e) {
			 System.out.println(e.getMessage());
		}
	}
}