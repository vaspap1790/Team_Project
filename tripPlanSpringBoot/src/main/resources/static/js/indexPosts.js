const visitor = document.getElementById("username").innerText.trim();
let posts;
const App = angular.module("App", ["ngMaterial", "jkAngularCarousel"]);
function checkIfUserIsLogged() {
    return !(visitor === null);
}




App.controller("MainCtrl", function ($scope, $http) {

    const URL = "http://localhost:8080/tripPlan/post/build";
    $http.get(URL).then((response) => {

        console.log("Success");
        console.log(response.data);
        posts = response.data.Posts;
        let slides = [];
        for (let i = 0; i < posts.length; i++) {
            for (let j = 0; j < posts[i].photos.length; j++) {

                slides.push(posts[i].photos[j].photos);
            }
            posts[i].photos = slides;
        }
        $scope.posts = posts;
        console.log($scope.posts);
    }).catch(() => {
        console.log("error");
    });
    
    $scope.clickedLike = function (post, index) {
        let boolean;
        let usernames = [];
        for (let i = 0; i < post.likes.length; i++) {

            usernames.push(post.likes[i].username);
            if (usernames.includes(visitor)) {
                boolean = true;
                let BtnOfLikes = document.getElementById("BtnOfLikes" + index);
            } else {
                boolean = false;
                console.log("error")
            }
        }
        ;
        return boolean;
    }


    $scope.handleLikeBtn = function (index) {

        let post = posts[index];
        if (checkIfUserIsLogged()) {
    

            let URL = `http://localhost:8080/tripPlan/post/likes/${post.postId}/${visitor}`;
            $http.get(URL)
                    .then((response) => {

                        console.log("Success");
                        document.getElementById("numOfLikes" + index).innerText = response.data.postLikes;

                        if (response.data.addedToDb) {
                            document.getElementById("BtnOfLikes" + index).classList.add("clickedLike");
                        } else {
                            document.getElementById("BtnOfLikes" + index).classList.remove("clickedLike");
                        }

                    }).catch(() => {
                console.log("Error");
            });
        } else {
            alert("You have to be logged in to perform that action.");
        }
        ;
    };
    $scope.handleCommentBtn = function ($event, index) {
        if (checkIfUserIsLogged()) {
            $event.currentTarget.parentElement.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.focus();
        } else {
            alert("You have to be logged in to perform that action.");
        }
    };
    $scope.handleCommentSubmitBtn = function (index) {
        if (checkIfUserIsLogged()) {

            let post = posts[index];
            let body = document.getElementById("commentBody" + index).value.trim();
            let URL = `http://localhost:8080/tripPlan/post/save/comment`;
            let object = {username: visitor, postId: post.postId, text: body};
            let jsonObject = JSON.stringify(object);
            document.getElementById("commentBody" + index).value = "";
            if (body !== null && body !== "") {
                console.log(jsonObject);
                var req = {
                    method: 'POST',
                    url: URL,
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    data: jsonObject
                };
                $http(req).then(function (response) {
                    console.log("success");
                }).catch(() => {
                    console.log("error");
                });
            }

        } else {
            alert("You have to be logged in to perform that action.");
        }
    };
});


//function checkClick(post, index) {
//
//
//    let usernames = [];
//
//    if (post.likes.length !== 0) {
////        for (let i = 0; i < post.likes.length; i++) {
////            usernames.push(post.likes[i].username);
////        }
//        console.log(usernames)
//        if (usernames.includes(visitor)) {
//            usernames.forEach((item,index)=>{
//                if(usernames[index]===visitor){
//                   usernames.splice(index, 1);
//                   console.log("splice",usernames)
//                }             
//            })           
//            
//            document.getElementById(`numOfLikes${index}`).value = usernames.length;
//        } else {
//            usernames.push( visitor);
//            console.log("push second else",usernames)
//            document.getElementById(`numOfLikes${index}`).value = usernames.length;
//
//        }
//
//    } else {
//        usernames.push(visitor);
//        console.log("push first else",usernames)
//        document.getElementById(`numOfLikes${index}`).value = usernames.length;
//    }
//
//}
