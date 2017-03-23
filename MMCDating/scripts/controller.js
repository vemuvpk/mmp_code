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
datingApp.controller('AppCtrl', function($scope, $sce,$localStorage) {
    //console.log($localStorage.user_id+'asxasx');
    
    this.config = {
        preload: "none",
        sources: [
            {src: $sce.trustAsResourceUrl("videos/mmp.mp4"), type: "video/mp4"},
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

var api_url='http://182.70.125.99/MMCDatingAPI/api/user';
var LikeKist_url='http://182.70.125.99/MMCDatingAPI/api/like';
var Locationist_url='http://182.70.125.99/MMCDatingAPI/api/location';





datingApp.controller('HeaderCtrl', function($scope,$localStorage,$http){
    $http.defaults.headers.post["Content-Type"] = "application/json";
    //console.clear();
     var StrtintervalID='';
     var StrtintervalIDForFrnds='';

     $('.frnds_list').hide();
     $scope.frndList='';

    if($localStorage.user_id!='')
    {   
        $('.UserLoggedIn').show();
        $('.UserLoggedOut').hide(); 
        
        //$scope.frndsList($localStorage.user_id);

        StrtintervalID = setInterval(function(){$scope.checkNotification($localStorage.user_id);}, 5000);
        //$scope.$on.userfriends($localStorage.user_id);
        StrtintervalIDForFrnds = setInterval(function(){$scope.userfriends($localStorage.user_id);}, 10000);

        
    }
    else
    { 
        $('.UserLoggedIn').hide();
        $('.UserLoggedOut').show(); 
    }


    $scope.userfriends = function(user_id)
    {   if(jQuery('.frnds_list').is(":visible"))
        {
            var dataObject = new Object();
                    dataObject.FromUserId = user_id;

                $http.post(api_url+'/contact/all',dataObject).success(function(data) 
                {       
                    
                        if(data.Status==0)
                        {
                            $('.no-res').show();
                        }
                        else
                        {    $scope.frndList=data.Data;  }
                    
                });
        }
    }





    $scope.checkNotification = function(user_id)
    {   
        if($('.chat-box').is(":hidden"))
        {   
            var dataObject = new Object();
                    dataObject.FromUserId = user_id;
            $http.post(api_url+'/chat/notification',dataObject).success(function(data) 
            {
                if(data.Data[0].IsNotification)
                {
                    var frndId=data.Data[0].NotificationObject.FromUserId;
                    var frndName=data.Data[0].NotificationObject.FromUserName;
                    var profilePic=data.Data[0].NotificationObject.FromUserProfilePicture;
                    $scope.ClickToChat(frndId,frndName,profilePic);
                }
                if(data.Data[1].IsNotification)
                {
                    /*var frndId=data.Data[0].FromUserId;
                    var frndName=data.Data[0].FromUserName;
                    var profilePic=data.Data[0].FromUserProfilePicture;
                    $scope.ClickToChat(frndId,frndName,profilePic);*/
                    $('#messages a.md-button').first().addClass('notification');

                }else{$('#messages a.md-button').first().removeClass('notification');}
            });
        }
    }


    var intervalID='';

    $scope.getFriends = function()
    {
            if($('#frnd_list_btn').hasClass('active'))
            {
                $('#frnd_list_btn').removeClass('active');
                $('.frnds_list').hide(500);
            }
            else
            {
                $('#frnd_list_btn').addClass('active');
                $('.frnds_list').show(500);

                var dataObject = new Object();
                    dataObject.FromUserId = $localStorage.user_id;

                $http.post(api_url+'/contact/all',dataObject).success(function(data) 
                {

                    if(data.Status==0)
                    {
                        $('.no-res').show();
                    }
                    else
                    {   
                        //data.Data[0].IsOnline=false;
                        $scope.frndList=data.Data;

                    }
                });
            }

    }
    $scope.ClickToChat = function(frndId,frndName,profilePic)
    {
        //console.log(frndId);
        $('.chat-box').show(500);
        $scope.frndName=frndName;
        $scope.frndId=frndId;
        $scope.profilePic=profilePic;

        $('.chat_list li').remove();
        window.clearInterval(intervalID);
        $localStorage.lastUpdate='';

        $scope.GetChatConversation(frndId,$localStorage.user_id);
        intervalID = setInterval(function(){$scope.GetChatConversation(frndId,$localStorage.user_id);}, 3000);

        var d = $('.chat_list');
            d.scrollTop(d.prop("scrollHeight"));
    }
    $scope.closeChatBox = function()
    {
      $('.chat-box').hide(500);  
      window.clearInterval(intervalID);
    }
    $scope.SendMessage = function(frndId,profilePic)
    {       
        console.log(profilePic);
        $('.chat_list').append('<li class="frommessage"><img src="'+profilePic+'" width="35" height="35"><span class="chat-txt">'+$scope.message+'</span></li>'); 
        var d = $('.chat_list');
            d.scrollTop(d.prop("scrollHeight"));

        var dataObject = new Object();
            dataObject.FromUserId = $localStorage.user_id;
            dataObject.ToUserId = frndId;
            dataObject.Message = $scope.message;

            $http.post(api_url+'/chat/send',dataObject).success(function(data) 
            {   console.log(data);
                if(data.Status==1)
                {
                    $scope.message='';
                }
            });
    }
    $scope.GetChatConversation = function(frndId,user_id)
    {   
         var dataObject = new Object();
            dataObject.FromUserId = user_id;
            dataObject.ToUserId = frndId;

        $http.post(api_url+'/chat/all',dataObject).success(function(data) 
        {
            if(data.Status==1)
            {
                $scope.IsOnline=data.Data[0].IsOnline;
                var lastUpdate=Math.round(new Date(data.Data[data.Data.length - 1].Date).getTime()/1000);
                if($localStorage.lastUpdate!=lastUpdate)
                {   
                    $localStorage.lastUpdate=lastUpdate;
                    $('.chat_list li').remove();
                    

                    var response=data;
                    var monthNames = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"];
                    var todaysDate = new Date();
                    for(var i=0;i<response.Data.length;i++)
                    {
                        var inputDate = new Date(response.Data[i].Date); 
                    
                        if(parseInt(todaysDate.getDate()) != parseInt(inputDate.getDate()))
                        {
                           response.Data[i].Date=monthNames[inputDate.getMonth()]+" "+inputDate.getDate();
                        }
                        else
                        {
                            var h=inputDate.getHours();
                            var m=inputDate.getMinutes();
                            response.Data[i].Date=(h > 12) ? (h-12 + ':' + m +' PM') : (h + ':' + m +' AM');
                        }
                    }

                    
                    $scope.chatConversation=response.Data;
                    var d = $('.chat_list');
                         d.scrollTop(d.prop("scrollHeight"));
                    //setTimeout($scope.scrollBottom(),5000);

                }
            }
        });
    }
    $scope.scrollBottom = function()
    {   
        //console.log($('.chat_list').prop("scrollHeight"));
         //$('.chat_list').scrollTop($('.chat_list').prop("scrollHeight")) ;
    }

});
datingApp.controller('TermsCtrl', function($scope){

});
datingApp.controller('AboutCtrl', function($scope){
});




datingApp.controller('viewProfileCtrl', function($scope,$localStorage,$http,$sce,$rootScope){
    $http.defaults.headers.post["Content-Type"] = "application/json";
    

    var dataObject = new Object();
       dataObject.UserId = $localStorage.FrndId;
       dataObject.LoginUserId = $localStorage.user_id;
    
    $http.post(api_url+'/userdetail',dataObject).success(function(data) 
    {   
        var response=data.Data;
        console.log(response);
        $scope.user_detail=response;

        if(response.Gender==1){$scope.user_detail.Gender='Male';}else{$scope.user_detail.Gender='Female';} 
        if(response.IsFriend){$('#req-btn').hide();}else{$('#req-btn').show();}
    });

    $scope.sendRequest = function(FrndId)
    {   
        var dataObject = new Object();
            dataObject.FromUserId =$localStorage.user_id;
            dataObject.ToUserId = FrndId;

        $http.post(api_url+'/contact/send',dataObject).success(function(data) 
        {   
            if(data.Status==1)
            {
                alertify.success(data.Data);
                //$('#req-btn').hide();
            }
            else
            {
                alertify.error(data.Data);
            }
        });
    }


});



datingApp.controller('logout', function($scope,$localStorage,$http) {
    $http.defaults.headers.post["Content-Type"] = "application/json";

    $scope.frndList='';
    var dataObject = new Object();
            dataObject.UserId =$localStorage.user_id;
    $http.post(api_url+'/logout',dataObject).success(function(data) 
    {
        
    });
    $localStorage.user_id='';
    $('.UserLoggedIn').hide();
    $('.UserLoggedOut').show();
    $('.chat-box').hide();
    $('.frnd-box').hide();
    
});



datingApp.controller('ContactCtrl', function($scope) {
});



datingApp.controller('MainCtrl', function($scope, $sce,$http,$localStorage,$location) {
    $http.defaults.headers.post["Content-Type"] = "application/json";


    $http.get(Locationist_url).success(function(response) 
    {
        $scope.locations = response.Data;
    });

    if($localStorage.user_id=='')
    {
        
         $('.UserLoggedIn').hide();
        $('.UserLoggedOut').show(); 
    }
    else{
         $('.UserLoggedIn').show();
         $('.UserLoggedOut').hide(); 
    }

    $scope.login = function() 
    {   
        if($scope.user.email!=undefined && $scope.user.password!=undefined)
        {
                var dataObject = new Object();
                dataObject.Email = $scope.user.email;
                dataObject.Password = $scope.user.password;
                $http.post(api_url+"/login",dataObject).success(function(response) 
                {   
                    if(response.Status==0)
                    {
                        alertify.alert(response.Data);
                    }
                    else
                    {   
                        $localStorage.user_id = response.Data.UserId;
                        
                        alertify.success('Login succefully');
                        $('.UserLoggedIn').show();
                        $('.UserLoggedOut').hide();
                        $('.signUp').hide();

                        $scope.frndList='';
                        $('.frnds_list').hide();
                        
                        $location.path('/Home');
                    }
                });
        }
    }

   $scope.search = function() 
   {
       var dataObject = new Object();
       dataObject.Gender = $scope.ctrl.Gender;
       dataObject.LookingForGender = $scope.ctrl.LookingForGender; 
       dataObject.FromAge = $scope.ctrl.FromAge; 
       dataObject.ToAge = $scope.ctrl.ToAge;
       dataObject.LocationName = $scope.ctrl.LocationName;
       console.log(dataObject);
       $http.post(api_url+"/search",dataObject).success(function(response) 
        {   console.log(response);
            if(response.Status==0)
            {
                alert(response.Data);
            }
            else
            {   if($localStorage.user_id==''){ $scope.blurimg='blur-img';}
                else{  $scope.blurimg=''; }
                $scope.search_result=response.Data;
                 
            }  
        });
   }

   $http.get(api_url+"/recent").success(function(response) 
    {
        $scope.recentUser = response.Data;
    });

   $scope.view_profile = function(UserId)
   {    
        $localStorage.FrndId=UserId;
        $location.path('/viewProfile');
   }
   
});




datingApp.controller('SignupCtrl', function($scope,$http,$location,$localStorage) {


    if($localStorage.user_id!='')
    {
        $location.path('/main');
        return false;
    }


    $http.defaults.headers.post["Content-Type"] = "application/json";
    $scope.signup = function() 
    {   
        if($scope.signup.email!=undefined && $scope.signup.password!=undefined)
        {   
            if($scope.signup.email!=$scope.signup.confirmEmail)
            {   
                alertify.error('Email does not match');
                return false;
            }
            if($scope.signup.password!=$scope.signup.confirmPwd)
            {   
                alertify.error('Password does not match');
                return false;
            }
                var dataObject = new Object();
                dataObject.Email = $scope.signup.email;
                dataObject.Password = $scope.signup.password;

                console.log(dataObject);
                $http.post(api_url+"/register",dataObject).success(function(response) 
                {
                    if(response.Status==0)
                    {
                        alertify.error(response.Data);
                    }
                    else
                    {   
                       alertify.alert(response.Data);
                       $location.path('/main');
                    }            
                });
        }
    }
    $scope.reset_signup =function()
    {
        $scope.signup='';
    }
});




datingApp.controller('ProfileCtrl', function($scope, $http,$localStorage,$compile,$location) {
    
    if($localStorage.user_id=='')
    {
        $location.path('/main');
        return false;
    }

    $('#profilePic').bind('change', function() {
      var PicSize=(this.files[0].size/1024)/1024;
      if(PicSize > 10)
      {
        alertify.alert("Profile image size should be less than 10MB.");
        return false;
      }
    });
    $('#profileVid').bind('change', function() {
      var PicSize=(this.files[0].size/1024)/1024;
      if(PicSize > 20)
      {
        alertify.alert("Video size should be less than 20MB.");
        return false;
      }

    });





    $http.defaults.headers.post["Content-Type"] = "application/json";

    $http.get(LikeKist_url).success(function(response) 
    {
        $scope.likes = response.Data;
    });
    $http.get(Locationist_url).success(function(response) 
    {
        $scope.locations = response.Data;
    });

    var dataObject = new Object();
       dataObject.UserId = $localStorage.user_id;
       dataObject.LoginUserId = $localStorage.user_id;

    $http.post(api_url+'/userdetail',dataObject).success(function(data) 
    {
        var response=data.Data;
        $scope.user = response;
        if(response.Gender==1){ $('.male_btn').addClass('active'); }else{ $('.female_btn').addClass('active'); }
        /*if(response.LookingforGender==1){ $('#select_value_label_0 span').text('Male') } else{ $('#select_value_label_0 span').text('Female') }*/
        for(var i=0;i<response.UserLikes.length;i++)
        {
             $( ".like_checkbox" ).each(function() {
                if($(this).attr('value')==response.UserLikes[i].Id)
                {
                    $(this).addClass('md-checked');
                }
            });
        }
        console.log( $scope.user);
    });

    $scope.editProfile = function() 
    {   
        if($('.male_btn').hasClass('active')){ var gender='1'; } else { var gender='2'; }
        if($('#select_value_label_0 span').text()=='Male') { var LookingFor='1'; } else { var LookingFor='2'; }
        
        var dataObject = new Object();
        dataObject.FirstName = $scope.user.FirstName;
        dataObject.LastName = $scope.user.LastName;
        dataObject.Gender = gender;
        dataObject.Age = $scope.user.Age;
        dataObject.LookingForGender = LookingFor;
        dataObject.ThingsNotLike = $scope.user.ThingsNotLike;
        dataObject.AboutMe = $scope.user.AboutMe;
        dataObject.LocationName = $scope.user.LocationName;

        if($scope.profile_pic !='' && $scope.profile_pic!=undefined)
        {
            var file = $scope.profile_pic;

            var ext = file.name.substring(file.name.lastIndexOf('.') + 1);
            if(ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "png" || ext == "PNG")
            {
                    var ImageName=Date.now()+'_pro_pic.'+file.name.split('.').pop();
                    var uploadUrl = 'upload_file.php?type=image&user_id='+$localStorage.user_id+'&ImageName='+ImageName;
                        var fd = new FormData();
                        fd.append('file', file);
                        $http.post(uploadUrl, fd, {
                            withCredentials: true,
                            transformRequest: angular.identity,
                            headers: {'Content-Type': undefined}
                        })
                    .success(function(response){  }).error(function(){ });
            }else{
                alertify.error('Image file type is not supported.');
                return false;
            }
        }
        else{ ImageName='' }
        if($scope.profile_video !='' && $scope.profile_video!=undefined)
        {
            var file = $scope.profile_video;
            var ext = file.name.substring(file.name.lastIndexOf('.') + 1);
            if(ext == "mp4" || ext == "webm" || ext == "ogg")
            {
                    var VideoName=Date.now()+'_pro_vid.'+file.name.split('.').pop();
                    var uploadUrl = 'upload_file.php?type=video&user_id='+$localStorage.user_id+'&VideoName='+VideoName;
                        var fd = new FormData();
                        fd.append('file', file);
                        $http.post(uploadUrl, fd, {
                            withCredentials: true,
                            transformRequest: angular.identity,
                            headers: {'Content-Type': undefined}
                        })
                        .success(function(response){ console.log(response); }).error(function(){ });
            }
            else{
                alertify.error('Video file type is not supported.');
                return false;
            }
        }
        else{ VideoName='' }

        

        var likes=new Array();
        $( ".md-checked" ).each(function() {
            likes.push($(this).attr('value') );
        });

        dataObject.Likes = likes;
        if(ImageName!=''){ dataObject.ProfilePicture='upload/profile_image/'+$localStorage.user_id+'/'+ImageName; }
        if(VideoName!=''){ dataObject.ProfileVideo='upload/profile_video/'+$localStorage.user_id+'/'+VideoName; }
        

        console.log(dataObject);

        $http.post(api_url+"/"+$localStorage.user_id+"/update",dataObject).success(function(response) 
        {   
            console.log(api_url+"/"+$localStorage.user_id+"/update");
            console.log(response);
            if(response.Status==1)
            {
                if(ImageName!=''){ $scope.user.ProfilePicture='upload/profile_image/'+$localStorage.user_id+'/'+ImageName; }
                if(VideoName!=''){ $scope.user.ProfileVideo='upload/profile_video/'+$localStorage.user_id+'/'+VideoName; }
                alertify.success(response.Data);
            }
            else
            {
                alertify.error(response.Data);
            }
            
            
        })
        .error(function(){ 
             console.log(response);
        });
    }

    $scope.ResetProfile = function()
    {   

        alertify.set({ labels: {
                ok     : "Yes",
                cancel : "No"
            } });
        alertify.confirm("Are you sure you want to reset you profile?", function (e) 
        {   
            if (e) {
                $scope.user='';
                $('.like_checkbox').removeClass('md-checked');
                $('.profile_picture').hide();
            }
        });
    }

});


datingApp.controller('activateCtrl', function( $scope, $routeParams,$location,$http) {
   $http.defaults.headers.post["Content-Type"] = "application/json";
    var dataObject = new Object();
        dataObject.Email = $routeParams.UserId;

    $http.post(api_url+'/activate',dataObject).success(function(response) 
    {
        if(response.Status==1)
        {
            alertify.success('Your account is activated successfully.')
            $location.path('/main');
        }
       
    });

});
datingApp.controller('HomeCtrl', function( $scope,$location,$http,$localStorage) {
    if($localStorage.user_id=='')
    {
        $('.signUp').show();
    }
    else{
        $('.signUp').hide();
    }
});





datingApp.controller('forgotCtrl', function( $scope,$location,$http,$localStorage) {
    $http.defaults.headers.post["Content-Type"] = "application/json";
    $scope.forgotpassword = function()
    {
        if($scope.user.email!='')
        {
            var dataObject = new Object();
                dataObject.Email = $scope.user.email;

            $http.post(api_url+'/forgetpassword',dataObject).success(function(response) 
            {
                if(response.Status==1)
                {
                    alertify.alert(response.Data);
                }
                else
                {
                    alertify.error(response.Data);
                }
               // $scope.user.email='';
            });
        }
    }
});


datingApp.controller('notificationCtrl', function( $scope,$location,$http,$localStorage) {
    $http.defaults.headers.post["Content-Type"] = "application/json";
    
    var dataObject = new Object();
        dataObject.ToUserId = $localStorage.user_id;

        $http.post(api_url+'/contact/request',dataObject).success(function(response) 
        {   console.log(response);
            if(response.Status==0)
            {
                $('.No_result_found').show();
            }
            else
            {
                $scope.RequestList=response.Data;
            }
        });

    $scope.response_request = function(requestUserId,Status)
    {
        
        var dataObject = new Object();
            dataObject.FromUserId = requestUserId;
            dataObject.ToUserId = $localStorage.user_id;
            dataObject.IsConfirmed = Status;

        $http.post(api_url+'/contact/confirm',dataObject).success(function(response) 
        {
            if(response.Status==1)
            {
                alertify.success(response.Data);
                $('#'+requestUserId).hide(300);
            }
            else
            {
                alertify.error(response.Data);
            }
        });
    }
});


datingApp.controller('composeCtrl', function( $scope,$location,$http,$localStorage) {
    $http.defaults.headers.post["Content-Type"] = "application/json";

    var dataObject = new Object();
        dataObject.FromUserId = $localStorage.user_id;
    $http.post(api_url+'/contact/all',dataObject).success(function(data) 
    {
        if(data.Status==1)
        {
            $scope.frndList=data.Data;
        }
    });

    $scope.sendMessage = function()
    {
        var dataObject = new Object();
            dataObject.FromUserId = $localStorage.user_id;
            dataObject.ToUserId =$scope.compose.frndId ;
            dataObject.Message = $scope.compose.message;

            $http.post(api_url+'/message/send',dataObject).success(function(response) 
            {
                if(response.Status==1)
                {
                    alertify.success(response.Data);
                    $scope.compose='';
                }
            });
    }
});

datingApp.controller('inboxCtrl', function( $scope,$location,$http,$localStorage) {
    $http.defaults.headers.post["Content-Type"] = "application/json";

    

    var dataObject = new Object();
            dataObject.FromUserId = $localStorage.user_id;

            $http.post(api_url+'/message/receivedmessages',dataObject).success(function(response) 
            {   console.log(response);
                if(response.Status==1)
                {   
                    var monthNames = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"];
                    var todaysDate = new Date();
                    for(var i=0;i<response.Data.length;i++)
                    {
                        var inputDate = new Date(response.Data[i].Date); 
                    
                        if(parseInt(todaysDate.getDate()) != parseInt(inputDate.getDate()))
                        {
                           console.log(monthNames[inputDate.getMonth()]+" "+inputDate.getDate()); 
                           response.Data[i].Date=monthNames[inputDate.getMonth()]+" "+inputDate.getDate();
                        }
                        else
                        {
                            console.log(inputDate.getHours()+":"+inputDate.getMinutes());
                            var h=inputDate.getHours();
                            var m=inputDate.getMinutes();
                            
                            response.Data[i].Date=(h > 12) ? (h-12 + ':' + m +' PM') : (h + ':' + m +' AM');
                        }
                    }

                    $scope.messages=response.Data;
                }
                else
                {
                    $('.No_result_found').show();
                }
            });
});


datingApp.controller('sentMessagesCtrl', function( $scope,$location,$http,$localStorage) {
    $http.defaults.headers.post["Content-Type"] = "application/json";

    

    var dataObject = new Object();
            dataObject.FromUserId = $localStorage.user_id;

            $http.post(api_url+'/message/sentmessages',dataObject).success(function(response) 
            {   console.log(response);
                if(response.Status==1)
                {
                    $scope.messages=response.Data;
                    var monthNames = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"];
                    var todaysDate = new Date();
                    for(var i=0;i<response.Data.length;i++)
                    {
                        var inputDate = new Date(response.Data[i].Date); 
                    
                        if(parseInt(todaysDate.getDate()) != parseInt(inputDate.getDate()))
                        {
                           console.log(monthNames[inputDate.getMonth()]+" "+inputDate.getDate()); 
                           response.Data[i].Date=monthNames[inputDate.getMonth()]+" "+inputDate.getDate();
                        }
                        else
                        {
                            console.log(inputDate.getHours()+":"+inputDate.getMinutes());
                            var h=inputDate.getHours();
                            var m=inputDate.getMinutes();
                            
                            response.Data[i].Date=(h > 12) ? (h-12 + ':' + m +' PM') : (h + ':' + m +' AM');
                        }
                    }

                    $scope.messages=response.Data;
                }
                else
                {
                    $('.No_result_found').show();
                }
            });
});



