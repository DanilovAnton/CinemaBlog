<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="content">
    <div class="container">
        <div class="create-post">
            <button class="new-post"><a href="${contextPath}/main/create">Create Post</a></button>
        </div>
        <c:if test="${!empty listPost}">
            <c:forEach items="${listPost}" var="post">
                <div class="col-lg-12">
                    <h4><i class="fa fa-bookmark-o"></i> <a
                            href="${contextPath}/main/post/${post.id}">${post.title}</a>
                    </h4>
                    <h5><i class="fa fa-user"></i>
                        <a href="${contextPath}/main/user/${post.user.username}">${post.user.username}</a>
                    </h5>
                    <p>${post.text}</p>
                </div>
            </c:forEach>
        </c:if>
    </div>
