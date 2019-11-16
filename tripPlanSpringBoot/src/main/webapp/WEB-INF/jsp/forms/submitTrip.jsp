
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit Trip</title>
        <jsp:include page="../components/linksHeader.jsp"/>
        <style>
            body,html{
                height: 100%;
                width: 100%;
                background-image: url("${pageContext.request.contextPath}/images/slider1.jpg");
                background-size: cover;
                background-position: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp"/> 
        <div class="d-flex justify-content-center align-items-center h-100 flex-column p-5 animated fadeIn" style="animation-duration: 2s;">
            <div class="mb-4 p-2"> <h4 class="text-white display-4">Are you Ready?</h4>   
                </div>
            <div class="">
                <a class="btn btn-primary px-3 py-2 mr-3" href="${pageContext.request.contextPath}/trip/saveTrip">Create Trip</a>
                <a class="btn btn-primary px-3 py-2 ml-3" href="${pageContext.request.contextPath}/user/choices">Return Back</a>
            </div>
        </div>
        <jsp:include page="../components/scripts.jsp"/>
    </body>
</html>
