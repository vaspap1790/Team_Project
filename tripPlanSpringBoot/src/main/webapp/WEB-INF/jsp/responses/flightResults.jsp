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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flightResults.css">
    </head>
    <body>
        <h1>Hello World!</h1>
        <a href="${pageContext.request.contextPath}/flight/postFlightResults">Post Flight Results</a>

        <div class="container border w-50 mt-5 shadow">
            <div class="d-flex d-row">
                <div class="pr-3">
                    <img src="https://s1.apideeplink.com/images/airlines/RO.png" />
                </div>

                <div class="d-flex align-items-center">
                    <div class="p-3">
                        <div class="d-flex justify-content-end"><span class="time">22:00</span></div>
                        <div class="d-flex justify-content-end">ATH</div>
                    </div>
                </div>

                <div class="LegInfo_stopsContainer__1XNWn">
                    <span class="airUp">12h12m</span>
                    <ul class="LegInfo_stopLine__3_s15">
                        <li class="LegInfo_stopDot__2vHOR"></li>
                    </ul>
                    <span class="airUp">1 stop</span>
                </div>

                <div class="d-flex align-items-center">
                    <div class="p-3">
                        <div class="d-flex justify-content-end"><span class="time">22:00</span></div>
                        <div class="d-flex justify-content-end">SKG</div>
                    </div>
                </div>


                <div class="d-flex flex-column ml-auto mr-auto">
                    <div class="mt-1 d-flex justify-content-center"> <span> 25 $ </span></div>
                    <button class="mt-2">Select</button>

                </div>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/showFlights.js"></script>

    </body>
</html>
