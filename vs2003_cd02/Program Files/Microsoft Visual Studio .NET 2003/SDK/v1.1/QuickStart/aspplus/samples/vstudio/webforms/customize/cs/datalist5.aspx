<%@ Page CodeBehind="datalist5.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="Customize.Cs.datalist5" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

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
                  <img align="top" id="TitleImage" width="25" border=1 src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>' runat="server"/>
                </td>
                <td valign="top">
                  <b>Title: </b>
                  <asp:linkbutton id="SelectTitle" Text='<%# DataBinder.Eval(Container.DataItem, "title") %>' CommandName="Select" style="color:darkred" runat="server"/>
                  <br>
                  <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %>
                  <br>
                  <asp:linkbutton id="DiscussionsBtn" Text="Discussions" CommandName="Discuss" style="color:darkred;font:8pt tahoma" runat="server"/>
                  |
                  <asp:linkbutton id="RatingsBtn" Text="Ratings" CommandName="Ratings" style="color:darkred;font:8pt tahoma" runat="server"/>
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
                <i><b><asp:Label id="DetailsTitle" runat="server"/></i></B><br>
              </div>
              <asp:Label id="DetailsTitleId" runat="server"/>
              <asp:Label id="DetailsPubId" runat="server"/>
              <asp:Label id="DetailsType" runat="server"/>
              <asp:Label id="DetailsPrice" runat="server"/>
              <asp:HyperLink id="PurchaseLink" runat="server"/>
            </td>
          </tr>
        </table>
      </td>

    </tr>
  </table>

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/footer.inc" -->

  <asp:Label id="Message" style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; FONT: 10pt verdana; PADDING-TOP: 0px" runat="server"/>

  </form>
<div></div>

</body>
 </html>
