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
    
    
    String ffirstname = request.getParameter("firstname");
    String flastname = request.getParameter("lastname");
    String fusername = request.getParameter("username");
    String fpass = request.getParameter("pass");
    String femail = request.getParameter("email");
    String fjob = request.getParameter("job");
    String fage = request.getParameter("age");
    String fcity = request.getParameter("city");
    String flink = request.getParameter("link");
    String ftweet = request.getParameter("tweet");

    
    Statement st = conn.createStatement();
 int i = st.executeUpdate("insert into users (firstname , lastname ,username , pass , email , job , age , city ,link,tweet) values ('" + ffirstname + "','" + flastname + "','" + fusername + "','" + fpass + "','" + femail +"','" + fjob + "','" + fage + "','" + fcity + "','" + flink + "','" + ftweet + "')");   
    if (i > 0) {
        //response.sendRedirect("index.jsp");
        out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
      
    }
    
    catch(Exception e){
        e.printStackTrace();
    }
    
    
  
%>

