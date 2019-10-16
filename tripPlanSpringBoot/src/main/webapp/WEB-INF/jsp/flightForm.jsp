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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
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
                        <input type="radio" name="radiogroup" value="on" checked>
                        <label for="">Roundtrip</label>

                        <input type="radio" name="radiogroup" value="on">
                        <label for="">One way</label>

                        <div class="">
                            <a id="map"
                                href="https://gr.skyscanner.com/inspire/map?outboundDate=2019-10-14&outboundPlace=&preferDirects=false">Map</a>
                        </div>

<<<<<<< HEAD
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
=======
                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <spring:label path="originPlace">From</spring:label>
                                <spring:input cssClass="autocomplete"  path="originPlace" type="text" placeholder="From *" />
                            </div>
                            <div class="form-group col-md-2">
                                <spring:label path="destinationPlace">To</spring:label>
                                <spring:input cssClass="autocomplete" path="destinationPlace" type="text" placeholder="To *" />
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
>>>>>>> ac746de19ff202cec96430c35d502082d4f867d5
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
                            <div>
                                <select name="cabinClass">
                                    <option value="economy">economy</option>
                                    <option value="business">business</option>
                                </select>
                            </div>
                            <!-- <spring:input path="cabinClass" type="text" placeholder="Cabin Class *" /> -->
                        </div>
                    </div>
                    <div class="d-flex justify-content-md-end">
                        <button type="submit" class="btn btn-info">Search flights <i
                                class="fas fa-arrow-right"></i></button>
                    </div>
                </spring:form>
            </div>
        </div>
<<<<<<< HEAD
    </div>
</body>
=======
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                <script type="text/javascript" src="${pageContext.request.contextPath}/js/flightJs.js"></script>

    </body>
>>>>>>> ac746de19ff202cec96430c35d502082d4f867d5

</html>