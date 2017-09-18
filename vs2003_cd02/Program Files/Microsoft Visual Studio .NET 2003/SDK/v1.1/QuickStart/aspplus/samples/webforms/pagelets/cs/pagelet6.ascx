<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">

    void Page_Load(Object Src, EventArgs e) {

        if (!Page.IsPostBack) {

          SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
          SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type='" + Category.SelectedItem.Value + "'", myConnection);

          DataSet ds = new DataSet();
          myCommand.Fill(ds, "Titles");

          MyDataList.DataSource = ds.Tables["Titles"].DefaultView;
          MyDataList.DataBind();
       }
    }

    void Category_Select(Object sender, EventArgs e) {

      SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
      SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type='" + Category.SelectedItem.Value + "'", myConnection);

      DataSet ds = new DataSet();
      myCommand.Fill(ds, "Titles");

      MyDataList.DataSource = ds.Tables["Titles"].DefaultView;
      MyDataList.DataBind();
    }

</script>

<table style="font: 10pt verdana">
  <tr>
    <td><b>Select a Category:</b></td>
    <td style="padding-left:15">
      <ASP:DropDownList AutoPostBack="true" id="Category" OnSelectedIndexChanged="Category_Select" runat="server">
        <ASP:ListItem value="business">Business</ASP:ListItem>
        <ASP:ListItem value="trad_cook">Traditional Cooking</ASP:ListItem>
        <ASP:ListItem value="mod_cook">Modern Cooking</ASP:ListItem>
      </ASP:DropDownList>
    </td>
  </tr>
</table>

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
