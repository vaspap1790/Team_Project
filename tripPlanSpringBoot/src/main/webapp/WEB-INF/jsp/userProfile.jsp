<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${pageContext.request.userPrincipal.name}</title>
        <jsp:include page="../jsp/components/linksHeader.jsp"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="hero-wrap js-fullheight" style="background-image: url('https://previews.123rf.com/images/liuzishan/liuzishan1611/liuzishan161100097/66120105-world-map-point-line-composition-representing-the-global-global-network-connection-international-mea.jpg'); min-height: 100vh;">

            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light fixed-top" id="ftco-navbar">
                <div class="container-fluid px-0 row">

                    <div class="col-xl-7 offset-xl-1 col-lg-9 d-flex align-items-center flex-wrap justify-content-between">

                        <a class="navbar-brand" href="${pageContext.request.contextPath}/">TripPlanner</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="oi oi-menu"></span> Menu
                        </button>

                        <div class="collapse navbar-collapse" id="ftco-nav">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
                                <li class="nav-item"><a href="" class="nav-link">About</a></li>
                                <li class="nav-item"><a href="" class="nav-link">Places</a></li>
                                <li class="nav-item"><a href="" class="nav-link">Blog</a></li>
                                <li class="nav-item"><a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact</a></li>
                                    <c:if test="${pageContext.request.userPrincipal.name == null}" >
                                    <li> <a href="${pageContext.request.contextPath}/login" class="btn btn-sm px-3 btn-warning mr-2 d-lg-none">Sign In</a></li>
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
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-sm px-3 btn-warning mr-2">Sign In</a>
                            <a href="${pageContext.request.contextPath}/register" class="btn btn-sm px-3 btn-warning">Sign Up</a>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <span style="margin: 0 20px;" class="text-white"><strong style="font-weight: bold;">Welcome</strong><strong style="font-style: italic;">,&nbsp;&nbsp;&nbsp; ${pageContext.request.userPrincipal.name} </strong></span>
                            <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm px-3 btn-warning">Log out</a>
                        </c:if>
                    </div>
                </div>
            </nav>

            <div class="overlay"></div>

            <div class="container pt-5">
                <div class="container bootstrap snippet bg-white">
                    <div class="row">
                        <div class="col-sm-3 shadow-lg"><!--left col-->

                            <div class="text-center">
                                <h1>${pageContext.request.userPrincipal.name}</h1>
                                <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                                <h6>Upload a different photo...</h6>
                                <input type="file"  class="text-center center-block file-upload ">                        
                            </div></hr><br>

                            <div class="panel panel-default shadow-lg">
                                <div class="panel-heading">Website <i class="fa fa-link fa-1x"></i></div>
                                <div class="panel-body"><a href="http://bootnipets.com">bootnipets.com</a></div>
                            </div>

                            <ul class="list-group shadow-lg">
                                <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
                                <li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span> 125</li>
                                <li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span> 13</li>
                                <li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span> 37</li>
                                <li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span> 78</li>
                            </ul> 

                        </div><!--/col-3-->
                        <div class="col-sm-9">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#home">Profil</a></li>
                                <li><a data-toggle="tab" href="#messages">Trips</a></li>
                                <li><a data-toggle="tab" href="#settings">Menu 2</a></li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane active" id="home">
                                    <hr>
                                    <form class="form" action="##" method="post" id="registrationForm">
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="first_name"><h4>First name</h4></label>
                                                <input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" title="enter your first name if any.">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="last_name"><h4>Last name</h4></label>
                                                <input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your last name if any.">
                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="phone"><h4>Phone</h4></label>
                                                <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-6">
                                                <label for="mobile"><h4>Mobile</h4></label>
                                                <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="email"><h4>Email</h4></label>
                                                <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="email"><h4>Location</h4></label>
                                                <input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="password"><h4>Password</h4></label>
                                                <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="password2"><h4>Verify</h4></label>
                                                <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <br>
                                                <button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                                <button class="btn btn-danger" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                            </div>
                                        </div>
                                    </form>


                                </div><!--/tab-pane-->
                                <div class="tab-pane" id="messages">

                                    <!--<hr>-->
                                    <form class="form" action="##" method="post" id="registrationForm">


                                    </form>

                                </div><!--/tab-pane-->
                                <div class="tab-pane" id="settings">

                                </div>

                            </div><!--/tab-pane-->
                        </div><!--/tab-content-->

                    </div><!--/col-9-->
                </div>

                <!--                <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
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
                
                                </div>-->

            </div>

        </div>

        <!--/row-->

        <script type="text/javascript" src="${pageContext.request.contextPath}/js/userProfile"></script>
    </body>
</html>
