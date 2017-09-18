<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/regularexpressionsheader.inc" -->

<h4>How Do I...Use Regular Expressions to make replacements?</h4>

The Regular Expressions library can often ease the time it takes to generate
string replacement functions.  By specifying a pattern of strings to be replaced,
you do not have to search for every possible variation of a string.  Once a
<b>Regex</b> object that matches every possible string to be replaced is created, 
the <b>Replace</b> method can be used to generate a result.  The <b>Replace</b>
method can be most easily used by passing in the source string and the
replacement string.  The <b>Replace</b> method will return the results as a String.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
Regex digitregex = new Regex("(?&lt;digit&gt;[0-9])");
String before = "Here is so4848me te88xt with emb4493edded numbers.";
 ...
String after = digitregex.Replace(before, "");
</Tab>
<Tab Name="VB">
Dim digitregex As Regex = new Regex("(?&lt;digit&gt;[0-9])")
Dim Before As String = "Here is so4848me te88xt with emb4493edded numbers."
 ...
Dim After As String = DigitRegex.Replace(Before, "")
</Tab>
<Tab Name="C++">
Regex * digitregex = new Regex(S"(?<digit>[0-9])");
String * before = S"Here is so4848me te88xt with emb4493edded numbers.";
 ...
String * after = digitregex -> Replace(before, "");
</Tab>
</Acme:TabControl>

<p>
You can also reuse the matched string in the replacement.  In the previous snippet
we have a named capture of <span class="code">?&lt;digit&gt;</span>.  This named capture
can be reused in the replacement string as <span class="code">${digit}</span>.
Note that ordinal captures can be used as well, <span class="code">$123</span>,
which would evaluate to 123 captures in our pattern.

<p>
This example illustrates how to use the <b>Replace</b> method of <b>Regex</b> to
remove all digits from the input string.

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/RegularExpressions/RegexReplace/CS"
        ViewSource="/quickstart/howto/samples/RegularExpressions/RegexReplace/RegexReplace.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# RegexReplace.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/RegularExpressions/RegexReplace/VB"
        ViewSource="/quickstart/howto/samples/RegularExpressions/RegexReplace/RegexReplace.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB RegexReplace.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/RegularExpressions/RegexReplace/CP"
        ViewSource="/quickstart/howto/samples/RegularExpressions/RegexReplace/RegexReplace.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ RegexReplace.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->