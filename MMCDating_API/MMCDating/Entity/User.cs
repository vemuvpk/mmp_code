//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MMCDating.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public User()
        {
            this.UsersLikes = new HashSet<UsersLike>();
        }
    
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Nullable<short> Gender { get; set; }
        public Nullable<int> Age { get; set; }
        public Nullable<short> LookingforGender { get; set; }
        public string ProfilePicture { get; set; }
        public string ProfileVideo { get; set; }
        public string ThingsNotLike { get; set; }
        public string AboutMe { get; set; }
        public Nullable<bool> IsConfirmed { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public string LocationName { get; set; }
    
        public virtual ICollection<UsersLike> UsersLikes { get; set; }
    }
}
