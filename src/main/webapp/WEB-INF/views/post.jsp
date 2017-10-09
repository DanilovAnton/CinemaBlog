<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div>
    <p hidden>${postForm.id}</p>
    <p>${postForm.title}</p>
    <p>${postForm.text}</p>
    <p>${postForm.user.username}</p>
</div>
<c:if test="${change}">
    <a href="${contextPath}/main/post/${postForm.id}/edit">edit</a>
</c:if>

<h1>comments</h1>
<div>
    <form:form modelAttribute="comment" method="POST" >
        <spring:bind path="text">
            <textarea rows="10" cols="45" name="text" placeholder="Enter text...."></textarea>
        </spring:bind>
        <br/>
        <input type="submit" value="save"/>
    </form:form>
</div>
<c:forEach items="${postForm.comments}" var="comment">
    <h1>${comment.text}</h1>
</c:forEach>
</body>
</html>
