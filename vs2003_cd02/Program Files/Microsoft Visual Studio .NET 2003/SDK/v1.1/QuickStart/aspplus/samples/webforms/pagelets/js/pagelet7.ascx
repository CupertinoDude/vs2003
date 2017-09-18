<%@ Control ClassName="Pagelet7JS" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="JScript" runat="server">

    private var _category : String = "";

    public function get Category() : String  {
        return _category;
    }

    public function set Category(value : String) {
          _category = value;
          var myConnection : SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
          var myCommand : SqlDataAdapter = new SqlDataAdapter("select * from Titles where type='" + _category + "'", myConnection);

          var ds : DataSet = new DataSet();
          myCommand.Fill(ds, "Titles");

          MyDataList.DataSource = ds.Tables("Titles").DefaultView;
          MyDataList.DataBind();
    }

</script>

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
