<%@ WebService Language="C#" Class="SessionService1" %>

using System;
using System.Web.Services;

public class SessionService1 : WebService {

   [ WebMethod(EnableSession=true) ]
   public String UpdateHitCounter() {

        if (Session["HitCounter"] == null) {
            Session["HitCounter"] = 1;
        }
        else {
            Session["HitCounter"] = ((int) Session["HitCounter"]) + 1;
        }

        return "You have accessed this service " + Session["HitCounter"].ToString() + " times.";
   }

   [ WebMethod(EnableSession=false)]
   public String UpdateAppCounter() {

        if (Application["HitCounter"] == null) {
            Application["HitCounter"] = 1;
        }
        else {
            Application["HitCounter"] = ((int) Application["HitCounter"]) + 1;
        }

        return "This service has been accessed " + Application["HitCounter"].ToString() + " times.";
   }
}