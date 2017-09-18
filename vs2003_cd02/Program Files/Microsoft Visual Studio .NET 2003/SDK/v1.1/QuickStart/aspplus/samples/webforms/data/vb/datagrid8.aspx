<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="Acme" %>

<html>

<script language="VB" runat="server">

    Dim MyConnection As SqlConnection
    Public StateIndex As Hashtable

    Sub Page_Load(Src As Object, E As EventArgs)

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;" & _
            "Integrated Security=SSPI")

        If Not (IsPostBack)
            BindGrid()
        End If

        StateIndex = New Hashtable()
        StateIndex("CA") = 0
        StateIndex("IN") = 1
        StateIndex("KS") = 2
        StateIndex("MD") = 3
        StateIndex("MI") = 4
        StateIndex("OR") = 5
        StateIndex("TN") = 6
        StateIndex("UT") = 7
    End Sub

    Public Function GetStateIndex(StateName As String) As Integer

        If StateIndex(stateName) <> Nothing
            Return CInt(StateIndex(stateName))
        Else
            Return 0
        End If
    End Function

    Sub MyDataGrid_Edit(Sender As Object, E As DataGridCommandEventArgs)

        MyDataGrid.EditItemIndex = CInt(E.Item.ItemIndex)
        BindGrid()
    End Sub

    Sub MyDataGrid_Cancel(Sender As Object, E As DataGridCommandEventArgs)

        MyDataGrid.EditItemIndex = -1
        BindGrid()
    End Sub

    Sub MyDataGrid_Update(Sender As Object, E As DataGridCommandEventArgs)

        Dim DS As DataSet
        Dim MyCommand As SqlCommand

        Dim UpdateCmd As String = "UPDATE Authors SET au_id = @Id, au_lname = @LName, " & _
             "au_fname = @FName, phone = @Phone, address = @Address, city = @City, " & _
             "state = @State, zip = @Zip, contract = @Contract where au_id = @Id"

        MyCommand = New SqlCommand(UpdateCmd, MyConnection)

        MyCommand.Parameters.Add(New SqlParameter("@Id", SqlDbType.NVarChar, 11))
        MyCommand.Parameters.Add(New SqlParameter("@LName", SqlDbType.NVarChar, 40))
        MyCommand.Parameters.Add(New SqlParameter("@FName", SqlDbType.NVarChar, 20))
        MyCommand.Parameters.Add(New SqlParameter("@Phone", SqlDbType.NChar, 12))
        MyCommand.Parameters.Add(New SqlParameter("@Address", SqlDbType.NVarChar, 40))
        MyCommand.Parameters.Add(New SqlParameter("@City", SqlDbType.NVarChar, 20))
        MyCommand.Parameters.Add(New SqlParameter("@State", SqlDbType.NChar, 2))
        MyCommand.Parameters.Add(New SqlParameter("@Zip", SqlDbType.NChar, 5))
        MyCommand.Parameters.Add(New SqlParameter("@Contract", SqlDbType.NVarChar,1))

        MyCommand.Parameters("@Id").Value = MyDataGrid.DataKeys(CInt(E.Item.ItemIndex))

        Dim Cols As String() = {"LName","FName","Phone","Address","City","Zip"}
        Message.InnerHtml = ""

        Dim I As Integer
        For I = 0 To 5

            Dim CurrentTextBox As System.Web.UI.WebControls.TextBox
            CurrentTextBox = E.Item.FindControl("edit_" & Cols(I))
            Dim ColValue As String = CurrentTextBox.Text

            ' check for invalid values
            Select Case Cols(i)
                Case "LName"
                    If Not InputValidator.IsValidAnsiName(colvalue)
                        Message.InnerHtml &= "ERROR: Last Name - " & InputValidator.AnsiNameErrorString & "<br>"
                    End If
                Case "FName"
                    If Not InputValidator.IsValidAnsiName(colvalue)
                        Message.InnerHtml &= "ERROR: First Name - " & InputValidator.AnsiNameErrorString & "<br>"
                    End If
                Case "Phone"
                    If Not InputValidator.IsValidAnsiPhoneNumber(colvalue)
                        Message.InnerHtml &= "ERROR: Phone - " & InputValidator.AnsiPhoneErrorString & "<br>"
                    End If
                Case "Address"
                    If Not InputValidator.IsValidAnsiAddress(colvalue)
                        Message.InnerHtml &= "ERROR: Address - " & InputValidator.AnsiAddressErrorString & "<br>"
                    End If
                Case "City"
                    If Not InputValidator.IsValidAnsiCityOrState(colvalue)
                        Message.InnerHtml &= "ERROR: City - " & InputValidator.AnsiCityStateErrorString & "<br>"
                    End If
                Case "Zip"
                    If Not InputValidator.IsValidFiveDigitZipCode(colvalue)
                        Message.InnerHtml &= "ERROR: Zip Code - " & InputValidator.AnsiBasicZipCodeErrorString & "<br>"
                    End If
            End Select

            ' Check for null values in required fields
            If ColValue = ""
                Message.InnerHtml &= "ERROR: Null values not allowed for " & Cols(i-1) & "<br>"
            End If

            MyCommand.Parameters("@" & Cols(I)).Value = ColValue
        Next

        If Message.InnerHtml <> ""
            Message.Style("color") = "red"
            Return
        End If

        Dim StateDropDownList As DropDownList
        StateDropDownList = E.Item.FindControl("edit_State")
        MyCommand.Parameters("@State").Value = StateDropDownList.SelectedItem.ToString()

        Dim ContractCheckBox As CheckBox
        ContractCheckBox = E.Item.FindControl("edit_Contract")

        If ContractCheckBox.Checked = true
            MyCommand.Parameters("@Contract").Value = "1"
        Else
            MyCommand.Parameters("@Contract").Value = "0"
        End If

        MyCommand.Connection.Open()

        Try
            MyCommand.ExecuteNonQuery()
            Message.InnerHtml = "<b>Record Updated</b><br>" & UpdateCmd
            MyDataGrid.EditItemIndex = -1
        Catch Exp As SqlException
            If Exp.Number = 2627
                Message.InnerHtml = "ERROR: A record already exists with " & _
                    "the same primary key"
            Else
                Message.InnerHtml = "ERROR: Could not update record, " & _
                    "please ensure the fields are correctly filled out"
            End If
            Message.Style("color") = "red"
        End Try

        MyCommand.Connection.Close()

        BindGrid()
    End Sub

    Sub BindGrid()

        Dim DS As DataSet
        Dim MyCommand As SqlDataAdapter
        MyCommand = new SqlDataAdapter("select * from Authors", MyConnection)

        DS = new DataSet()
        MyCommand.Fill(DS, "Authors")

        MyDataGrid.DataSource=DS.Tables("Authors").DefaultView
        MyDataGrid.DataBind()
    End Sub

</script>

<body style="font: 10pt verdana">

  <form runat="server">

    <h3><font face="Verdana">Updating a Row of Data w/ Templated Column</font></h3>

    <span id="Message" EnableViewState="false" style="font: arial 11pt;" runat="server"/><p>

    <ASP:DataGrid id="MyDataGrid" runat="server"
      Width="800"
      BackColor="#ccccff"
      BorderColor="black"
      ShowFooter="false"
      CellPadding=3
      CellSpacing="0"
      Font-Name="Verdana"
      Font-Size="8pt"
      HeaderStyle-BackColor="#aaaadd"
      OnEditCommand="MyDataGrid_Edit"
      OnCancelCommand="MyDataGrid_Cancel"
      OnUpdateCommand="MyDataGrid_Update"
      DataKeyField="au_id"
      AutoGenerateColumns="false"
    >

      <Columns>
        <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" 
            UpdateText="Update"  ItemStyle-Wrap="false"/>
        <asp:BoundColumn HeaderText="au_id" SortExpression="au_id" 
            ReadOnly="True" DataField="au_id" ItemStyle-Wrap="false"/>
        <asp:TemplateColumn HeaderText="au_lname" SortExpression="au_lname">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_LName" 
                Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="au_fname" SortExpression="au_fname">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_FName" 
                Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="phone" SortExpression="phone">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_Phone" 
                Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="address" SortExpression="address">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "address") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_Address" 
                Text='<%# DataBinder.Eval(Container.DataItem, "address") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="city" SortExpression="city">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "city") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_City" 
                Text='<%# DataBinder.Eval(Container.DataItem, "city") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="state" SortExpression="state">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "state") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:DropDownList runat="server" 
                SelectedIndex='<%# GetStateIndex(Container.DataItem("state")) %>' 
                id="edit_State">
                  <asp:ListItem>CA</asp:ListItem>
                  <asp:ListItem>IN</asp:ListItem>
                  <asp:ListItem>KS</asp:ListItem>
                  <asp:ListItem>MD</asp:ListItem>
                  <asp:ListItem>MI</asp:ListItem>
                  <asp:ListItem>OR</asp:ListItem>
                  <asp:ListItem>TN</asp:ListItem>
                  <asp:ListItem>UT</asp:ListItem>
            </asp:DropDownList>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="zip" SortExpression="zip">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "zip") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" id="edit_Zip" 
                Text='<%# DataBinder.Eval(Container.DataItem, "zip") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="contract" SortExpression="contract">
          <ItemTemplate>
            <asp:Label runat="server" 
                Text='<%# DataBinder.Eval(Container.DataItem, "contract", "{0}") %>'/>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:CheckBox runat="server" id="edit_Contract" 
                Checked='<%# DataBinder.Eval(Container.DataItem, "contract") %>'/>
          </EditItemTemplate>
        </asp:TemplateColumn>
      </Columns>

    </ASP:DataGrid>

  </form>

</body>
</html>
