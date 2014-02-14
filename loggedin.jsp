<%-- 
    Document   : loggedin
    Created on : 19-Dec-2013, 13:39:04
    Author     : nikos
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="loggedin.css">
<%
session = request.getSession(false);
if (session == null || session.getAttribute("username")==null){
    response.sendRedirect("index.jsp");
}
else{
%>

<% 
   String name=(String)session.getAttribute("username");
   Cookie Cusername = new Cookie("username",name);
   
   Cusername.setMaxAge(365*60*60*24); 
   
   response.addCookie( Cusername );
%>
      


 <div id ="header"> 
        <div id="insert">
            <div id ="see">
                <form name="profile" action="profile.jsp" method="post">
                        <input type="submit" id="button" name="sProfile" value="See your profile!" />
                </form>
             </div>
            
            <div id="logout">
                <form name="logout" action="doLogout.jsp" method="post">
                        <input type="submit" id="button" name="sSubmit" value="Log out" />
                </form> 

            </div> 
            
        </div>
          <a href="http://83.212.101.70:8080/SecretSanta/"><img src="images/cys.png" id="cys"></a>
        
</div>
<div id =wel>
   <h1>Welcome <%=Cusername.getValue()%> !!!</h1>
</div>
<%}%>