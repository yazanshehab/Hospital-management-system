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

    Connection conn = null;
    Statement stmt = null;
     PreparedStatement pstmt = null;
    String pass = request.getParameter("pass");

    pass= MD5.getMd5(pass);

    Cookie email = new Cookie("email",
            request.getParameter("email"));
    email.setMaxAge(60*60*10);
    response.addCookie( email );


    boolean userPass =false;
  // verify if user is manager
if(d.getManager(email.getValue(), pass) == true) {

    response.sendRedirect("Manager.jsp");


}
// verify if user is doctor
else if(d.getDoctor(email.getValue(), pass) == true) {
            response.sendRedirect("Doctor.jsp");


}
// verify if user is nurse
else if(d.getNurse(email.getValue(), pass) == true) {
    response.sendRedirect("Nurse.jsp");
}
    // verify if user is patient
else if(d.getPat(email.getValue(), pass) == true) {
    response.sendRedirect("Patient.jsp");
}


else {
    response.sendRedirect("index.jsp");
}





%>

