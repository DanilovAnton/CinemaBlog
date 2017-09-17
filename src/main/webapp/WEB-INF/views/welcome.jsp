<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%--<jsp:include page="header.jsp"/>--%>
<html>
<head>
<link href="${contextPath}/resources/css/style.css">
<title>CinemaBlog</title>
</head>
<body>
<c:url var="loginUrl" value="${contextPath}/login"/>
<a href="${loginUrl}">Login</a>
<br/>
<c:url var="RegUrl" value="${contextPath}/registration"/>
<a href="${RegUrl}">Registration</a>

</body>
</html>
<%--<jsp:include page="footer.jsp"/>--%>