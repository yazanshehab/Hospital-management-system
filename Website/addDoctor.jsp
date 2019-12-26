<%@ page import="Classes.DB" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Jabagh angok
  Date: 12/23/2019
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add a Doctor </title>
</head>
<body>
<table>
    <form method=post>
        <tr><td>Enter Doctor Info: </td>
            </tr>
        <tr><td>Username:</td><td><input type="text" name="name"></td></tr>
        <tr><td>Department:</td><td><input type="text" name="Department"></td></tr>
        <tr><td>Email:</td><td><input type="text" name="Email"></td></tr>
        <tr><td>PassWord:</td><td><input type="password" name="PassWord"></td></tr>
        <tr><td>Working days(please enter first letter of the day then ,):</td><td><input type="text" name="days"></td></tr>
        <tr><td>Starting hour:</td><td><input type="text" name="Start"></td></tr>
        <tr><td>Ending hour:</td><td><input type="text" name="End"></td></tr>
        <tr><td></td><td><input type="submit" value="ADD"></td></tr>
    </form>
</table>
</body>
</html>

<%
    DB d = new DB();
    try{
        String name=request.getParameter("name");
        String dep=request.getParameter("Department");
        String email=request.getParameter("Email");
        String pass=request.getParameter("PassWord");
        String day=request.getParameter("days");
        Time start= Time.valueOf(request.getParameter("Start"));
        Time end= Time.valueOf(request.getParameter("End"));
        boolean var =false;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/Project","root","159357");
        Statement st=con.createStatement();

        d.addDoc(name,dep,email,pass,day,start,end);
        response.sendRedirect("Manager.jsp");
    }
    catch(Exception e){
        System.out.println(e);
    }
%>
