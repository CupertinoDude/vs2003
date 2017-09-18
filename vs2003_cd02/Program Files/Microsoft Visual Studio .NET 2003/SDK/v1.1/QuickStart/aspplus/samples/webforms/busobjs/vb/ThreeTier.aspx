<%@ Page ClientTarget="DownLevel"%>
<%@ Import Namespace="BusinessLayer" %>

<html>

<script language="VB" runat="server">

  Sub Page_Load(Sender As Object, E As EventArgs)

    If Not (IsPostBack)

      Dim Bus As BusObjVB
      Bus = New BusObjVB()
      Categories.DataSource = Bus.GetCategories()
      Categories.DataBind()
    End If
  End Sub

  Sub Submit_Click(Sender As Object, E As EventArgs)

    If (Page.IsValid)

      Dim Id As Integer = 0
      If Not (CustomerId.Text = "")
        Id = CInt(CustomerId.Text)
      End If

      Dim Bus As BusObjVB
      Bus = new BusObjVB()
      Products.DataSource = Bus.GetProductsForCategory(Categories.SelectedItem.Value,Id)
    End If

    Products.DataBind()
  End Sub

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