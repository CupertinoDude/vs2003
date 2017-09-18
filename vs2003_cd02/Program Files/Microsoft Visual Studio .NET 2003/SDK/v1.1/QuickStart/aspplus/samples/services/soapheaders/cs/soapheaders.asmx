<%@ WebService Language="C#" Class="SoapHeadersCS.HeaderService" %>

using System;
using System.Web.Services;
using System.Web.Services.Protocols;

// Note the namespace has to be different from the one used
// on the proxy dll or we get errors about AuthHeader being
// defined in multiple places.
namespace SoapHeadersCS {

     // AuthHeader class extends from SoapHeader
    public class AuthHeaderCS : SoapHeader {
        public string Username;
        public string Password;
    }

    [WebService(Description="Simple sample to demonstrate use of SOAP Headers")]
    public class HeaderService {

        public AuthHeaderCS sHeader;

        [WebMethod(Description="This method requires a custom soap header set by the caller")]
        [SoapHeader("sHeader")]
        public string SecureMethod() {

            if (sHeader == null)
              return "ERROR: Please supply credentials";

            string usr = sHeader.Username;
            string pwd = sHeader.Password;

            if (AuthenticateUser(usr, pwd)) {
                 return "SUCCESS: " + usr + "," + pwd;
            }
            else {
                 return "ERROR: Could not authenticate";
            }
        }

        private bool AuthenticateUser(string usr, string pwd) {

            if ((usr != null)&&(pwd != null)) {
                // could query a database here for credentials...
                return true;
             }
            return false;
        }
    }
}
