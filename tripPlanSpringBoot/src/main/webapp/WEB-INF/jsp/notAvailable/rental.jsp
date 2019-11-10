<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../components/linksHeader.jsp"/>
        <style>
            body { text-align: center; padding: 150px; }
            h1 { font-size: 50px; }
            body { font: 20px Helvetica, sans-serif; color: #333; }
            article { display: block; text-align: left; width: 650px; margin: 0 auto; }
            a { color: #dc8100; text-decoration: none; }
            a:hover { color: #333; text-decoration: none; }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container-fluid px-0 row">

                <div class="col-xl-7 offset-xl-1 col-lg-9 d-flex align-items-center flex-wrap justify-content-between">

                    <a class="navbar-brand text-dark" href="${pageContext.request.contextPath}/">TripPlanner</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                            aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span> Menu
                    </button>

                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link text-dark">Home</a></li>
                            <li class="nav-item"><a href="" class="nav-link text-dark">About</a></li>
                            <li class="nav-item"><a href="" class="nav-link text-dark">Places</a></li>
                            <li class="nav-item"><a href="" class="nav-link text-dark">Blog</a></li>
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/contact" class="nav-link text-dark">Contact</a></li>
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
                <div class="col-4 col-lg-3 text-lg-right d-none d-lg-block">
                    <c:if test="${pageContext.request.userPrincipal.name == null}" >
                        <a href="${pageContext.request.contextPath}/login" class="btn  btn-sm px-3 btn-warning mr-2">Sign In</a>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-sm px-3 btn-warning">Sign Up</a>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <span style="margin: 0 20px;" class="text-dark"><strong style="font-weight: bold;">Welcome</strong><strong style="font-style: italic;">,&nbsp;&nbsp;&nbsp; ${pageContext.request.userPrincipal.name} </strong></span>
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm px-3 btn-warning">Log out</a>
                    </c:if>
                </div>
            </div>
        </nav>

        <article>
            <h1>We&rsquo;ll be back soon!</h1>
            <div >
                <p>Sorry for the inconvenience but we&rsquo;re performing some maintenance at the moment.<strong>There is no Rental at this moment </strong>, If you need to you can always <a href="${pageContext.request.contextPath}/contact">contact us</a>,
                </p>
                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/user/choices" class="btn btn-outline-dark btn-lg">Create Trip</a>
                </div>
                <br><br> <p>&mdash; Triplanner Team</p>
            </div>
        </article>
    </body>
</html>
