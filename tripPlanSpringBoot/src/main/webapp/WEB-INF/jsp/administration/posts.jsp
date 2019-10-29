
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Posts</title>
        <jsp:include page="../components/adminHeader.jsp"/>
        <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
    </head>
    <body>

        <jsp:include page="../components/adminNavbar.jsp"/>

        <section id="breadcrumb">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index.html">Dashboard</a></li>
                    <li class="active">Posts</li>
                </ol>
            </div>
        </section>

        <!-- Main -->
        <section id="main">
            <div class="container">
                <div class="row">
  
                    <jsp:include page="../components/adminAside.jsp"/>
                    
                    <div class="col-md-9">

                        <!-- Posts Table -->
                        <div class="panel panel-default">
                            <div class="panel-heading main-color-bg">
                                <h3 class="panel-title">Posts</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <input class="form-control" type="text" placeholder="Filter Posts...">
                                    </div>
                                </div>
                                <br>
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <th>Title</th>
                                        <th>Published</th>
                                        <th>Created</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td>Blog Post 1</td>
                                        <td><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                        <td>Dec 12, 2016</td>
                                        <td><a class="btn btn-default" href="editPost.html">Edit</a> <a class="btn btn-danger"
                                                                                                        href="#">Delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Blog Post 2</td>
                                        <td><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                        <td>Dec 13, 2016</td>
                                        <td><a class="btn btn-default" href="editPost.html">Edit</a> <a class="btn btn-danger"
                                                                                                        href="#">Delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Blog Post 3</td>
                                        <td><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></td>
                                        <td>Dec 13, 2016</td>
                                        <td><a class="btn btn-default" href="editPost.html">Edit</a> <a class="btn btn-danger"
                                                                                                        href="#">Delete</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Blog Post 4</td>
                                        <td><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                                        <td>Dec 14, 2016</td>
                                        <td><a class="btn btn-default" href="editPost.html">Edit</a> <a class="btn btn-danger"
                                                                                                        href="#">Delete</a>
                                        </td>
                                    </tr>
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
