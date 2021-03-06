<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="content">
    <div class="container">
        <div class="col-md-6 col-md-offset-3">
            <form:form modelAttribute="post" method="POST" action="${contextPath}/main/post/update/${post.id}">
                    <spring:bind path="id">
                        <tr><input name="id" value="${post.id}" type="hidden"/></tr>
                    </spring:bind>
                <div class="form-group">
                    <spring:bind path="title">
                        <tr><input name="title" class="form-control" type="text" value="${post.title}"></tr>
                    </spring:bind>
                </div>
                <div class="form-group">
                    <spring:bind path="text">
                        <tr><textarea name="text" class="form-control" cols="25" rows="5">${post.text}</textarea></tr>
                    </spring:bind>
                </div>
                <div class="form-group">
                    <spring:bind path="tags">
                        <tr><input name="tags" class="form-control" type="text" value="${post.tags}"></tr>
                    </spring:bind>
                </div>
                <p>
                    <button class="btn btn-primary" type="submit">Update</button>
                </p>
            </form:form>

            <form:form modelAttribute="post" method="POST" action="${contextPath}/main/post/remove" >
                <spring:bind path="id">
                    <input name="id" value="${post.id}" type="hidden"/>
                    <input class="btn btn-primary" type="submit" value="remove">
                </spring:bind>
            </form:form>

        </div>
    </div>
</div>