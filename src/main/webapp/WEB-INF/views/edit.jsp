<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>editpost</title>
</head>
<body>
<form:form modelAttribute="post" method="POST">
    <spring:bind path="id">
        <tr><input name="id" value="${post.id}" type="hidden"/></tr>
    </spring:bind>
    <p>title</p>
    <spring:bind path="title">
        <tr><input name="title" type="text" value="${post.title}"></tr>
    </spring:bind>
    <p>text</p>
    <spring:bind path="text">
        <tr><textarea name="text" cols="25" rows="5">${post.text}</textarea></tr>
    </spring:bind>
    <p>tags</p>
    <spring:bind path="tags">
        <tr><input name="tags" type="text" value="${post.tags}"></tr>
    </spring:bind>
    <br/>
    <br/>
    <input type="submit" name="action" value="update"/>
    <input type="submit" name="action" value="remove"/>
</form:form>
</body>
</html>
