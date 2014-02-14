<%-- 
    Document   : notloggedin
    Created on : 18-Dec-2013, 19:06:28
    Author     : nikos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>  
<head>
     <link rel="stylesheet" type="text/css" href="notloggedin.css">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     </head>


<body>
   <div id ="header"> 
        <div id="insert">
            
            <div id ="register">  
               <form name="makeAccount.jsp" method="post" action="makeAccount.jsp">
                   <table cellspacing="0">
                       <tr>
                           <td>
                               <input type="submit" name="Submit" value="Register !">
                           </td>
                       </tr>
                   </table>
               </form>
            </div>
            
            
           <div id ="login">   
               <form name="frmLogin"    onSubmit="return validate();" action="doLogin.jsp" method="post">
                   <table cellspacing="0">
                       <tr>
                           <td>
                               <input id="username" type="text" tabindex="1"   name="username" placeholder="username">
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
          </div>

         </div>  
       <a href="http://83.212.101.70:8080/SecretSanta/"><img src="images/cys.png" id="cys"></a>
</div>
    
<div id="foto">
        <img id="image" src="images/elf.jpg">
 </div>    
    
<div id="intro">
    <a href="http://83.212.101.70:8080/SecretSanta/makeAccount.jsp"><img id="con0" src="images/intro.png" ></a>
</div> 
    
    
<script>
    function myFunction()
    {
        alert("You can see only your matches information!");
    }
</script>

   <br><br> <br><br> 

    
<div id="some"> 
  <h2>Some of our recently registered users:</h2>
</div>
<br><br> 
<%
    String[] mlink = new String[8];
    int i=0;
    try{   
          
            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SecretSanta","root", "");


            Statement stmt = conn.createStatement();
            ResultSet  rsmatch ;

 
            rsmatch = stmt.executeQuery("SELECT * from users order by id desc LIMIT 8;" );
            while ( rsmatch.next() ) {
                           mlink[i] = rsmatch.getString("link");
                           i++;                
            }//while
            
                           
                           %> 
                           <div id="parent">
                                <div   class="userimage">
                                             <img src="<%=mlink[0]%>" border="0"  width="350" height="250" alt="Submit Form" onclick="myFunction()" > <br> 
                                </div>
                                <%

                                %> 
                                <div class="userimage">
                                             <img src="<%=mlink[1]%>" border="0"  width="350" height="250"  alt="Submit Form" onclick="myFunction()"> <br> 
                                </div> 
                                <%
                                %> 
                                <div class="userimage">
                                             <img src="<%=mlink[2]%>" border="0"  width="350" height="250" alt="Submit Form" onclick="myFunction()" > <br> 
                                </div>
                                <%

                                %> 
                                <div  class="userimage">
                                             <img src="<%=mlink[3]%>" border="0"  width="350" height="250" alt="Submit Form" onclick="myFunction()" > <br> 
                                </div>
                                <%

                                %> 
                                <div class="userimage">
                                             <img src="<%=mlink[4]%>" border="0"  width="350" height="250" alt="Submit Form" onclick="myFunction()" > <br> 
                                </div>
                                <%

                                %> 
                                <div class="userimage">
                                             <img src="<%=mlink[5]%>" border="0"  width="350" height="250" alt="Submit Form" onclick="myFunction()" > <br> 
                                </div>
                                <%


                                %> 
                                <div class="userimage">
                                             <img src="<%=mlink[6]%>" border="0"  width="350" height="250" alt="Submit Form" onclick="myFunction()" > <br> 
                                </div>
                                <%

                                %> 
                                 <div class="userimage">
                                             <img src="<%=mlink[7]%>" border="0"  width="350" height="250" alt="Submit Form" onclick="myFunction()"> <br> 
                                </div>
                           </div>
                           
                           <%
                           
               conn.close();
        }  
                                                                                                                     
        catch (Exception e) {
                    System.err.println("Got an exception! ");
                    System.err.println(e.getMessage());
       
       }
        
    
%>
       


    </body>
</html>
