<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">TripPlanner</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="" class="nav-link">About</a></li>
                <li class="nav-item"><a href="" class="nav-link">Places</a></li>
                <li class="nav-item"><a href="" class="nav-link">Blog</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact</a></li>
            </ul>
            <c:if test="${pageContext.request.userPrincipal.name == null}" >
                <a href="${pageContext.request.contextPath}/login" class="btn btn-warning mr-2">Sign In</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-warning">Sign Up</a>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <span style="margin: 0 20px;" class="text-white"><strong style="font-weight: bold;">Welcome</strong><strong style="font-style: italic;">,&nbsp;&nbsp;&nbsp; ${pageContext.request.userPrincipal.name} </strong></span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-warning">Log out</a>
            </c:if>

        </div>
    </div>
</nav>
