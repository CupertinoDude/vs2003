<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/regularexpressionsheader.inc" -->

<h4>How Do I...Get all matches for a pattern</h4>

Regular Expressions are often useful when trying to retrieve small portions of
text from a large document, result set, or when filtering a stream.  The <b>MatchCollection</b>
object contains all valid <b>Match</b> objects for a given regular expression after a
successful match occurs.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
Regex digitregex = new Regex("(?&lt;number&gt;\\d+)");
String s = "abc 123 def 456 ghi 789";
  ...
MatchCollection ms = digitregex.Matches(s);
</Tab>
<Tab Name="VB">
Dim DigitRegex As Regex = New Regex("(?&lt;number&gt;\d+)")
Dim S As String = "abc 123 def 456 ghi 789"
  ...
Dim Mc As MatchCollection = DigitRegex.Matches(S)
</Tab>
<Tab Name="C++">
Regex * digitregex = new Regex(S"(?<number>\\d+)");
String * s = S"abc 123 def 456 ghi 789";
  ...
MatchCollection * mc = digitregex->Matches(s);
</Tab>
</Acme:TabControl>

<p>
The following example illustrates how to create a <b>Regex</b> that matches numbers in a string.
The <b>Matches</b> method is callled to return a <b>MatchCollection</b>.  If the <b>Count</b>
property equals 0, no successful matches have occured.  If there are matches, the results
of each are displayed.

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/RegularExpressions/RegexMatches/CS"
        ViewSource="/quickstart/howto/samples/RegularExpressions/RegexMatches/RegexMatches.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# RegexMatches.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/RegularExpressions/RegexMatches/VB"
        ViewSource="/quickstart/howto/samples/RegularExpressions/RegexMatches/RegexMatches.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB RegexMatches.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/RegularExpressions/RegexMatches/CP"
        ViewSource="/quickstart/howto/samples/RegularExpressions/RegexMatches/RegexMatches.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ RegexMatches.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->