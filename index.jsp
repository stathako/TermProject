<%-- 
    Document   : index
    Created on : 18 Δεκ 2013, 7:02:15 μμ
    Author     : nikos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="index.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Secret Santa!</title>
        <script>
            function trim(s)
            {
                return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
            }

            function validate()
            {
                if(trim(document.frmLogin.username.value)=="")
                {
                  alert("Login empty");
                  document.frmLogin.username.focus();
                  return false;
                }
                else if(trim(document.frmLogin.pass.value)=="")
                {
                  alert("password empty");
                  document.frmLogin.pass.focus();
                  return false;
                }
            }
        </script>
    </head>
    
    <body>
         <%
        session = request.getSession(false);
                    if(session == null || session.getAttribute("username")==null){
        %>
     
        <jsp:include page="notloggedin.jsp"/>
        <%

        }
        else{
%>      
        <jsp:include page="loggedin.jsp"/>
<%
}

%>
   
    </body>
  <footer>
      <jsp:include page="footer.jsp"/>
  </footer>
</html>
