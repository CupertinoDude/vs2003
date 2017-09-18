<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Web Forms Syntax Reference</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#syntax">ASP.NET Web Forms Syntax Elements</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#render">Rendering Code Syntax</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#code">Declaration Code Syntax</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#ctrl">ASP.NET Server Control Syntax</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#htmlctrl">ASP.NET Html Server Control Syntax </a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#databind">Databinding Syntax</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#object">Object Tag Syntax</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#comment">Server Side Comment Syntax</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#include">Server Side Include Syntax</a><br>
</div>
</p>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="syntax">
<span class="subhead">ASP.NET Web Forms Syntax Elements</span>
<p>

An ASP.NET Web Forms page is a declarative text file with an .aspx file name extension.
In addition to static content, you can use eight distinct syntax markup elements.
This section of the QuickStart reviews each of these syntax elements and provides
examples demonstrating their use.


<!--BEGIN SECTION-->
<br>
<a name="render">
<br>
<span class="subhead">Rendering Code Syntax: &lt;% %&gt;  and &lt;%= %&gt;</span>
<p>

Code rendering blocks are denoted with &lt;% ... %&gt; elements, allow you to custom-control
content emission, and execute during the render phase of Web Forms page execution.
The following example demonstrates how you can use them to loop over HTML content.

<p><Acme:TabControl runat="server">

<Tab Name="C#">
&lt;% for (int i=0; i<8; i++) { %&gt;
     &lt;font size="&lt;%=i%&gt;"&gt; Hello World! &lt;/font&gt; &lt;br&gt;
&lt;% } %&gt;
</Tab>

<Tab Name="VB">
&lt;% For I=0 To 7 %&gt;
     &lt;font size="&lt;%=i%&gt;"&gt; Hello World! &lt;/font&gt; &lt;br&gt;
&lt;% Next %&gt;
</Tab>

<Tab Name="JScript">
&lt;% for (var i:int=0; i<8; i++) { %&gt;
     &lt;font size="&lt;%=i%&gt;"&gt; Hello World! &lt;/font&gt; &lt;br&gt;
&lt;% } %&gt;
</Tab>

</Acme:TabControl><p>



<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/CS/reference1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference1.src"
  Icon="/quickstart/aspplus/images/reference1.gif"
  Caption="C# Reference1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/VB/reference1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference1.src"
  Icon="/quickstart/aspplus/images/reference1.gif"
  Caption="VB Reference1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/JS/reference1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference1.src"
  Icon="/quickstart/aspplus/images/reference1.gif"
  Caption="JScript Reference1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
Code enclosed by &lt;% ... %&gt; is just executed, while expressions that include an
equal sign, &lt;%= ... %&gt;, are evaluated and the result is emitted as content.
Therefore <code><nobr>&lt;%="Hello World" %&gt;</nobr></code> renders the same thing as the C#
code <code><nobr>&lt;% Response.Write("Hello World"); %&gt;</nobr></code>.
<p>
<b>Note:</b> For languages that use marks to end or separate statements
(for example, the semicolon (;) in C#), it is important to place those marks correctly depending on how your code should be rendered.
<p>
<div class="indent">
<table class="table2" cellpadding=3>
<tr><th colspan="2"><b>C# code</b></th></tr>
<tr>
  <td><div class="code">&lt;% Response.Write("Hello World"); %&gt;</div></td>
  <td>A semicolon is necessary to end the statement.</td></tr>
<tr>
  <td><div class="code">&lt;%="Hello World"; %&gt;</div></td>
  <td>Wrong: Would result in "<code>Response.Write("Hello World";);</code>".</td></tr>
<tr>
  <td><div class="code">&lt;%="Hello World" %&gt;</div></td><td>A semicolon is not necessary.</td></tr>
</table>
</div>

<!--BEGIN SECTION-->
<br>
<a name="code">
<br>
<span class="subhead">Declaration Code Syntax: &lt;script runat="server"&gt; </span>
<p>

Code declaration blocks define member variables and methods that will be compiled into the
generated <b>Page</b> class.  These blocks can be used to author page and navigation logic.
The following example demonstrates how a <b>Subtract</b> method can be declared within a
<b>&lt;script runat="server"&gt;</b> block, and then invoked from the page.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script language="C#" runat=server&gt;
int subtract(int num1, int num2) {
  return num1 - num2;
}
&lt;/script&gt;

&lt;%
  ...
  number = subtract(number, 1);
  ...
%&gt;
</Tab>

<Tab Name="VB">
&lt;script language="VB" runat=server&gt;
Function Subtract(num1 As Integer, num2 As Integer) As Integer
  Return(num1 - num2)
End Function
&lt;/script&gt;

&lt;%
  ...
  number = subtract(number, 1)
  ...
%&gt;
</Tab>

<Tab Name="JScript">
&lt;script language="JScript" runat=server&gt;
function subtract(num1:int, num2:int) : int {
  return num1 - num2;
}
&lt;/script&gt;

&lt;%
  ...
  number = subtract(number, 1);
  ...
%&gt;
</Tab>

</Acme:TabControl><p>

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/CS/reference2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference2.src"
  Icon="/quickstart/aspplus/images/reference2.gif"
  Caption="C# Reference2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/VB/reference2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference2.src"
  Icon="/quickstart/aspplus/images/reference2.gif"
  Caption="VB Reference2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/JS/reference2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference2.src"
  Icon="/quickstart/aspplus/images/reference2.gif"
  Caption="JScript Reference2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<b>Important:</b> Unlike ASP -- where functions could be declared within &lt;% %&gt; blocks --
all functions and global page variables must be declared in a <b>&lt;script runat=server&gt;</b>
tag.  Functions declared within &lt;% %&gt; blocks will now generate a syntax compile error.



<!--BEGIN SECTION-->
<br>
<a name="ctrl">
<br>
<span class="subhead">ASP.NET Server Control Syntax</span>
<p>

Custom ASP.NET server controls enable page developers to dynamically generate HTML user interface (UI) and respond to
client requests. They are represented within a file using a declarative, tag-based syntax.
These tags are distinguished from other tags because they contain a <b>"runat=server"</b> attribute.
The following example demonstrates how an <b>&lt;asp:label runat="server"&gt;</b> server control can be
used within an ASP.NET page. This control corresponds to the <b>Label</b> class in the
<b><nobr>System.Web.UI.WebControls</nobr></b> namespace, which is included by default.
<p>
By adding a tag with the ID "Message", an instance of <b>Label</b> is created at run time:

<div class="code"><pre>
&lt;asp:label id="Message" font-size=24 runat="server"/&gt;
</pre></div>

The control can then be accessed using the same name. The following line sets the <b>Text</b> property
of the control.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
Message.Text = "Welcome to ASP.NET";
</Tab>

<Tab Name="VB">
Message.Text = "Welcome to ASP.NET"
</Tab>

<Tab Name="JScript">
Message.Text = "Welcome to ASP.NET";
</Tab>

</Acme:TabControl><p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/CS/reference3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference3.src"
  Icon="/quickstart/aspplus/images/reference3.gif"
  Caption="C# Reference3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/VB/reference3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference3.src"
  Icon="/quickstart/aspplus/images/reference3.gif"
  Caption="VB Reference3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/JS/reference3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference3.src"
  Icon="/quickstart/aspplus/images/reference3.gif"
  Caption="JScript Reference3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>



<!--BEGIN SECTION-->
<br>
<a name="htmlctrl">
<br>
<span class="subhead">ASP.NET HTML Server Control Syntax </span>
<p>

HTML server controls enable page developers to programmatically manipulate HTML elements
within a page.  An HTML server control tag is distinguished from client HTML elements
by means of a <b>"runat=server"</b> attribute.  The following example demonstrates how an HTML
<b>&lt;span runat=server&gt;</b> server control can be used within an ASP.NET page.
<p>
As with other server controls, the methods and properties are accessible programmatically, as shown in the following example.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;script language="C#" runat="server"&gt;
  void Page_Load(Object sender, EventArgs e) {
    Message.InnerHtml = "Welcome to ASP.NET";
  }
&lt;/script&gt;
...
&lt;span id="Message" style="font-size:24" runat="server"/&gt;
</Tab>

<Tab Name="VB">
&lt;script language="VB" runat="server"&gt;
  Sub Page_Load(sender As Object, e As EventArgs)
    Message.InnerHtml = "Welcome to ASP.NET"
  End Sub
&lt;/script&gt;
...
&lt;span id="Message" style="font-size:24" runat="server"/&gt;
</Tab>

<Tab Name="JScript">
&lt;script language="JScript" runat="server"&gt;
  function Page_Load(sender:Object, e:EventArgs) : void {
    Message.InnerHtml = "Welcome to ASP.NET";
  }
&lt;/script&gt;
...
&lt;span id="Message" style="font-size:24" runat="server"/&gt;
</Tab>

</Acme:TabControl><p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/CS/reference4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference4.src"
  Icon="/quickstart/aspplus/images/reference4.gif"
  Caption="C# Reference4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/VB/reference4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference4.src"
  Icon="/quickstart/aspplus/images/reference4.gif"
  Caption="VB Reference4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/JS/reference4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference4.src"
  Icon="/quickstart/aspplus/images/reference4.gif"
  Caption="JScript Reference4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>



<!--BEGIN SECTION-->
<br>
<a name="databind">
<br>
<span class="subhead">Data Binding Syntax: &lt;%# %&gt; </span>
<p>

The data binding support built into ASP.NET enables page developers to hierarchically bind
control properties to data container values.  Code located within a &lt;%# %&gt;
code block is only executed when the <b>DataBind</b> method of its parent control
container is invoked.  The following example demonstrates how to use the data binding
syntax within an <b>&lt;asp:datalist runat=server&gt;</b> control.
<p>
Within the datalist, the template for one item is specified. The content of the item template
is specified using a data binding expression and the <code>Container.DataItem</code> refers to the data
source used by the datalist <code>MyList</code>.
<div class="code"><pre>
&lt;asp:datalist id="MyList" runat=server&gt;
  &lt;ItemTemplate&gt;
    Here is a value: &lt;%# Container.DataItem %&gt;
  &lt;/ItemTemplate&gt;
&lt;/asp:datalist&gt;
</pre></div>

In this case the data source of the <code>MyList</code> control is set programmatically, and
then <code>DataBind()</code> is called.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
void Page_Load(Object sender, EventArgs e) {
  ArrayList items = new ArrayList();

  items.Add("One");
  items.Add("Two");
  items.Add("Three");

  MyList.DataSource = items;
  MyList.DataBind();
}
</Tab>

<Tab Name="VB">
Sub Page_Load(sender As Object, e As EventArgs)
  Dim items As New ArrayList()

  items.Add("One")
  items.Add("Two")
  items.Add("Three")

  MyList.DataSource = items
  MyList.DataBind()
End Sub
</Tab>

<Tab Name="JScript">
function Page_Load(sender:Object, e:EventArgs) : void {
  var items:ArrayList = new ArrayList();

  items.Add("One");
  items.Add("Two");
  items.Add("Three");

  MyList.DataSource = items;
  MyList.DataBind();
}
</Tab>

</Acme:TabControl>
<p>
Calling the <b>DataBind</b> method of a control causes a recursive tree walk from that
control on down in the tree; the <b>DataBinding</b> event is raised on each
server control in that hierarchy, and data binding expressions on the control are
evaluated accordingly. So, if the <b>DataBind</b> method of the page is called, then every
data binding expression within the page will be called.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/CS/reference5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference5.src"
  Icon="/quickstart/aspplus/images/reference5.gif"
  Caption="C# Reference5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/VB/reference5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference5.src"
  Icon="/quickstart/aspplus/images/reference5.gif"
  Caption="VB Reference5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/JS/reference5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference5.src"
  Icon="/quickstart/aspplus/images/reference5.gif"
  Caption="JS Reference5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="object">
<br>
<span class="subhead">Object Tag Syntax: &lt;object runat="server" /&gt;</span>
<p>

Object tags enable page developers to declare and create instances of variables using a declarative, tag-based syntax. The
following example demonstrates how the object tag can be used to create an instance of an <b>ArrayList</b> class.

<div class="code"><pre>
&lt;object id="items" class="System.Collections.ArrayList" runat="server"/&gt;
</pre></div>

The object will be created automatically at run time and can then be accessed through the ID "items".

<p><Acme:TabControl runat="server">
<Tab Name="C#">
void Page_Load(Object sender, EventArgs e) {
  items.Add("One");
  items.Add("Two");
  items.Add("Three");
  ...
}
</Tab>

<Tab Name="VB">
Sub Page_Load(sender As Object, e As EventArgs)
  items.Add("One")
  items.Add("Two")
  items.Add("Three")
  ...
End Sub
</Tab>

<Tab Name="JScript">
function Page_Load(sender:Object, e:EventArgs) : void {
  items.Add("One");
  items.Add("Two");
  items.Add("Three");
  ...
}
</Tab>

</Acme:TabControl><p>

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/CS/reference6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference6.src"
  Icon="/quickstart/aspplus/images/reference6.gif"
  Caption="C# Reference6.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/VB/reference6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference6.src"
  Icon="/quickstart/aspplus/images/reference6.gif"
  Caption="VB Reference6.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/JS/reference6.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference6.src"
  Icon="/quickstart/aspplus/images/reference6.gif"
  Caption="JScript Reference6.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="comment">
<br>
<span class="subhead">Server-Side Comment Syntax: &lt;%-- Comment --%&gt;</span>
<p>

Server-side comments enable page developers to prevent server code (including server controls) and
static content from executing or rendering.  The following sample demonstrates how to block content from
executing and being sent down to a client. Note that everything between &lt;%-- and --%&gt; is
filtered out and only visible in the original server file, even though it contains other ASP.NET
directives.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%--
  &lt;asp:calendar id="MyCal" runat=server/&gt;
    &lt;% for (int i=0; i<45; i++) { %&gt;
             Hello World &lt;br&gt;
    &lt;% } %&gt;
--%&gt;
</Tab>

<Tab Name="VB">
&lt;%--
  &lt;asp:calendar id="MyCal" runat=server/&gt;
    &lt;% For I=0 To 44 %&gt;
             Hello World &lt;br&gt;
    &lt;% Next %&gt;
--%&gt;
</Tab>

<Tab Name="JScript">
&lt;%--
  &lt;asp:calendar id="MyCal" runat=server/&gt;
    &lt;% for (var i:int=0; i<45; i++) { %&gt;
             Hello World &lt;br&gt;
    &lt;% } %&gt;
--%&gt;
</Tab>

</Acme:TabControl><p>

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/CS/reference7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference7.src"
  Icon="/quickstart/aspplus/images/reference7.gif"
  Caption="C# Reference7.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/VB/reference7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference7.src"
  Icon="/quickstart/aspplus/images/reference7.gif"
  Caption="VB Reference7.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/JS/reference7.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference7.src"
  Icon="/quickstart/aspplus/images/reference7.gif"
  Caption="JScript Reference7.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<!--BEGIN SECTION-->
<br>
<a name="include">
<br>
<span class="subhead">Server-Side Include Syntax: &lt;-- #Include File="Locaton.inc" --&gt;</span>
<p>

Server-side #Includes enable developers to insert the raw contents of a specified file anywhere
within an ASP.NET page.  The following sample demonstrates how to insert a custom header and footer within a page.

<div class="code"><pre>
&lt;!-- #Include File="Header.inc" --&gt;
...
&lt;!-- #Include File="Footer.inc" --&gt;
</pre></div>

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/CS/reference8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference8.src"
  Icon="/quickstart/aspplus/images/reference8.gif"
  Caption="C# Reference8.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/VB/reference8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference8.src"
  Icon="/quickstart/aspplus/images/reference8.gif"
  Caption="VB Reference8.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/reference/JS/reference8.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/reference/reference8.src"
  Icon="/quickstart/aspplus/images/reference8.gif"
  Caption="JScript Reference8.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->