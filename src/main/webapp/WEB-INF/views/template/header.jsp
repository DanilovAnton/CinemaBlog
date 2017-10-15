<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="wrapper">
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${contextPath}/">Cinema Blog</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="${action eq 'home' ? "active" : ''}"><a href="${contextPath}/">Home</a></li>
                    <li class="${action eq 'main' ? "active" : ''}"><a href="${contextPath}/main">Main</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="${action eq 'login' ? "active" : ''}"><a href="${contextPath}/login">Login <i
                            class="fa fa-sign-in"></i></a>
                    </li>
                    <li class="${action eq 'registration' ? "active" : ''}"><a href="${contextPath}/registration">Registration
                        <i class="fa fa-user-circle"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>