<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Results</title>
        <jsp:include page="../components/linksHeader.jsp"/>

    </head>
    <body>
        <jsp:include page="../components/navbar.jsp"/>

        <div class="hero-wrap" style="background-image: url('https://cdn.hotelplanner.com/Common/Images/_HotelPlanner/Home-Page/fade/sld6.jpg'); background-attachment: fixed;">
            <div class="overlay"></div>
            <div class="container pt-5">
                <div class="row no-gutters slider-text align-items-center justify-content-center pt-5" data-scrollax-parent="true">
                    <div class="col-md-9 text-center ftco-animate pt-5" data-scrollax=" properties: { translateY: '70%' }">
                        <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="${pageContext.request.contextPath}/">Home</a></span> <span>Hotel</span></p>
                        <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hotels</h1>
                    </div>
                </div>
            </div>

            <section id="start" class="ftco-section pb-0" style="padding-top: 140px;">
                <div class="container ftco-animate bg-white px-5 py-4">
                    <div class="row">
                        <div class="col-lg-3 sidebar order-md-last ftco-animate">
                            <div class="sidebar-wrap ftco-animate">
                                <h3 class="heading mb-4">Find City</h3>
                                <form action="${pageContext.request.contextPath}/hotel/postHotelResults">
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
                                                    <option value="">London United Kingdom</option>
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
                                <c:if test="${booking.bookingJson.count>0}">
                                    <c:forEach items="${booking.bookingJson.result}" var="res">
                                        <div class="col-sm col-md-6 col-lg-4 ftco-animate">
                                            <div class="destination">
                                                <div class="destination">
                                                    <a href="${res.url}" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${res.main_photo_url}); background-size: 200px">
                                                        <div class="icon d-flex justify-content-center align-items-center">
                                                            <span class="icon-link"></span>
                                                        </div>
                                                    </a>
                                                    <div class="text p-3">
                                                        <div class="d-flex">
                                                            <div class="one">
                                                                <h3 style="width: 180px; height: 30px; overflow: hidden;"><a href="${res.url}">${res.hotel_name}</a></h3>

                                                                <p class="rate">
                                                                    <i class="icon-star"></i>
                                                                    <i class="icon-star"></i>
                                                                    <i class="icon-star"></i>
                                                                    <i class="icon-star"></i>
                                                                    <i class="icon-star-o"></i>
                                                                    <span>${res.review_score} Rate</span>
                                                                </p>
                                                            </div>
                                                            <div class="two">
                                                                <span class="price per-price">
                                                                    <c:if test="${res.min_total_price > 0}">
                                                                        ${res.min_total_price} ${res.price_breakdown.currency}                                
                                                                        <br><small>/night</small></span>
                                                                    </c:if>
                                                                    <c:if test="${res.min_total_price eq 0}">
                                                                    N/A
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <p style="width: 210px; height: 25px; overflow: hidden;"><small>Adress : ${res.address} </small></p>
                                                        <hr>
                                                        <p class="bottom-area d-flex">
                                                            <span><i class="icon-map-o"></i> ${res.city}</span> 
                                                            <s:form action="${pageContext.request.contextPath}/hotel/postHotelResults" modelAttribute="accommodation" method="POST">
                                                                <s:input type="hidden" path="this1" value="${res.url}" />
                                                                <s:input type="hidden" path="location" value="${res.country_trans},${res.city_trans}" />
                                                                <s:input type="hidden" path="price" value="${res.min_total_price}" />
                                                                <s:input type="hidden" path="accommoName" value="${res.hotel_name}" />
                                                                <s:input type="hidden" path="checkin" value="${booking.checkin}" />
                                                                <s:input type="hidden" path="checkout" value="${booking.checkout}" />
                                                                <span class="ml-auto"><button class="btn btn-primary" type="submit">Book Now</button></span>
                                                            </s:form>
                                                        </p>
                                                    </div>
                                                </div>          
                                            </div>
                                        </div>

                                    </c:forEach>
                                </c:if>
                            </div>

                            <div class="row mt-5">
                                <div class="col text-center">
                                    <div class="block-27">
                                        <ul>
                                            <li><a href="#start">&lt;</a></li>
                                            <li class="active"><span>1</span></li>
                                            <li><a href="#start">2</a></li>
                                            <li><a href="#start">3</a></li>
                                            <li><a href="#start">4</a></li>
                                            <li><a href="#start">5</a></li>
                                            <li><a href="#start">&gt;</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- .col-md-8 -->
                    </div>
                </div>
            </section> <!-- .section -->

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

        </div>

        <jsp:include page="../components/scripts.jsp"/>
    </body>
</html>
