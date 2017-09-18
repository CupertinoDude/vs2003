<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">An E-Commerce Storefront</span>

<p>The following sample application is a mock-up of a typical e-commerce storefront.
The application shows the most common elements of the following types of applications: a product
browser, a session-based shopping cart, product details, and so forth. A SQL Server database is
used to store the product data, and the <b>DataList</b> and <b>Repeater</b> controls render this data.
The data access portion of the application is implemented as a managed component.</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/grocertogo/CS/grocertogo.aspx"
  ViewSource="/quickstart/aspplus/samples/grocertogo/grocertogo.src"
  Icon="/quickstart/aspplus/images/grocertogo_icon.gif"
  Caption="C# GrocerToGo.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/grocertogo/VB/grocertogo.aspx"
  ViewSource="/quickstart/aspplus/samples/grocertogo/grocertogo.src"
  Icon="/quickstart/aspplus/images/grocertogo_icon.gif"
  Caption="VB GrocerToGo.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/grocertogo/JS/grocertogo.aspx"
  ViewSource="/quickstart/aspplus/samples/grocertogo/grocertogo.src"
  Icon="/quickstart/aspplus/images/grocertogo_icon.gif"
  Caption="JScript GrocerToGo.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->