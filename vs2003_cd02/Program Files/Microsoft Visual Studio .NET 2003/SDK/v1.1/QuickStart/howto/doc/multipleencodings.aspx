<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/GlobalizationHeader.inc" -->

<h4>How Do I...Handle Multiple Encodings in one ASP.NET page?</h4>

This sample illustrates how to use <b>ContentEncoding</b> property provided in the <b>HttpWebResponse</b> class and how to create a proper <b>Encoding</b> object from the property value.  This enables your application to handle multiple encodings on the same page.  The <b>ContentEncoding</b> property has the value of the character set in the <b>ContentType</b> HTTP header sent from ASP.NET.
The <b>GetEncoding()</b> method of the <b>System.Text.Encoding</b> class accepts the encoding name string for creating the object.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
HttpWebResponse result = (HttpWebResponse)req.GetResponse();
...
Encoding encode = Encoding.GetEncoding( result.CharacterSet );
</Tab>
<Tab Name="VB">
Dim result As HttpWebResponse = req.GetResponse()
...
Dim encode As Encoding = Encoding.GetEncoding( result.CharacterSet )
</Tab>
<Tab Name="JScript">
var result : HttpWebResponse = HttpWebResponse(req.GetResponse());
...
var encode : Encoding = Encoding.GetEncoding( result.CharacterSet );
</Tab>
</Acme:TabControl>

<p>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Globalization/MultipleEncodings/CS/MultipleEncodings.aspx"
        ViewSource="/quickstart/howto/samples/Globalization/MultipleEncodings/MultipleEncodings.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="C# MultipleEncodings.aspx"
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Globalization/MultipleEncodings/VB/MultipleEncodings.aspx"
        ViewSource="/quickstart/howto/samples/Globalization/MultipleEncodings/MultipleEncodings.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="VB MultipleEncodings.aspx"
        runat="server" />
  </VbTemplate>
  <JsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Globalization/MultipleEncodings/JS/MultipleEncodings.aspx"
        ViewSource="/quickstart/howto/samples/Globalization/MultipleEncodings/MultipleEncodings.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="JScript MultipleEncodings.aspx"
        runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
