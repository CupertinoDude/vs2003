<%@ Control ClassName="Pagelet7CS" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">

    private String _category = "";

    public String Category {

      get {
        return _category;
      }
      set {
          _category = value;
          SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
          SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type='" + _category + "'", myConnection);

          DataSet ds = new DataSet();
          myCommand.Fill(ds, "Titles");

          MyDataList.DataSource = ds.Tables["Titles"].DefaultView;
          MyDataList.DataBind();
      }
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
