<%-- 
    Document   : loggedin
    Created on : 19-Dec-2013, 13:39:04
    Author     : nikos
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<p>Welcome <%=session.getAttribute("username")%></p>

<form name="logout" action="doLogout.jsp" method="post">
        <input type="submit" id="button" name="sSubmit" value="Log out" />
</form> 
<br> 
<form name="profile" action="profile.jsp" method="post">
        <input type="submit" id="button" name="sProfile" value="See your profile!" />
</form>
