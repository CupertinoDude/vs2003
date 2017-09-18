<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Performance Tuning Tips</span>
<p>
Any programming model has its common performance pitfalls, and ASP.NET is no exception.  This section describes some of the ways in which you can avoid performance bottlenecks in your code.
</p>
<p>
<ol>
<li><b>Disable Session State when not in use</b>:

Not all applications or pages require per-user session state. If it is not required, disable it completely.  This is easily accomplished using a page-level directive, such as the following:

<div class="code"><pre>
&lt;%@ Page EnableSessionState="false" %&gt;
</pre></div>

<p>
<b>Note:</b> If a page requires access to session variables but does not create or modify them, set the value of the directive to <i>ReadOnly</i>.  Session State can also be disabled for XML Web service methods. See <a href="servicesandobjs.aspx">Using Objects and Intrinsics</a> in the XML Web services section.
<p>
<li><b>Choose your Session State provider carefully</b>:

ASP.NET provides three distinct ways to store session data for your application: in-process session state, out-of-process session state as a Windows Service, and out-of-process session state in a SQL database.  Each has its advantages, but in-process session state is by far the fastest solution.  If you are only storing small amounts of volatile data in session state you should use the in-process provider.
 The out-of-process solutions are primarily useful in Web garden and Web farm scenarios or in situations in which data cannot be lost in the event of a server/process restart.
<p>
<li><b>Avoid excessive round trips to the server</b>:
The Web Forms page framework is one of the best features of ASP.NET, because it can dramatically reduce the amount of code you need to write to accomplish a task.  Programmatic access to page elements using server controls and the postback event handling model are arguably the most time-saving features. However, there are appropriate and inappropriate ways to use these features, and it is important to know when it is appropriate to use them.
<p>
An application typically needs to make a round trip to the server only when retrieving data or storing data.  Most data manipulations can take place on the client between round trips.  For example, validating form entries can often take place on the client before the user submits data.  In general, if you do not need to relay information back to the server, then you should not make a round trip to the server.
<p>
If you are writing your own server controls, consider having them render client-side code for up-level (ECMAScript-capable) browsers.  By employing "smart" controls, you can dramatically reduce the number of unecessary hits to your Web server.
<p>
<li><b>Use Page.IsPostback to avoid extra work on a round trip</b>:
If you are handling server control postbacks, you often need to execute different code the first time the page is requested from the code you do use for the round trip when an event is fired.  If you check the <b>Page.IsPostBack</b> property, your code can execute conditionally, depending on whether there is an initial request for the page or a responce to a server control event.  It might seem obvious to do this, but in practice it is possible to omit this check without changing the behavior of the page.  For example:
<p>

<table cellpadding=0 cellspacing=0 width="93%">
<tr>
<td>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script language="C#" runat="server"&gt;

    public DataSet ds;
    ...

    void Page_Load(Object sender, EventArgs e) {
        // ...set up a connection and command here...
        if (!Page.IsPostBack) {
            String query = "select * from Authors where FirstName like '%JUSTIN%'";
            myCommand.Fill(ds, "Authors");
            myDataGrid.DataBind();
        }
    }

    void Button_Click(Object sender, EventArgs e) {
        String query = "select * from Authors where FirstName like '%BRAD%'";
        myCommand.Fill(ds, "Authors");
        myDataGrid.DataBind();
    }

&lt;/script&gt;

&lt;form runat="server"&gt;
  &lt;asp:datagrid datasource='&lt;%# ds.Tables["Authors"].DefaultView %&gt;' runat="server"/&gt;&lt;br&gt;
  &lt;asp:button onclick="Button_Click" runat="server"/&gt;
&lt;/form&gt;
</Tab>
<Tab Name="VB">
&lt;script language="VB" runat="server"&gt;

    Public ds As DataSet
    ...

    Sub Page_Load(sender As Object, e As EventArgs)
        ' ...set up a connection and command here...
        If Not (Page.IsPostBack)
            Dim query As String = "select * from Authors where FirstName like '%JUSTIN%'"
            myCommand.Fill(ds, "Authors")
            myDataGrid.DataBind()
        End If
    End Sub

    Sub Button_Click(sender As Object, e As EventArgs)
        Dim query As String = "select * from Authors where FirstName like '%BRAD%'"
        myCommand.Fill(ds, "Authors")
        myDataGrid.DataBind()
    End Sub

&lt;/script&gt;

&lt;form runat="server"&gt;
  &lt;asp:datagrid datasource='&lt;%# ds.Tables("Authors").DefaultView %&gt;' runat="server"/&gt;&lt;br&gt;
  &lt;asp:button onclick="Button_Click" runat="server"/&gt;
&lt;/form&gt;
</Tab>
<Tab Name="JScript">
&lt;script language="JScript" runat="server"&gt;

    public var ds:DataSet;
    ...

    function Page_Load(sender:Object, e:EventArgs) : void {
        // ...set up a connection and command here...
        if (!Page.IsPostBack) {
            var query:String = "select * from Authors where FirstName like '%JUSTIN%'";
            myCommand.Fill(ds, "Authors");
            myDataGrid.DataBind();
        }
    }

    function Button_Click(sender:Object, e:EventArgs) : void {
        var query:String = "select * from Authors where FirstName like '%BRAD%'";
        myCommand.Fill(ds, "Authors");
        myDataGrid.DataBind();
    }

&lt;/script&gt;

&lt;form runat="server"&gt;
  &lt;asp:datagrid datasource='&lt;%# ds.Tables["Authors"].DefaultView %&gt;' runat="server"/&gt;&lt;br&gt;
  &lt;asp:button onclick="Button_Click" runat="server"/&gt;
&lt;/form&gt;
</Tab>
</Acme:TabControl>
</td>
</tr>
</table>
<p>
The <code>Page_Load</code> event executes on every request, so we checked <b>Page.IsPostBack</b> so that the first query does not execute when we process the <code>Button_Click</code> event postback.  Note that even without this check our page would behave identically, since the binding from the first query would be overturned by the call to <b>DataBind</b> in the event handler.  Keep in mind that it can be easy to overlook this simple performance improvement when you write your pages.
<p>
<li><b>Use server controls sparingly and appropriately</b>:
Even though it is extremely easy to use, a server control might not always be the best choice.  In many cases, a simple rendering or databinding substitution will accomplish the same thing.  For example:
<p>

<table cellpadding=0 cellspacing=0 width="93%">
<tr>
<td>
<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script language="C#" runat="server"&gt;

    public String imagePath;
    void Page_Load(Object sender, EventArgs e) {
        //...retrieve data for imagePath here...
        DataBind();
    }

&lt;/script&gt;

&lt;%-- the span and img server controls are unecessary...--%&gt;
The path to the image is: &lt;span innerhtml='&lt;%# imagePath %&gt;' runat="server"/&gt;&lt;br&gt;
&lt;img src='&lt;%# imagePath %&gt;' runat="server"/&gt;

&lt;br&gt;&lt;br&gt;

&lt;%-- use databinding to substitute literals instead...--%&gt;
The path to the image is: &lt;%# imagePath %&gt;&lt;br&gt;
&lt;img src='&lt;%# imagePath %&gt;' /&gt;

&lt;br&gt;&lt;br&gt;

&lt;%-- or a simple rendering expression...--%&gt;
The path to the image is: &lt;%= imagePath %&gt;&lt;br&gt;
&lt;img src='&lt;%= imagePath %&gt;' /&gt;
</Tab>
<Tab Name="VB">
&lt;script language="VB" runat="server"&gt;

    Public imagePath As String
    Sub Page_Load(sender As Object, e As EventArgs)
        '...retrieve data for imagePath here...
        DataBind()
    End Sub

&lt;/script&gt;

&lt;%--the span and img server controls are unecessary...--%&gt;
The path to the image is: &lt;span innerhtml='&lt;%# imagePath %&gt;' runat="server"/&gt;&lt;br&gt;
&lt;img src='&lt;%# imagePath %&gt;' runat="server"/&gt;

&lt;br&gt;&lt;br&gt;

&lt;%-- use databinding to substitute literals instead...--%&gt;
The path to the image is: &lt;%# imagePath %&gt;&lt;br&gt;
&lt;img src='&lt;%# imagePath %&gt;' /&gt;

&lt;br&gt;&lt;br&gt;

&lt;%-- or a simple rendering expression...--%&gt;
The path to the image is: &lt;%= imagePath %&gt;&lt;br&gt;
&lt;img src='&lt;%= imagePath %&gt;' /&gt;
</Tab>
<Tab Name="JScript">
&lt;script language="JScript" runat="server"&gt;

    public var imagePath:String;
    function Page_Load(sender:Object, e:EventArgs) : void {
        //...retrieve data for imagePath here...
        DataBind();
    }

&lt;/script&gt;

&lt;%-- the span and img server controls are unecessary...--%&gt;
The path to the image is: &lt;span innerhtml='&lt;%# imagePath %&gt;' runat="server"/&gt;&lt;br&gt;
&lt;img src='&lt;%# imagePath %&gt;' runat="server"/&gt;

&lt;br&gt;&lt;br&gt;

&lt;%-- use databinding to substitute literals instead...--%&gt;
The path to the image is: &lt;%# imagePath %&gt;&lt;br&gt;
&lt;img src='&lt;%# imagePath %&gt;' /&gt;

&lt;br&gt;&lt;br&gt;

&lt;%-- or a simple rendering expression...--%&gt;
The path to the image is: &lt;%= imagePath %&gt;&lt;br&gt;
&lt;img src='&lt;%= imagePath %&gt;' /&gt;
</Tab>
</Acme:TabControl>
</td>
</tr>
</table>
<p>

In this example, a server control is not needed to substitute values into the resulting HTML sent back to the client.  There are many other cases where this technique works just fine, even in server control templates.  However, if you want to programmatically manipulate the control's properties, handle events from it, or take advantage of its state preservation, then a server control would be appropriate.  You should examine your use of server controls and look for code you can optimize.
<p>
<li><b>Avoid excessive server control view state</b>:
Automatic state management is a feature that enables server controls to re-populate their values on a round trip without requiring you to write any code. This feature is not free however, since the state of a control is passed to and from the server in a hidden form field. You should be aware of when <b>ViewState</b> is helping you and when it is not.  For example, if you are binding a control to data on every round trip (as in the datagrid example in tip #4), then you do not need the control to maintain it's view state, since you will wipe out any re-populated data in any case.
<p>
<b>ViewState</b> is enabled for all server controls by default. To disable it, set the <b>EnableViewState</b> property of the control to false, as in the following example:
<p>
<div class="code"><pre>
&lt;asp:datagrid EnableViewState="false" datasource="..." runat="server"/&gt;
</pre></div>
<p>
You can also turn <b>ViewState</b> off at the page level.  This is useful when you do not post back from a page at all, as in the following example:
<p>
<div class="code"><pre>
&lt;%@ Page EnableViewState="false" %&gt;
</pre></div>
Note that this attribute is also supported by the <b>User Control</b> directive.  To analyze the amount of view state used by the server controls on your page, enable tracing and look at the View State column of the Control Hierarchy table.  For more information about the Trace feature and how to enable it, see the <a href="tracelogapp.aspx">Application-level Trace Logging</a> feature.

<p>
<li><b>Use Response.Write for String concatenation</b>:
Use the HttpResponse.Write method in your pages or user controls for string concatenation. This method offers buffering and concatenation services that are very efficient. If you are performing extensive concatenation, however, the technique in the following example, using multiple calls to <b>Response.Write</b>, is faster than concatenating a string with a single call to the <b>Response.Write</b> method. 
<p>

<table cellpadding=0 cellspacing=0 width="93%">
<tr>
<td>
<Acme:TabControl runat="server">
<Tab Name="C#">
Response.Write("a");
Response.Write(myString);
Response.Write("b");
Response.Write(myObj.ToString());
Response.Write("c");
Response.Write(myString2);
Response.Write("d");
</Tab>
<Tab Name="VB">
Response.Write("a")
Response.Write(myString)
Response.Write("b")
Response.Write(myObj.ToString())
Response.Write("c")
Response.Write(myString2)
Response.Write("d")
</Tab>
<Tab Name="JScript">
Response.Write("a");
Response.Write(myString);
Response.Write("b");
Response.Write(myObj.ToString());
Response.Write("c");
Response.Write(myString2);
Response.Write("d");
</Tab>
</Acme:TabControl>
</td>
</tr>
</table>

<p>
<li><b>Do not rely on exceptions in your code</b>:
Exceptions are very expensive and should rarely occur in your code. You should never use exceptions as a way to control normal program flow. If it is possible to detect in code a condition that would cause an exception, you should do that instead of waiting to catch the exception before handling that condition. Common scenarios include checking for null, assigning to a string that will be parsed into a numeric value, or checking for specific values before applying math operations.  For example:
<p>
<table cellpadding=0 cellspacing=0 width="93%">
<tr>
<td>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Consider changing this:

try {
   result = 100 / num;
}
catch (Exception e) {
  result = 0;
}

// To this:

if (num != 0)
   result = 100 / num;
else
  result = 0;

</Tab>
<Tab Name="VB">
' Consider changing this:

Try
   result = 100 / num

Catch (e As Exception)
  result = 0
End Try

// To this:

If Not (num = 0)
   result = 100 / num
Else
  result = 0
End If
</Tab>
<Tab Name="JScript">
// Consider changing this:

try {
   result = 100 / num;
}
catch (e:Exception) {
  result = 0;
}

// To this:

if (num != 0)
   result = 100 / num;
else
  result = 0;

</Tab>
</Acme:TabControl>
</td>
</tr>
</table>

<p>
<li><b>Use early binding in Visual Basic or JScript code</b>:
One of the advantages of Visual Basic, VBScript, and JScript is their typeless nature.  Variables can be created simply by using them and need no explicit type declaration.  When assigning from one type to another, conversions are performed automatically, as well.  This can be both an advantage and a disadvantage, since late binding is a very expensive convenience in terms of performance.
<p>
The Visual Basic language now supports type-safe programming through the use of a special <b>Option Strict</b> compiler directive.  For backward compatibility, ASP.NET does not enable <b>Option Strict</b> by default. However, for optimal perfomance, you should enable <b>Option Strict</b> for your pages by using a <b>Strict</b> attribute on the page or Control directive:
<p>
<div class="code"><pre>
&lt;%@ Page Language="VB" Strict="true" %&gt;

&lt;%

Dim B
Dim C As String

' This causes a compiler error:
A = "Hello"

' This causes a compiler error:
B = "World"

' This does not:
C = "!!!!!!"

' But this does:
C = 0

%&gt;
</pre></div>
<p>
JScript also supports typeless programming, though it offers no compiler directive to force early binding.  A variable is late-bound if:
<p>
<ul>
<li>It is declared explicitly as an object.
<li>It is a field of a class with no type declaration.
<li>It is a private function/method member with no explicit type declaration and the type cannot be inferred from its use.
</ul>
<p>
The last distinction is complicated. The JScript compiler optimizes if it can figure out the type, based on how a variable is used. In the following example, the variable <i>A</i> is early-bound but the variable <i>B</i> is late-bound:
<p>
<div class="code"><pre>
var A;
var B;

A = "Hello";
B = "World";
B = 0;
</pre></div>
<p>
For the best performance, declare your JScript variables as having a type. For example, "var A : String".

<p>
<li><b>Port call-intensive COM components to managed code</b>:
The .NET Framework provides a remarkably easy way to interoperate with traditional COM components. The benefit is that you can take advantage of the new platform while preserving your existing code. However, there are some circumstances in which the performance cost of keeping your old components is greater than the cost to migrate your components to managed code. Every situation is unique, and the best way to decide what needs to be changed is to measure site performance. In general, however, the performance impact of COM interoperability is proportional to the number of function calls made or the amount of data marshaled from unmanaged to managed code.  A component that requires a high volume of calls to interact with it is called "chatty," due to the number of communications between layers. You should consider porting such components to fully managed code to benefit from the performance gains provided by the .NET platform.  Alternatively, you might consider redesigning your component to require fewer calls or to marshal more data at once.
<p>
<li><b>Use SQL stored procedures for data access</b>:
Of all the data access methods provided by the .NET Framework, SQL-based data access is the best choice for building scalable web applications with the best performance.  When using the managed SQL provider, you can get an additional performance boost by using compiled stored procedures instead of ad hoc queries.  For an example of using SQL stored procedures, refer to the <a href="webdataaccess.aspx">Server-Side Data Access</a> section of this tutorial.
<p>
<li><b>Use SqlDataReader for a fast-forward, read-only data cursor</b>:
A <b>SqlDataReader</b> object provides a forward, read-only cursor over data retrieved from a SQL database. <b>SqlDataReader</b> is a more performant option than using a <b>DataSet</b> if it can be used for your scenario.  Because <b>SqlDataReader</b> supports the <b>IEnumerable</b> interface, you can even bind server controls, as well. For an example of using <b>SqlDataReader</b>, see the <a href="webdataaccess.aspx">Server-Side Data Access</a> section of this tutorial.
<p>
<li><b>Cache data and output wherever possible</b>:
The ASP.NET programming model provides a simple mechanism for caching page output or data when it does not need to be dynamically computed for every request.  You can design your pages with caching in mind to optimize those places in your application that you expect to have the most traffic.  More than any feature of the .NET Framework, the appropriate use of caching can enhance the performance of your site, sometimes by an order of magnitude or more.  For more information about how to use caching, see the <a href="cachingoverview.aspx">Cache Services</a> section of this tutorial.
<p>
<li><b>Enable Web gardening for multiprocessor computers</b>:
The ASP.NET process model helps enable scalability on multiprocessor machines by distributing the work to several processes, one for each CPU, each with processor affinity set to its CPU. The technique is called <i>Web gardening</i>, and can dramatically improve the performance of some applications.  To learn how to enable Web gardening, refer to the <a href="procmodel.aspx">Using the Process Model</a> section.
<p>
<li><b>Do not forget to disable Debug mode</b>:
The <b>&lt;compilation&gt;</b> section in ASP.NET configuration controls whether an application is compiled in Debug mode, or not.  Debug mode degrades performance significantly.  Always remember to disable Debug mode before you deploy a production application or measure performance.  For more information about Debug mode, refer to the section entitled <a href="debugcomsdk.aspx">The SDK Debugger</a>.
<p>
</ol>

<p>
<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
