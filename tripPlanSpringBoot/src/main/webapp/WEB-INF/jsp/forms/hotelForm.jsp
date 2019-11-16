
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Form</title>
        <jsp:include page="../components/linksHeader.jsp"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/autocomplete.css">
        <style>
            img{
                height: 100%;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp"/> 


        <div class="hero-wrap js-fullheight" style="background-image: url('https://cdnstatic1.eskypartners.com/backgrounds/hotele/hero_main4.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
                     data-scrollax-parent="true">
                    <div class="col-md-9 ftco-animate mb-5 pb-5 text-center text-md-left"
                         data-scrollax=" properties: { translateY: '70%' }">
                        <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Plan <br>Your own
                            Accommodation</h1>
                        <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great places to stay</p>
                    </div>
                </div>
            </div>
        </div>


        <section class="ftco-section justify-content-end ftco-search ftco-animate">
            <div class="container justify-content-center">
                <div class="row no-gutters">
                    <div class="col-md-12 nav-link-wrap">
                        <div class="nav nav-pills justify-content-center text-center" id="v-pills-tab" role="tablist"
                             aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" role="tab"
                               aria-controls="v-pills-1" aria-selected="true">Choose Hotel</a>
                        </div>
                    </div>
                    <div class="col-md-12 tab-wrap">

                        <div class="tab-content p-4 px-5" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel"
                                 aria-labelledby="v-pills-nextgen-tab">
                                <form action="${pageContext.request.contextPath}/hotel/postHotelForm" class="search-destination" method="POST">
                                    <div class="row"><div id="cityImg" style="max-height: 105px; max-width: 150px;"></div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">City</label>
                                                <div class="form-field">
                                                    <div class="icon"><i class="fa fa-home"></i></div>
                                                    <input autocomplete="off" type="text" id="city1" class="autocomplete form-control" required placeholder="Pick destination">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Check In</label>                           
                                                <div class="form-field" >
                                                    <div class="icon"><span class="far fa-calendar-alt"></span></div>          
                                                    <input autocomplete="off" name="checkin" class="form-control checkin_date" required="required"  type="text" placeholder="Check In" />
                                                </div>
                                            </div>
                                        </div>
                                        <div id="return" class="col-md align-items-end">
                                            <div  class="form-group">
                                                <label id="labelinbounddate" for="#">Check Out</label>
                                                <div  class="form-field ">
                                                    <div class="icon"><span class="far fa-calendar-alt"></span></div>                                                 
                                                    <input autocomplete="off" name="checkout" class="form-control checkout_date "  type="text" placeholder="Check Out" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-items-end">
                                            <div class="form-group">
                                                <label for="#">Guests</label>
                                                <div class="form-field">
                                                    <div class="select-wrap">
                                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                        <select name="guests" class="form-control">
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                        </select>
                                                        <input name="dest_id" id="dest_id" hidden>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md align-self-end">
                                            <div class="form-group">
                                                <div class="form-field">
                                                    <input id="submit" type="submit" value="Search"
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

        <script type="text/javascript" src="${pageContext.request.contextPath}/js/booking.js"></script>

    </body>
</html>
