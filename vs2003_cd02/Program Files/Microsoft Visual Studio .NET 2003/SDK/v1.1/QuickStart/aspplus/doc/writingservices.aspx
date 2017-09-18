<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Write a Simple XML Web service</span>

<p>
You can write a simple XML Web service in a few minutes using any text editor. The service demonstrated in this section, MathService, exposes methods for adding, subtracting, dividing, and multiplying two numbers.
At the top of the page, the following directive identifies the file as a XML Web service in addition to specifying the language for the service (C#, in this case).
</p>
<div class="code"><pre>
&lt;%@ WebService Language="C#" Class="MathService" %&gt;
</pre></div>

<p>
In this same file, you define a class that encapsulates the functionality of your service. This class should be public, and can optionally inherit from the <b>XML Web service</b> base
class. Each method that will be exposed from the service is flagged with a <b>[WebMethod]</b> attribute in front of it. Without this
attribute, the method will not be exposed from the service.  This is sometimes useful for hiding implementation details called by public
<b>XML Web service</b> methods, or in the case where the <b>XML Web service</b> class is also used in local applications (a local application can use any
public class, but only <b>WebMethod</b> classes are remotely accessible as XML Web services).
<p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
using System;
using System.Web.Services;

public class MathService : WebService {

   [WebMethod] public int Add(int a, int b) {
       return a + b;
   }

}
</Tab>

<Tab Name="VB">
Imports System
Imports System.Web.Services

Public Class MathService : Inherits WebService

   &lt;WebMethod()&gt; Public Function Add(a As Integer, b As Integer) As Integer
       Return(a + b)
   End Function

End Class
</Tab>

<Tab Name="JScript">
import System;
import System.Web.Services;

public class MathService extends WebService {

   WebMethodAttribute public function Add(a:int, b:int) : int {
       return a + b;
   }

}
</Tab>

</Acme:TabControl><p>

<p>
XML Web service files are saved under the .asmx file extension.  Like .aspx files, these are automatically compiled by the ASP.NET
runtime when a request to the service is made (subsequent requests are serviced by a cached precompiled type object).
In the case of MathService, you have defined the <b>WebService</b> class in the .asmx file itself.  Note that if an .asmx file is
requested by a browser, the ASP.NET runtime returns a XML Web service Help page that describes the XML Web service.
<p>

<table>
<tr>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/MathService/CS/MathService.asmx"
  ViewSource="/quickstart/aspplus/samples/services/MathService/MathService.src"
  Icon="/quickstart/aspplus/images/mathservice_asmx.gif"
  Caption="C# MathService.asmx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/MathService/VB/MathService.asmx"
  ViewSource="/quickstart/aspplus/samples/services/MathService/MathService.src"
  Icon="/quickstart/aspplus/images/mathservice_asmx.gif"
  Caption="VB MathService.asmx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/MathService/JS/MathService.asmx"
  ViewSource="/quickstart/aspplus/samples/services/MathService/MathService.src"
  Icon="/quickstart/aspplus/images/mathservice_asmx.gif"
  Caption="JScript MathService.asmx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
<td>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/MathService/CS/MathService.asmx?WSDL"
  Icon="/quickstart/aspplus/images/service_sdl.gif"
  Caption="C# MathService.asmx?wsdl"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/MathService/VB/MathService.asmx?WSDL"
  Icon="/quickstart/aspplus/images/service_sdl.gif"
  Caption="VB MathService.asmx?wsdl"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/MathService/JS/MathService.asmx?WSDL"
  Icon="/quickstart/aspplus/images/service_sdl.gif"
  Caption="JScript MathService.asmx?wsdl"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
</td>
</tr>
</table>

<h5>Precompiled XML Web services</h5>

If you have a precompiled class that you want to expose as a XML Web service (and this class exposes methods marked with the
<b>[WebMethod]</b> attribute), you can create an .asmx file with only the following line.

<div class="code"><pre>
&lt;%@ WebService Class="MyWebApplication.MyWebService" %&gt;
</pre></div>

<p>
<code>MyWebApplication.MyWebService</code> defines the <b>XML Web service</b> class, and is contained in the \bin subdirectory of the ASP.NET application.


<p>
<h5>Consuming a XML Web service from a Client Application</h5>

To consume this service, you need to use the Web Services Description Language command-line tool (WSDL.exe) included in the SDK to create a proxy class that is similar to the class defined in the .asmx file. (It will contain only the <b>WebMethod</b> methods.) Then, you compile your code with this proxy class included.
<p>

WSDL.exe accepts a variety of command-line options, however to create a proxy only one
option is required: the URI to the WSDL.   In this example, we are passing a few extra options that specify
the preferred language, namespace, and output location for the proxy. We are also compiling against a previously
saved WSDL file instead of the URI to the service itself:

<div class="code"><pre>
wsdl.exe /l:CS /n:MathService /out:MathService.cs MathService.wsdl
</pre></div>

<p>
Once the proxy class exists, you can create objects based on it. Each method call made with the object then goes out to the URI of the XML Web service (usually as a SOAP request).

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/MathService/CS/MathServiceClient.aspx"
  ViewSource="/quickstart/aspplus/samples/services/MathService/MathServiceClient.src"
  Icon="/quickstart/aspplus/images/mathservice_client.gif"
  Caption="C# MathServiceClient.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/MathService/VB/MathServiceClient.aspx"
  ViewSource="/quickstart/aspplus/samples/services/MathService/MathServiceClient.src"
  Icon="/quickstart/aspplus/images/mathservice_client.gif"
  Caption="VB MathServiceClient.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/MathService/JS/MathServiceClient.aspx"
  ViewSource="/quickstart/aspplus/samples/services/MathService/MathServiceClient.src"
  Icon="/quickstart/aspplus/images/mathservice_client.gif"
  Caption="JScript MathServiceClient.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->