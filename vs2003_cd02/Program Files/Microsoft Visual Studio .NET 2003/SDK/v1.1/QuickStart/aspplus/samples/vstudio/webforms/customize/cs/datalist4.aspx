<%@ Page CodeBehind="datalist4.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="Customize.Cs.datalist4" %>

 <html>
  <head>
</head>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <form runat="server">

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/header.inc" -->

  <table width="100%">
    <tr>
      <td width="50%">

        <ASP:DataList id="MyDataList" DataKeyField="title_id" runat="server">

          <ItemTemplate>

            <table cellpadding=10 style="font: 10pt verdana">
              <tr>
                <td valign="top">
                  <img id="TitleImage" align="top" width="25" border=1 src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>' runat="server">
                </td>
                <td valign="top">
                  <b>Title: </b>
                  <ASP:LinkButton id="SelectTitle" Text='<%# DataBinder.Eval(Container.DataItem, "title") %>' CommandName="Select" style="color:darkred" runat="server"/>
                  <br>
                  <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %><br>
                </td>
              </tr>
            </table>

          </ItemTemplate>

        </ASP:DataList>

      </td>

      <td valign="top" style="PADDING-TOP:15px" width="50%">
        <table cellpadding="5" width="100%" style="FONT: 10pt verdana">
          <tr>
            <td>
              <img id="DetailsImage" visible="false" runat="server">
            </td>
            <td valign="top" width="400">
              <div style="FONT: 12pt verdana; COLOR: darkred">
                <i><b><span id="DetailsTitle" runat="server"></span></i></B><br>
              </div>
              <span id="DetailsTitleId" runat="server"></span>
              <span id="DetailsPubId" runat="server"></span>
              <span id="DetailsType" runat="server"></span>
              <span id="DetailsPrice" runat="server"></span>
              <ASP:hyperlink id="PurchaseLink" target="_self" runat="server"/>
            </td>
          </tr>
        </table>
      </td>

    </tr>
  </table>

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/footer.inc" -->

  </form>

</body>
 </html>
