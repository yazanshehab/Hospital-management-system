<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.*" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="src.*" %>
<%@ page import="Classes.DB" %>
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
    doc= d.getSpecDoc(email);


%>
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
                <li><a href="index.jsp">add days off</a></li>
            </ul>

            <ul class="menu-list">
                <li><a href="Appointments.jsp">Show appointments</a></li>
            </ul>

            <ul class="menu-list">
                <li><a href="room.jsp">Add room for patient view all rooms</a></li>
            </ul>
        </aside>


    <div class="column is-8" >

        <section class="hero is-info welcome is-small">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title" style="font-family: 'HSN Sara'">
                        Hello Doctor  <%  out.print(doc[0]);
                    %>
                    </h1>
                </div>
            </div>
        </section>


                <table class="table is-bordered is-striped  is-hoverable "  >
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Working days</th>
                        <th>Start</th>
                        <th>End</th>
                        <th>Department</th>
                    </tr>
                    </thead>


                <tbody>


                <tr>
                    <td><%= doc[0]%></td>

                    <td><%=  doc[1] %></td>

                    <td><%=  doc[2]%></td>

                    <td><%= doc[3]%></td>

                    <td><%=  doc[4]%></td>


                </tr>



                </tbody>

                </table>



        </div>




        </div>

        </div>







</body>
</html>
