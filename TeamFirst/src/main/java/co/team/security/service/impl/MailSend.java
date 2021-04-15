package co.team.security.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import co.team.security.service.MailAuth;

public class MailSend {
	public void MailSend() {}
    
    public void MailSend(String email, String setRawPw, String id) {
    	String mailtext ="<p>아이디: "+id+"</p><br><p>비밀번호 : "+setRawPw+"<p>";
        Properties prop = System.getProperties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        
        Authenticator auth = new MailAuth();
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
    
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("freefitteam@gmail.com", "PYRAMID FIT"));
            InternetAddress to = new InternetAddress(email);         
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject("비밀번호 변경 메일", "UTF-8");            
            msg.setText(mailtext, "UTF-8", "html");            
            
            Transport.send(msg);
            
        } catch(AddressException ae) {            
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
        }
                
    }
}
