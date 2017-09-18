<%@ Control CodeBehind="pagelet7.ascx.cs" Language="c#" AutoEventWireup="false" Inherits="Pagelets.Cs.UserControls.pagelet7"%>
<span style="font: 12pt verdana">Category: <%=Category%></span>

<ASP:DataList id="MyDataList" BorderWidth="0" RepeatColumns="2" runat="server">

    <ItemTemplate>

      <table cellpadding=10 style="font: 10pt verdana">
        <tr>
          <td valign="top">
            <img align="top" src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>' >
          </td>
          <td valign="top">
            <b>Title: </b><%# DataBinder.Eval(Container.DataItem, "title") %><br>
            <b>Category: </b><%# DataBinder.Eval(Container.DataItem, "type") %><br>
            <b>Publisher ID: </b><%# DataBinder.Eval(Container.DataItem, "pub_id") %><br>
            <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %>
          </td>
        </tr>
      </table>

    </ItemTemplate>

</ASP:DataList>