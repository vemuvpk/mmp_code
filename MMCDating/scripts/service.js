/**
 * Created by Praveen on 01/09/15.
 */

'use strict';
datingApp.factory('MMPService', ['$http', '$q', 'localStorageService', '$location', 'ngSrvcSettings', function ($http, $q, localStorageService, $location, ngSrvcSettings) {

    var serviceBase = ngSrvcSettings.apiServiceBaseUri + 'Login/';
    var authServiceFactory = {};

    var _authentication = {
        isAuth: false,
        userName: "",
        useRefreshTokens: false
    };

    var _saveRegistration = function (registration) {

        _logOut();

        return $http.post(serviceBase + 'api/account/register', registration).then(function (response) {
            return response;
        });

    };

    var _login = function (loginData) {

        var data = "grant_type=password&username=" + loginData.userName + "&password=" + loginData.password;

        if (loginData.useRefreshTokens) {
            data = data + "&client_id=" + ngSrvcSettings.clientId;
        }

        var deferred = $q.defer();

        $http.post(serviceBase + 'token', data, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).success(function (response) {

            if (loginData.useRefreshTokens) {
                localStorageService.set('authorizationData', { token: response.access_token, userName: loginData.userName, refreshToken: response.refresh_token, useRefreshTokens: true });
            }
            else {
                localStorageService.set('authorizationData', { token: response.access_token, userName: loginData.userName, refreshToken: "", useRefreshTokens: false });
            }
            _authentication.isAuth = true;
            _authentication.userName = loginData.userName;
            _authentication.useRefreshTokens = loginData.useRefreshTokens;

            deferred.resolve(response);

        }).error(function (err, status) {
            _logOut();
            deferred.reject(err);
        });

        return deferred.promise;

    };

    var _logOut = function () {

        localStorageService.remove('authorizationData');

        _authentication.isAuth = false;
        _authentication.userName = "";
        _authentication.useRefreshTokens = false;

    };

    var _fillAuthData = function () {

        var authData = localStorageService.get('authorizationData');
        if (authData) {
            _authentication.isAuth = true;
            _authentication.userName = authData.userName;
            _authentication.useRefreshTokens = authData.useRefreshTokens;
        }
        else {
            $location.path('/login');
        }


    };

    var _refreshToken = function () {
        var deferred = $q.defer();

        var authData = localStorageService.get('authorizationData');

        if (authData) {

            if (authData.useRefreshTokens) {

                var data = "grant_type=refresh_token&refresh_token=" + authData.refreshToken + "&client_id=" + ngSrvcSettings.clientId;

                localStorageService.remove('authorizationData');

                $http.post(serviceBase + 'token', data, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).success(function (response) {

                    localStorageService.set('authorizationData', { token: response.access_token, userName: response.userName, refreshToken: response.refresh_token, useRefreshTokens: true });

                    deferred.resolve(response);

                }).error(function (err, status) {
                    _logOut();
                    deferred.reject(err);
                });
            }
        }

        return deferred.promise;
    };

    authServiceFactory.saveRegistration = _saveRegistration;
    authServiceFactory.login = _login;
    authServiceFactory.logOut = _logOut;
    authServiceFactory.fillAuthData = _fillAuthData;
    authServiceFactory.authentication = _authentication;
    authServiceFactory.refreshToken = _refreshToken;

    return authServiceFactory;
}]);

'use strict';
datingApp.factory('authInterceptorService', ['$q', '$injector', '$location', 'localStorageService', function ($q, $injector, $location, localStorageService) {

    var authInterceptorServiceFactory = {};

    var _request = function (config) {

        config.headers = config.headers || {};

        var authData = localStorageService.get('authorizationData');
        if (authData) {
            config.headers.Authorization = 'Bearer ' + authData.token;
        }

        return config;
    };

    var _responseError = function (rejection) {
        if (rejection.status === 401) {
            var authService = $injector.get('authService');
            var authData = localStorageService.get('authorizationData');

            if (authData) {
                if (authData.useRefreshTokens) {
                    $location.path('/refresh');
                    return $q.reject(rejection);
                }
            }
            authService.logOut();
            $location.path('/login');
        }
        return $q.reject(rejection);
    };

    authInterceptorServiceFactory.request = _request;
    authInterceptorServiceFactory.responseError = _responseError;

    return authInterceptorServiceFactory;
}]);

'use strict';
datingApp.factory('httpService', ['$http', '$filter', 'ngSrvcSettings', 'localStorageService', function ($http, $filter, ngSrvcSettings, localStorageService) {
    var authData = localStorageService.get('authorizationData');
    var config = '', username = '';
    if(authData){
        config = {
            headers:{
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer' + authData.token
            }
        };
        username = authData.userName
    }
    var serviceBase = ngSrvcSettings.apiServiceBaseUri;
    var httpServiceFactory = {};
    var getDatetime = function () {
        return $filter('date')(new Date(), 'yyyy-MM-dd HH:mm:ss');
    };
    var _get = function (api) {
        return $http.get(serviceBase + api).then(function (response) {
                return response;
            },
            function (err) {
                return "Something went Wrong";
            });
    };
    var _post = function (api, data) {
        data.CreatedOn = getDatetime();
        data.CreatedBy = username;
        data.ModifiedOn = getDatetime();
        data.ModifiedBy = username;
        return $http({ method: 'POST', url: serviceBase + api, data: data }).then(function (response) {
                return "Successfully Submitted";
            },
            function (err) {
                return "Error While Saving";
            });
    };
    var _put = function (api, ID, data) {
        data.ModifiedOn = getDatetime();
        data.ModifiedBy = username;
        return $http.put(serviceBase+ api + '/'+ ID, data).then(function(response) {
                return "Updated Successfully";
            },
            function (err) {
                return "Something went Wrong";
            });
    };
    var _delete = function (api, ID) {
        return $http.delete(serviceBase + api +"/"+ID).then(function (results) {
                return "Deleted Successfully";
            },
            function (err) {
                return "Something went Wrong";
            });
    };
    httpServiceFactory.get = _get;
    httpServiceFactory.post = _post;
    httpServiceFactory.put = _put;
    httpServiceFactory.delete = _delete;

    return httpServiceFactory;
}]);

'use strict';
datingApp.factory('sharedService', function () {
    var htmlData = '';
    return {
        getHtmlData: function () {
            return htmlData;
        },
        setHtmlData: function (value) {
            htmlData = value;
        }
    };
});
