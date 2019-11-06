<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registercss/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

        <link href="${pageContext.request.contextPath}/css/registercss/css/style.css" rel="stylesheet">

        <script src="https://kit.fontawesome.com/e41a5911e2.js"></script>
    </head>
    <body>

        <div class="wrapper" style="background-image: url('https://backgroundcheckall.com/wp-content/uploads/2017/12/login-background-images-for-website-6.jpg');">
            <div class="inner" style="background-image: url('');">
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <h3>Log In</h3>
                    <div class="form-group">

                    </div>
                    <c:if test="${sessionScope.user == null}">
                        <div class="form-wrapper">
                            <label for="username">Username</label>
                            <input name="username" class="form-control" placeholder="Enter Username..."/>
                        </div>
                        <div class="form-wrapper">
                            <label for="password">Password</label>
                            <input name="password" type="password" class="form-control" placeholder="Enter Password..."/>
                        </div>
                    </c:if>

                    <c:if test="${sessionScope.user != null}">
                        <div class="form-wrapper">
                            <label for="username">Username</label>
                            <input name="username" class="form-control" value="${user.username}" placeholder="Enter Username..."/>
                        </div>
                        <div class="form-wrapper">
                            <label for="password">Password</label>
                            <input name="password" type="password" class="form-control" value="${sessionScope.pass}" placeholder="Enter Password..."/>
                        </div>
                    </c:if>



                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Remember me
                            <span class="checkmark"></span>
                        </label>
                    </div>

                    <button type="submit" Class="btn btn-primary btn-block">Login</button>

                    <div style="padding:60px 0; margin-left: 100px;" class="form-wrapper">
                        <span class="">
                            Not a member?
                        </span>

                        <a style="color: white; font-weight: bold;" class="form-wrapper" href="${pageContext.request.contextPath}/register">
                            Sign up now							
                        </a>
                    </div>
                </form>
            </div>
        </div>


        <jsp:include page="../components/scripts.jsp"/>             




        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="${pageContext.request.contextPath}/js/logIn.js"></script>
    </body>
</html>