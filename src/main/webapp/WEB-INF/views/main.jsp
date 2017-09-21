<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <td>${post.title}</td>
                <td>${post.user.username}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
