<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Create post</title>
</head>
<body>
<h1>Create Post</h1>
<form:form method="post" modelAttribute="postForm">
    <h3>title</h3>
    <spring:bind path="title">
        <form:input path="title" type="text" placeholder="title" autofocus="true"/>
    </spring:bind>
    <h3>tags</h3>
    <spring:bind path="tags">
        <form:input path="tags" type="text" placeholder="tags"/>
    </spring:bind>
    <h3>text</h3>
    <spring:bind path="text">
        <form:textarea rows = "5" cols="45" name = "text" path="text"/>
    </spring:bind>
    <button type="submit">Submit</button>
</form:form>
</body>
</html>
