
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>   


        
    <script language="javascript">
    function validate(objForm){
    
    var firstname = document.form1.firstname;
    var lastname = document.form1.lastname;
    var username = document.form1.username;
    var pass = document.form1.pass;
    var email = document.form1.email;
    var job = document.form1.job;
    var age = document.form1.age;
    var city = document.form1.city;
    var link = document.form1.link;
    var tweet = document.form1.tweet;

    if (firstname.value == "")
       {
           alert("Your firstname wasn't recognised.");
           firstname.focus();
           return false;
       } 
     if (lastname.value == "")
       {
           alert("Your lastname wasn't recognised.");
           lastname.focus();
           return false;
       }



    if (username.value == "")
       {
           alert("Your username wasn't recognised.");
           username.focus();
           return false;
       }

         if (pass.value == "")
       {
           alert("Please enter a password.");
           pass.focus();
           return false;
       }
         if (email.value == "")
       {
           alert("Please enter your email address.");
           email.focus();
           return false;
       }
       if (job.value == "")
       {
           alert("Your job wasn't recognised.");
           job.focus();
           return false;
       }
       if (age.value == "")
       {
           alert("Your age wasn't recognised.");
           age.focus();
           return false;
       }
       if (city.value == "")
       {
           alert("City wasn't recognised.");
           city.focus();
           return false;
       }
       
    
       else{
       return true;
       }
    }


    </script>
       


    
    
    <div id="forma">  
        <form name="form1" method="post" action="regServlet" onSubmit="return validate(this)">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <div id="header">
                               <th colspan="2">Enter Information Here</th>
                        </div>             
                    </tr>
                </thead>
               <div id="contents">
                <tbody>
                    <tr>
                        <td>*First Name</td>
                        <td>&nbsp;<input type="text"  name="firstname" value="" /></td>
                    </tr>
                    <tr>
                        <td>*Last Name</td>
                        <td>&nbsp;<input type="text" name="lastname" value="" /></td>
                    </tr>
                    <tr>
                        <td>*User Name</td>
                        <td>&nbsp;<input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>*Password</td>
                        <td>&nbsp;<input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td>*Email</td>
                        <td>&nbsp;<input type="text" name="email" value="" /></td>
                    </tr>
                     <tr>
                        <td>*Job</td>
                        <td>&nbsp;<input type="text" name="job" value="" /></td>
                    </tr>
                     <tr>
                        <td>*Age</td>
                        <td>&nbsp;<input type="text" name="age" value="" /></td>
                    </tr>
                     <tr>
                        <td>*City</td>
                        <td>&nbsp;<input type="text" name="city" value="" /></td>
                    </tr>
                    <tr>
                        <td>A link of a picture of you!</td>
                        <td>&nbsp;<input type="text"   name="link" value="" /></td>
                    </tr>
                    <tr>
                        <td>Write a tweet about you!(until 140 characters)</td>
                        <td>&nbsp;<input type="text" style="height:150px; width:150px"  name="tweet" maxlength="140" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" />&nbsp;&nbsp;</td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Already registered!! <a href="index.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
   </div>
  </div>
<div id="footer"></div>
</body>
<footer>
      <jsp:include page="footer.jsp"/>
</footer>
<br><br><br><br><br><br>
</html>