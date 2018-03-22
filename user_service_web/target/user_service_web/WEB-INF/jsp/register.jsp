<%--
  Created by IntelliJ IDEA.
  User: silen
  Date: 2018/3/21
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/user/register" method="post" enctype="multipart/form-data">
        name:<input type="text" name="name"><br>
        password:<input type="password" name="password"><br>
        birthday:<input type="date" name="birthday"><br>
        pic:<input type="file" name="userfile"><br>
        <input type="submit" value="用户增加"/>
    </form>
</body>
</html>
