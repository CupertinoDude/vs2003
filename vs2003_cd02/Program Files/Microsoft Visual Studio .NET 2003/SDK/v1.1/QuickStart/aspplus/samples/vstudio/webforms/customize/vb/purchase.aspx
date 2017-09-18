<%@ Page CodeBehind="purchase.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Customize.Vb.purchase" %>

<html>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/header.inc" -->

  <form runat="server">

    <table>
      <tr>
        <td valign="top">

          <ASP:DataList id="MyDataList" runat="server">

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
                      <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %><br>
                    </td>
                  </tr>
                </table>

              </ItemTemplate>

          </ASP:DataList>

        </td>
        <td valign="top" style="padding-top:15;font: 10pt verdana">

          Thank you for your business!  Please complete the form below to confirm your purchase.
          <p>
          <table style="font: 10pt verdana" cellpadding="3">
            <tr><td><b>Name: </b></td><td><input id="txtName" size="30" type="text" runat="server"></td></tr>
            <tr><td><b>Mailing Address: </b></td><td><input id="txtAddress" size="50" type="text" runat="server"></td></tr>
            <tr><td><b>Account Number: </b></td><td><input id="txtAccountNum" size="10" type="text" runat="server"></td></tr>
          </table>
          <p>
          <input id="SubmitBtn" type="submit" value="Purchase" runat="server"/>
          <p>

        </td>
      </tr>

    </table>

    <asp:Label style="font: 10pt verdana;padding:0,15,15,15" id="Message" runat="server"/>

  </form>

  <!-- #include virtual="/quickstart/aspplus/samples/vstudio/webforms/customize/footer.inc" -->

</body>
</html>
