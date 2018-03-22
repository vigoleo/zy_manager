<%--
  Created by IntelliJ IDEA.
  User: silen
  Date: 2018/3/21
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>用户登陆</h1>
    <h1>${msg}</h1>
    <form action="/user/login" method="post">
        name:<input type="text" name="name"><br>
        password:<input type="text" name="password"><br>
        <input type="submit" value="用户登陆">
    </form>
    <a href="/user/toRegister" >用户注册</a>
</body>
</html>
