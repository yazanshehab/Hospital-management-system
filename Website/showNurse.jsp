<%@ page import="Classes.DB" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Jabagh angok
  Date: 12/24/2019
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>
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
        .hero{
            margin-bottom: 1%;
        }
    </style>
</head>
<body>

<div class="columns is-fullheight">
    <div class="column is-2 is-sidebar-menu is-hidden-mobile">
        <aside class="menu">
            <ul class="menu-list">
            </ul>



        </aside>
    </div>

    <div class="column is-8" >


        <section class="hero is-info welcome is-small">
            <div class="hero-body">
                <div class="container">
                    <h1 class="title" style="font-family: 'HSN Sara'">
                        All Nurses..
                    </h1>
                </div>
            </div>
        </section>


        <table class="table is-bordered is-striped  is-hoverable "  >
            <thead>
            <tr>
                <th>ID</th>
                <th>Nurse name</th>
                <th>Email</th>


            </tr>
            </thead>

            <tbody>

            <%
                DB d = new DB();

                ArrayList<ArrayList<String>> list =d.getAllNur();
            %>
            <%

                for(int i = 0; i < list.size(); i++) {



            %>
            <tr>
                <td><%= list.get(i).get(0)%></td>
                <td><%= list.get(i).get(1) %></td>
                <td><%= list.get(i).get(2)%></td>






            </tr>
            <%
                }

            %>


            </tbody>
        </table>
    </div>


</div>


</body>
</html>
