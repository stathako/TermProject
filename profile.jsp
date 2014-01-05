<%-- 
    Document   : reg
    Created on : 04-Jan-2014, 14:30:22
    Author     : nikos
--%>

<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>
<%                

     try{
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SecretSanta","root", "");


            Statement stmt = conn.createStatement();
            ResultSet rs;
 
            rs = stmt.executeQuery("SELECT lastname FROM users WHERE username = s");
            while ( rs.next() ) {
                String lastName = rs.getString("lastname");
                out.println(lastName);
            }
            conn.close();
        } 
        catch (Exception e) {
                    System.err.println("Got an exception! ");
                    System.err.println(e.getMessage());
       
       }
    

%>
