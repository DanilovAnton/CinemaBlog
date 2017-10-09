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
        <tr><input value="${post.id}" type="hidden"/></tr>
    </spring:bind>
    <p>title</p>
    <spring:bind path="title">
        <tr><input type="text" value="${post.title}"></tr>
    </spring:bind>
    <p>text</p>
    <spring:bind path="text">
        <tr><textarea cols="25" rows="5">${post.text}</textarea></tr>
    </spring:bind>
    <p>tags</p>
    <spring:bind path="tags">
        <tr><input type="text" value="${post.tags}"></tr>
    </spring:bind>
    <br/>
    <br/>
    <input type="submit" value="save"/>
</form:form>
</body>
</html>
