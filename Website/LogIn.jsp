<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>

<form action="/login" method="post">
    <div>
        <label> Email
            <input type="text" name="email">
        </label>
    </div>

    <div>
        <label> Password
            <input type="password" name="password">
        </label>
    </div>
    <div>
        <input type="submit" value= "Login">
    </div>
</form>
<% String status = (String) request.getAttribute("status"); %>
<% if (status != null && status.equals("fails")){%>

<div>
    Password or Emails  is wrong
</div>
<%}%>
<%= status  %>
</body>
</html>
