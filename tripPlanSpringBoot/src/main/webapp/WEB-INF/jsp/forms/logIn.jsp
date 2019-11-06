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

        <div class="wrapper" style="background-image: url('https://azmind.com/demo/bootstrap-registration-forms/form-1/assets/img/backgrounds/1@2x.jpg');">
            <div class="inner" style="background-image: url('');">
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <h3>Log In</h3>
                    <div class="form-group">
                        <!--                        <div class="form-wrapper">
                        <%--<spring:label  path="firstname">First Name</spring:label>--%>
                        <%--<spring:input path="firstname" cssClass="form-control" placeholder="Enter First Name..."/>--%> 
                        <%--<spring:errors path="firstname" cssClass= "error"/>--%>
                    </div>-->
                        <!--                        <div class="form-wrapper">
                        <%--<spring:label path="lastname">Last Name</spring:label>--%>
                        <%--<spring:input path="lastname" cssClass="form-control" placeholder="Enter Last Name..."/>--%>
                    </div>-->
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



                    <!--                    <div class="form-wrapper text-center">
                                            <span class="">
                                                Or login with
                                            </span>
                                        </div>
                    
                                        <a href="#" class="form-wrapper">
                                            <i class="fa fa-facebook-square"></i>
                                            Facebook
                                        </a>
                    
                                        <a href="#" class="form-wrapper btn-google m-b-10">
                                            <img src="images/icons/icon-google.png" alt="GOOGLE">
                                            Google
                                        </a>-->

<!--                    <div class="form-wrapper text-center">
                        <span class="">
                            Not a member?
                        </span>

                        <a class="form-wrapper" href="#">
                            Sign up now							
                        </a>
                    </div>-->
                </form>
            </div>
        </div>



<!--        <form action="${pageContext.request.contextPath}/login" method="post">

    <div class="container">
        
        <c:if test="${sessionScope.user == null}">
        
        <label for="username"><b>Username</b></label>
        <input type="text" placeholder="Enter Username" name="username" required>

        <label for="password"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" required>

        <button type="submit">Login</button>
        </c:if>
        
        <c:if test="${sessionScope.user != null}">
        
        <label for="username"><b>Username</b></label>
        <input type="text" value="${user.username}" name="username" required>

        <label for="password"><b>Password</b></label>
        <input type="password" value="${sessionScope.pass}" name="password" required>

        <button type="submit">Login</button>
        </c:if>
        
    </div>

</form>-->



        <jsp:include page="../components/scripts.jsp"/>             

<!--        <a href="${pageContext.request.contextPath}/">Home</a>-->


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="${pageContext.request.contextPath}/js/logIn.js"></script>
    </body>
</html>