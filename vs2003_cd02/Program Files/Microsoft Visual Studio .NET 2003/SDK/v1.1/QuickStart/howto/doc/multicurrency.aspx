<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/GlobalizationHeader.inc" -->

<h4>How Do I...Display Multiple Currencies (the Euro and local currency)?</h4>

This sample illustrates how to use multiple currencies such as the Euro and German DM (Deutsch mark) in your application.<p>
The <b>System.Globalization.NumberFormatInfo</b> class contains formatting information such as the currency symbol, decimal digit, separator, and so on.  In many European countries, two separate currencies are commonly used: the Euro and the local currency.  A static property <b>NumberFormatInfo.CurrentInfo</b> contains current local currency info, and the Currency symbol that is associated with the Euro. To represent the local currency and the Euro, you must first create a copy of the NumberFormatInfo instance using <b>NumberFormatInfo.Clone()</b>, then replace the <b>CurrencySymbol</b> property with the local currency symbol.<br>

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
NumberFormatInfo LocalFormat = (NumberFormatInfo)NumberFormatInfo.CurrentInfo.Clone();
LocalFormat.CurrencySymbol = "DM";	// Replace currency symbol with DM symbol.
</Tab>
<Tab Name="VB">
Dim LocalFormat As NumberFormatInfo = CType(NumberFormatInfo.CurrentInfo.Clone(), NumberFormatInfo)
LocalFormat.CurrencySymbol = "DM" ' Replace currency symbol with DM symbol.
</Tab>
<Tab Name="JScript">
var LocalFormat : NumberFormatInfo = NumberFormatInfo(NumberFormatInfo.CurrentInfo.Clone());
LocalFormat.CurrencySymbol = "DM";	// Replace currency symbol with DM symbol.
</Tab>
</Acme:TabControl>

<p>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Globalization/MultiCurrency/CS/MultiCurrency.aspx"
        ViewSource="/quickstart/howto/samples/Globalization/MultiCurrency/MultiCurrency.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="C# MultiCurrency.aspx"
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Globalization/MultiCurrency/VB/MultiCurrency.aspx"
        ViewSource="/quickstart/howto/samples/Globalization/MultiCurrency/MultiCurrency.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="VB MultiCurrency.aspx"
        runat="server" />
  </VbTemplate>
  <JsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Globalization/MultiCurrency/JS/MultiCurrency.aspx"
        ViewSource="/quickstart/howto/samples/Globalization/MultiCurrency/MultiCurrency.src"
        Icon = "/quickstart/images/genicon.gif"
        Caption="JScript MultiCurrency.aspx"
        runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
