<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/login" method="post">

            <div class="container">
                <p>${msg}</p>

                <label for="username"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="username" required>

                <label for="password"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>

                <p>${errorMsg}</p>
                <button type="submit">Login</button>
            </div>

        </form>
        <a href="${pageContext.request.contextPath}/">Home</a>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="${pageContext.request.contextPath}/js/logIn.js"></script>
    </body>
</html>