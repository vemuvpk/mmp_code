using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MMCDating.Models
{
    public class MMCDatingModels
    {
    }

    public class UserLoginModel
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public int UserId { get; set; }
    }

    public class UserRegisterModel
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public short Gender { get; set; }
        public int Age { get; set; }
        public short LookingforGender { get; set; }
        public string ThingsNotLike { get; set; }
        public string AboutMe { get; set; }
        public string ProfilePicture { get; set; }
        public string ProfileVideo { get; set; }
        public string LocationName { get; set; }

        public List<string> Likes { get; set; }

        public List<LikeModel> UserLikes { get; set; }

        public int LoginUserId { get; set; }
        public bool IsFriend { get; set; }


    }

    public class LikeModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class LocationModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class UserSearchModel
    {
        public short Gender { get; set; }
        public short LookingforGender { get; set; }
        public int FromAge { get; set; }
        public int ToAge { get; set; }
        public string LocationName { get; set; }
    }

    public class ForgetPasswordModel
    {
        public string Email { get; set; }
    }

    public class ReturnObject
    {
        public short Status { get; set; }
        public object Data { get; set; }
    }

    public class UserDetailModel
    {
        public int UserId { get; set; }
        public int LoginUserId { get; set; }
    }

    public class UserMessageModel
    {
        public int FromUserId { get; set; }
        public string FromUserName { get; set; }
        public string FromUserProfilePicture { get; set; }
        public int ToUserId { get; set; }
        public string ToUserName { get; set; }
        public string ToUserProfilePicture { get; set; }
        public bool IsSent { get; set; }
        public string Message { get; set; }
        public DateTime Date { get; set; }
    }

    public class UserContactModel
    {
        public int FromUserId { get; set; }
        public string FromUserName { get; set; }
        public string FromUserProfilePicture { get; set; }
        public string FromUserAboutMe { get; set; }
        public int ToUserId { get; set; }
        public string ToUserName { get; set; }
        public string ToUserProfilePicture { get; set; }
        public string ToUserAboutMe { get; set; }
        public short IsConfirmed { get; set; }
        public string IsOnline { get; set; }
    }

    public class UserChatModel
    {
        public int FromUserId { get; set; }
        public string FromUserName { get; set; }
        public string FromUserProfilePicture { get; set; }
        public int ToUserId { get; set; }
        public string ToUserName { get; set; }
        public string ToUserProfilePicture { get; set; }
        public string Message { get; set; }
        public DateTime Date { get; set; }
        public string MessageCSS { get; set; }
        public string IsOnline { get; set; }
    }

    public class NotificationModel
    {
        public bool IsNotification { get; set; }
        public int NoOfNotification { get; set; }
        public string NotificationType { get; set; }
        public object NotificationObject { get; set; }
    }

}