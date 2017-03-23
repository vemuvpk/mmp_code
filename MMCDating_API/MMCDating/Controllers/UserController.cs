using MMCDating.Common;
using MMCDating.Entity;
using MMCDating.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Text;
using System.Web.Http;
using System.Web.Http.Cors;

namespace MMCDating.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/user")]
    public class UserController : ApiController
    {
        readonly log4net.ILog _logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        [HttpPost]
        [Route("login")]
        public HttpResponseMessage Login(UserLoginModel userLoginModel)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                var user =
                    db.Users.FirstOrDefault(
                        u => u.Email == userLoginModel.Email && u.Password == userLoginModel.Password && u.IsConfirmed == true && u.IsActive == true);

                if (user != null)
                {
                    //dynamic obj = new ExpandoObject();
                    //obj.UserId = user.Id;
                    //obj.UserName = user.FirstName + " " + user.LastName;

                    db.UsersLoginLogs.Where(w => w.UserId == user.Id && w.LoggedOutTime == null).ToList().ForEach(f => f.LoggedOutTime = DateTime.Now);

                    UsersLoginLog usersLoginLog = new UsersLoginLog();
                    usersLoginLog.UserId = user.Id;
                    usersLoginLog.LoggedInTime = DateTime.Now;
                    usersLoginLog.CreatedDate = DateTime.Now;

                    db.UsersLoginLogs.Add(usersLoginLog);
                    db.SaveChanges();

                    var userData = new { UserId = user.Id, UserName = user.FirstName + " " + user.LastName };

                    ro.Status = 1;
                    ro.Data = userData;
                }
                else
                {
                    ro.Status = 0;
                    ro.Data = "Invalid user credentials.";
                }

            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);

        }

        [HttpPost]
        [Route("logout")]
        public HttpResponseMessage Logout(UserLoginModel userLoginModel)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                var user = db.Users.FirstOrDefault(u => u.Id == userLoginModel.UserId);
                if (user != null)
                {
                    db.UsersLoginLogs.Where(w => w.UserId == user.Id).ToList().ForEach(f => f.LoggedOutTime = DateTime.Now);
                    db.SaveChanges();

                    ro.Status = 1;
                    ro.Data = "User loggedout successfully.";
                }
                else
                {
                    ro.Status = 0;
                    ro.Data = "Invalid user.";
                }

            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);

        }

        [HttpPost]
        [Route("register")]
        public HttpResponseMessage Register(UserRegisterModel userRegisterModel)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                var duplicateEmail =
                    db.Users.FirstOrDefault(
                        u => u.Email == userRegisterModel.Email.Trim());

                if (duplicateEmail != null)
                {
                    ro.Status = 0;
                    ro.Data = "Email already exist.";
                }
                else
                {
                    var user = new User();
                    user.FirstName = CheckDBNull.ToStringType(userRegisterModel.FirstName).Trim();
                    user.LastName = CheckDBNull.ToStringType(userRegisterModel.LastName).Trim();
                    user.Email = CheckDBNull.ToStringType(userRegisterModel.Email).Trim();
                    user.Password = userRegisterModel.Password;
                    user.Gender = userRegisterModel.Gender;
                    user.Age = userRegisterModel.Age;
                    user.LookingforGender = userRegisterModel.LookingforGender;
                    user.ThingsNotLike = CheckDBNull.ToStringType(userRegisterModel.ThingsNotLike).Trim();
                    user.AboutMe = CheckDBNull.ToStringType(userRegisterModel.AboutMe).Trim();
                    user.ProfilePicture = CheckDBNull.ToStringType(userRegisterModel.ProfilePicture).Trim();
                    user.ProfileVideo = CheckDBNull.ToStringType(userRegisterModel.ProfileVideo).Trim();
                    user.IsActive = true;
                    user.CreatedDate = DateTime.Now;
                    user.ModifiedDate = DateTime.Now;

                    db.Users.Add(user);
                    db.SaveChanges();

                    try
                    {
                        string EmailFrom = ConfigurationManager.AppSettings["AdminEmail"];
                        string EmailTo = user.Email;
                        string EmailSubject = "Welcome to michaelsmeetingpoint.com";
                        StringBuilder EmailBody = new StringBuilder();
                        EmailBody.AppendLine("Hi,");
                        EmailBody.AppendLine("<br>");
                        EmailBody.AppendLine("<br>");
                        EmailBody.AppendLine("Welcome to michaelsmeetingpoint.com, please activate your account from below link.");
                        EmailBody.AppendLine("<br>");
                        EmailBody.AppendLine("<br>");
                        EmailBody.AppendLine("" + ConfigurationManager.AppSettings["URL"] + "/acivate/" + user.Email);
                        EmailBody.AppendLine("<br>");
                        EmailBody.AppendLine("<br>");
                        EmailBody.AppendLine("From, michaelsmeetingpoint.com");

                        Utility.SendMail(EmailTo, EmailFrom, "", "", EmailSubject, EmailBody.ToString());
                    }
                    catch (Exception)
                    {

                    }

                    ro.Status = 1;
                    ro.Data = "You are registered successfully, please check your email to activate your account.";
                }

            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);

        }

        [HttpPost]
        [Route("activate")]
        public HttpResponseMessage ActivateUser(UserRegisterModel userRegisterModel)
        {
            ReturnObject ro = new ReturnObject();
            ro.Status = 0;
            ro.Data = "User not valid.";
            using (var db = new MMCDatingEntities())
            {
                var user = db.Users.Where(w => w.Email == userRegisterModel.Email).FirstOrDefault();

                if (user != null)
                {
                    user.IsConfirmed = true;

                    db.SaveChanges();

                    ro.Status = 1;
                    ro.Data = "User activated successfully.";

                }

            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);

        }

        [HttpPost]
        [Route("{userId}/update")]
        public HttpResponseMessage UpdateProfile(UserRegisterModel userRegisterModel, int userId)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                var duplicateEmail =
                    db.Users.FirstOrDefault(
                        u => u.Email == userRegisterModel.Email.Trim() && u.Id != userId);

                if (duplicateEmail != null)
                {
                    ro.Status = 0;
                    ro.Data = "Email already exist.";
                }
                else
                {
                    var user = db.Users.FirstOrDefault(
                                    u => u.Id == userId);
                    user.FirstName = userRegisterModel.FirstName.Trim();
                    user.LastName = userRegisterModel.LastName.Trim();
                    user.Gender = userRegisterModel.Gender;
                    user.Age = userRegisterModel.Age;
                    user.LookingforGender = userRegisterModel.LookingforGender;
                    if (!string.IsNullOrEmpty(userRegisterModel.ThingsNotLike))
                        user.ThingsNotLike = userRegisterModel.ThingsNotLike.Trim();
                    user.AboutMe = userRegisterModel.AboutMe.Trim();
                    if (!string.IsNullOrEmpty(userRegisterModel.ProfilePicture))
                        user.ProfilePicture = userRegisterModel.ProfilePicture.Trim();
                    if (!string.IsNullOrEmpty(userRegisterModel.ProfileVideo))
                        user.ProfileVideo = userRegisterModel.ProfileVideo.Trim();
                    user.ModifiedDate = DateTime.Now;
                    user.LocationName = userRegisterModel.LocationName;


                    //_logger.Debug("ProfilePicture -- " + userRegisterModel.ProfilePicture);

                    user.UsersLikes.Clear();

                    foreach (var item in userRegisterModel.Likes)
                    {
                        user.UsersLikes.Add(new UsersLike
                        {
                            LikeId = Convert.ToInt32(item),
                            UserId = userId
                        });
                    }

                    db.SaveChanges();

                    ro.Status = 1;
                    ro.Data = "Your profile updated successfully.";
                }
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);

        }

        //[HttpGet]
        //[Route("{userId}")]
        //public HttpResponseMessage GetUser(int userId)
        //{
        //    ReturnObject ro = new ReturnObject();
        //    using (var db = new MMCDatingEntities())
        //    {
        //        var user = db.Users.Where(w => w.Id == userId).FirstOrDefault();

        //        if (user != null)
        //        {
        //            UserRegisterModel ur = new UserRegisterModel();
        //            ur.UserId = user.Id;
        //            ur.FirstName = user.FirstName;
        //            ur.LastName = user.LastName;
        //            ur.Gender = user.Gender.Value;
        //            ur.Age = user.Age.Value;
        //            ur.LookingforGender = user.LookingforGender.Value;
        //            ur.Email = user.Email;
        //            ur.ThingsNotLike = user.ThingsNotLike;
        //            ur.AboutMe = user.AboutMe;
        //            ur.ProfilePicture = user.ProfilePicture;
        //            ur.ProfileVideo = user.ProfileVideo;

        //            ur.UserLikes = new List<LikeModel>();
        //            foreach (var item in user.UsersLikes)
        //            {
        //                ur.UserLikes.Add(new LikeModel
        //                {
        //                    Id = item.Like.Id,
        //                    Name = item.Like.Name
        //                });
        //            }

        //            ro.Status = 1;
        //            ro.Data = ur;

        //        }

        //    }
        //    return Request.CreateResponse(HttpStatusCode.OK, ro);

        //}

        [HttpPost]
        [Route("userdetail")]
        public HttpResponseMessage GetUser(UserDetailModel userDetailModel)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                userDetailModel.UserId = CheckDBNull.ToIntegerType(userDetailModel.UserId);
                userDetailModel.LoginUserId = CheckDBNull.ToIntegerType(userDetailModel.LoginUserId);

                var user = db.Users.Where(w => w.Id == userDetailModel.UserId).FirstOrDefault();

                if (user != null)
                {
                    UserRegisterModel ur = new UserRegisterModel();
                    ur.UserId = user.Id;
                    ur.FirstName = user.FirstName;
                    ur.LastName = user.LastName;
                    ur.Gender = user.Gender.Value;
                    ur.Age = user.Age.Value;
                    ur.LookingforGender = user.LookingforGender.Value;
                    ur.Email = user.Email;
                    ur.ThingsNotLike = user.ThingsNotLike;
                    ur.AboutMe = user.AboutMe;
                    ur.ProfilePicture = user.ProfilePicture;
                    ur.ProfileVideo = user.ProfileVideo;
                    ur.LocationName = user.LocationName;

                    ur.UserLikes = new List<LikeModel>();
                    foreach (var item in user.UsersLikes)
                    {
                        ur.UserLikes.Add(new LikeModel
                        {
                            Id = item.Like.Id,
                            Name = item.Like.Name
                        });
                    }

                    ur.LoginUserId = userDetailModel.LoginUserId;
                    ur.IsFriend = db.UsersContacts.Where(w => ((w.FromUserId == userDetailModel.UserId && w.ToUserId == userDetailModel.LoginUserId) || (w.FromUserId == userDetailModel.LoginUserId && w.ToUserId == userDetailModel.UserId)) && w.IsConfirmed == true).Any();

                    ro.Status = 1;
                    ro.Data = ur;

                }

            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);

        }

        [HttpGet]
        [Route("recent")]
        public HttpResponseMessage GetRecentUsers()
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                var userList = db.Users.Where(w => w.IsConfirmed == true && w.IsActive == true).OrderByDescending(o => o.CreatedDate).Take(4).ToList();
                if (userList != null)
                {
                    List<UserRegisterModel> lstUserRegisterModel = new List<UserRegisterModel>();
                    foreach (var user in userList)
                    {

                        UserRegisterModel newUserRegisterModel = new UserRegisterModel();

                        newUserRegisterModel.UserId = user.Id;
                        newUserRegisterModel.FirstName = CheckDBNull.ToStringType(user.FirstName);
                        newUserRegisterModel.LastName = CheckDBNull.ToStringType(user.LastName);
                        newUserRegisterModel.Gender = CheckDBNull.ToSmallIntegerType(user.Gender);
                        newUserRegisterModel.Age = CheckDBNull.ToIntegerType(user.Age);
                        newUserRegisterModel.LookingforGender = CheckDBNull.ToSmallIntegerType(user.LookingforGender);
                        newUserRegisterModel.Email = CheckDBNull.ToStringType(user.Email);
                        newUserRegisterModel.ThingsNotLike = CheckDBNull.ToStringType(user.ThingsNotLike);
                        newUserRegisterModel.AboutMe = CheckDBNull.ToStringType(user.AboutMe);
                        newUserRegisterModel.ProfilePicture = CheckDBNull.ToStringType(user.ProfilePicture);
                        newUserRegisterModel.ProfileVideo = CheckDBNull.ToStringType(user.ProfileVideo);

                        newUserRegisterModel.UserLikes = new List<LikeModel>();
                        foreach (var item in user.UsersLikes)
                        {
                            newUserRegisterModel.UserLikes.Add(new LikeModel
                            {
                                Id = item.Like.Id,
                                Name = item.Like.Name
                            });
                        }

                        lstUserRegisterModel.Add(newUserRegisterModel);
                    }

                    ro.Status = 1;
                    ro.Data = lstUserRegisterModel;
                }
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

        [HttpPost]
        [Route("search")]
        public HttpResponseMessage SearchUser(UserSearchModel userSearchModel)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                userSearchModel.Gender = CheckDBNull.ToSmallIntegerType(userSearchModel.Gender);
                userSearchModel.LookingforGender = CheckDBNull.ToSmallIntegerType(userSearchModel.LookingforGender);
                userSearchModel.FromAge = CheckDBNull.ToIntegerType(userSearchModel.FromAge);
                userSearchModel.ToAge = CheckDBNull.ToIntegerType(userSearchModel.ToAge);
                userSearchModel.LocationName = CheckDBNull.ToStringType(userSearchModel.LocationName);

                var userList = db.Users.Where(w => w.IsConfirmed == true && w.IsActive == true).ToList();

                //if (userSearchModel.Gender > 0)
                //    userList = userList.Where(w => w.Gender == userSearchModel.Gender).ToList();
                if (userSearchModel.LookingforGender > 0)
                    userList = userList.Where(w => w.Gender == userSearchModel.LookingforGender).ToList();
                if (userSearchModel.FromAge > 0)
                    userList = userList.Where(w => w.Age > userSearchModel.FromAge).ToList();
                if (userSearchModel.ToAge > 0)
                    userList = userList.Where(w => w.Age < userSearchModel.ToAge).ToList();
                if (userSearchModel.LocationName != string.Empty)
                    userList = userList.Where(w => w.LocationName == userSearchModel.LocationName).ToList();

                if (userList != null)
                {
                    List<UserRegisterModel> lstUserRegisterModel = new List<UserRegisterModel>();
                    foreach (var user in userList)
                    {

                        UserRegisterModel newUserRegisterModel = new UserRegisterModel();

                        newUserRegisterModel.UserId = user.Id;
                        newUserRegisterModel.FirstName = CheckDBNull.ToStringType(user.FirstName);
                        newUserRegisterModel.LastName = CheckDBNull.ToStringType(user.LastName);
                        newUserRegisterModel.Gender = CheckDBNull.ToSmallIntegerType(user.Gender);
                        newUserRegisterModel.Age = CheckDBNull.ToIntegerType(user.Age);
                        newUserRegisterModel.LookingforGender = CheckDBNull.ToSmallIntegerType(user.LookingforGender);
                        newUserRegisterModel.Email = CheckDBNull.ToStringType(user.Email);
                        newUserRegisterModel.ThingsNotLike = CheckDBNull.ToStringType(user.ThingsNotLike);
                        newUserRegisterModel.AboutMe = CheckDBNull.ToStringType(user.AboutMe);
                        newUserRegisterModel.ProfilePicture = CheckDBNull.ToStringType(user.ProfilePicture);
                        newUserRegisterModel.ProfileVideo = CheckDBNull.ToStringType(user.ProfileVideo);

                        newUserRegisterModel.UserLikes = new List<LikeModel>();
                        foreach (var item in user.UsersLikes)
                        {
                            newUserRegisterModel.UserLikes.Add(new LikeModel
                            {
                                Id = item.Like.Id,
                                Name = item.Like.Name
                            });
                        }

                        lstUserRegisterModel.Add(newUserRegisterModel);
                    }

                    ro.Status = 1;
                    ro.Data = lstUserRegisterModel;
                }
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

        [HttpPost]
        [Route("forgetpassword")]
        public HttpResponseMessage ForgetPassword(ForgetPasswordModel forgetPasswordModel)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                var user = db.Users.Where(w => w.Email == forgetPasswordModel.Email.Trim() && w.IsConfirmed == true && w.IsActive == true).FirstOrDefault();

                if (user != null)
                {
                    string EmailFrom = ConfigurationManager.AppSettings["AdminEmail"];
                    string EmailTo = forgetPasswordModel.Email;
                    string EmailSubject = "Password for michaelsmeetingpoint.com";
                    StringBuilder EmailBody = new StringBuilder();
                    EmailBody.AppendLine("Hi " + user.FirstName + ",");
                    EmailBody.AppendLine("<br>");
                    EmailBody.AppendLine("<br>");
                    EmailBody.AppendLine("Please find your password for michaelsmeetingpoint.com");
                    EmailBody.AppendLine("<br>");
                    EmailBody.AppendLine("<br>");
                    EmailBody.AppendLine("<strong>Password:</strong> " + user.Password);
                    EmailBody.AppendLine("<br>");
                    EmailBody.AppendLine("<br>");
                    EmailBody.AppendLine("From, michaelsmeetingpoint.com");

                    Utility.SendMail(EmailTo, EmailFrom, "", "", EmailSubject, EmailBody.ToString());

                    ro.Status = 1;
                    ro.Data = "Please check your email to get your password.";
                }
                else
                {
                    ro.Status = 0;
                    ro.Data = "Email does not exist in the system.";
                }
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

        [HttpPost]
        [Route("contact/send")]
        public HttpResponseMessage SendContact(UserContactModel userContactModel)
        {
            ReturnObject ro = new ReturnObject();
            ro.Status = 0;
            ro.Data = "You are not authorised.";
            using (var db = new MMCDatingEntities())
            {
                userContactModel.FromUserId = CheckDBNull.ToIntegerType(userContactModel.FromUserId);
                userContactModel.ToUserId = CheckDBNull.ToIntegerType(userContactModel.ToUserId);

                var flg = db.UsersContacts.Where(w => w.FromUserId == userContactModel.FromUserId && w.ToUserId == userContactModel.ToUserId).Any();

                if (flg == false)
                {
                    UsersContact usersContact = new UsersContact();
                    usersContact.FromUserId = userContactModel.FromUserId;
                    usersContact.ToUserId = userContactModel.ToUserId;
                    usersContact.CreatedDate = DateTime.Now;

                    db.UsersContacts.Add(usersContact);
                    db.SaveChanges();

                    var fromUser = db.Users.Where(w => w.Id == userContactModel.FromUserId).FirstOrDefault();
                    var toUser = db.Users.Where(w => w.Id == userContactModel.ToUserId).FirstOrDefault();

                    db.SaveChanges();

                    if (fromUser != null && toUser != null)
                    {
                        try
                        {
                            string EmailFrom = ConfigurationManager.AppSettings["AdminEmail"];
                            string EmailTo = toUser.Email;
                            string EmailSubject = "Contact request from michaelsmeetingpoint.com";
                            StringBuilder EmailBody = new StringBuilder();
                            EmailBody.AppendLine("Hi,");
                            EmailBody.AppendLine("<br>");
                            EmailBody.AppendLine("<br>");
                            EmailBody.AppendLine("You have got contact request from " + fromUser.FirstName + " " + fromUser.LastName + ". Please click on below link to confirm contact request.");
                            EmailBody.AppendLine("<br>");
                            EmailBody.AppendLine("<br>");
                            EmailBody.AppendLine("" + ConfigurationManager.AppSettings["URL"] + "/contactconfirm/" + fromUser.Id + "/" + toUser.Id + "");
                            EmailBody.AppendLine("<br>");
                            EmailBody.AppendLine("<br>");
                            EmailBody.AppendLine("From, michaelsmeetingpoint.com");

                            Utility.SendMail(EmailTo, EmailFrom, "", "", EmailSubject, EmailBody.ToString());
                        }
                        catch (Exception)
                        {

                        }
                    }

                    ro.Status = 1;
                    ro.Data = "Conact request sent successfully.";
                }
                else
                {
                    ro.Status = 0;
                    ro.Data = "Request already sent to user.";
                }
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);

        }

        [HttpPost]
        [Route("contact/confirm")]
        public HttpResponseMessage ConfirmContact(UserContactModel userContactModel)
        {
            ReturnObject ro = new ReturnObject();
            ro.Status = 0;
            ro.Data = "You are not authorised.";
            using (var db = new MMCDatingEntities())
            {
                var userContact = db.UsersContacts.Where(w => w.FromUserId == userContactModel.FromUserId && w.ToUserId == userContactModel.ToUserId).FirstOrDefault();
                var isConfirmed = CheckDBNull.ToSmallIntegerType(userContactModel.IsConfirmed) > 0 ? true : false;

                if (userContact != null)
                {
                    userContact.IsConfirmed = isConfirmed;
                    db.SaveChanges();

                    ro.Status = 1;
                    ro.Data = "Contact request updated successfully.";
                }

            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);

        }

        [HttpPost]
        [Route("contact/all")]
        public HttpResponseMessage GetContact(UserContactModel userContactModel)
        {
            ReturnObject ro = new ReturnObject();
            ro.Status = 0;
            ro.Data = "No contacts available.";
            using (var db = new MMCDatingEntities())
            {
                List<UserContactModel> lstUserContactModel = new List<UserContactModel>();
                var userContactsFrom = db.UsersContacts.Where(w => w.FromUserId == userContactModel.FromUserId && w.IsConfirmed == true).ToList();

                foreach (var item in userContactsFrom)
                {

                    UserContactModel ucm = new UserContactModel();
                    ucm.FromUserId = item.FromUserId.Value;
                    ucm.ToUserId = item.ToUserId.Value;
                    var fromUser = db.Users.Where(w => w.Id == item.FromUserId).FirstOrDefault();
                    if (fromUser != null)
                    {
                        ucm.FromUserName = fromUser.FirstName + " " + fromUser.LastName;
                        ucm.FromUserProfilePicture = fromUser.ProfilePicture;
                    }
                    var toUser = db.Users.Where(w => w.Id == item.ToUserId).FirstOrDefault();
                    {
                        ucm.ToUserName = toUser.FirstName + " " + toUser.LastName;
                        ucm.ToUserProfilePicture = toUser.ProfilePicture;
                    }
                    var userOnline = db.UsersLoginLogs.Where(w => w.UserId == toUser.Id && w.LoggedOutTime == null).Any();
                    ucm.IsOnline = userOnline == true ? "IsOnline" : "IsOffline";

                    lstUserContactModel.Add(ucm);

                }

                var userContactsTo = db.UsersContacts.Where(w => w.ToUserId == userContactModel.FromUserId && w.IsConfirmed == true).ToList();

                foreach (var item in userContactsTo)
                {

                    UserContactModel ucm = new UserContactModel();
                    ucm.ToUserId = item.FromUserId.Value;
                    ucm.FromUserId = item.ToUserId.Value;
                    var fromUser = db.Users.Where(w => w.Id == item.FromUserId).FirstOrDefault();
                    if (fromUser != null)
                    {
                        ucm.ToUserName = fromUser.FirstName + " " + fromUser.LastName;
                        ucm.ToUserProfilePicture = fromUser.ProfilePicture;
                    }
                    var toUser = db.Users.Where(w => w.Id == item.ToUserId).FirstOrDefault();
                    {
                        ucm.FromUserName = toUser.FirstName + " " + toUser.LastName;
                        ucm.FromUserProfilePicture = toUser.ProfilePicture;
                    }
                    var userOnline = db.UsersLoginLogs.Where(w => w.UserId == fromUser.Id && w.LoggedOutTime == null).Any();
                    ucm.IsOnline = userOnline == true ? "IsOnline" : "IsOffline";

                    lstUserContactModel.Add(ucm);
                }

                ro.Status = 1;
                ro.Data = lstUserContactModel.OrderByDescending(o => o.ToUserName);

            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);

        }

        [HttpPost]
        [Route("contact/request")]
        public HttpResponseMessage GetContactRequest(UserContactModel userContactModel)
        {
            ReturnObject ro = new ReturnObject();
            ro.Status = 0;
            ro.Data = "No contact request available.";
            using (var db = new MMCDatingEntities())
            {
                List<UserContactModel> lstUserContactModel = new List<UserContactModel>();
                var userContacts = db.UsersContacts.Where(w => w.ToUserId == userContactModel.ToUserId && w.IsConfirmed == false).OrderByDescending(o => o.CreatedDate).ToList();

                foreach (var item in userContacts)
                {

                    UserContactModel ucm = new UserContactModel();
                    ucm.FromUserId = item.FromUserId.Value;
                    ucm.ToUserId = item.ToUserId.Value;
                    var fromUser = db.Users.Where(w => w.Id == item.FromUserId).FirstOrDefault();
                    if (fromUser != null)
                    {
                        ucm.FromUserName = fromUser.FirstName + " " + fromUser.LastName;
                        ucm.FromUserProfilePicture = fromUser.ProfilePicture;
                        ucm.FromUserAboutMe = fromUser.AboutMe;
                    }
                    var toUser = db.Users.Where(w => w.Id == item.ToUserId).FirstOrDefault();
                    {
                        ucm.ToUserName = toUser.FirstName + " " + toUser.LastName;
                        ucm.ToUserProfilePicture = toUser.ProfilePicture;
                        ucm.ToUserAboutMe = toUser.AboutMe;
                    }

                    lstUserContactModel.Add(ucm);

                    ro.Status = 1;
                    ro.Data = lstUserContactModel;
                }

            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);

        }

        [HttpPost]
        [Route("message/send")]
        public HttpResponseMessage SendMessage(UserMessageModel userMessageModel)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                userMessageModel.FromUserId = CheckDBNull.ToIntegerType(userMessageModel.FromUserId);
                userMessageModel.ToUserId = CheckDBNull.ToIntegerType(userMessageModel.ToUserId);
                userMessageModel.Message = CheckDBNull.ToStringType(userMessageModel.Message);

                UsersMessage usersMessage = new UsersMessage();
                usersMessage.FromUserId = userMessageModel.FromUserId;
                usersMessage.ToUserId = userMessageModel.ToUserId;
                usersMessage.Message = userMessageModel.Message;
                usersMessage.CreatedDate = DateTime.Now;
                usersMessage.IsRead = false;

                db.UsersMessages.Add(usersMessage);
                db.SaveChanges();

                ro.Status = 1;
                ro.Data = "Message sent successfully.";
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

        [HttpPost]
        [Route("message/all")]
        public HttpResponseMessage AllMessage(UserMessageModel userMessage)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                List<UserMessageModel> lstUserMessageModel = new List<UserMessageModel>();
                userMessage.FromUserId = CheckDBNull.ToIntegerType(userMessage.FromUserId);

                var userMessagesSent = db.UsersMessages.Where(w => w.FromUserId == userMessage.FromUserId).OrderByDescending(o => o.CreatedDate);

                foreach (var item in userMessagesSent)
                {
                    UserMessageModel userMessageModel = new UserMessageModel();
                    userMessageModel.FromUserId = item.FromUserId;
                    userMessageModel.ToUserId = item.ToUserId;
                    userMessageModel.IsSent = true;
                    var fromUser = db.Users.Where(w => w.Id == item.FromUserId).FirstOrDefault();
                    if (fromUser != null)
                    {
                        userMessageModel.FromUserName = fromUser.FirstName + " " + fromUser.LastName;
                        userMessageModel.FromUserProfilePicture = fromUser.ProfilePicture;
                    }
                    var toUser = db.Users.Where(w => w.Id == item.ToUserId).FirstOrDefault();
                    {
                        userMessageModel.ToUserName = toUser.FirstName + " " + toUser.LastName;
                        userMessageModel.ToUserProfilePicture = toUser.ProfilePicture;
                    }
                    userMessageModel.Message = item.Message;
                    userMessageModel.Date = item.CreatedDate;

                    lstUserMessageModel.Add(userMessageModel);
                }

                var userMessagesReceived = db.UsersMessages.Where(w => w.ToUserId == userMessage.FromUserId).OrderByDescending(o => o.CreatedDate);

                foreach (var item in userMessagesReceived)
                {
                    UserMessageModel userMessageModel = new UserMessageModel();
                    userMessageModel.FromUserId = item.FromUserId;
                    userMessageModel.ToUserId = item.ToUserId;
                    userMessageModel.IsSent = false;
                    var fromUser = db.Users.Where(w => w.Id == item.FromUserId).FirstOrDefault();
                    if (fromUser != null)
                    {
                        userMessageModel.FromUserName = fromUser.FirstName + " " + fromUser.LastName;
                        userMessageModel.FromUserProfilePicture = fromUser.ProfilePicture;
                    }
                    var toUser = db.Users.Where(w => w.Id == item.ToUserId).FirstOrDefault();
                    {
                        userMessageModel.ToUserName = toUser.FirstName + " " + toUser.LastName;
                        userMessageModel.ToUserProfilePicture = toUser.ProfilePicture;
                    }
                    userMessageModel.Message = item.Message;
                    userMessageModel.Date = item.CreatedDate;

                    lstUserMessageModel.Add(userMessageModel);
                }

                ro.Status = 1;
                ro.Data = lstUserMessageModel;
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

        [HttpPost]
        [Route("message/receivedmessages")]
        public HttpResponseMessage ReceivedMessages(UserMessageModel userMessage)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                List<UserMessageModel> lstUserMessageModel = new List<UserMessageModel>();
                userMessage.FromUserId = CheckDBNull.ToIntegerType(userMessage.FromUserId);

                db.UsersMessages.Where(w => w.ToUserId == userMessage.FromUserId && w.IsRead == false).ToList().ForEach(f => f.IsRead = true);
                db.SaveChanges();

                var userMessagesReceived = db.UsersMessages.Where(w => w.ToUserId == userMessage.FromUserId).OrderByDescending(o => o.CreatedDate);

                foreach (var item in userMessagesReceived)
                {
                    UserMessageModel userMessageModel = new UserMessageModel();
                    userMessageModel.FromUserId = item.FromUserId;
                    userMessageModel.ToUserId = item.ToUserId;
                    userMessageModel.IsSent = false;
                    var fromUser = db.Users.Where(w => w.Id == item.FromUserId).FirstOrDefault();
                    if (fromUser != null)
                    {
                        userMessageModel.FromUserName = fromUser.FirstName + " " + fromUser.LastName;
                        userMessageModel.FromUserProfilePicture = fromUser.ProfilePicture;
                    }
                    var toUser = db.Users.Where(w => w.Id == item.ToUserId).FirstOrDefault();
                    {
                        userMessageModel.ToUserName = toUser.FirstName + " " + toUser.LastName;
                        userMessageModel.ToUserProfilePicture = toUser.ProfilePicture;
                    }
                    userMessageModel.Message = item.Message;
                    userMessageModel.Date = item.CreatedDate;

                    lstUserMessageModel.Add(userMessageModel);
                }

                ro.Status = 1;
                ro.Data = lstUserMessageModel;
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

        [HttpPost]
        [Route("message/sentmessages")]
        public HttpResponseMessage SentMessages(UserMessageModel userMessage)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                List<UserMessageModel> lstUserMessageModel = new List<UserMessageModel>();
                userMessage.FromUserId = CheckDBNull.ToIntegerType(userMessage.FromUserId);

                var userMessagesSent = db.UsersMessages.Where(w => w.FromUserId == userMessage.FromUserId).OrderByDescending(o => o.CreatedDate);

                foreach (var item in userMessagesSent)
                {
                    UserMessageModel userMessageModel = new UserMessageModel();
                    userMessageModel.FromUserId = item.FromUserId;
                    userMessageModel.ToUserId = item.ToUserId;
                    userMessageModel.IsSent = true;
                    var fromUser = db.Users.Where(w => w.Id == item.FromUserId).FirstOrDefault();
                    if (fromUser != null)
                    {
                        userMessageModel.FromUserName = fromUser.FirstName + " " + fromUser.LastName;
                        userMessageModel.FromUserProfilePicture = fromUser.ProfilePicture;
                    }
                    var toUser = db.Users.Where(w => w.Id == item.ToUserId).FirstOrDefault();
                    {
                        userMessageModel.ToUserName = toUser.FirstName + " " + toUser.LastName;
                        userMessageModel.ToUserProfilePicture = toUser.ProfilePicture;
                    }
                    userMessageModel.Message = item.Message;
                    userMessageModel.Date = item.CreatedDate;

                    lstUserMessageModel.Add(userMessageModel);
                }

                ro.Status = 1;
                ro.Data = lstUserMessageModel;
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

        [HttpPost]
        [Route("chat/send")]
        public HttpResponseMessage SendChatMessage(UserChatModel userChatModel)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                userChatModel.FromUserId = CheckDBNull.ToIntegerType(userChatModel.FromUserId);
                userChatModel.ToUserId = CheckDBNull.ToIntegerType(userChatModel.ToUserId);
                userChatModel.Message = CheckDBNull.ToStringType(userChatModel.Message);

                UsersChat usersChat = new UsersChat();
                usersChat.FromUserId = userChatModel.FromUserId;
                usersChat.ToUserId = userChatModel.ToUserId;
                usersChat.Message = userChatModel.Message;
                usersChat.IsRead = false;
                usersChat.CreatedDate = DateTime.Now;

                db.UsersChats.Add(usersChat);
                db.SaveChanges();

                ro.Status = 1;
                ro.Data = "Message sent successfully.";
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

        [HttpPost]
        [Route("chat/all")]
        public HttpResponseMessage AllChatMessage(UserChatModel userChat)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                List<UserChatModel> lstUserChatModel = new List<UserChatModel>();
                userChat.FromUserId = CheckDBNull.ToIntegerType(userChat.FromUserId);
                userChat.ToUserId = CheckDBNull.ToIntegerType(userChat.ToUserId);

                db.UsersChats.Where(w => w.FromUserId == userChat.ToUserId && w.ToUserId == userChat.FromUserId && w.IsRead == false).ToList().ForEach(f => f.IsRead = true);
                db.SaveChanges();

                var userChatSent = db.UsersChats.Where(w => w.FromUserId == userChat.FromUserId && w.ToUserId == userChat.ToUserId).OrderByDescending(o => o.CreatedDate);

                var userOnline = db.UsersLoginLogs.Where(w => w.UserId == userChat.ToUserId && w.LoggedOutTime == null).Any();
                var isOnline = userOnline == true ? "IsOnline" : "IsOffline";

                foreach (var item in userChatSent)
                {
                    UserChatModel userChatModel = new UserChatModel();
                    userChatModel.FromUserId = item.FromUserId;
                    userChatModel.ToUserId = item.ToUserId;
                    var fromUser = db.Users.Where(w => w.Id == item.FromUserId).FirstOrDefault();
                    if (fromUser != null)
                    {
                        userChatModel.FromUserName = fromUser.FirstName + " " + fromUser.LastName;
                        userChatModel.FromUserProfilePicture = fromUser.ProfilePicture;
                    }
                    var toUser = db.Users.Where(w => w.Id == item.ToUserId).FirstOrDefault();
                    {
                        userChatModel.ToUserName = toUser.FirstName + " " + toUser.LastName;
                        userChatModel.ToUserProfilePicture = toUser.ProfilePicture;
                    }
                    userChatModel.Message = item.Message;
                    userChatModel.Date = item.CreatedDate;
                    userChatModel.MessageCSS = "frommessage";
                    userChatModel.IsOnline = isOnline;

                    lstUserChatModel.Add(userChatModel);
                }

                var userChatReceived = db.UsersChats.Where(w => w.ToUserId == userChat.FromUserId && w.FromUserId == userChat.ToUserId).OrderByDescending(o => o.CreatedDate);

                foreach (var item in userChatReceived)
                {
                    UserChatModel userChatModel = new UserChatModel();
                    userChatModel.FromUserId = item.FromUserId;
                    userChatModel.ToUserId = item.ToUserId;
                    var fromUser = db.Users.Where(w => w.Id == item.FromUserId).FirstOrDefault();
                    if (fromUser != null)
                    {
                        userChatModel.FromUserName = fromUser.FirstName + " " + fromUser.LastName;
                        userChatModel.FromUserProfilePicture = fromUser.ProfilePicture;
                    }
                    var toUser = db.Users.Where(w => w.Id == item.ToUserId).FirstOrDefault();
                    {
                        userChatModel.ToUserName = toUser.FirstName + " " + toUser.LastName;
                        userChatModel.ToUserProfilePicture = toUser.ProfilePicture;
                    }
                    userChatModel.Message = item.Message;
                    userChatModel.Date = item.CreatedDate;
                    userChatModel.MessageCSS = "tomessage";
                    userChatModel.IsOnline = isOnline;

                    lstUserChatModel.Add(userChatModel);
                }

                if (lstUserChatModel.Count > 0)
                {
                    ro.Status = 1;
                    ro.Data = lstUserChatModel.OrderBy(o => o.Date);
                }
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

        [HttpPost]
        [Route("chat/notification")]
        public HttpResponseMessage ChatNotification(UserChatModel userChat)
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                List<NotificationModel> lstNotificationModel = new List<NotificationModel>();
                userChat.FromUserId = CheckDBNull.ToIntegerType(userChat.FromUserId);

                var userChatSent = db.UsersChats.Where(w => w.ToUserId == userChat.FromUserId && w.IsRead == false).OrderByDescending(o => o.CreatedDate).FirstOrDefault();

                if (userChatSent != null)
                {
                    NotificationModel notificationModel = new NotificationModel();
                    notificationModel.IsNotification = true;
                    notificationModel.NoOfNotification = 1;
                    notificationModel.NotificationType = "Chat";

                    var userOnline = db.UsersLoginLogs.Where(w => w.UserId == userChatSent.FromUserId && w.LoggedOutTime == null).Any();
                    var isOnline = userOnline == true ? "IsOnline" : "IsOffline";

                    UserChatModel userChatModel = new UserChatModel();
                    userChatModel.FromUserId = userChatSent.FromUserId;
                    userChatModel.ToUserId = userChatSent.ToUserId;
                    var fromUser = db.Users.Where(w => w.Id == userChatSent.FromUserId).FirstOrDefault();
                    if (fromUser != null)
                    {
                        userChatModel.FromUserName = fromUser.FirstName + " " + fromUser.LastName;
                        userChatModel.FromUserProfilePicture = fromUser.ProfilePicture;
                    }
                    var toUser = db.Users.Where(w => w.Id == userChatSent.ToUserId).FirstOrDefault();
                    {
                        userChatModel.ToUserName = toUser.FirstName + " " + toUser.LastName;
                        userChatModel.ToUserProfilePicture = toUser.ProfilePicture;
                    }
                    userChatModel.Message = userChatSent.Message;
                    userChatModel.Date = userChatSent.CreatedDate;
                    userChatModel.MessageCSS = "frommessage";
                    userChatModel.IsOnline = isOnline;

                    notificationModel.NotificationObject = userChatModel;

                    lstNotificationModel.Add(notificationModel);
                }
                else
                {
                    NotificationModel notificationModel = new NotificationModel();
                    notificationModel.IsNotification = false;
                    notificationModel.NoOfNotification = 0;
                    notificationModel.NotificationType = "Chat";

                    lstNotificationModel.Add(notificationModel);
                }
                int intMessageCount = 0;
                var userMessage = db.UsersMessages.Where(w => w.ToUserId == userChat.FromUserId && w.IsRead == false).OrderByDescending(o => o.CreatedDate).ToList();
                if (userMessage != null)
                {
                    intMessageCount = intMessageCount + userMessage.Count;
                }
                var userContact = db.UsersContacts.Where(w => w.ToUserId == userChat.FromUserId && w.IsConfirmed == false).OrderByDescending(o => o.CreatedDate).ToList();
                if (userContact != null)
                {
                    intMessageCount = intMessageCount + userContact.Count;
                }

                if (intMessageCount > 0)
                {
                    NotificationModel notificationModel = new NotificationModel();
                    notificationModel.IsNotification = true;
                    notificationModel.NoOfNotification = intMessageCount;
                    notificationModel.NotificationType = "Message";

                    lstNotificationModel.Add(notificationModel);
                }
                else
                {
                    NotificationModel notificationModel = new NotificationModel();
                    notificationModel.IsNotification = false;
                    notificationModel.NoOfNotification = 0;
                    notificationModel.NotificationType = "Message";

                    lstNotificationModel.Add(notificationModel);
                }

                if (lstNotificationModel.Count > 0)
                {
                    ro.Status = 1;
                    ro.Data = lstNotificationModel;
                }

                
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }
    }
}
