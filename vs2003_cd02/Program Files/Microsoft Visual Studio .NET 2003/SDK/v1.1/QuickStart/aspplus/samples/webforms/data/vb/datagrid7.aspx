<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Acme" %>

<html>

<script language="VB" runat="server">

    Dim MyConnection As SqlConnection

    Sub Page_Load(Sender As Object, E As EventArgs)

        MyConnection = New _
            SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

        If Not (IsPostBack)
            BindGrid()
        End If
    End Sub

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

        Dim UpdateCmd As String = "UPDATE Authors SET au_id = @Id, " & _
            "au_lname = @LName, au_fname = @FName, phone = @Phone, " & _
            "address = @Address, city = @City, state = @State, zip = @Zip, " & _
            "contract = @Contract where au_id = @Id"

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

        Dim Cols As String() = {"@Id","@LName","@FName","@Phone", _
            "@Address","@City","@State","@Zip","@Contract"}

        Dim NumCols As Integer = E.Item.Cells.Count
        Message.InnerHtml = ""

        Dim I As Integer
        For I=2 To NumCols-2 'skip first, second and last column

            Dim CurrentTextBox As System.Web.UI.WebControls.TextBox
            CurrentTextBox = E.Item.Cells(I).Controls(0)
            Dim ColValue As String = CurrentTextBox.Text

            ' check for invalid values
            Select Case Cols(i-1)
                Case "@LName"
                    If Not InputValidator.IsValidAnsiName(colvalue)
                        Message.InnerHtml &= "ERROR: Last Name - " & InputValidator.AnsiNameErrorString & "<br>"
                    End If
                Case "@FName"
                    If Not InputValidator.IsValidAnsiName(colvalue)
                        Message.InnerHtml &= "ERROR: First Name - " & InputValidator.AnsiNameErrorString & "<br>"
                    End If
                Case "@Phone"
                    If Not InputValidator.IsValidAnsiPhoneNumber(colvalue)
                        Message.InnerHtml &= "ERROR: Phone - " & InputValidator.AnsiPhoneErrorString & "<br>"
                    End If
                Case "@Address"
                    If Not InputValidator.IsValidAnsiAddress(colvalue)
                        Message.InnerHtml &= "ERROR: Address - " & InputValidator.AnsiAddressErrorString & "<br>"
                    End If
                Case "@City"
                    If Not InputValidator.IsValidAnsiCityOrState(colvalue)
                        Message.InnerHtml &= "ERROR: City - " & InputValidator.AnsiCityStateErrorString & "<br>"
                    End If
                Case "@State"
                    If Not InputValidator.IsValidAnsiTwoCharacterState(colvalue)
                        Message.InnerHtml &= "ERROR: State - " & InputValidator.AnsiTwoCharacterStateErrorString & "<br>"
                    End If
                Case "@Zip"
                    If Not InputValidator.IsValidFiveDigitZipCode(colvalue)
                        Message.InnerHtml &= "ERROR: Zip Code - " & InputValidator.AnsiBasicZipCodeErrorString & "<br>"
                    End If
            End Select

            ' Check for null values in required fields
            If I<6 And ColValue = ""
                Message.InnerHtml &= "ERROR: Null values not allowed for " & Cols(i-1) & "<br>"
            End If

            MyCommand.Parameters(Cols(I-1)).Value = ColValue
        Next

        If Message.InnerHtml <> ""
            Message.Style("color") = "red"
            Return
        End If

        ' Append last row, converting true/false values to 0/1
        Dim ContractTextBox As System.Web.UI.WebControls.TextBox
        ContractTextBox = E.Item.Cells(NumCols-1).Controls(0)
        If ContractTextBox.Text.ToLower(CultureInfo.InvariantCulture) = "true"
            MyCommand.Parameters("@Contract").Value =  "1"
        Else
            MyCommand.Parameters("@Contract").Value =  "0"
        End If

        MyCommand.Connection.Open()

        Try
            MyCommand.ExecuteNonQuery()
            Message.InnerHtml = "<b>Record Updated</b><br>" & UpdateCmd.ToString()
            MyDataGrid.EditItemIndex = -1
        Catch Exp As SQLException
            If Exp.Number = 2627
                Message.InnerHtml = "ERROR: A record already exists with " & _
                    "the same primary key"
            Else
                Message.InnerHtml = "ERROR: Could not update record, please " & _
                    "ensure the fields are correctly filled out"
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

    <h3><font face="Verdana">Updating a Row of Data w/ Read-Only Column</font></h3>

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
            UpdateText="Update" ItemStyle-Wrap="false"/>
        <asp:BoundColumn HeaderText="au_id" SortExpression="au_id" 
            ReadOnly="True" DataField="au_id" ItemStyle-Wrap="false"/>
        <asp:BoundColumn HeaderText="au_lname" SortExpression="au_lname"
            DataField="au_lname"/>
        <asp:BoundColumn HeaderText="au_fname" SortExpression="au_fname" 
            DataField="au_fname"/>
        <asp:BoundColumn HeaderText="phone" SortExpression="phone" DataField="phone"/>
        <asp:BoundColumn HeaderText="address" SortExpression="address" 
            DataField="address"/>
        <asp:BoundColumn HeaderText="city" SortExpression="city" DataField="city"/>
        <asp:BoundColumn HeaderText="state" SortExpression="state" DataField="state"/>
        <asp:BoundColumn HeaderText="zip" SortExpression="zip" DataField="zip"/>
        <asp:BoundColumn HeaderText="contract" SortExpression="contract" 
            DataField="contract"/>
      </Columns>

    </ASP:DataGrid>

  </form>

</body>
</html>
