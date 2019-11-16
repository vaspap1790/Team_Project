<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="App">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${pageContext.request.userPrincipal.name}</title>
        <jsp:include page="../jsp/components/linksHeader.jsp"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"></script>

    </head>
    <body ng-controller="MainCtrl">

        <div class="hero-wrap js-fullheight" style="background-image: url('https://cmkt-image-prd.freetls.fastly.net/0.1.0/ps/3427679/910/741/m2/fpnw/wm1/e9h3d6vehwxpvkroqof0mehi5gc6btvlt58augcanbhlvq9w09gv9dlrbegoc0cb-.jpg?1508293067&s=d72c108776c61110bc6ad95150fc1bb2'); min-height: 100vh;">

            <jsp:include page="components/navbar.jsp" />

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
                                <li class="active"><a data-toggle="tab" href="#trips">Trips</a></li>
                                <li><a data-toggle="tab" href="#profile">Profile</a></li>
                                <li><a data-toggle="tab" href="#settings">Menu 2</a></li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane active" id="trips">

                                    <table class="border" ng-show="items.length !== 0">
                                        <thead>
                                            <tr class="bg-dark text-white">
                                                <th class="border p-3" style="display:none;">id</th>
                                                <th class="border p-3">Trip</th>
                                                <th class="border p-3">Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="item in items">

                                                <td class="border p-3" style="display:none;">
                                                    {{item.id}}
                                                </td>

                                                <td class="border p-3">
                                                    <a href="${pageContext.request.contextPath}/user/userTripsPage/{{item.id}}"><i class="fas fa-suitcase-rolling"></i>&nbsp;
                                                        {{item.location}}
                                                    </a>
                                                </td>

                                                <td class="border p-3"> 
                                                    <a>
                                                        <i ng-click="deleteItem($index, item.id)" class="far fa-trash-alt ml-4 mt-1"></i>
                                                    </a>
                                                </td>

                                            </tr>
                                        </tbody>
                                    </table>

                                    <hr>
                                    <p ng-show="items.length == 0">No Sketches Found</p>

                                </div><!--/tab-pane-->

                                <div class="tab-pane" id="profile">
                                    <hr>
                                    <spring:form modelAttribute="" class="form" action="${pageContext.request.contextPath}/" method="POST" id="registrationForm" enctype="multipart/form-data">
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <spring:label path="first_name"><h4>First name</h4></spring:label>
                                                <spring:input style="height: 4rem!important;" type="text" class="form-control" path="first_name" id="first_name" placeholder="Enter First name ...">
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <spring:label path="last_name"><h4>Last name</h4></spring:label>
                                                <spring:input style="height: 4rem!important;" type="text" class="form-control" path="last_name" id="last_name" placeholder="Enter Last name ...">
                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <spring:label path="phone_number"><h4>Phone</h4></spring:label>
                                                <spring:input style="height: 4rem!important;" type="text" class="form-control" path="phone_number" id="phone" placeholder="Enter Phone number ...">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-6">
                                                <spring:label path="mobile"><h4>Mobile</h4></spring:label>
                                                <spring:input style="height: 4rem!important;" type="text" class="form-control" path="mobile" id="mobile" placeholder="Enter Mobile number ...">
                                            </div>
                                        </div>
<!--                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label path="email"><h4>Email</h4></label>
                                                <input style="height: 4rem!important;" type="email" class="form-control" path="email" id="email" placeholder="Enter Email...">
                                            </div>
                                        </div>-->
<!--                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label path="email"><h4>Location</h4></label>
                                                <input style="height: 4rem!important;" type="email" class="form-control" path="email" id="location" placeholder="Enter your Location...">
                                            </div>
                                        </div>-->
<!--                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="password"><h4>Password</h4></label>
                                                <input style="height: 4rem!important;" type="password" class="form-control" name="password" id="password" placeholder="Enter password...">
                                            </div>
                                        </div>-->
<!--                                        <div class="form-group">

                                            <div class="col-xs-6">
                                                <label for="password2"><h4>Verify</h4></label>
                                                <input style="height: 4rem!important;" type="password" class="form-control" name="password2" id="password2" placeholder="Retype password...">
                                            </div>
                                        </div>-->
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <br>
                                                <button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                                <button class="btn btn-danger" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                            </div>
                                        </div>
                                    </spring:form>

                                    <!--Tips Angular-->   
                                </div><!--/tab-pane-->

                                <div class="tab-pane" id="settings">

                                </div>

                            </div><!--/tab-pane-->
                        </div><!--/tab-content-->

                    </div><!--/col-9-->
                </div>

            </div>

        </div>

        <!--/row-->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="../js/userProfile.js"></script>
    </body>
</html>
