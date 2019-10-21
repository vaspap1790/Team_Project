<%-- 
    Document   : test
    Created on : 21 Οκτ 2019, 4:25:25 μμ
    Author     : vasil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="mainpage">

            <div class="home-inner">
                <h1 class="text-center p-5">Where to next?</h1>
                <div id="flightform" class="container border shadow p-3 rounded">
                    <spring:form id="flightForm" modelAttribute="flight" action="${pageContext.request.contextPath}/flight/postRegister"
                                 method="POST" onsubmit="">
                        <div class="d-flex form-row p-2">
                            <spring:radiobutton   path="type" value="oneWay" checked="checked"/>
                            <label for="">One Way</label>
                            <spring:radiobutton   path="type" value="roundTrip"/>
                            <label for="">Roundtrip</label>                    
                        </div>
                        <div class="form-row ui-menu">

                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    <spring:label path="originPlace">From</spring:label>
                                        <input type="text" class="autocomplete" placeholder="From *">
                                    <spring:hidden id="originPlace" path="originPlace" />
                                </div>
                                <div class="form-group col-md-2">
                                    <spring:label path="destinationPlace">To</spring:label>
                                        <input type="text" class="autocomplete" placeholder="to *">
                                    <spring:hidden id="destinationPlace" path="destinationPlace"/>
                                </div>
                                <div class="form-group col-md-2">
                                    <spring:label path="originPlace">Depart</spring:label>
                                    <spring:input path="outboundDate"  type="date" placeholder="outbounddate *" />
                                </div>
                                <div class="col-md-2">
                                    <label path="inboundDate">Return</label>
                                    <input name="inboundDate"  class="ml-3" type="date" placeholder="epistrofi *" />
                                </div>
                            </div>

                        </div>
                        <div class="d-flex justify-content-md-end">
                            <button type="submit" class="btn btn-info">Search flights <i
                                    class="fas fa-arrow-right"></i></button>
                        </div>
                    </spring:form>
                </div>
            </div>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/flightJs.js"></script>

    </body>
</html>
