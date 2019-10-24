
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin</title>
        <!--<link rel="shortcut icon" href="img/keyboard.png" style="Lineal">-->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.v1.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/adminStyle.css" rel="stylesheet">
        <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                            aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><img src="img/logo.png" alt=""></a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.html">Dashboard</a></li>
                        <li><a href="pages.html">Pages</a></li>
                        <li><a href="posts.html">Posts</a></li>
                        <li><a href="users.html">Users</a></li>
                        <li><a href="courses.html">Courses</a></li>
                        <li><a href="trainers.html">Trainers</a></li>
                        <li><a href="students.html">Students</a></li>
                        <li><a href="assignments.html">Assignments</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Welcome, ${sessionScope.admin.adminName}</a></li>
                        <li><a href="login.html">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Header -->
        <header id="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h1><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard <small> Manage Your
                                Site</small>
                        </h1>
                    </div>
                    <div class="col-md-2">
                        <div class="dropdown create">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="true">
                                Add to Website
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a type="button" data-toggle="modal" data-target="#addPage">Add Page</a></li>
                                <li><a type="button" data-toggle="modal" data-target="#addPost">Add Post</a></li>
                                <li><a type="button" data-toggle="modal" data-target="#addUser">Add User</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="dropdown create">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="true">
                                Add to Structure
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a type="button" data-toggle="modal" data-target="#addCourse">Add Course</a></li>
                                <li><a type="button" data-toggle="modal" data-target="#addTrainer">Add Trainer</a></li>
                                <li><a type="button" data-toggle="modal" data-target="#addStudent">Add Student</a></li>
                                <li><a type="button" data-toggle="modal" data-target="#addAssignment">Add Assignment</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>

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

                    <div class="col-md-3">
                        <div class="list-group">
                            <a href="index.html" class="list-group-item active main-color-bg">
                                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard
                            </a>
                            <a href="pages.html" class="list-group-item"><span class="glyphicon glyphicon-list-alt"
                                                                               aria-hidden="true"></span> Pages <span class="badge">1</span></a>
                            <a href="posts.html" class="list-group-item"><span class="glyphicon glyphicon-pencil"
                                                                               aria-hidden="true"></span> Posts <span class="badge">33</span></a>
                            <a href="users.html" class="list-group-item"><span class="glyphicon glyphicon-user"
                                                                               aria-hidden="true"></span> Users <span class="badge">20</span></a>
                            <a href="courses.html" class="list-group-item"><i class="fas fa-book"></i> Courses
                                <span class="badge">4</span>
                            </a>
                            <a href="trainers.html" class="list-group-item"><i class="fas fa-chalkboard-teacher"></i> Trainers <span
                                    class="badge">10</span>
                            </a>
                            <a href="students.html" class="list-group-item"> <i class="fas fa-user-graduate"></i> Students <span
                                    class="badge">40</span>
                            </a>
                            <a href="assignments.html" class="list-group-item"><i class="fas fa-file-alt"></i> Assignments <span
                                    class="badge">81</span>
                            </a>
                        </div>

                        <div class="well">
                            <h4>Disk Space Used</h4>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 60%;">
                                    60%
                                </div>
                            </div>
                            <h4>Bandwidth Used </h4>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                     style="width: 40%;">
                                    40%
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">

                        <!-- Website Overview -->
                        <div class="panel panel-default">
                            <div class="panel-heading main-color-bg">
                                <h3 class="panel-title">Website Overview</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-3">
                                    <div class="well dash-box">
                                        <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 20</h2>
                                        <h4>Users</h4>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="well dash-box">
                                        <h2><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> 1</h2>
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
                                        <h2><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 564</h2>
                                        <h4>Visitors</h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Stucture Overview -->
                        <div class="panel panel-default">
                            <div class="panel-heading main-color-bg">
                                <h3 class="panel-title">Structure Overview</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-3">
                                    <div class="well dash-box">
                                        <h2><i class="fas fa-book"></i> 4</h2>
                                        <h4>Courses</h4>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="well dash-box">
                                        <h2><i class="fas fa-chalkboard-teacher"></i> 10</h2>
                                        <h4>Trainers</h4>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="well dash-box">
                                        <h2><i class="fas fa-user-graduate"></i> 40</h2>
                                        <h4>Students</h4>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="well dash-box">
                                        <h2><i class="fas fa-file-alt"></i> 81</h2>
                                        <h4>Assignments</h4>
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
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Joined</th>
                                    </tr>
                                    <tr>
                                        <td>Jill Smith</td>
                                        <td>jillsmith@gmail.com</td>
                                        <td>Dec 12, 2016</td>
                                    </tr>
                                    <tr>
                                        <td>Eve Jackson</td>
                                        <td>ejackson@yahoo.com</td>
                                        <td>Dec 13, 2016</td>
                                    </tr>
                                    <tr>
                                        <td>John Doe</td>
                                        <td>jdoe@gmail.com</td>
                                        <td>Dec 13, 2016</td>
                                    </tr>
                                    <tr>
                                        <td>Stephanie Landon</td>
                                        <td>landon@yahoo.com</td>
                                        <td>Dec 14, 2016</td>
                                    </tr>
                                    <tr>
                                        <td>Mike Johnson</td>
                                        <td>mjohnson@gmail.com</td>
                                        <td>Dec 15, 2016</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer id="footer">
            <p><img src="img/logo.png" alt=""> Copyright AdminCS, &copy; 2019</p>
        </footer>

        <!-- Modals -->

        <!-- Add Page -->
        <div class="modal fade" id="addPage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Add Page</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Page Title</label>
                                <input type="text" class="form-control" placeholder="Page Title">
                            </div>
                            <div class="form-group">
                                <label>Page Body</label>
                                <textarea name="editor1" class="form-control" placeholder="Page Body"></textarea>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Published
                                </label>
                            </div>
                            <div class="form-group">
                                <label>Meta Tags</label>
                                <input type="text" class="form-control" placeholder="Add Some Tags...">
                            </div>
                            <div class="form-group">
                                <label>Meta Description</label>
                                <input type="text" class="form-control" placeholder="Add Meta Description...">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Add Post -->
        <div class="modal fade" id="addPost" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Add Post</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Post Title</label>
                                <input type="text" class="form-control" placeholder="Post Title">
                            </div>
                            <div class="form-group">
                                <label>Post Body</label>
                                <textarea name="editor2" class="form-control" placeholder="Post Body"></textarea>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Published
                                </label>
                            </div>
                            <div class="form-group">
                                <label>Meta Tags</label>
                                <input type="text" class="form-control" placeholder="Add Some Tags...">
                            </div>
                            <div class="form-group">
                                <label>Meta Description</label>
                                <input type="text" class="form-control" placeholder="Add Meta Description...">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Add User -->
        <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Add User</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>First Name</label>
                                <input type="text" class="form-control" placeholder="First Name">
                            </div>
                            <div class="form-group">
                                <label>Second Name</label>
                                <input type="text" class="form-control" placeholder="Second Name">
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <input type="password" class="form-control" placeholder="Confirm Password">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Add Student -->
        <div class="modal fade" id="addStudent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form id="addStudentForm">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Add Student</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>First Name</label>
                                <input name="firstName" type="text" class="form-control" placeholder="First Name">
                            </div>
                            <div class="form-group">
                                <label>Second Name</label>
                                <input name="secondName" type="text" class="form-control" placeholder="Second Name">
                            </div>
                            <div class="form-group">
                                <label>Birth Date</label>
                                <input name="birthDate" type="date" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Stream</label>
                                <select name="stream" class="form-control">
                                    <option disabled selected hidden>Choose</option>
                                    <option value="Java">Java</option>
                                    <option value="C#">C#</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Tuition</label>
                                <input type="text" name="tuition" class="form-control" placeholder="Tuition">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Add Trainer -->
        <div class="modal fade" id="addTrainer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form id="addTrainerForm">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Add Trainer</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>First Name</label>
                                <input type="text" name="firstName" class="form-control" placeholder="First Name">
                            </div>
                            <div class="form-group">
                                <label>Second Name</label>
                                <input type="text" name="secondName" class="form-control" placeholder="Second Name">
                            </div>
                            <div class="form-group">
                                <label>Subject</label>
                                <input type="text" name="subject" class="form-control" placeholder="Subject">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Add Course -->
        <div class="modal fade" id="addCourse" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form id="addCourseForm">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Add Course</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Title</label>
                                <input name="title" type="text" class="form-control" placeholder="Title">
                            </div>
                            <div class="form-group">
                                <label>Stream</label>
                                <select name="stream" class="form-control">
                                    <option disabled selected hidden>Choose</option>
                                    <option value="Java">Java</option>
                                    <option value="C#">C#</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Type</label>
                                <select name="type" class="form-control">
                                    <option disabled selected hidden>Choose</option>
                                    <option value="Full Time">Full Time</option>
                                    <option value="Part Time">Part Time</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Start Date</label>
                                <input name="startDate" type="date" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>End Date</label>
                                <input name="endDate" type="date" class="form-control">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Add Assignment -->
        <div class="modal fade" id="addAssignment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form id="addAssignmentForm">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Add Assignment</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Title</label>
                                <input name="title" type="text" class="form-control" placeholder="Title">
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <select name="description" class="form-control">
                                    <option disabled selected hidden>Choose</option>
                                    <option value="Part A">Part A</option>
                                    <option value="Part B">Part B</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>SubDate</label>
                                <input name="subDate" type="date" class="form-control">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>



        <script>
            CKEDITOR.replace('editor1');
        </script>
        <script>
            CKEDITOR.replace('editor2');
        </script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.v1.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<!--        <script src="js/validation-lib/dist/jquery.validate.js"></script>-->
    </body>
</html>
