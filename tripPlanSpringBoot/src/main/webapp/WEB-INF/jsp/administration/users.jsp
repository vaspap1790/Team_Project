
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Users</title>
        <jsp:include page="../components/adminHeader.jsp"/>
        <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
    </head>
    <body>
        
        <jsp:include page="../components/adminNavbar.jsp"/>
        
        <section id="breadcrumb">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index.html">Dashboard</a></li>
                    <li class="active">Users</li>
                </ol>
            </div>
        </section>

        <!-- Main -->
        <section id="main">
            <div class="container">
                <div class="row">
       
                    <jsp:include page="../components/adminAside.jsp"/>
                    
                    <div class="col-md-9">

                        <!-- Users Table -->
                        <div class="panel panel-default">
                            
                            <div class="panel-heading main-color-bg">
                                <h3 class="panel-title">Users</h3>
                            </div>
                            
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <input class="form-control" type="text" placeholder="Filter Users...">
                                    </div>
                                </div>
                                <br>
                                
                             <c:choose>
                                <c:when test = "${requestScope.trainers.size()>0}">

        
                                    <table class="table table-stripped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="text-center">#</th>
                                            <th scope="col" class="text-center">Name</th>
                                            <th scope="col" class="text-center">Email</th>
                                            <th scope="col" class="text-center">Username</th>
                                            <th scope="col" class="text-center">Update</th>
                                            <th scope="col"  class="text-center">Delete</th>
                                            </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var = "i" items = "${requestScope.users}">
                                        <tr>
                                            <th scope="row" class="text-center">${requestScope.users.indexOf(i)+1}</th>
                                            <td class="text-center" style="overflow:hidden"> <c:out value = "${i.getFirstname()+i.getLastname()}"/> </td>
                                            <td class="text-center" style="overflow:hidden"> <c:out value = "${i.getEmail()}"/> </td> 
                                            <td class="text-center" style="overflow:hidden"> <c:out value = "${i.getUsername()}"/> </td> 
                                            <td class="text-center">  <a class="btn btn-default" href="${pageContext.request.contextPath}/trainer/Update.htm?id=${i.getUserId()}"> Update</a> </td>
                                            <td class="text-center"> <a class="btn btn-danger" href="${pageContext.request.contextPath}/trainer/Delete.htm?id=${i.getUserId()}" onclick="return confirm('Are you sure you want to delete the file?')"> Delete  </a> </td> 
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    </table> 

                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted">No users registered</span>
                                </c:otherwise>                         
                            </c:choose>
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
