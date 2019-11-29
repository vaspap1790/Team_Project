
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>General Error Page</title>

        <link href="https://fonts.googleapis.com/css?family=Montserrat:200,400,700" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/errorpagecss/style.css">
        <link rel="shortcut icon"
              href="https://cdn.iconscout.com/icon/premium/png-256-thumb/compass-1098-751593.png"
              type="image/x-icon">
    </head>

    <body>

        <div id="notfound">
            <div class="notfound">
                <div class="notfound-404">
                    <h1>Oops!</h1>
                    <h2>The Page can't be found</h2>
                </div>
                <a href="${pageContext.request.contextPath}/">Go TO Homepage</a>
            </div>
        </div>
            
    </body>
</html>

