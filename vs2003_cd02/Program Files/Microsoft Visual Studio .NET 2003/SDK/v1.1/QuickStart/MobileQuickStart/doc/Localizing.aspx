<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Localizing Mobile Applications</h4>

<p>

Because ASP.NET Mobile Controls are built on Microsoft ASP.NET, the techniques for localizing
mobile Web applications (that is, providing for rendering an application into multiple spoken
languages) parallel those for localizing ASP.NET-based desktop Web applications.
The ASP.NET QuickStart Tutorial provides both an
<a target="_new" href="/quickstart/aspplus/doc/internationalization.aspx">overview</a>
and
<a target="_new" href="/quickstart/aspplus/doc/localizingapps.aspx">more detail</a> 
about localizing ASP.NET-based applications.
Note that this tutorial is available only if you have installed the Microsoft .NET Framework
samples on this computer. 

<p>

There is an additional consideration when building mobile applications. 
Because the ASP.NET mobile controls generate UI containing text strings,
applications must be able to override these values
to supply strings in languages for which ASP.NET has not
been localized. Examples of these values include "Prev" and "Next" for page browsing,
and "Calendar" to display a calendar. Therefore, ASP.NET
provides application-writable properties on any control that generates text in its
UI. The following is a list of such properties.

<ul>
  <li><b>Calendar.CalendarEntryText</b></li>
  <li><b>Command.SoftkeyLabel</b></li>
  <li><b>Link.SoftkeyLabel</b></li>
  <li><b>ObjectList.BackCommandText</b></li>
  <li><b>ObjectList.DetailsCommandText</b></li>
  <li><b>ObjectList.MoreText</b></li>
  <li><b>PagerStyle.NextPageText</b></li>
  <li><b>PagerStyle.PreviousPageText</b></li>
  <li><b>PhoneCall.SoftkeyLabel</b></li>
  <li><b>ValidationSummary.BackLabel</b></li>
</ul>

<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
