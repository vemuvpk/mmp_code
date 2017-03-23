/**
 * Created by Praveen on 19/08/15.
 */
// Admin Controllers
'use strict';
datingApp.controller('loginController', ['$scope', '$location', 'ngSrvcSettings', function ($scope, $location, authService) {

    $scope.loginData = {
        userName: "",
        password: "",
        useRefreshTokens: false
    };
    $scope.message = "";
    $scope.login = function () {
        signin();
    };
   function signin() {
        // alert($scope.loginData);
        MMPService.login($scope.loginData).then(function (response) {
                $location.path('/home');
            },
            function (err) {
                if (err) {
                    $scope.message = err.error_description;
                } else $scope.message = "Something went wrong";
            });
    }
}]);

'use strict';
datingApp.controller('AppCtrl', function($scope, $sce) {
    this.config = {
        preload: "none",
        sources: [
            {src: $sce.trustAsResourceUrl("../videos/mmp.mp4"), type: "video/mp4"},
        ],
        plugins: {
            controls: {
                autoHide: true,
                autoHideTime: 1000
            },
        }
    };
});
'use strict';
datingApp.controller('TermsCtrl', function($scope){
});
datingApp.controller('AboutCtrl', function($scope){
});
datingApp.controller('viewProfileCtrl', function($scope){
});
datingApp.controller('ContactCtrl', function($scope) {
});
datingApp.controller('MainCtrl', function($scope, $sce) {
});
datingApp.controller('SignupCtrl', function($scope) {
});
datingApp.controller('ProfileCtrl', function($scope) {
    $scope.likes = ['Meeting for coffee', 'Eating out',
        'Movies',
    'Shopping',
    'Music',
    'Reading',
    'Writing',
    'Art',
    'Design',
    'Clothes',
    'Sports',
    'Playing sports',
    'Physical fitness',
    'Swimming',
    'Boating',
    'Having fun in groups',
    'Bush',
    'walking',
    'Camping',
    'Enjoying',
    'Nature',
    'Photography',
    'Theatre',
    'group',
    'Craft',
    'Beach',
    'Bicycles',
    'Computer',
    'Games',
    ]
});