<%-- 
    Document   : match
    Created on : 06-Jan-2014, 14:58:24
    Author     : nikos
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>      
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
                    
                    
                    rs1 = stmt.executeQuery("SELECT * from users WHERE age='"+myage+"' AND job='"+myjob+"' AND city='"+mycity+"' ;" );
                    while ( rs1.next() ) {
                                String temp=rs1.getString("username");
                                if(!temp.equals(myusername)){    
                                            possibleMatches[counter]=rs1.getString("username");
                                            counter++;
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
                                            if(!temp.equals(myusername)){
                                                        possibleMatches[counter]=rs2.getString("username");
                                                        counter++;
                                            }                 
                                }
                                if (counter>0){
                                            Random generator = new Random();
                                            int randomIndex = generator.nextInt( counter );
                                            String mymatch=possibleMatches[randomIndex];
                                            session.setAttribute("match",  mymatch);

                                }
          
                                else {
                                             rs3= stmt.executeQuery("SELECT * from users WHERE age='"+myage+"' AND city='"+mycity+"'  ;" );
                                             while ( rs3.next() ) {

                                                         String temp=rs3.getString("username");
                                                         if(!temp.equals(myusername)){
                                                                      possibleMatches[counter]=rs3.getString("username");
                                                                      counter++;
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
                                                                    if(!temp.equals(myusername)){
                                                                                 possibleMatches[counter]=rs4.getString("username");
                                                                                 counter++;
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
                                                                                  if(!temp.equals(myusername)) {      
                                                                                                possibleMatches[counter]=rs5.getString("username");
                                                                                                counter++;
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
                                                                                                if(!temp.equals(myusername)) {      
                                                                                                              possibleMatches[counter]=rs6.getString("username");
                                                                                                              counter++;
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
                                                                                                            if(!temp.equals(myusername)) {      
                                                                                                                          possibleMatches[counter]=rs7.getString("username");
                                                                                                                          counter++;
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
                                                                                                                      if(!temp.equals(myusername)){
                                                                                                                                     possibleMatches[counter]=rs8.getString("username");
                                                                                                                                     counter++;
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
                                String mymatch=(String)session.getAttribute("match");
                                rsmatch = stmt.executeQuery("SELECT * from users WHERE username='"+mymatch+"';" );
                                
                                while ( rsmatch.next() ) { 
                                           String mlink = rsmatch.getString("link");
                                           %> 
                                           <div class="photo">
                                                      <img src="<%=mlink%>" border="0"  width="350" height="250"> <br> 
                                           </div>
                                           <% 
                                           String mtweet = rsmatch.getString("tweet");
                                           %>          <p><%=mtweet%></p> <br>    <%

                                           String mfirstname = rsmatch.getString("firstname");
                                           String mlastname = rsmatch.getString("lastname");
                                           %>          <p>name:<%=mfirstname%>  <%=mlastname%></p>     <%

                                           String musername = rsmatch.getString("username");
                                           %>          <p>username:<%=musername%></p>     <%  

                                           //  String fpass = rs.getString("pass");
                                           String memail = rsmatch.getString("email");
                                           %>          <p>email:<%=memail%></p>     <%
                                           String mjob = rsmatch.getString("job");
                                           %>          <p>profession:<%=mjob%></p>     <%
                                           String mage = rsmatch.getString("age");
                                           %>          <p>age:<%=mage%></p>     <%
                                           String mcity = rsmatch.getString("city");
                                           %>          <p>hometown:<%=mcity%></p>  <br>   <%

                                 }
                                
                                
                                         
                          }//while
                              
                    
                   
           
            
            conn.close();
        }  
                                                                                                                     
        catch (Exception e) {
                    System.err.println("Got an exception! ");
                    System.err.println(e.getMessage());
       
       }
    

%>


<form name="logout" action="doLogout.jsp" method="post">
        <input type="submit" id="button" name="sSubmit" value="Log out" />
</form>
<br>
  


</html>