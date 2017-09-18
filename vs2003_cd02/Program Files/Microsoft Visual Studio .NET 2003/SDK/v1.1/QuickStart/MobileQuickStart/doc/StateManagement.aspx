<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Managing Application State</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#ViewState">View State in Mobile Pages</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#SessionHistory">View State Session History</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#SessionExpiry">Dealing with Session State Expiration</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#NoViewState">Turning Off View State</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#Cookies">Client State and Cookies</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

When creating a mobile Web application, you can use a wide variety
of Microsoft ASP.NET features for state management including:

<ul compact>
<li>Page- and control-level state management in your pages.
<li>Access to client-side state by using cookies or hidden variables.
<li>Scalable, reliable session management that works across server farms.
<li>Application state control.
</ul>

<p>

For more information about state management, see the ASP.NET
documentation.

<p>

<a name="ViewState"></a>
<span class="subhead">View State in Mobile Pages</span><br>

<p>

ASP.NET mobile Web Forms pages can keep their own state across
multiple client round trips.
When a property is set for a control either programmatically or based on user
input, the property value is saved automatically as part of the control's 
state. To the application, this makes it appear as though the page's lifetime
spans multiple client requests.
This page-level state management is known as <i>view state</i>.

<p>

On ordinary Web Forms pages, view state is sent to the client
as a hidden variable on a form, and is returned to the server as part of a 
postback. Due to bandwidth limitations, mobile Web Forms pages do not send
view state to the client. Instead, they save view state as part of a state stack
in a user's session on the server. 

<p>

<a name="SessionHistory"></a>
<span class="subhead">View State Session History</span><br>

<p>
Because the view state for a given page must be kept on the server,
if the user uses a Back feature on the browser to go back in the history,
the current state on the server can lose synchronization with the current
page of the browser. 
<p>
For example, suppose the user goes to Page 1, then clicks a button to
go to Page 2, and then presses Back to return to Page 1. The current page
on the browser is now Page 1, but the current state on the server is Page 2. 
<p>
To alleviate this problem, mobile Web Forms maintains a small history
of view state information in the user's session. Each identifier sent
to the client corresponds to a position in this history. In the previous
example, if the user again posts from Page 1, mobile Web Forms will
use the identifier saved with Page 1 to synchronize the history.
<p>
The size of this history is configurable by the developer, and must
be tuned for the application. The default size is 6, and can be changed
by adding a numeric attribute to a <b><mobileControls></b> tag in web.config,
as shown in the following example. 
<p>

<div class="xmpcode">
&lt;configuration&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;system.web&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;mobileControls sessionStateHistorySize="10"&nbsp;/&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/system.web&gt;<br>
&lt;/configuration&gt;
</div>

<p>

<a name="SessionExpiry"></a>
<span class="subhead">Dealing with Session State Expiration</span><br>

<p>

Because view state is saved in the session, it is possible for
view state to expire if a page is not posted back within the session
expiration time. View state expiration is unique to mobile Web Forms pages.
When the
user posts a page back for which there is no view state available, the
runtime calls the <b>OnViewStateExpire</b> method of the page. The
default implementation of this method raises an exception indicating
that the view state has expired. However, if an application can
manually restore view state after expiration, it can override this method
at the page level, regenerate the application state as appropriate,
and  not call the error-raising base implementation.

<p>

For example, the items collection of a <b>SelectionList</b> mobile control are saved in
view state. Suppose that when the <b>SelectionList</b> mobile control is created, the
items are created dynamically. If the application calls the <b>OnViewStateExpire</b> method, the items
can be recreated to minimize the effect of the expired session.

<p>

In the following example, the application calls the <b>Session.Abandon</b> method when the page first executes.
Then, when the page is posted back, the application calls the <b>OnViewStateExpire</b> method.  
The items are added again to the <b>SelectionList</b> and no error message 
appears.

<p>

<Acme:SourceRef runat="server" Path="StateManagement/OnViewStateExpire" />

<p>

<a name="NoViewState"></a>
<span class="subhead">Turning Off View State</span><br>

<p>

Although using the session for view state management enables smaller
response sizes, the use of session state can lead to
performance degradation on the server, particularly if the view state is used inefficiently.
In particular, when using controls with large amounts of data,
you must use techniques such as custom paging or turning off view state
for efficiency. For example, consider a site that shows news stories.
Rather than saving article content on a per-user basis in the session,
this type of site must use smarter data access so that only one copy of each
article is cached on the server, and session state use is minimized.

<p>

To turn off view state for a control and its children, set the <b>EnableViewState</b>
property of the control to <b>false</b>. To turn off view state for an entire page,
you can add an <b>EnableViewState="false"</b> attribute to the <b>Page</b> directive.

<p>

The following sample illustrates how you can create a page without view state.
The <i>GetWeather</i> method in this sample is a placeholder. In a actual application
scenario, this method would perform custom data access.

<p>

<Acme:SourceRef runat="server" Path="StateManagement/NoViewState" />

<p>

Even when view state is disabled, some mobile Web Forms controls will save
essential state information across client round trips. An example of such 
information includes the currently active form on a page. When you turn off
view state, the page saves this essential information as a hidden form variable
that is sent back to the client.

<p>

<a name="Cookies"></a>
<span class="subhead">Client State and Cookies</span><br>

<p>

By default, the session management features of ASP.NET require the server
to write out a session cookie to a client.
The client subsequently submits the cookie on each request during the 
session, and the server looks up the session state from this information.
Many mobile devices, however, do not support cookies.
For session management, including view state, to work correctly on these
devices, you must configure the application to use <i>cookieless
session management</i>. With this feature enabled, ASP.NET automatically
inserts the session key in application URLs.

<p>

When working with devices that do not support cookies, how do you create a persistent long-term client state? An example of 
such state information is a pre-entered customer number. Because you 
cannot rely on a client having cookies, your application must take you to an alternate page that can be bookmarked. 

The following sample shows an example of such a site.
Any users that browse to this URL view a form where they enter their customer IDs.
Then the application displays an alternate URL, which users can bookmark.

<p>

Note that this sample will not work on cell phone emulators that do not support bookmarking
functionality, but will work on actual phones.

<p>

<Acme:SourceRef runat="server" Path="StateManagement/ClientState" />

<p>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
