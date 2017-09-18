<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" 
    Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Working With Business Objects</span>
<p>

<div class="indent" style="font-family:Verdana;">
    <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;
    <a class="toc2" href="#bindir">The Application /Bin Directory</a><br>
    <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;
    <a class="toc2" href="#importing">Importing Business Objects</a><br>
    <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;
    <a class="toc2" href="#twotier">A Simple Two-Tier Web Forms Page</a><br>
    <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;
    <a class="toc2" href="#threetier">A Simple Three-Tier Web Forms Page</a><br>
    <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;
    <a class="toc2" href="#summary">Section Summary</a><br>
</div>
<p>
<hr>

Encapsulating logic in business components is an essential part 
of any real-world application, Web-based or otherwise.  In ASP.NET, business
objects are the building blocks for multi-tiered Web applications, such 
as those with a layer for data access or common application rules.
This section demonstrates how to write some simple components and include 
them in your application's Web Forms pages.
</p>

<p>
<!--BEGIN SECTION-->
<a name="bindir">
<span class="subhead">The Application /Bin Directory</span>
</p>

<p>
A problem with using the COM model for Web application components 
is that those components must be registered (typically
using the regsvr32 tool) before they can be used from a traditional 
ASP application.  Remote administration of these types of
applications is often not possible, because the registration tool 
must be run locally on the server.  To make matters more difficult,
these components remain locked on disk once they are loaded by an 
application, and the entire Web server must be stopped before
these components can be replaced or removed.
</p>

<p>
ASP.NET attempts to solve these problems by allowing components 
to be placed in a well-known directory, to be automatically found
at run time.  This well-known directory is always named <b>/bin</b>, 
and is located immediately under the root directory for the
application (a virtual directory defined by Internet Information 
Services (IIS)).  The benefit is that no registration is required to 
make components available to the
ASP.NET Framework application -- components can be deployed by simply 
copying to the /bin directory or performing an FTP file transfer.
</p>

<p>
In addition to providing a zero-registration way to deploy 
compiled components, ASP.NET does not require these components to remain
locked on disk at run time.  Behind the scenes, ASP.NET duplicates 
the assemblies found in /bin and loads these "shadow" copies instead.
The original components can be replaced even while the Web server 
is still running, and changes to the /bin directory are automatically
picked up by the runtime.  When a change is detected, ASP.NET 
allows currently executing requests to complete, and directs
all new incoming requests to the application that uses the new 
component or components.
</p>

<!--BEGIN SECTION-->
<br>
<a name="importing">
<br>
<span class="subhead">Importing Business Objects</span>

<p>
At its most basic level, a business component is just a class 
for which you can create an instance from a Web Forms page 
that imports it.  The following
example defines a simple HelloWorld class.  The class has one 
public constructor (which is executed when an instance of the class is first
created), a single <b>String</b> property called FirstName, 
and a SayHello method that prints a greeting using the value of the
FirstName property.
</p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
using System;
using System.Text;

namespace HelloWorld {
  public class HelloObj {
    private String _name;

    public HelloObj() {
        _name = null;

    }

    public String FirstName {
      get {
        return _name;
      }
      set {
        _name = value;
      }
    }

    public String SayHello() {
      StringBuilder sb = new StringBuilder("Hello ");
      if (_name != null)
         sb.Append(_name);
      else
         sb.Append("World");

      sb.Append("!");
      return sb.ToString();
    }
  }
}
</Tab>

<Tab Name="VB">
Imports System
Imports System.Text

Namespace HelloWorld
  Public Class HelloObj
    Private _name As String

    Public Sub New
      MyBase.New()
      _name = Nothing
    End Sub

    Public Property FirstName As String
      Get
        Return(_name)
      End get
      Set
        _name = value
       End Set
    End Property

    Public Function SayHello() As String
      Dim sb As New StringBuilder("Hello ")
      If (_name <> Nothing) Then
         sb.Append(_name)
      Else
         sb.Append("World")
      End If
      sb.Append("!")
      Return(sb.ToString())
    End Function
  End Class
End Namespace
</Tab>

<Tab Name="JScript">
import System;
import System.Text;

package HelloWorld {
  public class HelloObj {
    private var _name:String;

    public function HelloObj() {
        _name = null;

    }

    public function get FirstName() : String
    {
        return _name;
    }
    public function set FirstName(value:String) : void
    {
        _name = value;
    }

    public function SayHello() : String {
      sb:StringBuilder = new StringBuilder("Hello ");
      if (_name != null)
         sb.Append(_name);
      else
         sb.Append("World");

      sb.Append("!");
      return sb.ToString();
    }
  }
}
</Tab>

</Acme:TabControl>

<p>
To compile this class, the C# compiler (Csc.exe) is run from 
the command line.  The <b>/t</b> option tells the compiler to
build a library (DLL), and the <b>/out</b> option tells the 
compiler where to place the resulting assembly.  In this case, the /bin
directory for the application is directly under the 
"aspplus" vroot of this tutorial, and it is assumed this command is being run from
the sample directory, that is, ...\QuickStart\AspPlus\Samples\WebForms\Busobjs.
<p>

<div class="code"><pre>
csc /t:library /out:..\..\..\..\bin\HelloObj.dll HelloObj.cs
</pre></div>

<p>For Visual Basic, the equivalent compilation command is:<p>
<div class="code"><pre>
vbc /t:library /out:..\..\..\..\bin\HelloObjVB.dll HelloObj.vb
</pre></div>

<p>For JScript, the equivalent compilation command is:<p>
<div class="code"><pre>
jsc /out:..\..\..\..\bin\HelloObjJS.dll HelloObj.js
</pre></div>

<p>
The component is now available to any Web Forms page in the 
application that needs to use it.  The following HelloObj.aspx 
example illustrates
this functionality.
</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/busobjs/CS/HelloObj.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/busobjs/HelloObj.src"
  Icon="/quickstart/aspplus/images/helloobj.gif"
  Caption="C# HelloObj.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/busobjs/VB/HelloObj.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/busobjs/HelloObj.src"
  Icon="/quickstart/aspplus/images/helloobj.gif"
  Caption="VB HelloObj.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/busobjs/JS/HelloObj.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/busobjs/HelloObj.src"
  Icon="/quickstart/aspplus/images/helloobj.gif"
  Caption="JScript HelloObj.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<p>
Note the <b>Import</b> directive at the top of the page that 
specifies the namespace to include.  Once the namespace is 
included using this directive, 
the class can be used from within the Web Forms page.  Because 
the assembly is pre-loaded by the ASP.NET runtime, only
a simple namespace import is required to make the component 
available. The following code example the <b>Import</b> directive.
</p>

<div class="code"><pre>
&lt;%@ Import Namespace="HelloWorld" %&gt;
</pre></div>

<p>
By default, ASP.NET loads all assemblies from the /bin 
directory when the application is started.  The assemblies 
to load are specifed through
the configuration system. For details, see the 
<a href="configoverview.aspx">Configuration Overview</a> section. Additional
assemblies can be imported into an application using 
configuration as well.  For example:
</p>

<div class="code"><pre>
&lt;configuration&gt;
    &lt;system.web&gt;
        &lt;compilation&gt;
            &lt;assemblies&gt;
                &lt;!--The following assemblies are loaded explicitly 
                       from the global cache--&gt;
                &lt;add assembly="System.Data, Version=1.0.5000.0, 
                    Culture=neutral, PublicKeyToken=b77a5c561934e089"/&gt;
                &lt;add assembly="System.Web.Services, Version=1.0.5000.0, 
                    Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"/&gt;
                &lt;add assembly="System.Drawing, Version=1.0.5000.0, 
                    Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"/&gt;
                &lt;!--This tells ASP.NET to load all assemblies from /bin--&gt;
                &lt;add assembly="*"/&gt;
            &lt;/assemblies&gt;
        &lt;/compilation&gt;
    &lt;/system.web&gt;
&lt;/configuration&gt;
</pre></div>

<p>
<b>Note: </b> Each assembly loaded from /bin is limited in scope 
to the application in which it is running. This means that peer applications could
potentially use different assemblies with the same class or 
namespace names, without conflicting.
</p>

<!--BEGIN SECTION-->
<br>
<a name="twotier">
<br>
<span class="subhead">A Simple Two-Tier Web Forms Page</span>

<p>
The classic use for an external component is to perform data access.  
This simplifies the code in your page, improving readability and
separating your user interface (UI) logic from the system functionality.  
The following example demonstrates a simple
two-tiered Web Forms page that uses a data access component to 
retrieve product information.
</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/busobjs/CS/TwoTier.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/busobjs/TwoTier.src"
  Icon="/quickstart/aspplus/images/twotier.gif"
  Caption="C# TwoTier.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/busobjs/VB/TwoTier.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/busobjs/TwoTier.src"
  Icon="/quickstart/aspplus/images/twotier.gif"
  Caption="VB TwoTier.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/busobjs/JS/TwoTier.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/busobjs/TwoTier.src"
  Icon="/quickstart/aspplus/images/twotier.gif"
  Caption="JScript TwoTier.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
The data access component takes a single parameter to its 
constructor specifying the connection string to the product database.
The Web Forms page calls the component's <b>GetCategories</b> 
method to populate a drop-down list, and calls the component's 
<b>GetProductsForCategory</b> method to display the products for 
the category selected by the user.
</p>

<!--BEGIN SECTION-->
<br>
<a name="threetier">
<br>
<span class="subhead">A Simple Three-Tier Web Forms Page</span>
<p>
A three-tiered application model extends the two-tiered scenario to 
include business rules between the UI and data access logic.  This
model allows UI developers to work with a higher level of 
abstraction rather than directly manipulating data through low-level data
access component APIs.  The middle business component typically 
enforces business rules and ensures that the relationships and
primary key constraints of the database are honored.  The following 
example uses the middle component to calculate a discount based on
a two-digit Vendor ID entered by the client.
</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/busobjs/CS/ThreeTier.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/busobjs/ThreeTier.src"
  Icon="/quickstart/aspplus/images/threetier.gif"
  Caption="C# ThreeTier.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/busobjs/VB/ThreeTier.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/busobjs/ThreeTier.src"
  Icon="/quickstart/aspplus/images/threetier.gif"
  Caption="VB ThreeTier.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/busobjs/JS/ThreeTier.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/busobjs/ThreeTier.src"
  Icon="/quickstart/aspplus/images/threetier.gif"
  Caption="JScript ThreeTier.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<a name="endofsection">

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>The ASP.NET runtime finds business objects (local assemblies) 
in a well-known /bin directory, directly under the application root. 
The /bin directory offers the following advantages:
<ul>
<li><b>No registration required.</b> No registration is required to 
make an assembly available to pages in the application. It is 
available by virtue of its location in the /bin directory. 
Compiled code can be deployed by simply copying or FTPing to this location.</li>
<li><b>No server restart required.</b> When any part of an ASP.NET 
Framework application is changed (for example, when a DLL 
in /bin is replaced), new requests immediately begin execution against 
the changed file or files. Currently executing requests are allowed 
to complete before the old application is gracefully torn down. The 
Web server does not require a restart when you change your application, 
even when replacing compiled code.</li>
<li><b>No namespace conflicts.</b> Each assembly loaded from /bin is 
limited in scope to the application in which it is running. This means 
that peer applications could potentially use different assemblies with 
the same class or namespace names, without conflicting.</li>
</ul></li>
<li>Classes in an assembly are made available to a page in the 
application using an <b>Import</b> directive within the .aspx file.</li>
<li>Two-tiered applications simplify the code in a page, 
improving readability and separating user interface (UI) logic
from system functionality.</li>
<li>Three-tiered applications extend the two-tiered model to 
enable UI developers to work with a higher level of abstraction. The middle
business component typically enforces business rules and ensures 
that the relationships and primary key constraints of the database are
honored.</li>
</ul>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->