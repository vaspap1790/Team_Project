<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>adassa!</h1>

        <spring:form modelAttribute="flight" action="${pageContext.request.contextPath}/flight/postRegister" method="POST" onsubmit="">

            <div >
                <spring:hidden path="country"/>  
            </div>
            <div class="col-md-2">
                <spring:hidden path="currency" />
            </div>
            <div class="col-md-2">       
                <spring:hidden path="locale" />
            </div>
            <div class="col-md-2">       
                <spring:input path="originPlace" placeholder="From *" maxlength="20" required="required" />
            </div>
            <div class="col-md-2">       
                <spring:input path="destinationPlace" type="text" placeholder="to *" maxlength="20" required="required" />
            </div>
            <div class="col-md-2">       
                <spring:input path="outboundDate" type="date" placeholder="outbounddate *" maxlength="20" required="required" />
            </div>
            <div class="col-md-2">       
                <spring:input path="adults" type="text" placeholder="epivates *" maxlength="20" required="required" />
            </div>
            <div class="col-md-2">  
<!--                <label for="inboudDate">epistrofi</label>-->
                <input name="inboundDate" type="date" placeholder="epistrofi *" maxlength="20"  />
            </div>
          
             <div class="col-md-2">       
                <spring:input path="cabinClass" type="text" placeholder="cabin *" maxlength="20" required="required" />
            </div>
            
            <button type="submit" class="btnSubmit">Search</button>   
        </spring:form>
            
    </body>
</html>
