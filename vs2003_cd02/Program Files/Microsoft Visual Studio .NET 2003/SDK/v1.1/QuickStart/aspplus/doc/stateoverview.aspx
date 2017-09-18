<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Managing Application State</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#applicationstate">Using Application State</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#sessionstate">Using Session State</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#cookies">Using Client-Side Cookies</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#viewstate">Using ViewState</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="applicationstate">
<span class="subhead">Using Application State</span>
<p>
This sample illustrates the use of application state to read a dataset in
<b>Application_Start</b>.
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/application2/CS/application2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/application2/application2.src"
  Icon="/quickstart/aspplus/images/application2.gif"
  Caption="C# Application2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/application2/VB/application2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/application2/application2.src"
  Icon="/quickstart/aspplus/images/application2.gif"
  Caption="VB Application2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/application2/JS/application2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/application2/application2.src"
  Icon="/quickstart/aspplus/images/application2.gif"
  Caption="JScript Application2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
<p>

Because an application and all the objects it stores can be concurrently accessed
by different threads, it is better to store only infrequently modified data with
application scope. Ideally an object is initialized in the <b>Application_Start</b> event
and further access is read-only.
<p>

In the following sample a file is read in <b>Application_Start</b> (defined in the Global.asax file)
and the content is stored in a <b>DataView</b> object in the application state.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
void Application_Start() {
    DataSet ds = new DataSet();

    FileStream fs = new FileStream(Server.MapPath("schemadata.xml"),FileMode.Open,FileAccess.Read);
    StreamReader reader = new StreamReader(fs);
    ds.ReadXml(reader);
    fs.Close();

    DataView view = new DataView(ds.Tables[0]);
    Application["Source"] = view;
}
</Tab>

<Tab Name="VB">
Sub Application_Start()
    Dim ds As New DataSet()

    Dim fs As New FileStream(Server.MapPath("schemadata.xml"),FileMode.Open,FileAccess.Read)
    Dim reader As New StreamReader(fs)
    ds.ReadXml(reader)
    fs.Close()

    Dim view As New DataView (ds.Tables(0))
    Application("Source") = view
End Sub
</Tab>

<Tab Name="JScript">
function Application_Start() : void {
    var ds:DataSet = new DataSet();

    var fs:FileStream = new FileStream(Server.MapPath("schemadata.xml"),FileMode.Open,FileAccess.Read);
    var reader:StreamReader = new StreamReader(fs);
    ds.ReadXml(reader);
    fs.Close();

    var view:DataView = new DataView(ds.Tables[0]);
    Application("Source") = view;
}
</Tab>

</Acme:TabControl><p>

<p>

In the <b>Page_Load</b> method, the <b>DataView</b> is then retrieved and used to populate a <b>DataGrid</b> object:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
void Page_Load(Object sender, EventArgs e) {
    DataView Source = (DataView)(Application["Source"]);
    ...
    MyDataGrid.DataSource = Source;
    ...
}
</Tab>

<Tab Name="VB">
Sub Page_Load(sender As Object, e As EventArgs)
    Dim Source As New DataView  = CType(Application("Source"), DataView)
    ...
    MyDataGrid.DataSource = Source
    ...
End Sub
</Tab>

<Tab Name="JScript">
function Page_Load(sender:Object, e:EventArgs) : void {
    var Source:DataView = DataView((Application("Source")));
    ...
    MyDataGrid.DataSource = Source;
    ...
}
</Tab>

</Acme:TabControl><p>

<p>

The advantage of this solution is that only the first request pays the price of retrieving
the data. All subsequent requests use the already existing <b>DataView</b> object. As the
data is never modified after initialization, you do not have to make any provisions for serializing access.
<p>



<!--BEGIN SECTION-->
<a name="sessionstate">
<span class="subhead">Using Session State</span>
<p>

The following sample illustrates the use of session state to store volatile user preferences.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/session1/CS/session1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/session1/session1.src"
  Icon="/quickstart/aspplus/images/session1.gif"
  Caption="C# Session1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/session1/VB/session1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/session1/session1.src"
  Icon="/quickstart/aspplus/images/session1.gif"
  Caption="VB Session1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/session1/JS/session1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/session1/session1.src"
  Icon="/quickstart/aspplus/images/session1.gif"
  Caption="JScript Session1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

To provide individual data for a user during a session, data can be stored
with session scope. In the following sample, values for user preferences are initialized
in the <b>Session_Start</b> event in the Global.asax file. 
<p>


<p><Acme:TabControl runat="server">
<Tab Name="C#">
void Session_Start() {
    Session["BackColor"] = "beige";
    ...
}
</Tab>

<Tab Name="VB">
Sub Session_Start()
    Session("BackColor") = "beige"
    ...
End Sub
</Tab>

<Tab Name="JScript">
function Session_Start() : void {
    Session("BackColor") = "beige";
    ...
}
</Tab>

</Acme:TabControl><p>

In the following
customization page, values for user preferences are modified in the <b>Submit_Click</b> event handler according to user input.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected void Submit_Click(Object sender, EventArgs e) {
    Session["BackColor"] = BackColor.Value;
    ...

    Response.Redirect(State["Referer"].ToString());
}
</Tab>

<Tab Name="VB">
Protected Sub Submit_Click(sender As Object, e As EventArgs)
    Session("BackColor") = BackColor.Value
    ...

    Response.Redirect(State("Referer").ToString())
End Sub
</Tab>

<Tab Name="JScript">
protected function Submit_Click(sender:Object, e:EventArgs) : void {
    Session("BackColor") = BackColor.Value;
    ...

    Response.Redirect(State("Referer").ToString());
}
</Tab>

</Acme:TabControl><p>

<p>

The individual values are retrieved using the <b>GetStyle</b> method:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected String GetStyle(String key) {
    return Session[key].ToString();
}
</Tab>

<Tab Name="VB">
Protected GetStyle(key As String) As String
    Return(Session(key).ToString())
End Sub
</Tab>

<Tab Name="JScript">
protected function GetStyle(key:String) : String {
    return Session(key).ToString();
}
</Tab>

</Acme:TabControl><p>

The <b>GetStyle method</b> is used to construct session-specific styles:
<div class="code"><pre>
&lt;style&gt;
    body
    {
      font: &lt;%=GetStyle("FontSize")%&gt; &lt;%=GetStyle("FontName")%&gt;;
      background-color: &lt;%=GetStyle("BackColor")%&gt;;
    }
    a
    {
        color: &lt;%=GetStyle("LinkColor")%&gt;
    }
&lt;/style&gt;
</pre></div>
<p>

To verify that the values are really stored with session scope,
open the sample page twice, then change one value in the first
browser window and refresh the second one. The second window
picks up the changes because both browser instances share a
common <b>Session</b> object.
<p>

<b>Configuring session state:</b>
Session state features can be configured via the <b>&lt;sessionState&gt;</b>
section in a web.config file. To double the default timeout of
20 minutes, you can add the following to the web.config file of an
application:
<div class="code"><xmp>
<sessionState
  timeout="40"
/>
</xmp></div>

<p>
If cookies are not available, a session can be tracked
by adding a session identifier to the URL. This can be enabled by setting
the following:
<div class="code"><xmp>
<sessionState
  cookieless="true"
/>
</xmp></div>

<p>
By default, ASP.NET will store the session state in the same process that processes the request, just as ASP does. Additionally, ASP.NET can
store session data in an external process, which can even reside
on another machine. To enable this feature:
<ul>
<li>Start the ASP.NET state service, either using the Services snap-in or by
executing "net start aspnet_state" on the command line. The state service
will by default listen on port 42424.  To change the port, modify the
registry key for the service:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\aspnet_state\Parameters\Port
<li>Set the <b>mode</b> attribute of the <b>&lt;sessionState&gt;</b> section to "StateServer".
<li>Configure the <b>stateConnectionString</b> attribute with the values of the
machine on which you started aspnet_state.
</ul>

The following sample assumes that the state service is running
on the same machine as the Web server ("localhost") and uses the default
port (42424):
<div class="code"><pre>
&lt;sessionState
  mode="StateServer"
  stateConnectionString="tcpip=localhost:42424"
/&gt;
</pre></div>

Note that if you try the sample above with this setting, you can reset
the Web server (enter <code>iisreset</code> on the command line) and the session state
value will persist.
<p>



<!--BEGIN SECTION-->
<a name="cookies">
<span class="subhead">Using Client-Side Cookies</span>
<p>
The following sample illustrates the use of client-side cookies to store volatile user preferences.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/cookies1/CS/cookies1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/cookies1/cookies1.src"
  Icon="/quickstart/aspplus/images/cookies1.gif"
  Caption="C# Cookies1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/cookies1/VB/cookies1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/cookies1/cookies1.src"
  Icon="/quickstart/aspplus/images/cookies1.gif"
  Caption="VB Cookies1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/cookies1/JS/cookies1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/cookies1/cookies1.src"
  Icon="/quickstart/aspplus/images/cookies1.gif"
  Caption="JScript Cookies1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
<p>

Storing cookies on the client is one of the methods that ASP.NET's session
state uses to associate requests with sessions. Cookies can also be used
directly to persist data between requests, but the data is then stored
on the client and sent to the server with every request. Browsers place
limits on the size of a cookie; therefore, only a maximum of 4096 bytes is guaranteed
to be acceptable.
<p>

When the data is stored on the client, the <b>Page_Load</b> method in the file
cookies1.aspx checks whether the client has sent a cookie. If not, a new
cookie is created and initialized and stored on the client:

<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected void Page_Load(Object sender, EventArgs e) {
    if (Request.Cookies["preferences1"] == null) {
        HttpCookie cookie = new HttpCookie("preferences1");
        cookie.Values.Add("ForeColor", "black");
        ...
        Response.Cookies.Add(cookie);
    }
}
</Tab>

<Tab Name="VB">
Protected Sub Page_Load(sender As Object, e As EventArgs)
    If Request.Cookies("preferences1") = Null Then
        Dim cookie As New HttpCookie("preferences1")
        cookie.Values.Add("ForeColor", "black")
        ...
        Response.Cookies.Add(cookie)
    End If
End Sub
</Tab>

<Tab Name="JScript">
protected function Page_Load(sender:Object, e:EventArgs) : void {
    if (Request.Cookies("preferences1") == null) {
        var cookie:HttpCookie = new HttpCookie("preferences1");
        cookie.Values.Add("ForeColor", "black");
        ...
        Response.Cookies.Add(cookie);
    }
}
</Tab>

</Acme:TabControl><p>

<p>

On the same page, a <b>GetStyle</b> method is used again to provide
the individual values stored in the cookie:

<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected String GetStyle(String key) {
  HttpCookie cookie = Request.Cookies["preferences1"];
  if (cookie != null) {
    switch (key)
    {
      case "ForeColor" : return cookie.Values["ForeColor"]; break;
      ...
    }
  }
  return "";
}
</Tab>

<Tab Name="VB">
Protected Function GetStyle(key As String) As String
  Dim cookie As HttpCookie = Request.Cookies("preferences1")
  If cookie <> Null Then
    Select Case key
      Case "ForeColor"
        Return(cookie.Values("ForeColor"))
      Case ...
    End Select
  End If
  Return("")
End Function
</Tab>

<Tab Name="JScript">
protected function GetStyle(key:String) : String {
  var cookie:HttpCookie = Request.Cookies("preferences1");
  if (cookie != null) {
    switch (key)
    {
      case "ForeColor" : return cookie.Values("ForeColor"); break;
      ...
    }
  }
  return "";
}
</Tab>

</Acme:TabControl><p>

<p>

Verify that the sample works by opening the cookies1.aspx page and modifying
the preferences. Open the page in another window, it should pick up the new
preferences. Close all browser windows and open the cookies1.aspx page again.
This should delete the temporary cookie and restore the default preference values.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/cookies2/CS/cookies2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/cookies2/cookies2.src"
  Icon="/quickstart/aspplus/images/cookies2.gif"
  Caption="C# Cookies2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/cookies2/VB/cookies2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/cookies2/cookies2.src"
  Icon="/quickstart/aspplus/images/cookies2.gif"
  Caption="VB Cookies2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/cookies2/JS/cookies2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/cookies2/cookies2.src"
  Icon="/quickstart/aspplus/images/cookies2.gif"
  Caption="JScript Cookies2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

To make a cookie persistent between sessions, the <b>Expires</b> property on
the <b>HttpCookie</b> class has to be set to a date in the future. The following
code on the customization.aspx page is identical to the previous sample,
with the exception of the assignment to <b>Cookie.Expires</b>:

<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected void Submit_Click(Object sender, EventArgs e) {
    HttpCookie cookie = new HttpCookie("preferences2");
    cookie.Values.Add("ForeColor",ForeColor.Value);
    ...
    cookie.Expires = DateTime.MaxValue; // Never Expires

    Response.Cookies.Add(cookie);

    Response.Redirect(State["Referer"].ToString());
}
</Tab>

<Tab Name="VB">
Protected Sub Submit_Click(sender As Object, e As EventArgs)
    Dim cookie As New HttpCookie("preferences2")
    cookie.Values.Add("ForeColor",ForeColor.Value)
    ...
    cookie.Expires = DateTime.MaxValue ' Never Expires

    Response.Cookies.Add(cookie)

    Response.Redirect(State("Referer").ToString())
End Sub
</Tab>

<Tab Name="JScript">
protected function Submit_Click(sender:Object, e:EventArgs) : void {
    var cookie:HttpCookie = new HttpCookie("preferences2");
    cookie.Values.Add("ForeColor",ForeColor.Value);
    ...
    cookie.Expires = DateTime.MaxValue; // Never Expires

    Response.Cookies.Add(cookie);

    Response.Redirect(State("Referer").ToString());
}
</Tab>

</Acme:TabControl><p>

Verify that the sample is working by modifying a value, closing all browser
windows, and opening cookies2.aspx again. The window should still show the
customized value.
<p>

<!--BEGIN SECTION-->
<a name="viewstate">
<span class="subhead">Using ViewState</span>
<p>
This sample illustrates the use of the <b>ViewState</b> property to store request-specific values.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/pagestate/CS/pagestate1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/pagestate/pagestate1.src"
  Icon="/quickstart/aspplus/images/pagestate1.gif"
  Caption="C# PageState1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/pagestate/VB/pagestate1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/pagestate/pagestate1.src"
  Icon="/quickstart/aspplus/images/pagestate1.gif"
  Caption="VB PageState1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/pagestate/JS/pagestate1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/pagestate/pagestate1.src"
  Icon="/quickstart/aspplus/images/pagestate1.gif"
  Caption="JScript PageState1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
<p>

ASP.NET provides the server-side notion of a view state for each control. A control can save its
internal state between requests using the <b>ViewState</b> property on an instance of the class <b>StateBag</b>. The
<b>StateBag</b> class provides a dictionary-like interface to store objects associated with a string key.
<p>

The file pagestate1.aspx displays one visible panel and stores the index of it in the view
state of the page with the key <b>PanelIndex</b>:
<p>
<p><Acme:TabControl runat="server">
<Tab Name="C#">
protected void Next_Click(Object sender, EventArgs e ) {
    String PrevPanelId = "Panel" + ViewState["PanelIndex"].ToString();
    ViewState["PanelIndex"] = (int)ViewState["PanelIndex"] + 1;
    String PanelId = "Panel" + ViewState["PanelIndex"].ToString();
    ...
}
</Tab>

<Tab Name="VB">
Protected Sub Next_Click(sender As Object, e As EventArgs)
    Dim PrevPanelId As String = "Panel" + ViewState("PanelIndex").ToString()
    ViewState("PanelIndex") = CType(ViewState("PanelIndex") + 1, Integer)
    Dim PanelId As String = "Panel" + ViewState("PanelIndex").ToString()
    ...
End Sub
</Tab>

<Tab Name="JScript">
protected function Next_Click(sender:Object, e:EventArgs) : void {
    var PrevPanelId:String = "Panel" + ViewState("PanelIndex").ToString();
    ViewState("PanelIndex") = int(ViewState("PanelIndex") + 1);
    var PanelId:String = "Panel" + ViewState("PanelIndex").ToString();
    ...
}
</Tab>

</Acme:TabControl><p>

Note that if you open the page in several browser windows, each browser window will
initially show the name panel. Each window can independently navigate between the panels.


<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>Use application state variables to store data that is modified infrequently but used often.
<li>Use session state variables to store data that is specific to one session or user.
The data is stored entirely on the server. Use it for short-lived, bulky, or sensitive data.
<li>Store small amounts of volatile data in a nonpersistent cookie. The data is stored on the
client, sent to the server on each request, and expires when the client ends execution.
<li>Store small amounts of non-volatile data in a persistent cookie. The data is stored on the
client until it expires and is sent to the server on each request.
<li>Store small amounts of request-specific data in the view state. The data is sent from the server
to the client and back.
</ol>
<p>


<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
