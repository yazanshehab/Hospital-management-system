<%--
  Created by IntelliJ IDEA.
  User: Jabagh angok
  Date: 12/19/2019
  Time: 5:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="src.*" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Database Manager!</title>
    <link rel="stylesheet" type="text/css" href="css/bulma.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.6.2/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

    <style type="text/css">
        @font-face {
            font-family: 'ArabicFont'; /*a name to be used later*/
            src: local('css/Tajawal-Bold') ; /*URL to font*/
        }
        .columns {
            min-height: 100vh ;
            display: flex ;
            flex-direction: row ;
            justify-content: stretch
        }
        .aside {
            background: hsl(0, 0%, 29%);
            padding: 2.5rem ;
        }
        .box{
            margin: 5%
        }
        .button {
            margin-left: 5%;
            position: center;
        }
        .aside li a{
            color: hsl(0, 0%, 100%);
        }
        .title{
            font-family:  ArabicFont;
        }
    </style>
</head>
<body>
<%

%>

<div class="wrapper">
    <div class="columns">

        <aside class="column is-2 aside">
            <ul class="menu-list">
                <li><a href="Manager.jsp">Manager</a></li>
            </ul>
            <p class="menu-label">Administration</p>

            <ul class="menu-list">
                <li><a href="addUser.jsp">Add Medical Staff</a></li>

            </ul>

            <ul class="menu-list">
                <li><a href="Appointments.jsp">Show appointments</a></li>

            </ul>






        </aside>

        <main class="column main">
            <nav class="breadcrumb is-small" aria-label="breadcrumbs">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li class="is-active"><a href="#" aria-current="page">Manager</a></li>
                </ul>
            </nav>

            <section class="hero is-info welcome is-small">
                <div class="hero-body">
                    <div class="container">
                        <h1 class="title" style="font-family: 'HSN Sara'">
                            Welcome BOSS....!
                        </h1>
                    </div>
                </div>
            </section>


            <div class="column is-2">
                <div class="tile is-parent is-centered is-variable">
                    <article class="tile is-child box">

                        <p class="subtitle">Nurses</p>
                    </article>


                </div>

                <a href="showNurse.jsp" class="button is-primary ">Show Nurses</a>

            </div>



            <div class="columns is-multiline">
                <div class="column is-2">
                    <div class="tile is-parent is-centered is-variable">
                        <article class="tile is-child box">

                            <p class="subtitle">Doctors</p>
                        </article>


                    </div>

                    <a href="showDoc.jsp" class="button is-primary ">Show doctors</a>

                </div>

                <div class="column is-2">
                    <div class="tile is-parent is-centered is-variable">
                        <article class="tile is-child box">

                            <p class="subtitle">Patients</p>
                        </article>


                    </div>

                    <a href="showPatient.jsp" class="button is-primary ">Show patient</a>

                </div>
            </div>

        </main>


    </div>

</div>







</body>
</html>
