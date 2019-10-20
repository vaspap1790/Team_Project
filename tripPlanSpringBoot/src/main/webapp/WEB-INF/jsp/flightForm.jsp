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
        <style>
            .ui-autocomplete {
                position: absolute;
                top: 100%;
                left: 0;
                z-index: 1000;
                float: left;
                display: none;
                min-width: 160px;   
                padding: 4px 0;
                margin: 0 0 10px 25px;
                list-style: none;
                background-color: #ffffff;
                border-color: #ccc;
                border-color: rgba(0, 0, 0, 0.2);
                border-style: solid;
                border-width: 1px;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
                -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
                -webkit-background-clip: padding-box;

                background-clip: padding-box;
                *border-right-width: 2px;
                *border-bottom-width: 2px;
            }

            .ui-menu-item > a.ui-corner-all {
                display: block;
                padding: 3px 15px;
                clear: both;
                font-weight: normal;
                line-height: 18px;
                color: #555555;
                white-space: nowrap;
                text-decoration: none;
            }

            .ui-state-hover, .ui-state-active {
                color: #ffffff;
                text-decoration: none;
                background-color: #0088cc;
                border-radius: 0px;
                -webkit-border-radius: 0px;
                -moz-border-radius: 0px;
                background-image: none;
            }
            .ui-helper-hidden-accessible {
                display: none !important;
            }
            
        </style>

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