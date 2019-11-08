<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../components/linksHeader.jsp"/>
        <style>
            body { text-align: center; padding: 150px; }
            h1 { font-size: 50px; }
            body { font: 20px Helvetica, sans-serif; color: #333; }
            article { display: block; text-align: left; width: 650px; margin: 0 auto; }
            a { color: #dc8100; text-decoration: none; }
            a:hover { color: #333; text-decoration: none; }
        </style>
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp"/>
        <article>
            <h1>We&rsquo;ll be back soon!</h1>
            <div >
                <p>Sorry for the inconvenience but we&rsquo;re performing some maintenance at the moment. If you need to you can always <a href="${pageContext.request.contextPath}/contact">contact us</a>,
                    otherwise the only available transportation is <strong>Airplane </strong>!</p>
                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/user/choices" class="btn btn-outline-dark btn-lg">Create Trip</a>
                </div>
                <br><br> <p>&mdash; Triplanner Team</p>
            </div>
        </article>
    </body>
</html>
