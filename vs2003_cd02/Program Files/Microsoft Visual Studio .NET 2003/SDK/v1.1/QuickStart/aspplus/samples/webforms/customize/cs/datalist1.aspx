<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="C#" runat="server">

    void Page_Load(Object semder, EventArgs e) {

        SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
        SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles", myConnection);

        DataSet ds = new DataSet();
        myCommand.Fill(ds, "Titles");

        MyRepeater.DataSource = ds.Tables["Titles"].DefaultView;
        MyRepeater.DataBind();
    }

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
