<%@ WebService Language="JScript" Class="SoapHeadersJS.HeaderService" %>

import System;
import System.Xml.Serialization;
import System.Web.Services;
import System.Web.Services.Protocols;

package SoapHeadersJS {

     // AuthHeader class extends from SoapHeader
    XmlRootAttribute("sHeader")
    public class AuthHeader extends SoapHeader {
        public var Username:String;
        public var Password:String;
    }

    WebServiceAttribute(Description="Simple sample to demonstrate use of SOAP Headers")
    public class HeaderService {

        public var sHeader:AuthHeader;

        WebMethodAttribute(Description="This method requires a custom soap header set by the caller")
        SoapHeaderAttribute("sHeader")
        public function SecureMethod() : String {

            if (sHeader == null)
              return "ERROR: Please supply credentials";

            var usr:String = sHeader.Username;
            var pwd:String = sHeader.Password;

            if (AuthenticateUser(usr, pwd)) {
                 return "SUCCESS: " + usr + "," + pwd;
            }
            else {
                 return "ERROR: Could not authenticate";
            }
        }

        private function AuthenticateUser(usr:String, pwd:String) : Boolean {

            if ((usr != null)&&(pwd != null)) {
                // could query a database here for credentials...
                return true;
             }
            return false;
        }
    }
}
