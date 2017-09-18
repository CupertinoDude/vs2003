<%@ Import Namespace="DataLayer" %>

<html>

<script language="C#" runat="server">

  public void Page_Load(Object sender, EventArgs E)
  {
    if (!IsPostBack)
    {
      DataObj data = new DataObj("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
      Categories.DataSource = data.GetCategories();
      Categories.DataBind();
    }
  }

  public void Submit_Click(Object sender, EventArgs E)
  {
    DataObj data = new DataObj("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
    Products.DataSource = data.GetProductsForCategory(Categories.SelectedItem.Value);
    Products.DataBind();
  }

</script>

<body style="font: 10pt verdana" bgcolor="ffffcc">

  <form runat="server">

  <h3>A Simple Two-Tier WebForm</h3>

  Select a Category:

  <ASP:DropDownList id="Categories" DataValueField="CategoryName" runat="server"/>

  <input type="Submit" OnServerClick="Submit_Click" Value="Get Products" runat="server"/><p>

  <ASP:DataList id="Products" ShowHeader=false ShowFooter=false RepeatColumns="2" RepeatDirection="horizontal" BorderWidth=0 runat="server">

    <ItemTemplate>
      <table>
        <tr>
          <td width="150" style="text-align:center; font-size:8pt; vertical-align:top; height:200">
            <ASP:ImageButton borderwidth=6 bordercolor="#ffffcc" command="Select" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ImagePath") %>' runat="server"/>
            <p>
            <%# DataBinder.Eval(Container.DataItem, "ProductName") %> <br>
            <%# DataBinder.Eval(Container.DataItem, "UnitPrice", "{0:C}").ToString() %>
          </td>
        </tr>
      </table>
    </ItemTemplate>

  </ASP:DataList>

  </form>

</body>
</html>