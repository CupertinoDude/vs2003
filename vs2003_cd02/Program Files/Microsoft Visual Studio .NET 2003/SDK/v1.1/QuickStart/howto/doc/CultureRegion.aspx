<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/globalizationheader.inc" -->

<h4>How Do I...Use the CultureInfo and RegionInfo classes?</h4>

<div class="indent" style="width:660">
The <b>CultureInfo</b> and <b>RegionInfo</b> classes are exported from the <b>System.Globalization</b>
namespace.  <b>CultureInfo</b> contains a culture's <b>DisplayName</b>, <b>Calendar</b>, and
various official abbreviations.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
CultureInfo c = new CultureInfo("en-us");
Console.WriteLine ("The CultureInfo is set to: {0}", c.DisplayName);
Console.WriteLine ("The parent culture is: {0}", c.Parent.DisplayName);
Console.WriteLine ("The three letter ISO language name is: {0}", c.ThreeLetterISOLanguageName);
Console.WriteLine ("The default calendar for this culture is: {0}\n\n", c.Calendar.ToString());
</Tab>
<Tab Name="VB">
Dim C As CultureInfo = New CultureInfo("en-us")
Console.WriteLine ("The CultureInfo is set to: {0}", C.DisplayName)
Console.WriteLine ("The parent culture is: {0}", C.Parent.DisplayName)
Console.WriteLine ("The three letter ISO language name is: {0}", C.ThreeLetterISOLanguageName)
Console.WriteLine ("The default calendar for this culture is: {0}\n\n", C.Calendar.ToString())
</Tab>
<Tab Name="C++">
CultureInfo* c = new CultureInfo("en-us");
Console::WriteLine ("The CultureInfo is set to: {0}", c->DisplayName);
Console::WriteLine ("The parent culture is: {0}", c->Parent->DisplayName);
Console::WriteLine ("The three leter ISO language name is: {0}", c->ThreeLetterISOLanguageName);
Console::WriteLine ("The default calendar for this culture is: {0}\n\n", c->Calendar->ToString());
</Tab>
</Acme:TabControl>

<p>
<b>RegionInfo</b> contains information for a given region including <b>DisplayName</b>, currency
information, and official abbreviations.  <b>RegionInfo</b> also contains a static property
to retreive the <b>CurrentRegion</b>.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
RegionInfo r = new RegionInfo("us");
Console.WriteLine ("The name of this region is: {0}", r.Name);
Console.WriteLine ("The currency symbol for the region is: {0}", r.CurrencySymbol);
Console.WriteLine ("Is this region metric : {0} \n\n", r.IsMetric);
</Tab>
<Tab Name="VB">
Dim R As RegionInfo = New RegionInfo("us")
Console.WriteLine ("The name of this region is: {0}", R.Name)
Console.WriteLine ("The currency symbol for the region is: {0}", R.CurrencySymbol)
Console.WriteLine ("Is this region metric : {0}", R.IsMetric)
</Tab>
<Tab Name="C++">
RegionInfo *r = new RegionInfo("us");
Console::WriteLine ("The name of this region is: {0}", r->Name);
Console::WriteLine ("The currency symbol for the region is: {0}", r->CurrencySymbol);
Console::WriteLine ("Is this region metric : {0} \n\n", r->IsMetric.ToString());
</Tab>
</Acme:TabControl>
</div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Globalization/CultureRegion/CS"
        ViewSource="/quickstart/howto/samples/Globalization/CultureRegion/CultureRegion.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# CultureRegion.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Globalization/CultureRegion/VB"
        ViewSource="/quickstart/howto/samples/Globalization/CultureRegion/CultureRegion.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB CultureRegion.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Globalization/CultureRegion/CP"
        ViewSource="/quickstart/howto/samples/Globalization/CultureRegion/CultureRegion.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ CultureRegion.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
