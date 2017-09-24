<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Main page</title>
</head>
<body>
<h2>main</h2>

<c:if test="${!empty listPost}">
    <table>
        <tr>
            <th>Title</th>
        </tr>
        <c:forEach items="${listPost}" var="post">
            <tr>
                <td><a href="${contextPath}/post/${post.id}">${post.title}</a></td>
                <td><a href="${contextPath}/user/${post.user.id}">${post.user.username}</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
