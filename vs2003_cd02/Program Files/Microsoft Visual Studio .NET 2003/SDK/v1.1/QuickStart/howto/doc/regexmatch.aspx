<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/regularexpressionsheader.inc" -->

<h4>How Do I...Use Regular Expressions to match a pattern?</h4>

Regular Expressions allow for easy parsing and matching of strings
to a specific pattern.  Using the objects available in the <b>RegularExpressions</b>
namespace, it is possible to compare a string against a given pattern, replace a
string pattern with another string, or to retrieve only portions of a formatted
string.

<p>
In the simplest case, Regular Expressions can be used to do string comparisons against
a pattern of strings.  For instance, it can be useful to only allow strings of a
particular length range, especially when accepting passwords.
The following code demonstrates creating a <b>Regex</b> and testing to see if the string
matches the pattern using the <b>IsMatch</b> method.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
Regex emailregex = new Regex("(?&lt;user&gt;[^@]+)@(?&lt;host&gt;.+)");
Boolean ismatch = emailregex.IsMatch("johndoe@tempuri.org");
</Tab>
<Tab Name="VB">
Dim emailregex As Regex = New Regex("(?&lt;user&gt;[^@]+)@(?&lt;host&gt;.+)");
Dim ismatch As Boolean = emailregex.IsMatch("johndoe@tempuri.org");
</Tab>
<Tab Name="C++">
Regex * emailregex = new Regex("(?<user>[^@]+)@(?<host>.+)");
String * s = S"johndoe@tempuri.org";
Match * m = emailregex -> Match(s);
</Tab>
</Acme:TabControl>

<p>
This sample illustrates how to create a <b>Regex</b> object using a pattern string.
The <b>Match</b> method is called and a <b>Match</b> object is returned.  By
examining the <b>Success</b> property, the sample decides whether to continue
processing the <b>Match</b> object or to print an error message.  If the match is
successful, the <b>Groups</b> collection of the <b>Match</b> object can be queried
for ordinal or named groups within the match.  The following sample illustrates
using named groups in a pattern match to validate an email address and then print
the user and host portions.

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/RegularExpressions/RegexMatch/CS"
        ViewSource="/quickstart/howto/samples/RegularExpressions/RegexMatch/RegexMatch.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# RegexMatch.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/RegularExpressions/RegexMatch/VB"
        ViewSource="/quickstart/howto/samples/RegularExpressions/RegexMatch/RegexMatch.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB RegexMatch.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/RegularExpressions/RegexMatch/CP"
        ViewSource="/quickstart/howto/samples/RegularExpressions/RegexMatch/RegexMatch.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ RegexMatch.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->