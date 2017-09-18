<%@ Page CodeBehind="datalist8.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Customize.Vb.datalist8" %>

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
              <asp:CheckBox id="Save" runat="server"/> <b>Save to Favorites</b>
            </td>
          </tr>
        </table>

      </ItemTemplate>

  </ASP:DataList>

  <p>

  <div style="padding:0,15,0,15">
      <input id="SubmitBtn" type="submit" Value="Update Favorites" runat="server"/>
  </div>

  <p>

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/footer.inc" -->

  </form>

  <asp:label style="font: 10pt verdana" EnableViewState="false" id="Message" runat="server"/>

</body>
</html>
