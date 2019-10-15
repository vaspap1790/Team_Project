<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/e41a5911e2.js"></script>
    <link href="${pageContext.request.contextPath}/css/flightForm.css" rel="stylesheet">

</head>

<body>

    <div class="mainpage">

        <div class="home-inner">
            <h1 class="text-center p-5">Where to next?</h1>
            <div id="flightform" class="container border shadow p-3 rounded">
                <spring:form modelAttribute="flight" action="${pageContext.request.contextPath}/flight/postRegister"
                    method="POST" onsubmit="">

                    <div>
                        <spring:hidden path="country" />
                    </div>
                    <div class="col-md-2">
                        <spring:hidden path="currency" />
                    </div>
                    <div class="col-md-2">
                        <spring:hidden path="locale" />
                    </div>

                    <div class="d-flex form-row p-2">
                        <input type="radio" name="aa" value="on" checked>
                        <label for="">Roundtrip</label>

                        <input type="radio" name="aa" value="on">
                        <label for="">One way</label>

                        <div class="">
                            <a
                                href="https://gr.skyscanner.com/inspire/map?outboundDate=2019-10-14&outboundPlace=&preferDirects=false">Map</a>
                        </div>

                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-2">
                            <spring:label path="originPlace">From</spring:label>
                            <spring:input path="originPlace" type="text" placeholder="From *" />
                        </div>

                        <div class="form-group col-md-2">
                            <spring:label path="destinationPlace">To</spring:label>
                            <spring:input path="destinationPlace" type="text" placeholder="To *" />
                        </div>
                        <div class="form-group col-md-2">
                            <spring:label path="originPlace">Depart</spring:label>
                            <spring:input path="outboundDate" type="date" placeholder="outbounddate *" />
                        </div>
                        <div class="col-md-2">

                            <label path="inboundDate">Return</label>
                            <input name="inboundDate" type="date" placeholder="epistrofi *" />
                        </div>
                        <div class="form-group col-md-2">
                            <spring:label path="adults">Travelers</spring:label>
                            <spring:input path="adults" type="text" placeholder="Travelers *" />
                        </div>
                        <div class="col-md-2">

                            <spring:label path="cabinClass">Cabin Class</spring:label>
                            <spring:input path="cabinClass" type="text" placeholder="Cabin Class *" />
                        </div>
                    </div>
                    <div class="d-flex justify-content-md-end">
                        <button type="submit" class="btn btn-info">Search flights <i
                                class="fas fa-arrow-right"></i></button>
                    </div>
                </spring:form>
            </div>
      

    </div>
</body>

</html>