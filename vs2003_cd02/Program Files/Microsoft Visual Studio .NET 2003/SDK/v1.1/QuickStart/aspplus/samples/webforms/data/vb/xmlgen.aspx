<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<head>

    <script language="VB" runat="server">
        Dim Source As DataView
        Dim ds As DataSet
        Dim GetSchemaChecked As Boolean
        Dim GetDataChecked As Boolean

        Shared originalString As String = "server=(local)\NetSDK;database=;Integrated Security=SSPI" 
        Dim connectString As String = originalString
        Dim selectString As String = ""
        
        Dim tables(4) As Object
        
        Public Sub Page_Load(sender As Object, e As EventArgs)
            If tables(0) Is Nothing
                tables(0) = New String() {"authors", "discounts", "employee", "jobs", "publishers", "sales", "stores", "titleauthor", "titles"}
                tables(1) = New String() {"Categories", "Customers", "Employees", "Orders", "Products", "Region", "Shippers", "Suppliers", "Territories"}
                tables(2) = New String() {"Categories", "Customers", "ProductDetails", "Products"}
                tables(3) = New String() {"Modules", "Personalization", "SiteDirectory", "UserData"}
            End If

            If Not IsPostBack
                database_SelectedIndexChanged(database, Nothing)
            End If
            
            Init()
        End Sub

        Private Sub Init()
            connectString = originalString.Replace("database=", "database=" + database.SelectedItem.Text)
            selectString = "select * from " & table.SelectedItem.Text
            
            connect.Text = connectString
            query.Text = selectString
        End Sub
        
        Public Sub database_SelectedIndexChanged(sender As Object, e As EventArgs)
            table.DataSource = tables(database.SelectedIndex)
            table.DataBind()

            Init()
        End Sub
        
        Public Sub table_SelectedIndexChanged(sender As Object, e As EventArgs)
            Init()
        End Sub

        Public Sub Submit_Click(sender As Object, e As EventArgs)
            If IsPostBack
                If table.SelectedIndex > -1 AndAlso database.SelectedIndex > -1
                    Dim myConnection As New SqlConnection(connectString)
                    Dim myCommand As New SqlDataAdapter(selectString, myConnection)

                    ds = New DataSet()
                    myCommand.Fill(ds, "Table")

                    Source = New DataView(ds.Tables(0))

                    GetSchemaChecked = GetSchema.Checked
                    GetDataChecked = GetData.Checked

                    MyDataGrid.DataSource=Source
                    MyDataGrid.DataBind()
                End If
            End If
         End Sub

    </script>

</head>
<body bgcolor="ffffcc">

    <h3><font face="Verdana">SQL to XML Generator</font></h3>

    <form runat="server">

        <table border=0 cellpadding=5 style="font:10pt verdana">
        <tr>
          <td colspan="2">
            <b>Connect String:</b><br>
            <asp:Label runat="server" id="connect" />
          </td>
        </tr>
        <tr>
          <td>
            <b>Table Properties</b><br>
            Database:<br>
            Table:
          </td>
          <td>
            <br>
            <asp:DropDownList
             runat="server"
             id="database"
             AutoPostBack="true"
             OnSelectedIndexChanged="database_SelectedIndexChanged">
              <asp:ListItem>Pubs</asp:ListItem>
              <asp:ListItem>Northwind</asp:ListItem>
              <asp:ListItem>GrocerToGo</asp:ListItem>
              <asp:ListItem>Portal</asp:ListItem>
            </asp:DropDownList><br>
            <asp:DropDownList
             runat="server"
             id="table"
             AutoPostBack="true"
             OnSelectedIndexChanged="table_SelectedIndexChanged" />
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <b>Query:</b><br>
            <asp:Label runat="server" id="query" />
          </td>
        <tr>
          <td>
            <input type="radio" id="GetSchema" name="Mode" runat="server"/>Get XML Schema<br>
            <input type="radio" id="GetData" name="Mode" runat="server"/>Get XML Data<br>
            <input type="radio" id="GetBoth" name="Mode" checked runat="server"/>Get Both
          </td>
          <td valign="top">
            <input type="submit" runat="server" OnServerClick="Submit_Click">
          </td>
        </tr>
        <tr>
          <td colspan="2">

              <%  If Page.IsPostBack AndAlso Not DS Is Nothing %>
                  <b>Result:</b><br>
                  <textarea cols=80 rows=25>
              <%
                  If GetSchemaChecked
                      DS.WriteXmlSchema(Response.Output)
                  Else If GetDataChecked
                      DS.WriteXml(Response.Output, XmlWriteMode.IgnoreSchema)
                  Else
                      DS.WriteXml(Response.Output, XmlWriteMode.WriteSchema)
                  End If
              %>
                  </textarea>
              <%  End If  %>

          </td>
        </tr>
        <tr>
          <td colspan="2">

              <%  If Page.IsPostBack AndAlso Not DS Is Nothing %>
                  <b>Data:</b><br>
              <%  End If  %>

              <ASP:DataGrid id="MyDataGrid"
                BackColor="#EDBE7B"
                BorderColor="black"
                ShowFooter="false"
                CellPadding=3
                CellSpacing="0"
                Font-Name="Verdana"
                Font-Size="8pt"
                HeaderStyle-BackColor="#DC6035"
                EnableViewState="false"
                runat="server"
              />

          </td>
        <tr>
        </table>

    </form>

</body>
</html>

