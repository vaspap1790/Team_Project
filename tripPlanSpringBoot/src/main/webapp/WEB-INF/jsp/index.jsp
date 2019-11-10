<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TripPlanner</title>

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/arrow.css">
        <script src="https://kit.fontawesome.com/e41a5911e2.js"></script>

    </head>

    <body>

        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container-fluid px-0 row">

                <div class="col-xl-7 offset-xl-1 col-lg-9 d-flex align-items-center flex-wrap justify-content-between">

                    <a class="navbar-brand" href="${pageContext.request.contextPath}/">TripPlanner</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                            aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="oi oi-menu"></span> Menu
                    </button>

                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active"><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
                            <li class="nav-item"><a href="" class="nav-link">About</a></li>
                            <li class="nav-item"><a href="" class="nav-link">Places</a></li>
                            <li class="nav-item"><a href="" class="nav-link">Blog</a></li>
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact</a></li>
                                <c:if test="${pageContext.request.userPrincipal.name == null}" >
                                <li> <a href="${pageContext.request.contextPath}/login" class="btn  btn-sm px-3 btn-warning mr-2 d-lg-none">Sign In</a></li>
                                <li> <a href="${pageContext.request.contextPath}/register" class="btn btn-sm px-3 btn-warning d-lg-none mt-2">Sign Up</a></li>
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <li> <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm px-3 btn-warning d-lg-none">Log out</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="col-4 col-lg-3 text-lg-right d-none d-lg-block">
                    <c:if test="${pageContext.request.userPrincipal.name == null}" >
                        <a href="${pageContext.request.contextPath}/login" class="btn  btn-sm px-3 btn-warning mr-2">Sign In</a>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-sm px-3 btn-warning">Sign Up</a>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <span style="margin: 0 20px;" class="text-white"><strong style="font-weight: bold;">Welcome</strong><strong style="font-style: italic;">,&nbsp;&nbsp;&nbsp; ${pageContext.request.userPrincipal.name} </strong></span>
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm px-3 btn-warning">Log out</a>
                    </c:if>
                </div>
            </div>
        </nav>

        <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_1.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
                     data-scrollax-parent="true">
                    <div class="col-md-9 ftco-animate mb-5 pb-5 text-center text-md-left"
                         data-scrollax=" properties: { translateY: '70%' }">
                        <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Discover <br>A new Place
                        </h1>
                        <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great places to stay, eat,
                            shop, or visit from local experts</p>

                        <div class="row justify-content-center">
                            <div>
                                <a href="${pageContext.request.contextPath}/user/choices" class="btn btn-outline-light btn-lg">Get Started</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a class="down-arrow" href="#start">
                <div class="arrow bounce d-none d-md-block">
                    <i class="fas fa-angle-down fa-3x" aria-hidden="true"></i>
                </div>
            </a>
        </div>

        <section id="start" class="ftco-section bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="intro ftco-animate">
                            <h3><span>01</span> Travel</h3>
                            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.
                                It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="intro ftco-animate">
                            <h3><span>02</span> Experience</h3>
                            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.
                                It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="intro ftco-animate">
                            <h3><span>03</span> Relax</h3>
                            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.
                                It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2 class="mb-4">See our latest vacation ideas</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 ftco-animate">
                        <a href="#" class="destination-entry img" style="background-image: url(images/destination-1.jpg);">
                            <div class="text text-center">
                                <h3>Beachfront Scape</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 ftco-animate">
                        <a href="#" class="destination-entry img"
                           style="background-image: url(images/destination-2-1.jpg);">
                            <div class="text text-center">
                                <h3>Group Holidays</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4 ftco-animate">
                        <a href="#" class="destination-entry img" style="background-image: url(images/destination-3.jpg);">
                            <div class="text text-center">
                                <h3>City Breaks</h3>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-about d-md-flex">
            <div class="one-half img" style="background-image: url(images/about.jpg);"></div>
            <div class="one-half ftco-animate">
                <div class="heading-section ftco-animate ">
                    <h2 class="mb-4">The Best Travel Agency</h2>
                </div>
                <div>
                    <p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would
                        have been rewritten a thousand times and everything that was left from its origin would be the word
                        "and" and the Little Blind Text should turn around and return to its own, safe country. But nothing
                        the copy said could convince her and so it didn’t take long until a few insidious Copy Writers
                        ambushed her, made her drunk with Longe and Parole and dragged her into their agency, where they
                        abused her for their.</p>
                </div>
            </div>
        </section>

        <section class="ftco-section services-section bg-light">
            <div class="container">
                <div class="row d-flex">
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block">
                            <div class="icon"><span class="flaticon-yatch"></span></div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Special Activities</h3>
                                <p>A small river named Duden flows by their place and supplies.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block">
                            <div class="icon"><span class="flaticon-around"></span></div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Travel Arrangements</h3>
                                <p>A small river named Duden flows by their place and supplies.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block">
                            <div class="icon"><span class="flaticon-compass"></span></div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Private Guide</h3>
                                <p>A small river named Duden flows by their place and supplies.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block">
                            <div class="icon"><span class="flaticon-map-of-roads"></span></div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Location Manager</h3>
                                <p>A small river named Duden flows by their place and supplies.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2 class="mb-4">Most Popular Destination</h2>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm col-md-6 col-lg ftco-animate">
                        <div class="destination">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/destination-1.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <div class="d-flex">
                                    <div class="one">
                                        <h3><a href="#">Paris, Italy</a></h3>
                                        <p class="rate">
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star-o"></i>
                                            <span>8 Rating</span>
                                        </p>
                                    </div>
                                    <div class="two">
                                        <span class="price">$200</span>
                                    </div>
                                </div>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <p class="days"><span>2 days 3 nights</span></p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> San Franciso, CA</span>
                                    <span class="ml-auto"><a href="#">Discover</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm col-md-6 col-lg ftco-animate">
                        <div class="destination d-md-flex flex-column-reverse">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/destination-2.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <div class="d-flex">
                                    <div class="one">
                                        <h3><a href="#">Paris, Italy</a></h3>
                                        <p class="rate">
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star-o"></i>
                                            <span>8 Rating</span>
                                        </p>
                                    </div>
                                    <div class="two">
                                        <span class="price">$200</span>
                                    </div>
                                </div>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <p class="days"><span>2 days 3 nights</span></p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> San Franciso, CA</span>
                                    <span class="ml-auto"><a href="#">Discover</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm col-md-6 col-lg ftco-animate">
                        <div class="destination">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/destination-3.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <div class="d-flex">
                                    <div class="one">
                                        <h3><a href="#">Paris, Italy</a></h3>
                                        <p class="rate">
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star-o"></i>
                                            <span>8 Rating</span>
                                        </p>
                                    </div>
                                    <div class="two">
                                        <span class="price">$200</span>
                                    </div>
                                </div>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <p class="days"><span>2 days 3 nights</span></p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> San Franciso, CA</span>
                                    <span class="ml-auto"><a href="#">Discover</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm col-md-6 col-lg ftco-animate">
                        <div class="destination d-md-flex flex-column-reverse">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/destination-4.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <div class="d-flex">
                                    <div class="one">
                                        <h3><a href="#">Paris, Italy</a></h3>
                                        <p class="rate">
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star-o"></i>
                                            <span>8 Rating</span>
                                        </p>
                                    </div>
                                    <div class="two">
                                        <span class="price">$200</span>
                                    </div>
                                </div>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <p class="days"><span>2 days 3 nights</span></p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> San Franciso, CA</span>
                                    <span class="ml-auto"><a href="#">Discover</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);"
                 data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="100000">0</strong>
                                        <span>Happy Customers</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="40000">0</strong>
                                        <span>Destination Places</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="87000">0</strong>
                                        <span>Hotels</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <strong class="number" data-number="56400">0</strong>
                                        <span>Restaurant</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2 class="mb-4"><strong>Popular</strong> Hotels</h2>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm col-md-6 col-lg ftco-animate">
                        <div class="destination">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/hotel-1.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <div class="d-flex">
                                    <div class="one">
                                        <h3><a href="#">New Orleans, Hotel</a></h3>
                                        <p class="rate">
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star-o"></i>
                                            <span>8 Rating</span>
                                        </p>
                                    </div>
                                    <div class="two">
                                        <span class="price per-price">$40<br><small>/night</small></span>
                                    </div>
                                </div>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> Miami, Fl</span>
                                    <span class="ml-auto"><a href="#">Book Now</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm col-md-6 col-lg ftco-animate">
                        <div class="destination d-md-flex flex-column-reverse">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/hotel-2.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <div class="d-flex">
                                    <div class="one">
                                        <h3><a href="#">New Orleans, Hotel</a></h3>
                                        <p class="rate">
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star-o"></i>
                                            <span>8 Rating</span>
                                        </p>
                                    </div>
                                    <div class="two">
                                        <span class="price per-price">$40<br><small>/night</small></span>
                                    </div>
                                </div>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> Miami, Fl</span>
                                    <span class="ml-auto"><a href="#">Book Now</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm col-md-6 col-lg ftco-animate">
                        <div class="destination">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/hotel-3.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <div class="d-flex">
                                    <div class="one">
                                        <h3><a href="#">New Orleans, Hotel</a></h3>
                                        <p class="rate">
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star-o"></i>
                                            <span>8 Rating</span>
                                        </p>
                                    </div>
                                    <div class="two">
                                        <span class="price per-price">$40<br><small>/night</small></span>
                                    </div>
                                </div>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> Miami, Fl</span>
                                    <span class="ml-auto"><a href="#">Book Now</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm col-md-6 col-lg ftco-animate">
                        <div class="destination d-md-flex flex-column-reverse">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/hotel-4.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <div class="d-flex">
                                    <div class="one">
                                        <h3><a href="#">New Orleans, Hotel</a></h3>
                                        <p class="rate">
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star-o"></i>
                                            <span>8 Rating</span>
                                        </p>
                                    </div>
                                    <div class="two">
                                        <span class="price per-price">$40<br><small>/night</small></span>
                                    </div>
                                </div>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> Miami, Fl</span>
                                    <span class="ml-auto"><a href="#">Book Now</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm col-md-6 col-lg ftco-animate">
                        <div class="destination">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/hotel-5.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <div class="d-flex">
                                    <div class="one">
                                        <h3><a href="#">New Orleans, Hotel</a></h3>
                                        <p class="rate">
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star"></i>
                                            <i class="icon-star-o"></i>
                                            <span>8 Rating</span>
                                        </p>
                                    </div>
                                    <div class="two">
                                        <span class="price per-price">$40<br><small>/night</small></span>
                                    </div>
                                </div>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> Miami, Fl</span>
                                    <span class="ml-auto"><a href="#">Book Now</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section testimony-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                        <h2 class="mb-4">Our satisfied customer says</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there
                            live the blind texts. Separated they live in</p>
                    </div>
                </div>
                <div class="row ftco-animate">
                    <div class="col-md-12">
                        <div class="carousel-testimony owl-carousel ftco-owl">
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text">
                                        <p class="mb-5">Far far away, behind the word mountains, far from the countries
                                            Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Mark Web</p>
                                        <span class="position">Marketing Manager</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(images/person_2.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text">
                                        <p class="mb-5">Far far away, behind the word mountains, far from the countries
                                            Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Mark Web</p>
                                        <span class="position">Interface Designer</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(images/person_3.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text">
                                        <p class="mb-5">Far far away, behind the word mountains, far from the countries
                                            Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Mark Web</p>
                                        <span class="position">UI Designer</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text">
                                        <p class="mb-5">Far far away, behind the word mountains, far from the countries
                                            Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Mark Web</p>
                                        <span class="position">Web Developer</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text">
                                        <p class="mb-5">Far far away, behind the word mountains, far from the countries
                                            Vokalia and Consonantia, there live the blind texts.</p>
                                        <p class="name">Mark Web</p>
                                        <span class="position">System Analyst</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2 class="mb-4">Recommended Restaurants</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="destination">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/restaurant-1.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <h3><a href="#">Luxury Restaurant</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> San Franciso, CA</span>
                                    <span class="ml-auto"><a href="#">Discover</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="destination d-md-flex flex-column-reverse">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/restaurant-2.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <h3><a href="#">Luxury Restaurant</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> San Franciso, CA</span>
                                    <span class="ml-auto"><a href="#">Book Now</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="destination">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/restaurant-3.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <h3><a href="#">Luxury Restaurant</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> San Franciso, CA</span>
                                    <span class="ml-auto"><a href="#">Book Now</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 ftco-animate">
                        <div class="destination d-md-flex flex-column-reverse">
                            <a href="#" class="img img-2 d-flex justify-content-center align-items-center"
                               style="background-image: url(images/restaurant-4.jpg);">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-link"></span>
                                </div>
                            </a>
                            <div class="text p-3">
                                <h3><a href="#">Luxury Restaurant</a></h3>
                                <p class="rate">
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star"></i>
                                    <i class="icon-star-o"></i>
                                    <span>8 Rating</span>
                                </p>
                                <p>Far far away, behind the word mountains, far from the countries</p>
                                <hr>
                                <p class="bottom-area d-flex">
                                    <span><i class="icon-map-o"></i> San Franciso, CA</span>
                                    <span class="ml-auto"><a href="#">Book Now</a></span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2><strong>Tips</strong> &amp; Articles</h2>
                    </div>
                </div>
                <div class="row d-flex">
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.html" class="block-20"
                               style="background-image: url('images/image_1.jpg');">
                            </a>
                            <div class="text">
                                <span class="tag">Tips, Travel</span>
                                <h3 class="heading mt-3"><a href="#">8 Best homestay in Philippines that you don't miss
                                        out</a></h3>
                                <div class="meta mb-3">
                                    <div><a href="#">October 3, 2018</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.html" class="block-20"
                               style="background-image: url('images/image_2.jpg');">
                            </a>
                            <div class="text">
                                <span class="tag">Culture</span>
                                <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the
                                        blind texts</a></h3>
                                <div class="meta mb-3">
                                    <div><a href="#">October 3, 2018</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.html" class="block-20"
                               style="background-image: url('images/image_3.jpg');">
                            </a>
                            <div class="text">
                                <span class="tag">Tips, Travel</span>
                                <h3 class="heading mt-3"><a href="#">Even the all-powerful Pointing has no control about the
                                        blind texts</a></h3>
                                <div class="meta mb-3">
                                    <div><a href="#">October 3, 2018</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section-parallax">
            <div class="parallax-img d-flex align-items-center">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                            <h2>Subcribe to our Newsletter</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia,
                                there live the blind texts. Separated they live in</p>
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





        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" /></svg></div>


        <footer id="foot" class="ftco-footer ftco-bg-dark ftco-section ftco-animate">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Contact Us</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia,
                                there live the blind texts.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4 ml-md-4">
                            <h2 class="ftco-heading-2">Information</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">About Us</a></li>
                                <li><a href="#" class="py-2 d-block">Online enquiry</a></li>
                                <li><a href="#" class="py-2 d-block">Call Us</a></li>
                                <li><a href="#" class="py-2 d-block">General enquiries</a></li>
                                <li><a href="#" class="py-2 d-block">Booking Conditions</a></li>
                                <li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
                                <li><a href="#" class="py-2 d-block">Refund policy</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Experience</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">Beach</a></li>
                                <li><a href="#" class="py-2 d-block">Adventure</a></li>
                                <li><a href="#" class="py-2 d-block">Wildlife</a></li>
                                <li><a href="#" class="py-2 d-block">Honeymoon</a></li>
                                <li><a href="#" class="py-2 d-block">Nature</a></li>
                                <li><a href="#" class="py-2 d-block">Party</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Have Questions?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text"><a target="_blank" href="https://www.google.com/maps/place/Omonoia+39,+Athina+105+64/@37.9807716,23.7300947,17z/data=!3m1!4b1!4m5!3m4!1s0x14a1bd3a371b1527:0xc814362af19d1764!8m2!3d37.9807716!4d23.7322834">Πανεπιστημίου 39, 1ος όροφος,<br>Τ.Κ. 10564, Αθήνα</a></span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+30 210 60 87 264
                                            </span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span
                                                class="text">tripPlannerDemo@gmail.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <div style="height: 250px; width: 250px;"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d786.2119282487015!2d23.732529646567396!3d37.98068313206236!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sgr!4v1572558339900!5m2!1sen!2sgr" width="250" height="250" frameborder="0" style="border:0;" allowfullscreen=""></iframe></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p>Copyright &copy;
                            <script>document.write(new Date().getFullYear());</script> All rights reserved</p>
                    </div>
                </div>
            </div>
        </footer>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/main.js"></script>

    </body>

</html>
