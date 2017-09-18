<%@ Page CodeBehind="datalist1.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Customize.Vb.datalist1" %>

<html>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/header.inc" -->

  <ASP:Repeater id="MyRepeater" runat="server">

      <HeaderTemplate>

        <table width="100%" style="font: 8pt verdana">
          <tr style="background-color:DFA894">
            <th>
              Title
            </th>
            <th>
              Title ID
            </th>
            <th>
              Type
            </th>
            <th>
              Publisher ID
            </th>
            <th>
              Price
            </th>
          </tr>

      </HeaderTemplate>

      <ItemTemplate>

        <tr style="background-color:FFECD8">
          <td>
            <%# DataBinder.Eval(Container.DataItem, "title") %>
          </td>
          <td>
            <%# DataBinder.Eval(Container.DataItem, "title_id") %>
          </td>
          <td>
            <%# DataBinder.Eval(Container.DataItem, "type") %>
          </td>
          <td>
            <%# DataBinder.Eval(Container.DataItem, "pub_id") %>
          </td>
          <td>
            <%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %>
          </td>
        </tr>

      </ItemTemplate>

      <FooterTemplate>

        </table>

      </FooterTemplate>

  </ASP:Repeater>

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/footer.inc" -->

</body>
</html>
