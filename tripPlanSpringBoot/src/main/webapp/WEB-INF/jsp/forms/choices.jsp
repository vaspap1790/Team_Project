<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <jsp:include page="../components/linksHeader.jsp"/>
        <link rel="stylesheet" href="../css/autocomplete.css">
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp"/>

        <div class="hero-wrap js-fullheight" style="background-image: url('../images/image_3.jpg');">
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

        <section class="ftco-section justify-content-end ftco-search animated fadeInUpBig">
            <div class="container justify-content-center">
                <div class="row no-gutters">
                    <div class="col-md-12 nav-link-wrap">
                        <div class="nav nav-pills justify-content-center text-center" id="v-pills-tab" role="tablist"
                             aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" role="tab"
                               aria-controls="v-pills-1" aria-selected="true">Create Trip</a>
                        </div>
                    </div>
                    <div class="col-md-12 tab-wrap">

                        <div class="tab-content p-4 px-5" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel"
                                 aria-labelledby="v-pills-nextgen-tab">
                                <form action="${pageContext.request.contextPath}/user/postChoices" class="search-destination">
                                    <div class="row">
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Trip</label>
                                                <div class="form-field">
                                                    <div class="select-wrap">
                                                        <div class="icon"><span class="icon-my_location"></span></div>
                                                        <input type="text" name="location" class="autocomplete form-control" required="required" placeholder="Name Your Trip *">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Transportation</label>
                                                <div class="form-field">
                                                    <div class="select-wrap">
                                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>

                                                        <select name="transportation" class="form-control">
                                                            <option value="flight">Airplane</option>
                                                            <option value="train">Train</option>
                                                            <option value="ship">Ship</option>
                                                            <option value="none">None</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Accommodation</label>
                                                <div class="form-field">
                                                    <div class="select-wrap">
                                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>

                                                        <select name="accomodation" class="form-control">
                                                            <option value="hotel">Hotel</option>
                                                            <option value="hostel">Hostel</option>
                                                            <option value="airbnb">AirBnb</option>
                                                            <option value="none">None</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Rentals</label>
                                                <div class="form-field">
                                                    <div class="select-wrap">
                                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>

                                                        <select name="rental" class="form-control">
                                                            <option value="car">Car</option>
                                                            <option value="motocycle">Motocycle</option>
                                                            <option selected="selected" value="none">None</option>
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



        <jsp:include page="../components/scripts.jsp"/>


        <script
            src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"
            integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/choices.js"></script>

    </body>
</html>
