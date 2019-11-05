<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/login" method="post">

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

        </form>
        <a href="${pageContext.request.contextPath}/">Home</a>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="${pageContext.request.contextPath}/js/logIn.js"></script>
    </body>
</html>