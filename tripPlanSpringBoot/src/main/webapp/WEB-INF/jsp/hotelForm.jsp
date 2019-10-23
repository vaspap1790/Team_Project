<%-- 
    Document   : hotelForm
    Created on : Oct 22, 2019, 3:22:32 PM
    Author     : vaspa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/autocomplete.css">
    </head>
    <body>
        <h1>Hello World!ggffg</h1>
        <a href="${pageContext.request.contextPath}/hotel/postHotelForm">hotel</a>
        
            <form>

            <input type="text" id="city1" class="autocomplete">
        </form>
      

   
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/booking.js"></script>

    </body>
</html>
