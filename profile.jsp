<%-- 
    Document   : reg
    Created on : 04-Jan-2014, 14:30:22
    Author     : nikos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>
<%                
   
     try{   
         
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SecretSanta","root", "");


            Statement stmt = conn.createStatement();
            ResultSet rs;
 
            rs = stmt.executeQuery("SELECT * from users WHERE username='"+session.getAttribute("username")+"';" );
            while ( rs.next() ) {
                String flink = rs.getString("link");
                %> 
                <div class="photo">
                    <img src="<%=flink%>" border="2"  width="350" height="250"> <br> 
                </div>
                <% 
                String ftweet = rs.getString("tweet");
                %>          <p><%=ftweet%></p> <br>    <%
                
                String ffirstname = rs.getString("firstname");
                String flastname = rs.getString("lastname");
                %>          <p>name:<%=ffirstname%>  <%=flastname%></p>     <%
                
                String fusername = rs.getString("username");
                %>          <p>username:<%=fusername%></p>     <%  
                
              //  String fpass = rs.getString("pass");
                String femail = rs.getString("email");
                %>          <p>email:<%=femail%></p>     <%
                String fjob = rs.getString("job");
                %>          <p>profession:<%=fjob%></p>     <%
                String fage = rs.getString("age");
                %>          <p>age:<%=fage%></p>     <%
                String fcity = rs.getString("city");
                %>          <p>hometown:<%=fcity%></p>  <br>   <%

                
            }
            conn.close();
        } 
 
        catch (Exception e) {
                    System.err.println("Got an exception! ");
                    System.err.println(e.getMessage());
       
       }
    

%>
<form name="match" action="match.jsp" method="post">
        <input type="submit" id="button" name="sMatch" value="See your match!" />
</form>



</html>