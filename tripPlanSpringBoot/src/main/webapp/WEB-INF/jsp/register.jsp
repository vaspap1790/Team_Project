
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register</title> 
        <link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet">
    </head>

    <body>

        <spring:form modelAttribute="user" action="${pageContext.request.contextPath}/user/postRegister" method="POST" id="registerForm" enctype="multipart/form-data">

            <div class="form-group">
                <spring:label  path="firstname">First Name</spring:label>
                <spring:input path="firstname" cssClass="form-control" placeholder="Enter First Name..."/> 
                <spring:errors path="firstname" cssClass= "error"/> 
            </div>
            <div class="form-group">
                <spring:label path="lastname">Last Name</spring:label>
                <spring:input path="lastname" cssClass="form-control" placeholder="Enter Second Name..."/>

            </div>
            <div class="form-group">
                <spring:label path="username">Username</spring:label>
                <spring:input path="username" cssClass="form-control" placeholder="Enter Username..."/>

            </div>
            <div class="form-group">
                <spring:label path="email">email</spring:label>
                <spring:input path="email" cssClass="form-control" placeholder="Enter email..."/>

            </div>
            <div class="form-group">
                <spring:label path="password">Password</spring:label>
                <spring:input path="password" cssClass="form-control" placeholder="Enter password..."/>

            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input name="confirmPassword" class="form-control" placeholder="Enter password..."/>

            </div>
            <div class="form-group">
                <label for="photo">Photo</label>
                <input name="photo" type="file" class="form-control"/>
                
            </div>
            </br>
            <div class="form-group">
                <button type="submit" Class="btn btn-primary btn-block">Save</button>
            </div>

        </spring:form>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>


    </body>
</html> 