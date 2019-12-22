<%--
  Created by IntelliJ IDEA.
  User: Jabagh angok
  Date: 11/19/2019
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>

<%@page import="java.sql.*" %>
<%@ page import="Classes.DB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="src.MD5" %>
<%@ page import="java.security.MessageDigest" %>


<%
    DB d = new DB();
    d.init();
    
    //Change this to match your settings
  String DB_URL = "jdbc:mysql://localhost:3306/project";
    String USER = "root";
  String PASS = "159357";

    Connection conn = null;
    Statement stmt = null;
     PreparedStatement pstmt = null;
   String email =request.getParameter("email");
    String pass = request.getParameter("pass");

  String userPass =d.getManager(email);
  pass= MD5.getMd5(pass);
  // verify if user is manager
if(userPass.equals(pass)) {
    response.sendRedirect("Manager.jsp");
}
    // verify if user is doctor
if(userPass.isEmpty()) {
    userPass =d.getDoctor(email);
    if(userPass.equals(pass)){
    response.sendRedirect("Doctor.jsp");
    }
}
// TODOOO  verify if user is nurse

    // TOOOODOOOO  verify if user is patient






%>

