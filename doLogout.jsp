<%-- 
    Document   : doLogout
    Created on : 19-Dec-2013, 19:05:13
    Author     : nikos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    request.getSession(false).removeAttribute("username");
    request.getSession(false).invalidate();
    

    String redirectURL = "http://83.212.101.70:8080/SecretSanta/";
    response.sendRedirect(redirectURL);


%>