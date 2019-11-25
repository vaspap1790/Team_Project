const visitor = document.getElementById("username");
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


    $scope.handleLikeBtn = function ($event, index) {


        if (checkIfUserIsLogged()) {

            if (posts[index].includes(visitor)) {

                let numOfLikesSpan = document.getElementById("numOfLikes" + index);
                let currentNumOfLikes = parseInt(numOfLikesSpan.innerText);
                numOfLikesSpan.innerText = currentNumOfLikes + 1;

                let URL = `http://localhost:8080/tripPlan/post/likes/${post.postId}/${username}`;
                $http.get(URL)
                        .then(() => {
                            console.log("Success")
                        }).catch(() => {
                    console.log("Error");
                });
            } else {

                let numOfLikesSpan = document.getElementById("numOfLikes" + index);
                let currentNumOfLikes = parseInt(numOfLikesSpan.innerText);
                numOfLikesSpan.innerText = currentNumOfLikes - 1;

                let URL = `http://localhost:8080/tripPlan/post/likes/${post.postId}/${username}`;
                $http.get(URL)
                        .then(() => {
                            console.log("Success")
                        }).catch(() => {
                    console.log("Error");
                });

            }

        } else {
            alert("You have to be logged in to perform that action.");
        }
    };


    $scope.handleCommentBtn = function ($event, index) {
        if (checkIfUserIsLogged()) {
            $event.currentTarget.parentElement.nextElementSibling.firstElementChild.firstElementChild.firstElementChild.focus();
        } else {
            alert("You have to be logged in to perform that action.");
        }
    };


    $scope.handleCommentSubmitBtn = function ($event, index) {

        if (checkIfUserIsLogged()) {

            //httpRequest

        } else {
            alert("You have to be logged in to perform that action.");
        }

    };

});

