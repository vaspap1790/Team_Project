<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="App">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TripPlanner</title>
        <jsp:include page="components/linksHeader.jsp"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/posts.css">

        <script data-require="angular.js@*" data-semver="1.5.0"
        src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.js"></script>
        <script src="https://code.angularjs.org/1.5.0/angular-animate.min.js"></script>
        <script src="https://code.angularjs.org/1.5.0/angular-aria.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angular_material/1.0.5/angular-material.min.js"></script>
        <link rel="stylesheet"
              href="https://ajax.googleapis.com/ajax/libs/angular_material/1.0.5/angular-material.min.css" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jk-carousel.min.css" />

    </head>

    <body ng-controller="MainCtrl">
        <jsp:include page="components/navbar.jsp" />

        <div class="hero-wrap js-fullheight" style="background-image: url('http://smashingtips.com/wp-content/uploads/2012/08/Amazing-Scenery-HD-Wallpapers.jpg');">
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
                                <a href="${pageContext.request.contextPath}/user/choices" class="btn btn-outline-light btn-lg" id="startbtn">Get Started</a>
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

        <div class="container ftco-section bg-light" id="start">
            <div class="row justify-content-center">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <h2><strong>Posts</strong> &amp; Comments</h2>
                </div>
            </div>
        </div>

        <!--Posts-->

        <div class="container d-flex flex-wrap justify-content-center" id="mainPostContainer">

            <div class="card shadow-lg" ng-repeat="post in posts track by $index">

                <div class="card-body">
                    <div class="d-flex row mt-2 mb-2 align-items-center">

                        <div class="col-1 photoHover" style="height: 40px; width: 40px;">
                            <img src="data:image/jpg;base64,{{post.profilePhoto}}" id="profilePicture"  alt="avatar" style="height: 40px; width: 40px;">
                        </div>

                        <div class="col-11 pl-3 pr-2">
                            <div><strong> {{post.username}} 's trip: {{post.title}}</strong></div>
                            <div style="font-size:xx-small;"><strong>{{post.timeStamp.substring(0, 19).replace("T", " ")}}</strong></div>
                        </div>

                    </div>

                    <div class="d-flex row mt-2 mb-2 px-1">
                        <p class="card-text">{{post.body}}</p>
                    </div>

                    <div class="row mt-2 mb-2">

                        <!--////////////////Carousel (yet to add)////////////////-->


                        <!--                        <md-card layout="column" layout-align="center center" style="padding-bottom: 10px">
                                                    <h3>AutoSlide Carousel</h3>
                                                    <jk-carousel data="post.photos" item-template-url="'item-template.'" max-width="800" max-height="500"
                                                                 auto-slide="true" auto-slide-time="2000">
                                                    </jk-carousel>
                                                </md-card>-->


                        <!--When carousel is ready add ng-show="!post.photos.length"--> 
                        <img src="https://cdn.blueswandaily.com//2018/11/Travel000-2000x1200.jpg" 
                             id="mainPicture" alt="" srcset="">

                    </div>

                    <div class="row mt-1 d-flex justify-content-between align-items-center px-2">
                        <div>
                            <img src="https://image.flaticon.com/icons/svg/2065/2065064.svg" style="width:30px;" alt="">
                            <span id="numOfLikes{{$index}}">{{post.likes.length}}</span>
                        </div>
                        <p>{{post.comments.length}} Comments</p>
                    </div>

                    <div class="row d-flex justify-content-around align-items-center">

                        <hr
                            style="width: 96%; color:rgba(99, 99, 99, 0.05); height: 0.05px; background-color:rgba(99, 99, 99, 0.05);" />

                        <a href="" class="btn btn-basic" ng-click="handleLikeBtn($event, $index)"><i class="far fa-thumbs-up"></i> Like</a>
                        <a href="" class="btn btn-basic" ng-click="handleCommentBtn($event, $index)"><i class="far fa-comments"></i> Comment</a>
                        <a href="" class="btn btn-basic"><i class="fas fa-share-alt"></i> Share</a>

                        <hr
                            style="width: 96%; color:rgba(99, 99, 99, 0.05); height: 0.05px; background-color:rgba(99, 99, 99, 0.05);" />

                    </div>

                    <div class="row d-flex justify-content-center">

                        <form style="width:96%">
                            <div class="input-group mycustom">
                                <input type="text" class="form-control" placeholder="Write a comment..." required>
                                <div class="input-group-prepend">
                                    <button type="submit" ng-click="handleCommentSubmitBtn($event, $index)"
                                            class="btn btn-warning btn-sm"><i class="fas fa-arrow-circle-right text-white pl-2 pr-2"></i></button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

        </div>             


        <!--        <section id="start" class="ftco-section bg-light">
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
                                    <div class="text p-3">-->
        <!--                                <h3><a href="#">Luxury Restaurant</a></h3>
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
                </section>-->


        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" /></svg></div>

        <jsp:include page="components/footer.jsp"/>
        <jsp:include page="components/scripts.jsp"/>     
        <script src="${pageContext.request.contextPath}/js/jk-carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/indexPosts.js"></script>
    </body>

</html>
