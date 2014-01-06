<%-- 
    Document   : notloggedin
    Created on : 18-Dec-2013, 19:06:28
    Author     : nikos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<form name="frmLogin" onSubmit="return validate();" action="doLogin.jsp" method="post">
    <table cellspacing="0">
        <tr>
            <td>
                <input id="username" type="text" tabindex="1" name="username" placeholder="username">
            </td>
            <td>
                <input id="password" type="password" name="pass" placeholder="password">
            </td>
            <td>
                <input type="submit" id="button" name="sSubmit" value="Log in" />
            </td>
       </tr>
     </table>
</form>


<form name="makeAccount.jsp" method="post" action="makeAccount.jsp">
    <table cellspacing="0">
        <tr>
            <td>
                <input type="submit" name="Submit" value="Register !">
            </td>
        </tr>
    </table>
</form>
