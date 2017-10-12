<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <title>Create post</title>
</head>
<body>
<div class="container">
    <form:form method="post" modelAttribute="postForm" class="form-signin">
        <div class="form-group">
            <spring:bind path="title">
                <form:input path="title" type="text" placeholder="title" class="form-control"
                            autofocus="true"/>
                <form:errors path="title"/>
            </spring:bind>
        </div>
        <div class="form-control">
            <spring:bind path="tags">
                <form:input path="tags" type="text" placeholder="tags"/>
                <form:errors path="text"/>
            </spring:bind>
        </div>
        <div class="form-control">
            <spring:bind path="text">
                <form:textarea rows="5" cols="45" name="text" path="text"/>
                <form:errors path="text"/>
            </spring:bind>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${contextPath}/webjars/jquery/3.2.1/jquery.min.js"></script>
<script src="${contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
