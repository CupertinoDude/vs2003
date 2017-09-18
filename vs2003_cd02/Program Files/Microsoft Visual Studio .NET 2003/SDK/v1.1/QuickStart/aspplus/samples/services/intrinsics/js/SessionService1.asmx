<%@ WebService Language="JScript" Class="SessionService1" %>

import System;
import System.Web.Services;

public class SessionService1 extends WebService {

   WebMethodAttribute(true)
   public function UpdateHitCounter() : String {

        if (Session["HitCounter"] == null) {
            Session["HitCounter"] = 1;
        }
        else {
            Session["HitCounter"] = int(Session["HitCounter"]) + 1;
        }

        return "You have accessed this service " + Session["HitCounter"] + " times.";
   }

   WebMethodAttribute(false)
   public function UpdateAppCounter() : String {

        if (Application["HitCounter"] == null) {
            Application["HitCounter"] = 1;
        }
        else {
            Application["HitCounter"] = int(Application["HitCounter"]) + 1;
        }

        return "This service has been accessed " + Application["HitCounter"] + " times.";
   }
}