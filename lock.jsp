<%-- 
    Document   : lock
    Created on : 07-Jan-2014, 18:24:54
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
<%@ page import="core.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session = request.getSession(false);
if (session == null || session.getAttribute("username")==null){
    response.sendRedirect("index.jsp");
}
else{
%>


<%
    String fmatch=(String)session.getAttribute("match");
    String fusername=(String)session.getAttribute("username");
    


    try{
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SecretSanta","root", "");
    
    
    
    Statement st1 = conn.createStatement();
    Statement st2 = conn.createStatement();

    st1.executeUpdate("update users set mymatch='"+fmatch+"' where username='"+fusername+"'");
    st2.executeUpdate("update users set mymatch='"+fusername+"' where username='"+fmatch+"'");

      
    }
    
    catch(Exception e){
        out.println("Unable to connect to database."); 
        e.printStackTrace();
    }
    
    ///////////////////////////////////psaxno to mail tou match
    try{   
            
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SecretSanta","root", "");


            Statement stmt = conn.createStatement();
            ResultSet  rs  ;

 
            rs = stmt.executeQuery("SELECT * from users where username='"+fmatch+"' " );
            while ( rs.next() ) {
                    String mailOfMatch = rs.getString("email");
                    Email E = new Email();
                    E.sendEamil(mailOfMatch,"Κάποιος θέλει να στείλει σε σένα δωρο!!","Ο χρηστης '"+fusername+"' θελει να στείλει σε σένα δωρο."
                            + "Μπες στο SecretSanta Site κάνε Log in και δες ποιος είναι!!!! ");
                
             }//while
                
            conn.close();
        }  
                                                                                                                     
        catch (Exception e) {
                    System.err.println("Got an exception! ");
                    System.err.println(e.getMessage());
       
       }
    
    
    
    
    
    
    


%>

        <jsp:include page="profile.jsp"/>
<%}%>