<%-- 
    Document   : flightResults
    Created on : Oct 22, 2019, 3:22:17 PM
    Author     : vaspa
--%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flightResults.css">
        <style>
            input{
                border:0;
            }

        </style>
    </head>
    <body>

        <h1>Hello World!</h1>
        <a href="${pageContext.request.contextPath}/flight/postFlightResults">Post Flight Results</a>



        <div class="container">

            <c:forEach items="${flights.Itineraries}" var="it" >
                <s:form action="${pageContext.request.contextPath}/flight/postFlightResults" method="POST" modelAttribute="transportation">
                    <div class="row border border-primary mt-2">
                        <div class="col-md-8">
                            <c:forEach items="${flights.Legs}" var="f" varStatus="fcount" >

                                <c:if test="${f.Id == it.OutboundLegId }">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="d-flex d-row">
                                                <div class="pr-3">
                                                    <c:forEach items="${flights.Carriers}" var="car" varStatus="carcount">
                                                        <c:if test="${car.Id==f.Carriers[0]}">
                                                            <img src="${car.ImageUrl}" />
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <div class="p-3 ">
                                                        <div class="d-flex justify-content-end">
                                                            <span class="time">${fn:substring(f.Departure,11,16)}</span>
                                                            <s:input type="hidden" path="departure" value="${f.Departure}"/>
                                                        </div>
                                                        <div id="place_form" class="d-flex justify-content-end">
                                                            <c:forEach items="${flights.Places}" var="p" varStatus="pcount">
                                                                <c:if test="${p.Id==f.OriginStation}">
                                                                    <s:input type="hidden" path="startingPoint" value="${p.Name}" ></s:input>
                                                                    <span>${p.Code}</span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="LegInfo_stopsContainer__1XNWn ">
                                                    <span class="airUp">${f.Duration} m</span>
                                                    <ul class="LegInfo_stopLine__3_s15">
                                                        <li class="LegInfo_stopDot__2vHOR"></li>
                                                    </ul>
                                                    <span class="airUp">${fn:length(f.Stops)} stops</span>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <div class=" p-3">
                                                        <div class="d-flex justify-content-end">
                                                            <span  class="time">${fn:substring(f.Arrival,11,16)}</span>
                                                            <s:input type="hidden" path="arrival" value="${f.Arrival}"/>
                                                        </div>
                                                        <div id="place_to" class="d-flex justify-content-end">
                                                            <c:forEach items="${flights.Places}" var="p" varStatus="pcount">
                                                                <c:if test="${p.Id==f.DestinationStation}">
                                                                    <span>${p.Code}</span>
                                                                    <s:input type="hidden" path="destination" value="${p.Name}" ></s:input>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>                                             
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center ml-4">
                                                    <div class="p-3">
                                                        <div class="d-flex justify-content-center">
                                                            <span id="date">${fn:substring(fn:replace(f.Departure,"-","/"),5,10)} </span>
                                                            <s:input type="hidden" path="arrival" value="${f.Arrival}"/>
                                                        </div>                    
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${flights.Legs}" var="f" varStatus="fcount" >
                                <c:if test="${f.Id == it.InboundLegId }">
                                    <hr>
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div class="d-flex d-row">
                                                <div class="pr-3">
                                                    <c:forEach items="${flights.Carriers}" var="car" varStatus="carcount">
                                                        <c:if test="${car.Id==f.Carriers[0]}">
                                                            <img src="${car.ImageUrl}" />
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <div class="p-3 ">
                                                        <div class="d-flex justify-content-end">
                                                            <span class="time">${fn:substring(f.Departure,11,16)}</span>
                                                        </div>
                                                        <div id="place_form" class="d-flex justify-content-end">
                                                            <c:forEach items="${flights.Places}" var="p" varStatus="pcount">
                                                                <c:if test="${p.Id==f.OriginStation}">
                                                                    <span>${p.Code}</span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="LegInfo_stopsContainer__1XNWn ">
                                                    <span class="airUp">${f.Duration} m</span>
                                                    <ul class="LegInfo_stopLine__3_s15">
                                                        <li class="LegInfo_stopDot__2vHOR"></li>
                                                    </ul>
                                                    <span class="airUp">${fn:length(f.Stops)} stops</span>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <div class="p-3">
                                                        <div class="d-flex justify-content-end">
                                                            <span  class="time">${fn:substring(f.Arrival,11,16)}</span>
                                                        </div>
                                                        <div id="place_to" class="d-flex justify-content-end">
                                                            <c:forEach items="${flights.Places}" var="p" varStatus="pcount">
                                                                <c:if test="${p.Id==f.DestinationStation}">
                                                                    <span>${p.Code}</span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center ml-4">
                                                    <div class="p-3">
                                                        <div class="d-flex justify-content-center">
                                                            <span id="date">${fn:substring(fn:replace(f.Departure,"-","/"),5,10)} </span>
                                                        </div>                    
                                                    </div>
                                                </div>


                                            </div>      
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="col-md-4 d-flex align-items-center">
                            <c:forEach items="${flights.Legs}" var="f" varStatus="fcount" >
                                <c:if test="${f.Id==it.OutboundLegId}">     
                                    <div class="d-flex align-items-center ml-4">
                                        <div class=" d-flex justify-content-center">                                                                            
                                            <h4> <span class="font-weight-bold" > ${it.PricingOptions[0].Price}</span></h4>
                                            <s:input type="hidden" path="price" value="${it.PricingOptions[0].Price}" />
                                            <button id="submit" type="submit" class="ml-4 btn btn-primary" > Select</button>

                                        </div>
                                        <s:input type="hidden" path="this1" value="${it.PricingOptions[0].DeeplinkUrl}"/>
                                        <s:input type="hidden" path="transportationId" />
                                        <s:input type="hidden" path="tripId" />
                                        
                                    </div> 
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </s:form>
            </c:forEach>

        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/showFlights.js"></script>

    </body>
</html>
