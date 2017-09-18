<%@ Page Trace="true" %>

<%@ Import NameSpace="System.Data" %>
<%@ Import NameSpace="System.Data.SqlClient" %>


<html>

<script language="VB" runat="server">

  Sub Page_Load(Sender As Object, E As EventArgs)

    If Not (IsPostBack)

      Dim MyConnection As SqlConnection
      Dim MyCommand As SqlDataAdapter    

      MyConnection = New SqlConnection("server=(local)\NetSDK;database=grocertogo;Integrated Security=SSPI")
      MyCommand = New SqlDataAdapter("select distinct CategoryName from Categories", MyConnection)

      Dim DS As New DataSet
      MyCommand.Fill(DS, "Categories")

      Categories.DataSource = ds.Tables("Categories").DefaultView
      Categories.DataBind
    End If
  End Sub

  Sub Submit_Click(Sender As Object, E As EventArgs)

    Dim MyConnection As SqlConnection
    Dim MyCommand As SqlDataAdapter

    MyConnection = New SqlConnection("server=(local)\NetSDK;database=grocertogo;Integrated Security=SSPI")
    MyCommand = New SqlDataAdapter("select ProductName, ImagePath, UnitPrice, c.CategoryId  from Products p, Categories c where c.CategoryName='" & Categories.SelectedItem.Value & "' and p.CategoryId = c.CategoryId", MyConnection)

    Dim DS As New DataSet
    MyCommand.Fill(DS, "Products")

    Products.DataSource = ds.Tables("Products").DefaultView
    Products.DataBind()
  End Sub

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