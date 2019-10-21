<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                                  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
                            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                                    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                            crossorigin="anonymous"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                                    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                            crossorigin="anonymous"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                                    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                            crossorigin="anonymous"></script>
                            <script src="https://kit.fontawesome.com/e41a5911e2.js"></script>
                            <link href="${pageContext.request.contextPath}/css/flightForm.css" rel="stylesheet">-->




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




    </head>

    <body>

        <!--        <div class="mainpage">
            
                        <div class="home-inner">
                            <h1 class="text-center p-5">Where to next?</h1>
                            <div id="flightform" class="container border shadow p-3 rounded">
        <spring:form modelAttribute="flight" action="${pageContext.request.contextPath}/flight/postRegister"
                     method="POST" onsubmit="">

            <div>
            <spring:hidden path="country" />
        </div>
        <div class="col-md-2">
            <spring:hidden path="currency" />
        </div>
        <div class="col-md-2">
            <spring:hidden path="locale" />
        </div>

        <div class="d-flex form-row p-2">
            <input type="radio" name="radiogroup" value="on" checked>
            <label for="">Roundtrip</label>

            <input type="radio" name="radiogroup" value="on">
            <label for="">One way</label>

            <div class="">
                <a id="map"
                   href="https://gr.skyscanner.com/inspire/map?outboundDate=2019-10-14&outboundPlace=&preferDirects=false">Map</a>
            </div>

        </div>



        <div class="form-row">
            <div class="form-group col-md-2">
            <spring:label path="originPlace">From</spring:label>
            <spring:input cssClass="autocomplete form-control" path="originPlace" type="text"
                          placeholder="From *" />
        </div>
        <div class="form-group col-md-2">
            <spring:label path="destinationPlace">To</spring:label>
            <spring:input cssClass="autocomplete form-control" path="destinationPlace" type="text"
                          placeholder="To *" />
        </div>
        <div class="form-group col-md-2">
            <spring:label path="originPlace">Depart</spring:label>
            <spring:input path="outboundDate" type="date" class="form-control" placeholder="outbounddate *" />
        </div>


        <div class="col-md-2">
            <label path="inboundDate">Return</label>
            <input name="inboundDate" type="date" class="form-control" placeholder="epistrofi *" />
        </div>
         <div class="form-group col-md-2">
            <spring:label path="adults">Travelers</spring:label>
            <spring:input path="adults" type="text" class="form-control" placeholder="Travelers *" />
        </div> 


            <div class="col-md-2">
            <spring:label path="adults">Travelers</spring:label>
                <div>
            <spring:select path="adults" class="form-control">
                <spring:option value="1" selected="selected">1</spring:option>
                <spring:option value="2">2</spring:option>
                <spring:option value="3">3</spring:option>
                <spring:option value="4">4</spring:option>
                <spring:option value="5">5</spring:option>
            </spring:select>
        </div>
    </div>


    <div class="col-md-2">
            <spring:label path="cabinClass">Cabin Class</spring:label>
                <div>
            <spring:select path="cabinClass" class="form-control">
                <spring:option value="economy" selected="selected">economy</spring:option>
                <spring:option value="business">business</spring:option>
            </spring:select>
        </div>

    </div>


</div>


<div class="d-flex justify-content-md-end">
    <button type="submit" class="btn btn-info">Search flights <i
            class="fas fa-arrow-right"></i></button>
</div>
        </spring:form>
    </div>
</div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/flightJs.js"></script>-->






        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">TripPlanner</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="#" class="nav-link">Home</a></li>
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

        <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
                     data-scrollax-parent="true">
                    <div class="col-md-9 ftco-animate mb-5 pb-5 text-center text-md-left"
                         data-scrollax=" properties: { translateY: '70%' }">
                        <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Plan <br>Your own
                            Trip</h1>
                        <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great places to stay, eat,
                            shop, or visit from local experts</p>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section justify-content-end ftco-search">
            <div class="container-wrap ml-auto">
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
                                <form action="#" class="search-destination">
                                    <div class="row">
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">From</label>
                                                <div class="form-field">
                                                    <div class="icon"><span class="icon-my_location"></span></div>
                                                    <input type="text" class="form-control" placeholder="From">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Where</label>
                                                <div class="form-field">
                                                    <div class="icon"><span class="icon-map-marker"></span></div>
                                                    <input type="text" class="form-control" placeholder="Where">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Depart</label>
                                                <div class="form-field">
                                                    <div class="icon"><span class="icon-map-marker"></span></div>
                                                    <input type="text" class="form-control checkin_date"
                                                           placeholder="Check In">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Return</label>
                                                <div class="form-field">
                                                    <div class="icon"><span class="icon-map-marker"></span></div>
                                                    <input type="text" class="form-control checkout_date"
                                                           placeholder="From">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Travelers</label>
                                                <div class="form-field">
                                                    <div class="select-wrap">
                                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">1</option>
                                                            <option value="">2</option>
                                                            <option value="">3</option>
                                                            <option value="">4</option>
                                                            <option value="">5</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Cabin Class</label>
                                                <div class="form-field">
                                                    <div class="select-wrap">
                                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">Economy</option>
                                                            <option value="">Business</option>
                                                        </select>
                                                    </div>
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
                                </form>
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
        <script src="../js/google-map.js"></script>
        <script src="../js/main.js"></script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/flightJs.js"></script>

    </body>

</html>