<%-- 
    Document   : match
    Created on : 06-Jan-2014, 14:58:24
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
  window.location = "http://83.212.101.70:8080/SecretSanta/match.jsp"
  }
}

function myFunctionEmail()
{
          alert("An email has been sent!");
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
<%                
   
     try{   
            int counter=0;
            String[] possibleMatches = new String[20];
           

            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SecretSanta","root", "");


            Statement stmt = conn.createStatement();
            ResultSet  rs,rs1,rs2,rs3,rs4,rs5,rs6,rs7,rs8,rsmatch  ;

 
            rs = stmt.executeQuery("SELECT * from users WHERE username='"+session.getAttribute("username")+"';" );
            while ( rs.next() ) {
                    String myage = rs.getString("age");                
                    String mycity = rs.getString("city");
                    String myjob = rs.getString("job");
                    String myusername = rs.getString("username");                
                    String myFirstMatch = rs.getString("mymatch");                

                    if(myFirstMatch!= null  && !myFirstMatch.isEmpty()){ 
                                String printflag="1";
                                session.setAttribute("printflag",printflag);
                                session.setAttribute("match",  myFirstMatch);


                    }        
                    else {
                                String printflag="0";
                                session.setAttribute("printflag",printflag);
                        
                    rs1 = stmt.executeQuery("SELECT * from users WHERE age='"+myage+"' AND job='"+myjob+"' AND city='"+mycity+"' ;" );
                    while ( rs1.next() ) {
                                String temp=rs1.getString("username");
                                String tempMatch=rs1.getString("mymatch");
                                if(!temp.equals(myusername) ){ 
                                            if( tempMatch== null   ){                                                                     
                                                    possibleMatches[counter]=rs1.getString("username");
                                                    counter++;
                                            }        
                               }            
                    }
                    if (counter>0){
                                Random generator = new Random();
                                int randomIndex = generator.nextInt( counter );
                                String mymatch=possibleMatches[randomIndex];
                                
                                session.setAttribute("match",  mymatch);
                                
                       
                    }
                    else{
                      
                                rs2 = stmt.executeQuery("SELECT * from users WHERE age='"+myage+"' AND job='"+myjob+"'  ;" );
                                while ( rs2.next() ) {
                                          
                                            String temp=rs2.getString("username");
                                            String tempMatch=rs2.getString("mymatch");
                                            if(!temp.equals(myusername) ){ 
                                                        if( tempMatch== null   ){                                                                     
                                                                possibleMatches[counter]=rs2.getString("username");
                                                                counter++;
                                                        }        
                                            }                 
                                }
                                if (counter>0){
                                            Random generator = new Random();
                                            int randomIndex = generator.nextInt( counter );
                                            String mymatch =possibleMatches[randomIndex];
                                            session.setAttribute("match",  mymatch);

                                }
          
                                else {
                                             rs3= stmt.executeQuery("SELECT * from users WHERE age='"+myage+"' AND city='"+mycity+"'  ;" );
                                             while ( rs3.next() ) {

                                                         String temp=rs3.getString("username");
                                                         String tempMatch=rs3.getString("mymatch");
                                                         if(!temp.equals(myusername) ){ 
                                                                    if( tempMatch==null  ){ 
                                                                            possibleMatches[counter]=rs3.getString("username");
                                                                            counter++;
                                                                    }        
                                                         }                 
                                             }
                                             if (counter>0){
                                                         Random generator = new Random();
                                                         int randomIndex = generator.nextInt( counter );
                                                         String mymatch=possibleMatches[randomIndex];
                                                         
                                                          session.setAttribute("match",  mymatch);

                                             }
                                             else {
                                              
                                                        rs4= stmt.executeQuery("SELECT * from users WHERE job='"+myjob+"' AND city='"+mycity+"'  ;" );
                                                        while ( rs4.next() ) {

                                                                    String temp=rs4.getString("username");
                                                                    String tempMatch=rs4.getString("mymatch");
                                                                    if(!temp.equals(myusername) ){ 
                                                                                if( tempMatch== null  ){                                                                     
                                                                                        possibleMatches[counter]=rs4.getString("username");
                                                                                        counter++;
                                                                                }        
                                                                    }                 
                                                        }
                                                        if (counter>0){
                                                                    Random generator = new Random();
                                                                    int randomIndex = generator.nextInt( counter );
                                                                    String mymatch=possibleMatches[randomIndex];
                                                                   
                                                                    session.setAttribute("match",  mymatch);


                                                        }
                                                        else {
                                                        
                                                                      rs5 = stmt.executeQuery("SELECT * from users WHERE age='"+myage+"' ;" );
                                                                      while ( rs5.next() ) {
                                                                                  String temp=rs5.getString("username");
                                                                                  String tempMatch=rs5.getString("mymatch");
                                                                                  if(!temp.equals(myusername) ){ 
                                                                                                if( tempMatch== null   ){                                                                     
                                                                                                        possibleMatches[counter]=rs5.getString("username");
                                                                                                        counter++;
                                                                                                }        
                                                                                    }  
                                                                      }
                                                                      if (counter>0){
                                                                                  Random generator = new Random();
                                                                                  int randomIndex = generator.nextInt( counter );
                                                                                  String mymatch=possibleMatches[randomIndex];
                                                                                  
                                                                                  session.setAttribute("match",  mymatch);


                                                                      }
                                                            
                                                                      else{
                                                            
                                                                                    rs6 = stmt.executeQuery("SELECT * from users WHERE job='"+myjob+"' ;" );
                                                                                    while ( rs6.next() ) {
                                                                                                String temp=rs6.getString("username");
                                                                                                String tempMatch=rs6.getString("mymatch");
                                                                                                if(!temp.equals(myusername) ){ 
                                                                                                            if( tempMatch== null    ){                                                                     
                                                                                                                    possibleMatches[counter]=rs6.getString("username");
                                                                                                                    counter++;
                                                                                                            }        
                                                                                                } 
                                                                                    }
                                                                                    if (counter>0){
                                                                                                Random generator = new Random();
                                                                                                int randomIndex = generator.nextInt( counter );
                                                                                                String mymatch=possibleMatches[randomIndex];
                                                                                                
                                                                                                
                                                                                                session.setAttribute("match",  mymatch);

                                                                                    }
                                                                                    else {
                                                                                                rs7 = stmt.executeQuery("SELECT * from users WHERE city='"+mycity+"' ;" );
                                                                                                while ( rs7.next() ) {
                                                                                                            String temp=rs7.getString("username");
                                                                                                            String tempMatch=rs7.getString("mymatch");
                                                                                                            if(!temp.equals(myusername) ){ 
                                                                                                                        if( tempMatch== null   ){                                                                     
                                                                                                                                possibleMatches[counter]=rs7.getString("username");
                                                                                                                                counter++;
                                                                                                                        }        
                                                                                                            }  
                                                                                                }
                                                                                                if (counter>0){
                                                                                                            Random generator = new Random();
                                                                                                            int randomIndex = generator.nextInt( counter );
                                                                                                            String mymatch=possibleMatches[randomIndex];
                                                                                                            
                                                                                                            session.setAttribute("match",  mymatch);

                                                                                                           }
                                                                                                  
                                                                                                else{
                                                                                                          rs8 = stmt.executeQuery("SELECT * from users  ;" );
                                                                                                          while ( rs8.next() ) {
                                                                                                                      String temp=rs8.getString("username");
                                                                                                                      String tempMatch=rs8.getString("mymatch");
                                                                                                                     if(!temp.equals(myusername) ){ 
                                                                                                                                if( tempMatch== null   ){                                                                     
                                                                                                                                        possibleMatches[counter]=rs8.getString("username");
                                                                                                                                        counter++;
                                                                                                                                }        
                                                                                                                     }   
                                                                                                          }
                                                                                                          if (counter>0){
                                                                                                                      Random generator = new Random();
                                                                                                                      int randomIndex = generator.nextInt( counter );
                                                                                                                      String mymatch=possibleMatches[randomIndex];
                                                                                                                      
                                                                                                                      session.setAttribute("match",  mymatch);

                                                                                                          } 

                                                                                        
                                                                                                }
                                                                                         }
                                                                                    }
                                                                      }   
                                                        
                                                        
                                                        }
                                                        
                                             }
                                             
                                }  
                            }
                    
                                String mymatch=(String)session.getAttribute("match");
                                rsmatch = stmt.executeQuery("SELECT * from users WHERE username='"+mymatch+"';" );
                                
                                while ( rsmatch.next() ) { 
                                           String mlink = rsmatch.getString("link");
                                           %> 
                                           
                                           <div id="info">
                                           <div class="photo">
                                                      <img src="<%=mlink%>" border="0"  width="350" height="250"> <br> 
                                           </div>
                                           <% 
                                           String mtweet = rsmatch.getString("tweet");
                                           %>          <h2><%=mtweet%></h2> <br>    <%

                                           String mfirstname = rsmatch.getString("firstname");
                                           String mlastname = rsmatch.getString("lastname");
                                           %>          <h3>name:<%=mfirstname%>  <%=mlastname%></h3>     <%

                                           String musername = rsmatch.getString("username");
                                           %>          <h3>username:<%=musername%></h3>     <%  

                                           //  String fpass = rs.getString("pass");
                                           String memail = rsmatch.getString("email");
                                           %>          <h3>email:<%=memail%></h3>     <%
                                           String mjob = rsmatch.getString("job");
                                           %>          <h3>profession:<%=mjob%></h3>     <%
                                           String mage = rsmatch.getString("age");
                                           %>          <h3>age:<%=mage%></h3>     <%
                                           String mcity = rsmatch.getString("city");
                                           %>          <h3>hometown:<%=mcity%></h3>  <br>   <%

                                 }
                                
                                
                                       
                          }//while
                              
                    
                   
           
            
            conn.close();
        }  
                                                                                                                     
        catch (Exception e) {
                    System.err.println("Got an exception! ");
                    System.err.println(e.getMessage());
       
       }

String flag=(String)session.getAttribute("printflag"); 
String zero="0";  
if (flag.equals(zero)){
%>
</div>
                    
 <form name="lock" onclick="myFunctionEmail()" action="lock.jsp" method="post">
           <input type="submit" id="button" name="sLock" value="Lock this match!" />
</form>
<br>

<form name="look" action="match.jsp" method="post">
          <input type="submit" id="button" name="sLook" value="Look for other matches!" />
</form>
<div id="info">
    <h4>
      if the same person appears again then you have to wait<br> for other users with common interests with you to register!
    </h4>
</div>
<br><br><br><br>
<br><br>
<%}
else{
String mymatch=(String)session.getAttribute("match");

%>

   <br><br><br><br>                            
<div id="info">
        <h2>It seems that you are locked with :<%=mymatch%> !!! <br> It's time to buy a present!!!<br></h2> 
              <h4>  If you want to unlock this match :  </h4>                             
        
</div>            
<form name="unlock" onclick="myFunctionEmail()" action="unlock.jsp" method="post">
           <input type="submit" id="button" name="sUnLock" value="unlock" />
</form>
<br><br><br><br><br><br>
                                
 <%}%>                               
                                
 <footer>
<jsp:include page="footer.jsp"/>
</footer>


</html>