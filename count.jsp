<%-- 
    Document   : count
    Created on : 22-Jan-2014, 20:25:34
    Author     : nikos
--%>


<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>

<%  int uyear=90;
    try{
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SecretSanta","root", "");
    
    
    String stringCount = (String)session.getAttribute("SessionCounter");
  
    
    Statement st = conn.createStatement();
    //st.executeUpdate("update * countingTable set count='32' ");
    //st1.executeUpdate("delete  from countingTable");
   // st.executeUpdate("insert into countingTable (count) values ('" + stringCount + "')");
   // st.executeUpdate("insert into countingTable (count) values ( + year )");   
   /*
    String sql="insert into countingTable (count) values (?)";
    PreparedStatement statement=conn.prepareStatement(sql);
    statement.setInt(1,uyear);
    statement.executeUpdate();

    */
    st.executeUpdate("update countingTable set count=NULL where count='8'");

    
    
    
    
    
    response.sendRedirect("index.jsp");

      
    }
    
    catch(Exception e){
        out.println("error");
        e.printStackTrace();
    }
    
    
  
%>

