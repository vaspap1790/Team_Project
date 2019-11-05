
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>

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
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">TripPlanner</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
                        <li class="nav-item"><a href="" class="nav-link">About</a></li>
                        <li class="nav-item"><a href="" class="nav-link">Places</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/flight/register" class="nav-link">Flights</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/hotel/hotelForm" class="nav-link">Hotels</a></li>
                        <li class="nav-item"><a href="" class="nav-link">Blog</a></li>
                        <li class="nav-item active"><a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact</a></li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/user/logIn" class="btn btn-warning mr-2">Sign In</a>
                    <a href="${pageContext.request.contextPath}/user/register" class="btn btn-warning">Sign Up</a>
                </div>
            </div>
        </nav>
        <!-- END nav -->


        <div class="hero-wrap js-fullheight" style="background-image: url('https://alpinecabinet.com/wp-content/uploads/2018/12/contact-background.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
                    <div class="col-md-9 text-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                        <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Blog</span></p>
                        <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Contact Us</h1>
                    </div>
                </div>
            </div>
            <a class="down-arrow" href="#start">
                <div class="arrow bounce d-none d-md-block">
                    <i class="fas fa-angle-down fa-3x" aria-hidden="true"></i>
                </div>
            </a>
        </div>

        <section id="start" class="ftco-section contact-section ftco-degree-bg ftco-animate">
            <div class="container">
                <div class="row d-flex mb-5 contact-info">
                    <div class="col-md-12 mb-4">
                        <h2 class="h4">Contact Information</h2>
                    </div>
                    <div class="w-100"></div>
                    <div class="col-md-3">
                        <p><span>Address:</span> <a target="_blank" href="https://www.google.com/maps/place/Omonoia+39,+Athina+105+64/@37.9807716,23.7300947,17z/data=!3m1!4b1!4m5!3m4!1s0x14a1bd3a371b1527:0xc814362af19d1764!8m2!3d37.9807716!4d23.7322834">Πανεπιστημίου 39,<br> 1ος όροφος,<br>Τ.Κ. 10564, Αθήνα</a></p>
                    </div>
                    <div class="col-md-3">
                        <p><span>Phone:</span> <a href="tel://1234567920">+30 210 60 87 264</a></p>
                    </div>
                    <div class="col-md-6">
                        <p><span>Email:</span> <a href="#">tripPlannerDemo@gmail.com</a></p>
                    </div>
                </div>
                <div class="row block-9">
                    <div class="col-md-6 order-md-last pr-md-5">
                        <form action="#">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Your Name">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Your Email">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Subject">
                            </div>
                            <div class="form-group">
                                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
                            </div>
                        </form>

                    </div>

                    <div class="col-md-6">
                        <div id="map"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1111.8734290683103!2d23.732775172937295!3d37.980560549553495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sgr!4v1572558519810!5m2!1sen!2sgr" width="550" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe></div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section-parallax ftco-animate">
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
        <!--<script src="js/jquery.timepicker.min.js"></script>-->
        <script src="js/scrollax.min.js"></script>
        <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <!--<script src="js/google-map.js"></script>-->
        <script src="js/main.js"></script>

    </body>
</html>
