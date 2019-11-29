<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light animated zoomIn" id="ftco-navbar" style="animation-duration: 1.5s;">
    <div class="container-fluid px-0 row">

        <div class="col-xl-7 offset-xl-1 col-lg-8 d-flex align-items-center flex-wrap justify-content-between">
            <img src="https://image.flaticon.com/icons/svg/201/201623.svg" style="width:40px;"/>
            <a class="navbar-brand ml-2" href="${pageContext.request.contextPath}/">TripPlanner</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                    aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="" class="nav-link">About</a></li>
                    <li class="nav-item"><a href="" class="nav-link">Places</a></li>
                    <li class="nav-item"><a href="" class="nav-link">Blog</a></li>
                    <li class="nav-item"><a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact</a></li>
                        <c:if test="${pageContext.request.userPrincipal.name == null}" >
                        <li> <a href="${pageContext.request.contextPath}/login" class="btn  btn-sm px-3 btn-warning mr-2 d-lg-none">Sign In</a></li>
                        <li> <a href="${pageContext.request.contextPath}/register" class="btn btn-sm px-3 btn-warning d-lg-none mt-2">Sign Up</a></li>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li> <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm px-3 btn-warning d-lg-none">Log out</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="col-4 col-lg-4 text-lg-right d-none d-lg-block">
            <c:if test="${pageContext.request.userPrincipal.name == null}" >
                <a href="${pageContext.request.contextPath}/login" class="btn  btn-sm px-3 btn-warning mr-2">Sign In</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-sm px-3 btn-warning">Sign Up</a>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <span class="text-white mr-3"><strong class="font-weight-bold">Welcome</strong><strong style="font-style: italic;">,&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/profile"> <span id="username"> ${pageContext.request.userPrincipal.name}</span></a> </strong></span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm px-3 btn-warning">Log out</a>
            </c:if>
        </div>    
        <li style="display:none" id="tripId">${tripId}</li>
    </div>
</nav>