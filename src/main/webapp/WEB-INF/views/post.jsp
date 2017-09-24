<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
 <h2>${post.title}</h2>
<h2>${post.user.username}</h2>
<h2>${post.tags}</h2>
<h2>${post.text}</h2>

<%--<h1>comments</h1>--%>
<%--<c:forEach items="${post.comments}" var="comment">--%>
    <%--<h1>${comment.text}</h1>--%>
<%--</c:forEach>--%>
</body>
</html>
