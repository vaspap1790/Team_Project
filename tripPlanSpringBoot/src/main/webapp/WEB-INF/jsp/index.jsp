
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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

        </style>
    </head>
    <body>
        <h1>Hello World!</h1>

        <!--        <form id="contactForm1">
                    <input name="city" id="city" type="text">
                    <label class="error" for="city" id="name_error">This field is required.</label>
                    <input type="submit" name="submit" class="button" id="submit_btn" value="Send" />
                </form>-->

        <div class="ui-menu">
            <label for="city">City: </label>
            <input id="city">
        </div>


    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bookingJs.js"></script>

    </body>
</html>
