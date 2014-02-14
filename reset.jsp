<%-- 
    Document   : reset
    Created on : 17-Jan-2014, 18:08:28
    Author     : nikos
--%>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>
<%
session = request.getSession(false);
if (session == null || session.getAttribute("username")==null){
    response.sendRedirect("index.jsp");
}
else{
%>
<%
    try{
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SecretSanta","root", "");
    
    
    String myusername=(String)session.getAttribute("username");
  

    
    Statement st = conn.createStatement();
    st.executeUpdate("delete from users where username='"+myusername+"'");
    session.setAttribute("match",null);
    session.setAttribute("username",null);

    %>
    <p>Your data has been deleted. </p>    
    <jsp:include page="makeAccount.jsp"/>
    <%
      
    }
    
    catch(Exception e){
        e.printStackTrace();
    }
    
    
  
%>
<%}%>
