
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AdminRegister</title> 
    </head>

    <body>

        <spring:form modelAttribute="admin" action="${pageContext.request.contextPath}/admin/postRegister" method="POST" id="adminRegisterForm">

            <div class="form-group">
                <spring:label path="adminName">Username</spring:label>
                <spring:input path="adminName" cssClass="form-control" placeholder="Enter Administration name..."/>

            </div>
            <div class="form-group">
                <spring:label path="email">email</spring:label>
                <spring:input path="email" cssClass="form-control" placeholder="Enter email..."/>

            </div>
            <div class="form-group">
                <spring:label path="password">Password</spring:label>
                <spring:input path="password" cssClass="form-control" placeholder="Enter password..."/>

            </div>
            </br>
            <div class="form-group">
                <button type="submit" Class="btn btn-primary btn-block">Save</button>
            </div>

        </spring:form>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
    </body>
</html> 