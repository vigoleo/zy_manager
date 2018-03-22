<%--
  Created by IntelliJ IDEA.
  User: silen
  Date: 2018/3/22
  Time: 1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pages" uri="http://java.sun.com/jsp/page/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
   当前用户 <h1>${sessionScope.activeUser.name}</h1><img src="/${activeUser.avatar}" width="100px" height="100px">
<hr/>
    条件查询<form id="searchForm" name="searchForm" action="/user/list" method="post">
        name:<input type="text" name="name" value="${user.name}"><br>
       <input type="hidden" name="pageNum" id="pageNum" value="1">
       <input type="submit" value="用户调查"/>
   </form>
    <h1>jstl展现数据</h1>
    <c:forEach items="${pageInfo.list}" var="u">
        ${u.name}&nbsp;${u.password}
        <c:if test="${activeUser.id==u.id}">
            <a href="/user/toUpdate?id=${u.id}">修改</a>&nbsp;
            <a href="/user/doDelete?id=${u.id}">删除</a>
        </c:if><br>
    </c:forEach><br>
    <pages:list/>
   <script type="text/javascript">
       function jump(cpage) {
           document.getElementById("pageNum").value=cpage;
           document.getElementById("searchForm").submit();
       }
   </script>
</body>
</html>
