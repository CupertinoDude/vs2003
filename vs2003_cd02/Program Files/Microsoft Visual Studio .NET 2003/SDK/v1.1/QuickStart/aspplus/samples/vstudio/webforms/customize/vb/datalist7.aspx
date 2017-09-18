<%@ Page CodeBehind="datalist7.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Customize.Vb.datalist7" %>

<html>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <form runat="server">

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/header.inc" -->

  <ASP:DataList id="MyDataList" RepeatColumns="2" runat="server">

      <ItemTemplate>

        <table cellpadding=10 style="font: 10pt verdana">
          <tr>
            <td width=1 bgcolor="BD8672"/>
            <td valign="top">
              <img align="top" src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>' >
            </td>
            <td valign="top">
              <b>Title: </b><%# DataBinder.Eval(Container.DataItem, "title") %><br>
              <b>Category: </b><%# DataBinder.Eval(Container.DataItem, "type") %><br>
              <b>Publisher ID: </b><%# DataBinder.Eval(Container.DataItem, "pub_id") %><br>
              <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %>
              <p>
              <asp:linkbutton id="EditBtn" CommandName="Edit" runat="server">
                <img border="0" src="/quickstart/aspplus/images/edit_book.gif" >
              </asp:linkbutton>
            </td>
          </tr>
        </table>

      </ItemTemplate>

      <EditItemTemplate>

        <table cellpadding=10 style="font: 10pt verdana">
          <tr>
            <td width=1 bgcolor="BD8672"/>
            <td valign="top">
              <img align="top" src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>' >
            </td>
            <td valign="top">
              <b>Title: </b><%# DataBinder.Eval(Container.DataItem, "title") %><br>
              <b>Category: </b><%# DataBinder.Eval(Container.DataItem, "type") %><br>
              <b>Publisher ID: </b><%# DataBinder.Eval(Container.DataItem, "pub_id") %><br>
              <b>Price: </b>
              <input id="edit_price" type="text" value='<%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %>' runat="server"/>
              <p>
              <asp:linkbutton id="UpdateBtn" CommandName="Update" runat="server"><img border="0" src="/quickstart/aspplus/images/update_book.gif" ></asp:linkbutton>
              <asp:linkbutton id="CancelBtn" CommandName="Cancel" runat="server"><img border="0" src="/quickstart/aspplus/images/cancel_book.gif" ></asp:linkbutton>
            </td>
          </tr>
        </table>

      </EditItemTemplate>

  </ASP:DataList>

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/footer.inc" -->

  </form>

  <asp:label style="font: 10pt verdana;padding:0,15,15,15" id="Message" runat="server"/>

</body>
</html>
