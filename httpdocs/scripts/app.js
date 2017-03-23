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
        'LocalStorageModule'
]);
'use strict';
datingApp.config(['$mdThemingProvider', '$routeProvider', function ($mdThemingProvider, $routeProvider) {
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

