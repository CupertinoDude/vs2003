<%@ Page ClientTarget="DownLevel"%>
<%@ Import Namespace="BusinessLayer" %>

<html>

<script language="C#" runat="server">

  public void Page_Load(Object sender, EventArgs E)
  {
    if (!IsPostBack)
    {
      BusObj bus = new BusObj();
      Categories.DataSource = bus.GetCategories();
      Categories.DataBind();
    }
  }

  public void Submit_Click(Object sender, EventArgs E)
  {
    if (Page.IsValid)
    {
      int id = 0;
      if (CustomerId.Text != "")
        id = Int32.Parse(CustomerId.Text);

      BusObj bus = new BusObj();
      Products.DataSource = bus.GetProductsForCategory(Categories.SelectedItem.Value,id);
    }
    Products.DataBind();
  }

</script>

<body style="font: 10pt verdana" bgcolor="ffffcc">

  <form runat="server">

  <h3>A Simple Three-Tier Web Form</h3>

  Select a Category:

  <ASP:DropDownList id="Categories" DataValueField="CategoryName" runat="server"/> &nbsp;

  Preferred Customer ID:

  <ASP:TextBox id="CustomerId" Width="35" runat="server"/> &nbsp;

  <input type="Submit" OnServerClick="Submit_Click" Value="Get Products" runat="server"/>

  &nbsp;&nbsp;

  <asp:RegularExpressionValidator id="RegExValidator"
    ControlToValidate="CustomerId"
    ValidationExpression="[0-9]{2}"
    Display="Dynamic"
    Font-Name="verdana" Font-Size="10"
    runat=server>
   Customer ID must be two numeric digits
  </asp:RegularExpressionValidator>

  <p>

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