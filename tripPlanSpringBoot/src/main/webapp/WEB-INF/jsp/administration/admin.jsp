<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin</title>
        <jsp:include page="../components/adminHeader.jsp"/>
    </head>
    <body>

        <jsp:include page="../components/adminNavbar.jsp"/>

        <section id="breadcrumb">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="active">Dashboard</li>
                </ol>
            </div>
        </section>

        <!-- Main -->
        <section id="main">
            <div class="container">

                <div class="row">

                    <jsp:include page="../components/adminAside.jsp"/>

                    <div class="col-md-9">

                        <!-- Website Overview -->
                        <div class="panel panel-default">
                            <div class="panel-heading main-color-bg">
                                <h3 class="panel-title">Website Overview</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-3">
                                    <div class="well dash-box">
                                        <h2><i class="fas fa-user-friends"></i></span> 20</h2>
                                        <h4>Users</h4>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="well dash-box">
                                        <h2><i class="far fa-file-alt"></i></span> 1</h2>
                                        <h4>Pages</h4>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="well dash-box">
                                        <h2><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 33</h2>
                                        <h4>Posts</h4>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="well dash-box">
                                        <h2><i class="fas fa-male"></i></span> 564</h2>
                                        <h4>Visitors</h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Latest Users -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Latest Users</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-striped table-hover">
                                    <tbody>
                                    <thead>
                                    <th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    </th>
                                    </thead>
                                    <c:forEach items="${users}" var="user"> 
                                        <tr>
                                            <td></td>
                                            <td>${user.username}</td>
                                            <td>${user.email}</td>
                                            <td>${user.roleRef.this1}</td>
                                            <td><a class="btn btn-default" href="editUser.html">Edit</a> 
                                                <a class="btn btn-danger"  href="#">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="../components/adminFooter.jsp"/>
        <jsp:include page="../components/adminModals.jsp"/>
        <jsp:include page="../components/adminScripts.jsp"/>

    </body>
</html>
