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
                    <spring:form modelAttribute="esky" action="${pageContext.request.contextPath}/flight/postRegister1"
                                 method="POST" onsubmit="">


                       

                        <spring:radiobutton path="type" value="oneway"/>
                        <spring:radiobutton path="type" value="roundtrip"/>


                        <spring:select path="sc">
                            <spring:option value="economy">economy</spring:option>
                            <spring:option value="business">business</spring:option>
                            <spring:option selected="selected" value="htc">HTC</spring:option>
                            <spring:option value="iphone">IPHONE</spring:option>
                        </spring:select>

                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <spring:label path="originPlace">From</spring:label>//
                                <spring:input cssClass="autocomplete"  path="originPlace" type="text" placeholder="From *" />
                            </div>
                            <div class="form-group col-md-2">
                                <spring:label path="destinationPlace">To</spring:label>//
                                <spring:input cssClass="autocomplete" path="destinationPlace" type="text" placeholder="To *" />
                            </div>
                            <div class="form-group col-md-2">
                                <spring:label path="departureDate">Depart</spring:label> //
                                <spring:input path="departureDate" type="date" placeholder="outbounddate *" />
                            </div>
                            <div class="col-md-2">
                                <label path="returnDate">Return</label>
                                <input name="returnDate" type="date" placeholder="epistrofi *" />
                            </div>
                            <div class="form-group col-md-2">
                                <spring:label path="pa">Travelers</spring:label>
                                <spring:input path="pa" type="text" placeholder="Travelers *" />
                            </div>
                            <div class="col-md-2">

                                <spring:hidden path="py"  />
                                <spring:hidden path="pc"   />
                                <spring:hidden path="pi" />
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/flightJs.js"></script>

    </body>

</html>