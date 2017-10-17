<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="f" uri="http://example.com/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="content">
    <div class="container">
        <div>
            <h2>${postForm.title}</h2>
            <p>Автор: ${postForm.user.username}</p>
            <h3>${postForm.text}</h3>

        </div>

        <c:if test="${change}">
            <button class="btn btn-success"><a href="${contextPath}/main/post/${postForm.id}/edit">Редактировать</a></button>
        </c:if>

        <h3>comments</h3>
        <div class="row ass">
            <div class="col-md-6">
                <form:form modelAttribute="comment" method="POST"
                           action="${contextPath}/main/comment/add/${postForm.id}">
                    <div class="form-group">
                        <spring:bind path="text">
                            <textarea id="cta" rows="3" class="form-control" placeholder="Enter text...."></textarea>
                        </spring:bind>
                    </div>
                    <button id="btn-comment" class="btn btn-primary" type="submit">Submit</button>

                </form:form>
            </div>
        </div>
    </div>
    <div class="container">
        <c:forEach items="${postForm.comments}" var="comment">
            <table>
                <tr>
                    <th>date</th>
                    <th>text</th>
                </tr>
                <tr>
                    <td>${f:formatLocalDateTime(comment.dateTime, 'dd.MM.yyyy HH:mm:ss')}</td>
                    <td>${comment.text}</td>
                    <c:if test="${change}">
                        <td>
                            <form:form modelAttribute="comment" method="POST">
                                <spring:bind path="id">
                                    <input name="id" type="hidden" value="${comment.id}"/>
                                    <input type="submit" name="action" value="remove">
                                </spring:bind>
                            </form:form>
                        </td>
                    </c:if>
                </tr>
            </table>
        </c:forEach>
    </div>

