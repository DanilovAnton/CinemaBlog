<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="header-wrap">
    <div class="container">
        <div class="col-md-3 col-md-offset-4">
            <form action="${contextPath}/login" method="POST" class="form-signin" role="form">
                <h2>login</h2>
                <input type="text" name="username" class="form-control" placeholder="username" autofocus="true"/>
                <input type="password" name="password" class="form-control" placeholder="password"/>
                <span>${error}</span>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
            </form>
        </div>
    </div>
</div>
