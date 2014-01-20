<%-- 
    Document   : lock
    Created on : 17-Jan-2014, 15:14:50
    Author     : nikos
--%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String fmatch=(String)session.getAttribute("match");
    String fusername=(String)session.getAttribute("username");
    

    try{
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SecretSanta","root", "");
    
    
    
    Statement st1 = conn.createStatement();
    Statement st2 = conn.createStatement();

    st1.executeUpdate("update users set mymatch=NULL where username='"+fusername+"'");
    st2.executeUpdate("update users set mymatch=NULL where username='"+fmatch+"'");

      
    }
    
    catch(Exception e){
        out.println("Unable to connect to database."); 
        e.printStackTrace();
    }
    
  
///////////////////////////////////////////mail/////////////////////////////////////////////////////
            String result="result";
            String to ="to";
            String user = fmatch;
            String from = "secretsantasitevolos@gmail.com";
            String pass = "volos2014";
            String host = "smtp.gmail.com";
            Properties props = System.getProperties();
            props.put("mail.smtp.starttls.enable", "true"); // added this line
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.user", from);
            props.put("mail.smtp.password", pass);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            
            Session mailSession = Session.getDefaultInstance(props,null);
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con =DriverManager.getConnection
                ("jdbc:mysql://localhost:3306/SecretSanta","root", "");
                stmt = con.createStatement();
             
                rs = stmt.executeQuery("SELECT * FROM userregister where username='"+user+"'");
                if(rs.next()){
                    to = rs.getObject(5).toString();
                    MimeMessage message = new MimeMessage(mailSession);
                    message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
                    message.setSubject("Νέα απο το ταίρι σου στο secret santa!");
                    message.setText("Δυστυχώς ο χρηστης '"+fusername+"' δε θελει να στείλει σε σένα δωρο."
                            + "Μπες στο SecretSanta Site ,κάνε Log in και βρες άλλο ταιρι!! ");
                    
                    Transport.send(message);
                     result = "Sent message successfully....";
                     
                }
            
            }catch (MessagingException mex) {
                    mex.printStackTrace();
                    result = "Error: unable to send message....";
             }catch (SQLException e) {
                throw new ServletException("Servlet Could not display records.", e);
            } catch (ClassNotFoundException e) {
             throw new ServletException("JDBC Driver not found.", e);
            
            }finally {
            try {
                if(rs != null) {
                    rs.close();
                    rs = null;
                }
                if(stmt != null) {
                    stmt.close();
                    stmt = null;
                }
                if(con != null) {
                    con.close();
                    con = null;
                }
            } catch (SQLException e) {}
  
                    out.close();
               }

        

   out.println("Result: " + result + "\n");    
%>
        <jsp:include page="index.jsp"/>
