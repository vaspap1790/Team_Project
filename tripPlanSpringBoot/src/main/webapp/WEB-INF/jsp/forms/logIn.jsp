<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/user/postLogIn" method="POST" id="logInForm">

            <input type="text" placeholder="username" name="username"/>
            <input type="text" placeholder="password" name="password"/>
            <input type="submit"/>

        </form>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="${pageContext.request.contextPath}/js/logIn.js"></script>
    </body>
</html>