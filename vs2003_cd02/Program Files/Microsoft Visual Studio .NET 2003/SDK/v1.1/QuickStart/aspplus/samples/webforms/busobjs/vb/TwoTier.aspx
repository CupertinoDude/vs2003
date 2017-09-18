<%@ Import Namespace="DataLayer" %>

<html>

<script language="VB" runat="server">

  Sub Page_Load(Sender As Object, E As EventArgs)

    If Not (Page.IsPostBack)
      Dim Data As DataObjVB
      Data = New DataObjVB("server=(local)\NetSDK;database=grocertogo;Integrated Security=SSPI")
      Categories.DataSource = Data.GetCategories()
      Categories.DataBind()
    End If
  End Sub

  Sub Submit_Click(Sender As Object, E As EventArgs)

    Dim Data As DataObjVB
    Data = New DataObjVB("server=(local)\NetSDK;database=grocertogo;Integrated Security=SSPI")
    Products.DataSource = Data.GetProductsForCategory(Categories.SelectedItem.Value)
    Products.DataBind()
  End Sub

</script>

<body style="font: 10pt verdana" bgcolor="ffffcc">

  <form runat="server">

  <h3>A Simple Two-Tier Web Form</h3>

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