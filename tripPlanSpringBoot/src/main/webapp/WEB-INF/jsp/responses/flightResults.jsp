
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Results</title>
        <jsp:include page="../components/linksHeader.jsp"/>

        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flightResults.css">
        <!--        <style>
                    input{
                        border:0;
                    }
        
                </style>-->
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp"/>


        <div class="hero-wrap js-fullheight" style="background-image: url('https://www.flightshopee.com/f-images/slider/flight02.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
                    <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                        <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="${pageContext.request.contextPath}/">Home</a></span> <span>Flights</span></p>
                        <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Flight Results</h1>
                    </div>
                </div>
            </div>
        </div>


        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 sidebar order-md-last ftco-animate">
                        <div class="sidebar-wrap ftco-animate">
                            <h3 class="heading mb-4">Find City</h3>
                            <form action="#">
                                <div class="fields">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Destination, City">
                                    </div>
                                    <div class="form-group">
                                        <div class="select-wrap one-third">
                                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                            <select name="" id="" class="form-control" placeholder="Keyword search">
                                                <option value="">Select Location</option>
                                                <option value="">San Francisco USA</option>
                                                <option value="">Berlin Germany</option>
                                                <option value="">Lodon United Kingdom</option>
                                                <option value="">Paris Italy</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" id="checkin_date" class="form-control checkin_date" placeholder="Date from">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" id="checkout_date" class="form-control checkout_date" placeholder="Date to">
                                    </div>
                                    <div class="form-group">
                                        <div class="range-slider">
                                            <span>
                                                <input type="number" value="25000" min="0" max="120000"/>	-
                                                <input type="number" value="50000" min="0" max="120000"/>
                                            </span>
                                            <input value="1000" min="0" max="120000" step="500" type="range"/>
                                            <input value="50000" min="0" max="120000" step="500" type="range"/>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" value="Search" class="btn btn-primary py-3 px-5">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="sidebar-wrap ftco-animate">
                            <h3 class="heading mb-4">Star Rating</h3>
                            <form method="post" class="star-rating">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">
                                        <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">
                                        <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">
                                        <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">
                                        <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">
                                        <p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
                                    </label>
                                </div>
                            </form>
                        </div>
                    </div><!-- END-->

                    <div class="col-lg-9">
                        <div class="row">
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
                                                            <%--<s:input type="hidden" path="tripId"  />--%>
                                                        </div> 
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </s:form>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col text-center">
                                <div class="block-27">
                                    <ul>
                                        <li><a href="#">&lt;</a></li>
                                        <li class="active"><span>1</span></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">&gt;</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div> <!-- .col-md-8 -->
                </div>
            </div>
        </section>

        <section class="ftco-section-parallax">
            <div class="parallax-img d-flex align-items-center">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                            <h2>Subcribe to our Newsletter</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
                            <div class="row d-flex justify-content-center mt-5">
                                <div class="col-md-8">
                                    <form action="#" class="subscribe-form">
                                        <div class="form-group d-flex">
                                            <input type="text" class="form-control" placeholder="Enter email address">
                                            <input type="submit" value="Subscribe" class="submit px-3">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        
        <jsp:include page="../components/footer.jsp"/>
        <jsp:include page="../components/scripts.jsp"/>

        <!--        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->


        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/showFlights.js"></script>

    </body>
</html>
