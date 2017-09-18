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

  <ASP:DataList id="MyDataList" RepeatColumns="2" RepeatDirection="Horizontal" runat="server">

      <ItemTemplate>

        <div style="padding:15,15,15,15;font-size:10pt;font-family:Verdana">

          <div style="font:12pt verdana;color:darkred">
            <i><b><%# DataBinder.Eval(Container.DataItem, "title") %></i></b>
          </div>

          <br>

          <b>Title ID: </b><%# DataBinder.Eval(Container.DataItem, "title_id") %><br>
          <b>Category: </b><%# DataBinder.Eval(Container.DataItem, "type") %><br>
          <b>Publisher ID: </b><%# DataBinder.Eval(Container.DataItem, "pub_id") %><br>
          <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %><p>

        </div>

      </ItemTemplate>

  </ASP:DataList>

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/footer.inc" -->

</body>
</html>
