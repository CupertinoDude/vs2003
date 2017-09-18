<%@ Page Trace="true" %>

<%@ Import NameSpace="System.Data" %>
<%@ Import NameSpace="System.Data.SqlClient" %>


<html>

<script language="C#" runat="server">

  public void Page_Load(Object sender, EventArgs E)
  {
    if (!IsPostBack)
    {
      SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
      SqlDataAdapter myCommand = new SqlDataAdapter("select distinct CategoryName from Categories", myConnection);

      DataSet ds = new DataSet();
      myCommand.Fill(ds, "Categories");

      Categories.DataSource = ds.Tables["Categories"].DefaultView;
      Categories.DataBind();
    }
  }

  public void Submit_Click(Object sender, EventArgs E)
  {
    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=grocertogo;Integrated Security=SSPI");
    SqlDataAdapter myCommand = new SqlDataAdapter("select ProductName, ImagePath, UnitPrice, c.CategoryId  from Products p, Categories c where c.CategoryName='" + Categories.SelectedItem.Value + "' and p.CategoryId = c.CategoryId", myConnection);

    DataSet ds = new DataSet();
    myCommand.Fill(ds, "Products");

    Products.DataSource = ds.Tables["Products"].DefaultView;
    Products.DataBind();
  }

</script>

<body style="font: 10pt verdana" bgcolor="ffffcc">

  <form runat="server">

  <h3>Enabling Trace Ouput for a Page</h3>

  Select a Category:

  <asp:DropDownList id="Categories" DataValueField="CategoryName" runat="server"/>

  <input type="Submit" OnServerClick="Submit_Click" Value="Get Products" runat="server"/><p>

  <asp:DataList id="Products" ShowHeader=false ShowFooter=false RepeatDirection="horizontal" BorderWidth=0 runat="server">

    <ItemTemplate>
      <table>
        <tr>
          <td width="150" style="text-align:center; font-size:8pt; vertical-align:top; height:200">
            <asp:ImageButton borderwidth=6 bordercolor="#ffffcc" command="Select" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ImagePath") %>' runat="server"/>
            <p>
            <%# DataBinder.Eval(Container.DataItem, "ProductName") %> <br>
            <%# DataBinder.Eval(Container.DataItem, "UnitPrice", "{0:C}").ToString() %>
          </td>
        </tr>
      </table>
    </ItemTemplate>

  </asp:DataList>

  </form>

</body>
</html>