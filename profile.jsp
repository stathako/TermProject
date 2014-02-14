<%-- 
    Document   : reg
    Created on : 04-Jan-2014, 14:30:22
    Author     : nikos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<link rel="stylesheet" type="text/css" href="loggedin.css">

<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>

<script>
function myFunction()
{
//var x;
var r=confirm("This action will erase your current information.\n Are you sure");
if (r==true)
  {
  document.getElementById("myForm").action="reset.jsp";
  }
else
  {
  window.location = "http://83.212.101.70:8080/SecretSanta/profile.jsp"
  }
}
</script>

 <div id ="header"> 
        <div id="insert">
            <div id ="see">
               
                <form id="myForm" name="reset" onclick="myFunction()" action="index.jsp"  method="post">
                        <input type="submit" id="button" name="sSubmit" value="Reset your information" />
                </form>
            </div>
            <div id ="logout">
                <form name="logout" action="doLogout.jsp" method="post">
                        <input type="submit" id="button" name="sSubmit" value="Log out" />
                </form>
            </div>    
                
        </div>
          <a href="http://83.212.101.70:8080/SecretSanta/"><img src="images/cys.png" id="cys"></a>
</div>

<br><br><br><br>
<div id="info">
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
                <div class="photooooo">
                    <img src="<%=flink%>" border="2"  width="350" height="250"> <br> 
                </div>
                <% 
                String ftweet = rs.getString("tweet");
                %>         <h2><%=ftweet%></h2><br>    <%
                
                String ffirstname = rs.getString("firstname");
                String flastname = rs.getString("lastname");
                %>          <h3>name:<%=ffirstname%>  <%=flastname%></h3>    <%
                
                String fusername = rs.getString("username");
                %>          <h3>username:<%=fusername%></h3>     <%  
                
              //  String fpass = rs.getString("pass");
                String femail = rs.getString("email");
                %>          <h3>email:<%=femail%></h3>     <%
                String fjob = rs.getString("job");
                %>          <h3>profession:<%=fjob%></h3>     <%
                String fage = rs.getString("age");
                %>         <h3>age:<%=fage%></h3>     <%
                String fcity = rs.getString("city");
                %>          <h3>hometown:<%=fcity%></h3>  <br>   <%

                
            }
            conn.close();
        } 
 
        catch (Exception e) {
                    System.err.println("Got an exception! ");
                    System.err.println(e.getMessage());
       
       }
    

%>
</div>
<div class ="myButton">
    <form name="match" action="match.jsp" method="post">
          <input type="submit" id="button" name="sMatch" value="See your match!" />
     </form>
 </div>
<br><br><br><br>
<br><br>


<footer>
      <jsp:include page="footer.jsp"/>
</footer>


</html>