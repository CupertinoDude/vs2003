<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="C#" runat="server">

    void Page_Load(Object sender, EventArgs e) {

        SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
        SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles", myConnection);

        DataSet ds = new DataSet();
        myCommand.Fill(ds, "Titles");

        MyDataList.DataSource = ds.Tables["Titles"].DefaultView;
        MyDataList.DataBind();
    }

</script>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/header.inc" -->

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

              <a href='<%# DataBinder.Eval(Container.DataItem, "title_id", "purchase.aspx?titleid={0}") %>' >
                <img border="0" src="/quickstart/aspplus/images/purchase_book.gif" >
              </a>

            </td>
          </tr>
        </table>

      </ItemTemplate>

  </ASP:DataList>

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/footer.inc" -->

</body>
</html>
