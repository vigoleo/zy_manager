<%--
  Created by IntelliJ IDEA.
  User: silen
  Date: 2018/3/22
  Time: 7:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>用户修改</h1>
    <form id="regiditForm" action="/user/update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${user.id}"><br>
        name:<input type="text" name="name" value="${user.name}"><br>
        password:<input type="password" name="password" value="${user.password}"><br>
        birthday:<input type="date" name="birthday" value='<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>'/><br>
        <img src="/${user.pic} " alt="avatar" width="100px" hight="100px">
        pic:<input type="file" name="userfile" ><br/>
        <input type="submit" value="修改">
    </form>
</body>
</html>
