<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-default navbar-fixed-top custom-shadow">
    <div class="container">
        <div class="navbar-header">
            <a href="restaurants" class="navbar-brand">Lunch Vote App</a>
        </div>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <ul class="nav navbar-nav hidden-sm hidden-xs">
                <li class="active"><a href="${pageContext.request.contextPath}/restaurants/history">Show history</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/restaurants/new">Add restaurant</a></li>
            </ul>
        </sec:authorize>

        <ul class="nav navbar-nav navbar-right hidden-xs">
            <sec:authorize access="isAnonymous()">
                <li>
                    <a href="${pageContext.request.contextPath}/register" methods="post">
                        <span class="glyphicon glyphicon-user"></span> Sign Up
                    </a>
                </li>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
                <li><a href="${pageContext.request.contextPath}/profile">
                    <span class="glyphicon glyphicon-user"></span> ${userTo.name} Profile
                </a></li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout" methods="post">
                        <span class="glyphicon glyphicon-log-out"></span> Logout
                    </a>
                </li>
            </sec:authorize>
        </ul>
    </div>
</nav>