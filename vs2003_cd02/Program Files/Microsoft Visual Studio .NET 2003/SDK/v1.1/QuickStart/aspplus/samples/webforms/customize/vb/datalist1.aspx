<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="VB" runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs)

        Dim DS As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
        MyCommand = New SqlDataAdapter("select * from Titles", MyConnection)

        DS = New DataSet()
        MyCommand.Fill(DS, "Titles")

        MyRepeater.DataSource = DS.Tables("Titles").DefaultView
        MyRepeater.DataBind()
    End Sub

</script>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/header.inc" -->

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

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/footer.inc" -->

</body>
</html>
