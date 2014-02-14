
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="makeAccount.css">

<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>   


        
    <script language="javascript">
    var testresults
    function checkemail(str){
        var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
        if (filter.test(str))testresults=true
        else{
            alert("Please input a valid email address!")
            testresults=false
        }
        return (testresults)
    }

     
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
       /*  if (email.value == "")
       {
           alert("Please enter your email address.");
           email.focus();
           return false;
       }
 
  */
        
      if(true)  {
            return  checkemail(email.value);      
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
       


    <body>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <div class="pinakas1">
        <form name="form1" method="post" action="regServlet" onSubmit="return validate(this)">
            <center>
            <table id="table" border="0.2" width="30%" cellpadding="5">
                <thead>
                    <tr class="alt">
                               <th colspan="2"><h3>Enter Information Here</h3></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><h4>*First Name</h4></td>
                        <td>&nbsp;<input type="text"  name="firstname" value="" /></td>
                    </tr>
                    <tr>
                        <td><h4>*Last Name</h4></td>
                        <td>&nbsp;<input type="text" name="lastname" value="" /></td>
                    </tr>
                    <tr>
                        <td><h4>*User Name</h4></td>
                        <td>&nbsp;<input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td><h4>*Password</h4></td>
                        <td>&nbsp;<input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td><h4>*Email</h4></td>
                        <td>&nbsp;<input type="text" name="email" value="" /></td>
                    </tr>
                     <tr>
                        <td><h4>*Job</h4></td>
                        <td>&nbsp;<input type="text" name="job" value="" /></td>
                    </tr>
                     <tr>
                        <td><h4>*Age</h4></td>
                        <td>&nbsp;<input type="text" name="age" value="" /></td>
                    </tr>
                     <tr>
                        <td><h4>*City</h4></td>
                        <td>&nbsp;<input type="text" name="city" value="" /></td>
                    </tr>
                    <tr>
                        <td><h4>A link of a picture of you!</h4></td>
                        <td>&nbsp;<input type="text"   name="link" value="" /></td>
                    </tr>
                    <tr>
                        <td><h4>Write a tweet about you!(until 140 characters)</h4></td>
                        <td>&nbsp;<input type="text" style="height:150px; width:150px"  name="tweet" maxlength="140" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" />&nbsp;&nbsp;</td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Already registered?</h3> <a href="index.jsp"><div id="telos"><h3>Login Here</h3></div></a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
 </div>
<footer>
      <jsp:include page="footer.jsp"/>
</footer>
<br><br><br><br><br><br>
    </body>
</html>