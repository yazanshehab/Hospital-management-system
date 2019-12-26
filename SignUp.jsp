<%@ page import="Classes.DB" %>
<%@ page import="src.MD5" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Jabagh angok
  Date: 12/23/2019
  Time: 7:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <form method=post>
        <tr><td>Enter Your Information Please: </td>
        </tr>
        <tr><td>Username:</td><td><input type="text" name="name"></td></tr>
        <tr><td>Email:</td><td><input type="text" name="Email"></td></tr>
        <tr><td>PassWord:</td><td><input type="password" name="PassWord"></td></tr>
        <tr><td></td><td><input type="submit" value="ADD"></td></tr>
    </form>
</table>
</body>
</html>
<%
    DB d = new DB();
    try{
        String name=request.getParameter("name");

        String email=request.getParameter("Email");
        String pass=request.getParameter("PassWord");

        pass= MD5.getMd5(pass);

        boolean var =false;
        d.init();

        d.addPat(name,email,pass);
        response.sendRedirect("index.jsp");

    }
    catch(Exception e){
        System.out.println(e);
    }
%>
