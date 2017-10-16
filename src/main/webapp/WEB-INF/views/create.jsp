<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="content">
    <div class="container">
        <div class="col-md-6 col-md-offset-3">
            <form:form method="post" modelAttribute="postForm" class="form-signin">
                <div class="form-group">
                    <spring:bind path="title">
                        <form:input path="title" type="text" placeholder="title" class="form-control"
                                    autofocus="true"/>
                        <form:errors path="title"/>
                    </spring:bind>
                </div>
                <div class="form-group">
                    <spring:bind path="tags">
                        <form:input path="tags" type="text" placeholder="tags" class="form-control"/>
                        <form:errors path="text"/>
                    </spring:bind>
                </div>
                <div class="form-group">
                    <spring:bind path="text">
                        <form:textarea rows="5" name="text" path="text" class="form-control" placeholder="text"/>
                        <form:errors path="text"/>
                    </spring:bind>
                </div>
                    <button class="btn btn-primary btn-lg" type="submit">Добваить</button>
            </form:form>
        </div>
    </div>