<%-- 
    Document   : flightResults
    Created on : Oct 22, 2019, 3:22:17 PM
    Author     : vaspa
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <a href="${pageContext.request.contextPath}/flight/postFlightResults">Post Flight Results</a>
        
       
        <c:forEach items="${flights.Quotes}" var="quo">
            <c:out value="${quo}"></c:out>
        </c:forEach>
        


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/showFlights.js"></script>

    </body>
</html>
