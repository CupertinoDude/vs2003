<%@ Page CodeBehind="datalist5.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Customize.Vb.datalist5" %>

<html>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <form runat="server">

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/header.inc" -->

  <table width="100%">
    <tr>
      <td width="50%">

        <ASP:DataList id="MyDataList" OnSelectedIndexChanged="MyDataList_Select" OnItemCommand="MyDataList_ItemCommand" DataKeyField="title_id" runat="server">

          <ItemTemplate>

            <table cellpadding=10 style="font: 10pt verdana">
              <tr>
                <td valign="top">
                  <img align="top" width="25" border=1 src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>' runat="server"/>
                </td>
                <td valign="top">
                  <b>Title: </b>
                  <asp:linkbutton Text='<%# DataBinder.Eval(Container.DataItem, "title") %>' CommandName="Select" style="color:darkred" runat="server"/>
                  <br>
                  <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %>
                  <br>
                  <asp:linkbutton Text="Discussions" CommandName="Discuss" style="color:darkred;font:8pt tahoma" runat="server"/>
                  |
                  <asp:linkbutton Text="Ratings" CommandName="Ratings" style="color:darkred;font:8pt tahoma" runat="server"/>
                </td>
              </tr>
            </table>

          </ItemTemplate>

        </ASP:DataList>

      </td>

      <td valign="top" style="padding-top:15" width="50%">
        <table cellpadding="5" width="100%" style="font: 10pt verdana">
          <tr>
            <td>
              <img id="DetailsImage" visible="false" runat="server">
            </td>
            <td valign="top" width="400">
              <div style="font: 12pt verdana;color:darkred">
                <i><b><asp:Label id="DetailsTitle" runat="server"/></i></b><br>
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

  <asp:Label id="Message" style="font: 10pt verdana;padding:0,15,15,15" runat="server"/>

  </form>

</body>
</html>
