<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">

        <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="../css/animate.css">

        <link rel="stylesheet" href="../css/owl.carousel.min.css">
        <link rel="stylesheet" href="../css/owl.theme.default.min.css">
        <link rel="stylesheet" href="../css/magnific-popup.css">

        <link rel="stylesheet" href="../css/aos.css">

        <link rel="stylesheet" href="../css/ionicons.min.css">

        <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="../css/jquery.timepicker.css">


        <link rel="stylesheet" href="../css/flaticon.css">
        <link rel="stylesheet" href="../css/icomoon.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/autocomplete.css">

    </head>

    <body>

        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">TripPlanner</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
                        <li class="nav-item"><a href="" class="nav-link">About</a></li>
                        <li class="nav-item"><a href="" class="nav-link">Places</a></li>
                        <li class="nav-item"><a href="" class="nav-link">Hotels</a></li>
                        <li class="nav-item"><a href="" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="" class="nav-link">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <div class="hero-wrap js-fullheight" style="background-image: url('../images/destination-4.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
                     data-scrollax-parent="true">
                    <div class="col-md-9 ftco-animate mb-5 pb-5 text-center text-md-left"
                         data-scrollax=" properties: { translateY: '70%' }">
                        <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Plan <br>Your Flight
                        </h1>
                        <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great prices to fly and explore the world</p>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section justify-content-end ftco-search">
            <div class="container justify-content-center">
                <div class="row no-gutters">
                    <div class="col-md-12 nav-link-wrap">
                        <div class="nav nav-pills justify-content-center text-center" id="v-pills-tab" role="tablist"
                             aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab"
                               aria-controls="v-pills-1" aria-selected="true">Flight</a>
                        </div>
                    </div>
                    <div class="col-md-12 tab-wrap">

                        <div class="tab-content p-4 px-5" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel"
                                 aria-labelledby="v-pills-nextgen-tab">
                                <spring:form  id="flightForm" modelAttribute="flight" action="${pageContext.request.contextPath}/flight/postRegister"
                                              class="search-destination">
                                    <div class="d-flex form-row p-2">
                                        <div class="form-group">
                                            <spring:radiobutton  path="type" value="oneWay" checked="checked"/>
                                            <label for="">One Way</label>
                                            <spring:radiobutton  path="type" class="ml-4" value="roundTrip"/>
                                            <label for="">Roundtrip</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">From</label>
                                                <div class="form-field">
                                                    <div class="icon"><span class="icon-my_location"></span></div>
                                                    <input type="text" class="autocomplete form-control" placeholder="From *">
                                                    <spring:hidden id="originPlace" path="originPlace" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Where</label>
                                                <div class="form-field">
                                                    <div class="icon"><span class="icon-map-marker"></span></div>
                                                    <input type="text" class="autocomplete form-control" placeholder="To *">
                                                    <spring:hidden id="destinationPlace" path="destinationPlace"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Depart</label>                           
                                                <div class="form-field" >
                                                    <div class="icon"><span class="icon-map-marker"></span></div>          
                                                        <spring:input path="outboundDate" cssClass="form-control checkin_date"  type="text" placeholder="To *" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Return</label>
                                                <div class="form-field">
                                                    <div class="icon"><span class="icon-map-marker"></span></div>                                                 
                                                    <input name="inboundDate"  class="form-control checkout_date" type="text" placeholder="From *" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-self-end">
                                            <div class="form-group">
                                                <div class="form-field">
                                                    <input type="submit" value="Search"
                                                           class="form-control btn btn-primary">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </spring:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <script src="../js/jquery.min.js"></script>
        <script src="../js/jquery-migrate-3.0.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.easing.1.3.js"></script>
        <script src="../js/jquery.waypoints.min.js"></script>
        <script src="../js/jquery.stellar.min.js"></script>
        <script src="../js/owl.carousel.min.js"></script>
        <script src="../js/jquery.magnific-popup.min.js"></script>
        <script src="../js/aos.js"></script>
        <script src="../js/jquery.animateNumber.min.js"></script>
        <script src="../js/bootstrap-datepicker.js"></script>
        <!--<script src="../js/jquery.timepicker.min.js"></script>-->
        <script src="../js/scrollax.min.js"></script>
        <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <!--<script src="../js/google-map.js"></script>-->
        <script src="../js/main.js"></script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/flightJs.js"></script>

    </body>

</html>
