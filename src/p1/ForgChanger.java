package p1;

import java.io.*;
import java.sql.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.http.*;

public class ForgChanger extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        HttpSession session=req.getSession(true);
        
        final String to,subject,body,id,pass;
        
        String email=req.getParameter("mail");
        
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
       
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","admin","thundereagle");
            st=con.createStatement();
            rs=st.executeQuery("select PASSWORD from PORTAL_USERS where EMAIL='"+email+"'");
            boolean b=rs.next();
            if(b==false)
            {
               out.println("No such user!!");
               res.sendRedirect("register.jsp"); 
            }
            else if(b==true)
            {
            //start code to send message
            to=email;
            subject="Password Recovery";
            body="Your password is "+rs.getString(5);
            id="downloader@gmail.com";
            pass="eagle";
            
            Properties props=new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
               
            Session ses=Session.getDefaultInstance(props,new javax.mail.Authenticator() { 
                protected PasswordAuthentication getPasswordAuthentication(){ 
                    return new PasswordAuthentication(id,pass);}});
            try
            {
                Message message=new MimeMessage(ses);
                message.setFrom(new InternetAddress(id));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
                message.setSubject(subject);
                message.setText(body);
                Transport.send(message);
            }catch(MessagingException e){
                out.print("connect to internet first");
                throw new RuntimeException(e);
                }
            //ens code to send message
            
             session.setAttribute("msg_sent", "msg_sent");
             res.sendRedirect("register.jsp");
            }
            
            }catch(Exception e)
            {
             session.setAttribute("msg_sent_fail", "msg_sent_fail");
             res.sendRedirect("register.jsp");
            } 
             finally
             {
               try{
               con.close();}catch(Exception e){}
             }
        }
    }

   