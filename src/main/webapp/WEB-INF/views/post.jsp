<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form:form modelAttribute="postForm" method="post" action="${contextPath}/main/post/${postForm.id}">
        <spring:bind path="id">
            <input type="hidden" value="${postForm.id}"><br/>
        </spring:bind>
        <spring:bind path="title">
            <input type="text" value="${postForm.title}"/><br/>
        </spring:bind>
        <spring:bind path="text">
            <input type="text" value="${postForm.text}"/><br/>
        </spring:bind>
        <spring:bind path="tags">
            <input type="text" value="${postForm.tags}"/><br/>
        </spring:bind>
        <c:if test="${change}">
            <input type="submit" name="action" value="update"/><br/>
            <input type="submit" name="action" value="remove"/>
        </c:if>
    </form:form>

<h1>comments</h1>
<c:forEach items="${post.comments}" var="comment">
    <h1>${comment.text}</h1>
</c:forEach>
</body>
</html>
