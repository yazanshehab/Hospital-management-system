<%@ page import="Classes.DB" %><%--
  Created by IntelliJ IDEA.
  User: Jabagh angok
  Date: 12/23/2019
  Time: 12:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    String email="";
    String[] doc = new String[5];
    Cookie cookie = null;
    Cookie[] cookies = null;
    cookies = request.getCookies();
    if( cookies != null ){

        cookie = cookies[1];
        email=cookie.getValue( );

    }else{
        out.println("<h2>No cookies founds</h2>");
    }

    DB d =new DB();
    doc= d.getSpecPat(email);


%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Database Dashboard!</title>
    <link rel="stylesheet" type="text/css" href="css/bulma.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.6.2/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

    <style type="text/css">
        .columns {
            min-height: 100vh ;
            display: flex ;
            flex-direction: row ;
            justify-content: stretch
        }
        .is-sidebar-menu {
            background: hsl(0, 0%, 29%);
            padding: 2.5rem ;
        }
        .is-8 {
            margin-left: 1%;
            margin-top: 3%;
        }
        .hero {
            margin-bottom: 1%;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="columns">


<aside class="column is-2 aside">
    <p class="menu-label">Administration</p>
    <ul class="menu-list">
        <li><a href="index.jsp">book an Appoinment</a></li>
    </ul>

    <ul class="menu-list">
        <li><a href="Appointments.jsp">Show appointments</a></li>
    </ul>

    <ul class="menu-list">
        <li><a href="index.jsp">view Doctors</a></li>
    </ul>
</aside>


<div class="column is-8" >

    <section class="hero is-info welcome is-small">
        <div class="hero-body">
            <div class="container">
                <h1 class="title" style="font-family: 'HSN Sara'">
                    Hello   <%  out.print(doc[0]);
                %>
                </h1>
            </div>
        </div>
    </section>


    <table class="table is-bordered is-striped  is-hoverable "  >
        <thead>
        <tr>
            <th>Name</th>
            <th>Room</th>

        </tr>
        </thead>


        <tbody>


        <tr>
            <td><%= doc[0]%></td>

            <td><%=  doc[1] %></td>



        </tr>



        </tbody>

    </table>


</div>

</div>


</div>


</body>
</html>
