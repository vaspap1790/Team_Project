<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/user/postLogIn" method="POST">
            
            <input type="text" placeholder="username" name="username"/>
            <input type="text" placeholder="password" name="password"/>
            <input type="submit"/>
            
        </form>
    </body>
</html>