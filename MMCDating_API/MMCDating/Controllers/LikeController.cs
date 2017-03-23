using MMCDating.Entity;
using MMCDating.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace MMCDating.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/like")]
    public class LikeController : ApiController
    {

        [HttpGet]
        public HttpResponseMessage Index()
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                var likes = db.Likes.Where(w => w.IsActive == true).Select(s => new LikeModel() { Id = s.Id, Name = s.Name }).ToList();
                ro.Status = 1;
                ro.Data = likes;
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

    }
}
