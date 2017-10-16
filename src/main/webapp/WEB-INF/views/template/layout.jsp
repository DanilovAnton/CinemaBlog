<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="icon" href="/resources/favicon.ico">
    <title><tiles:insertAttribute name="title" ignore="true"/></title>
</head>
<body>

<tiles:insertAttribute name="header"/>

<tiles:insertAttribute name="body"/>

<tiles:insertAttribute name="footer"/>

<script type="text/javascript" src="/webjars/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/main.js"></script>
</body>
</html>
