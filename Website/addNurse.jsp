<%@ page import="java.sql.*" %>
<%@ page import="Classes.DB" %><%--
  Created by IntelliJ IDEA.
  User: Jabagh angok
  Date: 12/23/2019
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <table>
        <tr><td>First lets Check if the user already exists  </td>
            <td>
        <form method=post>
        <tr><td>Select User Type: </td>
            <td>
                <select name="User">
                    <option value="-1">Select</option>
                    <option value="Doctor">Doctor</option>
                    <option value="Nurse">Nurse</option>
                </select>
            </td></tr>
        <tr><td>Username:</td><td><input type="text" name="email"></td></tr>
        <tr><td>Password:</td><td><input type="password" name="pass"></td></tr>
        <tr><td></td><td><input type="submit" value="Add"></td></tr>
        </form>
    </table>
<%
    DB d = new DB();

    try{
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String user=request.getParameter("User");
        boolean var =false;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Project","root","159357");
        Statement st=con.createStatement();
        if(user.equals("Doctor")) {
            ResultSet rs = st.executeQuery("select * from Doctor where dEmail='" + email  + "'");
            while(rs.next()){
                System.out.println("LOOOOL user exists");
               var=true;
                response.sendRedirect("addUser.jsp");
            }
            if(var==false){
                response.sendRedirect("addDoctor.jsp");
            }
        }

        if(user.equals("Nurse")) {
            var=false;
            ResultSet rs = st.executeQuery("select * from Nurse where nEmail='" + email + "'");
            while(rs.next()){
                System.out.println("LOOOOL");
                var=true;
                response.sendRedirect("addUser.jsp");
            }
            if(var==false){
                response.sendRedirect("addNurse.jsp");
            }

        }
    }
    catch(Exception e){
        System.out.println(e);
    }
%>





