<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="Acme" %>

<html>

<script language="VB" runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs)
        If Not Request.QueryString("titleid") Is Nothing
            If InputValidator.IsSafeText(Request.QueryString("titleid"))
                Dim DS As DataSet
                Dim MyConnection As SqlConnection
                Dim MyCommand As SqlDataAdapter

                Dim Query As String
                Query = "select * from Titles where title_id = '" & Request.QueryString("titleid") & "'"

                MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
                MyCommand = New SqlDataAdapter(Query, MyConnection)

                DS = New DataSet()
                MyCommand.Fill(DS, "Titles")

                MyDataList.DataSource = DS.Tables("Titles").DefaultView
                MyDataList.DataBind()
            End If
        End If
    End Sub


    Sub Submit_Click(Src As Object, E As EventArgs)

        Message.InnerHtml = "<h2>Purchase Made!!!</h2>"
    End Sub

</script>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/header.inc" -->

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
            <tr><td><b>Name: </b></td><td><input size="30" type="text" runat="server"></td></tr>
            <tr><td><b>Mailing Address: </b></td><td><input size="50" type="text" runat="server"></td></tr>
            <tr><td><b>Account Number: </b></td><td><input size="10" type="text" runat="server"></td></tr>
          </table>
          <p>
          <input type="submit" value="Purchase" runat="server" OnServerClick="Submit_Click"/>
          <p>

        </td>
      </tr>

    </table>

    <div style="font: 10pt verdana;padding:0,15,15,15" id="Message" runat="server"/>

  </form>

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/footer.inc" -->

</body>
</html>
