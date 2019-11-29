
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
        <title>Chat Room</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    </head>
    <body style="background-image: url('https://images.unsplash.com/photo-1542435503-956c469947f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1867&q=80'); background-size:cover!important; height:100vh;">
        <noscript>
        <h2>Sorry! Your browser doesn't support Javascript, you have to enable it!</h2>
        </noscript>

        <div id="username-page">
            <div class="username-page-container" style="width:700px!important;">
                <h1 class="title">Type your username</h1>
                <form id="usernameForm" name="usernameForm">
                    <div class="form-group">
                        <input type="text" id="name" placeholder="Username"
                               autocomplete="off" class="form-control" />
                    </div>
                    <div class="form-group">
                        <button type="submit" class="accent username-submit">Start
                            Chatting</button>

                    </div>
                </form>
                <form action="${pageContext.request.contextPath}/user/profile">
                    <button type="submit" style="background-color: red; color: white;">Exit
                        Chatting</button>
                </form>
            </div>
        </div>

        <div id="chat-page" class="hidden">
            <div class="chat-container" style="width:480px;">
                <div class="chat-header" style="background-color: lightgray;">
                    <h2>Chat Room</h2>
                </div>
                <div class="connecting">Connecting...</div>
                <ul id="messageArea">

                </ul>
                <form id="messageForm" name="messageForm" nameForm="messageForm">
                    <div class="form-group">
                        <div class="input-group clearfix">
                            <input type="text" id="message" placeholder="Type a message..."
                                   autocomplete="off" class="form-control" />
                            <button type="submit" class="primary">Send</button>
                            <br>
                            
                        </div>
                    </div>
                </form>

                <form action="${pageContext.request.contextPath}/user/profile">
                    <button type="submit" style="background-color: red; color: white;">Exit
                        Chatting</button>
                </form>

            </div>
        </div>
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main_1.js"></script>

    </body>
</html>
