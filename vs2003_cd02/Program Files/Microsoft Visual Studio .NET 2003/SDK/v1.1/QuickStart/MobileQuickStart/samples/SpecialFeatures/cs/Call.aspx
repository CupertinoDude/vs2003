<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<mobile:Form runat=server>

  <mobile:PhoneCall runat=server
       PhoneNumber="(425) 882-8080"
       AlternateFormat="{0} at {1}"
       AlternateUrl="http://www.microsoft.com"
       Text="Call Microsoft" />

</mobile:Form>

