/**
 * Created by Praveen on 19/08/15.
 */
'use strict';
var datingApp = angular.module("datingApp",
    [
        'angular-loading-bar',
        'ngRoute',
        'ngMaterial',
        'ngAnimate',
        "ngSanitize",
        "com.2fdevs.videogular",
        "com.2fdevs.videogular.plugins.controls",
        "com.2fdevs.videogular.plugins.overlayplay",
        //"com.2fdevs.videogular.plugins.poster",
        'ui.bootstrap',
        'LocalStorageModule',
        'ngStorage'
]);


'use strict';
datingApp.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            
            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);


'use strict';
datingApp.config(['$mdThemingProvider', '$routeProvider' ,'$locationProvider',function ($mdThemingProvider, $routeProvider,$locationProvider) {
    $mdThemingProvider.theme('default')
        .primaryPalette('blue')
        .accentPalette('indigo')
        .warnPalette('red')
        .backgroundPalette('blue-grey');
   
    $routeProvider.when("/",
        {
            templateUrl: "views/app.html",
            controller: "AppCtrl"
        }
    );
    $routeProvider.when("/terms",
        {
            templateUrl: "views/terms.html",
            controller: "TermsCtrl"
        }
    );
    $routeProvider.when("/about",
        {
            templateUrl: "views/about.html",
            controller: "AboutCtrl"
        }
    );
    $routeProvider.when("/contact",
        {
            templateUrl: "views/contact.html",
            controller: "ContactCtrl"
        });
    $routeProvider.when("/main",
        {
            templateUrl: "views/main.html",
            controller: "MainCtrl"
        }
    );
    $routeProvider.when("/signup",
        {
            templateUrl: "views/Signup.html",
            controller: "SignupCtrl"
        }
    );
    $routeProvider.when("/logout",
        {   
            templateUrl: "views/app.html",
            controller: "logout"
        }
    );
    $routeProvider.when("/viewProfile",
        {
            templateUrl: "views/viewProfile.html",
            controller: "viewProfileCtrl"
        }
    );
    $routeProvider.when("/profile",
        {
            templateUrl: "views/profile.html",
            controller: "ProfileCtrl"
        }
    );
    $routeProvider.when("/Home",
        {
            templateUrl: "views/Home.html",
            controller: "HomeCtrl"
        }
    );
    $routeProvider.when("/forgot",
        {
            templateUrl: "views/forgot.html",
            controller: "forgotCtrl"
        }
    );
     $routeProvider.when("/notification",
        {
            templateUrl: "views/notification.html",
            controller: "notificationCtrl"
        }
    );
    $routeProvider.when("/compose",
        {
            templateUrl: "views/compose.html",
            controller: "composeCtrl"
        }
    );
    $routeProvider.when("/inbox",
        {
            templateUrl: "views/inbox.html",
            controller: "inboxCtrl"
        }
    );
    $routeProvider.when("/sentMessages",
        {
            templateUrl: "views/sentMessages.html",
            controller: "sentMessagesCtrl"
        }
    );
    
    $routeProvider.when("/acivate/:UserId",
        {
            templateUrl: "views/main.html",
            controller: "activateCtrl"
        }
    );

    //$locationProvider.html5Mode(true);
 //   $routeProvider.otherwise({ redirectTo: "/main" });
}]);

var serviceBase = 'http://localhost:46838/';
//var serviceBase = 'http://ngauthenticationapi.azurewebsites.net/';
    datingApp.constant('ngSrvcSettings', {
    apiServiceBaseUri: serviceBase,
    clientId: 'ngMMP'
});
datingApp.config(function ($httpProvider) {
    $httpProvider.interceptors.push('authInterceptorService');

});

datingApp.run(['MMPService', function (MMPService) {
//    MMPService.fillAuthData();
}]);



