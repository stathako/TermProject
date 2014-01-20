<%-- 
    Document   : doLogin
    Created on : 18-Dec-2013, 19:13:04
    Author     : nikos
--%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
  

<%

    
    
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SecretSanta","root", "");
    
    ResultSet rsdoLogin = null;
    PreparedStatement psdoLogin=null;
    
    String sUserID=request.getParameter("username");
    String sPassword=request.getParameter("pass");
    String message="User login successfully ";
    
    try{
    String sqlOption="SELECT * FROM users WHERE username=? AND pass=?;";
    
    
    psdoLogin=conn.prepareStatement(sqlOption);
    psdoLogin.setString(1,sUserID);
    psdoLogin.setString(2,sPassword);
    
    rsdoLogin=psdoLogin.executeQuery();
    
    if(rsdoLogin.next())
    {
      String username=rsdoLogin.getString("firstname")+" "+rsdoLogin.getString("lastname");
      request.getSession().setAttribute("username",rsdoLogin.getString("username"));
      
        //session.setAttribute("sUserID",rsdoLogin.getString("sUserID"));
      //session.setAttribute("sUserName",sUserName);
     
      //response.sendRedirect("index.jsp?error="+message);
        response.sendRedirect(request.getHeader("Referer"));
    }
    else
    {
      message="No user or password matched" ;
      //response.sendRedirect("index.jsp?error="+message);
      response.sendRedirect(request.getHeader("Referer")+"?error="+message);
       
    }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    /// close object and connection
    try{
         if(psdoLogin!=null){
             psdoLogin.close();
         }
         if(rsdoLogin!=null){
             rsdoLogin.close();
         }
         
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }

%>