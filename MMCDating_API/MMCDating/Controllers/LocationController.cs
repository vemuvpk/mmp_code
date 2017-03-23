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
    [RoutePrefix("api/location")]
    public class LocationController : ApiController
    {

        [HttpGet]
        public HttpResponseMessage Index()
        {
            ReturnObject ro = new ReturnObject();
            using (var db = new MMCDatingEntities())
            {
                var locations = db.Locations.Where(w => w.IsActive == true).Select(s => new LocationModel() { Id = s.Id, Name = s.Name }).ToList();
                ro.Status = 1;
                ro.Data = locations;
            }
            return Request.CreateResponse(HttpStatusCode.OK, ro);
        }

    }
}
