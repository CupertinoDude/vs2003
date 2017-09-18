<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<h4>Calendar</h4>

<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#working">Working With Calendar</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#modes">Date Selection Modes</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#graphics">Selection Link Graphics</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#text">Selection Link Text</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#custom">Adding Custom Content to Calendar</a><br>
</div>

<p>
<hr>

<!--BEGIN SECTION-->
<a name="working">
<span class="subhead">Working With Calendar</span>
<p>
The <b>Calendar</b> control displays a month calendar from which users can select dates.
The following sample illustrates using a simple <b>Calendar</b> control.

<p>
<!--basic-->
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/CS/Calendar1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar1.src"
  Icon="/quickstart/aspplus/images/calendar1.gif"
  Caption="C# Calendar1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/VB/Calendar1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar1.src"
  Icon="/quickstart/aspplus/images/calendar1.gif"
  Caption="VB Calendar1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/JS/Calendar1.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar1.src"
  Icon="/quickstart/aspplus/images/calendar1.gif"
  Caption="JScript Calendar1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<a name="modes">
<span class="subhead">Date Selection Modes</span>
<p><b>Calendar</b> supports four date selection modes, as described in the following table.</p>
<div class="indent">
<table class="table2" width="75%">
    <tr>
    <th style="width:25%"><b>Mode</b></th>
    <th>Description</th>
    </tr>
    <tr>
    <td style="width:25%"><b>Day</b></td>
    <td>User can select any single day.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>DayWeek</b></td>
    <td>User can select a single day, or an entire week.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>DayWeekMonth</b></td>
    <td>User can select a single day, an entire week, or the entire visible month.</td>
    </tr>
    <tr>
    <td style="width:25%"><b>None</b></td>
    <td>Date selection is disabled.</td>
    </tr>
</table>
</div>

<p>
The following sample demonstrates mode selection with a <b>Calendar</b> control.
<p>

<!--Date Selection Modes-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/CS/Calendar2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar2.src"
  Icon="/quickstart/aspplus/images/calendar2.gif"
  Caption="C# Calendar2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/VB/Calendar2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar2.src"
  Icon="/quickstart/aspplus/images/calendar2.gif"
  Caption="VB Calendar2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/JS/Calendar2.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar2.src"
  Icon="/quickstart/aspplus/images/calendar2.gif"
  Caption="JScript Calendar2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>


<p>
<a name="graphics">
<span class="subhead">Selection Link Graphics</span>
<p>The <b>Calendar</b> control can use either text or graphics for its selection links.  The following sample shows how
to use graphics to create a better-looking calendar.</p>
<!--selection link graphics-->
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/CS/Calendar3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar3.src"
  Icon="/quickstart/aspplus/images/calendar3.gif"
  Caption="C# Calendar3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/VB/Calendar3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar3.src"
  Icon="/quickstart/aspplus/images/calendar3.gif"
  Caption="VB Calendar3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/JS/Calendar3.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar3.src"
  Icon="/quickstart/aspplus/images/calendar3.gif"
  Caption="JScript Calendar3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<a name="text">
<span class="subhead">Selection Link Text</span>
<p>The <b>Calendar</b> control can also use text labels for week or month selection, as shown in the following example.</p>
<!--selection link text-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/CS/Calendar4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar4.src"
  Icon="/quickstart/aspplus/images/calendar4.gif"
  Caption="C# Calendar4.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/VB/Calendar4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar4.src"
  Icon="/quickstart/aspplus/images/calendar4.gif"
  Caption="VB Calendar4.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/JS/Calendar4.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar4.src"
  Icon="/quickstart/aspplus/images/calendar4.gif"
  Caption="JScript Calendar4.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<a name="custom">
<span class="subhead">Adding Custom Content to Calendar</span>
<p>You can make appointment-style calendars by adding content in the <b>OnDayRender</b> event. Two of the arguments
for <b>OnDayRender</b> are the <b>Day</b> that is being rendered and its <b>Cell</b> object.  Custom text can be added to the
cell for a particular day by adding it as a <b>LiteralControl</b> to the <b>Cell</b> object's Controls collection, as shown in the following example.

<p><Acme:TabControl runat="server">
<Tab Name="C#">
string Hol = GetHoliday(Day.Date);

if (Hol != string.Empty) Cells.Controls.Add(new LiteralControl("&lt;br&gt;" + Hol));
</Tab>

<Tab Name="VB">
Dim Hol As String = GetHoliday(Day.Date)

If Hol <> String.Empty Then Cells.Controls.Add(New LiteralControl("&lt;br&gt;" + Hol))
</Tab>

<Tab Name="JScript">
var Hol:String = GetHoliday(Day.Date);

if (Hol != String.Empty) Cells.Controls.Add(new LiteralControl("&lt;br&gt;" + Hol));
</Tab>

</Acme:TabControl><p>

</p>
<!--adding custom content-->
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/CS/Calendar5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar5.src"
  Icon="/quickstart/aspplus/images/calendar5.gif"
  Caption="C# Calendar5.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/VB/Calendar5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar5.src"
  Icon="/quickstart/aspplus/images/calendar5.gif"
  Caption="VB Calendar5.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/JS/Calendar5.aspx"
  ViewSource="/quickstart/aspplus/samples/webforms/ctrlref/webctrl/Calendar/Calendar5.src"
  Icon="/quickstart/aspplus/images/calendar5.gif"
  Caption="JScript Calendar5.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
