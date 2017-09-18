<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="Acme" %>

<html>
<script language="VB" runat="server">

    Dim MyConnection As SqlConnection

    Sub Page_Load(Sender As Object, E As EventArgs)

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

        If Not (IsPostBack)
            BindGrid()
            Page.DataBind()
        End If
    End Sub


    Sub AddAuthor_Click(Sender As Object, E As EventArgs)
        Message.InnerHtml = ""

        If (Page.IsValid)

            Dim DS As DataSet
            Dim MyCommand As SqlCommand

            Dim InsertCmd As String = "insert into Authors (au_id, au_lname, au_fname, phone, address, city, state, zip, contract) values (@Id, @LName, @FName, @Phone, @Address, @City, @State, @Zip, @Contract)"

            MyCommand = New SqlCommand(InsertCmd, MyConnection)

            MyCommand.Parameters.Add(New SqlParameter("@Id", SqlDbType.NVarChar, 11))
            MyCommand.Parameters("@Id").Value = au_id.Value

            MyCommand.Parameters.Add(New SqlParameter("@LName", SqlDbType.NVarChar, 40))
            MyCommand.Parameters("@LName").Value = au_lname.Value

            MyCommand.Parameters.Add(New SqlParameter("@FName", SqlDbType.NVarChar, 20))
            MyCommand.Parameters("@FName").Value = au_fname.Value

            MyCommand.Parameters.Add(New SqlParameter("@Phone", SqlDbType.NChar, 12))
            MyCommand.Parameters("@Phone").Value = phone.Value

            MyCommand.Parameters.Add(New SqlParameter("@Address", SqlDbType.NVarChar, 40))
            MyCommand.Parameters("@Address").Value = address.Value

            MyCommand.Parameters.Add(New SqlParameter("@City", SqlDbType.NVarChar, 20))
            MyCommand.Parameters("@City").Value = city.Value

            MyCommand.Parameters.Add(New SqlParameter("@State", SqlDbType.NChar, 2))
            MyCommand.Parameters("@State").Value = state.Value

            MyCommand.Parameters.Add(New SqlParameter("@Zip", SqlDbType.NChar, 5))
            MyCommand.Parameters("@Zip").Value = zip.Value

            MyCommand.Parameters.Add(New SqlParameter("@Contract", SqlDbType.NVarChar,1))
            MyCommand.Parameters("@Contract").Value = contract.Value

            MyCommand.Connection.Open()

            Try
                MyCommand.ExecuteNonQuery()
                Message.InnerHtml = "<b>Record Added</b><br>" & InsertCmd.ToString()
            Catch Exp As SQLException
                If Exp.Number = 2627
                    Message.InnerHtml = "ERROR: A record already exists with the same primary key"
                Else
                    Message.InnerHtml = "ERROR: Could not add record, please ensure the fields are correctly filled out"
                End If
                Message.Style("color") = "red"
            End Try

            MyCommand.Connection.Close()

        End If

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

    <h3><font face="Verdana">Inserting a Row of Data w/ Validation</font></h3>

    <table width="95%">
      <tr>
        <td valign="top">

          <ASP:DataGrid id="MyDataGrid" runat="server"
            Width="700"
            BackColor="#ccccff"
            BorderColor="black"
            ShowFooter="false"
            CellPadding=3
            CellSpacing="0"
            Font-Name="Verdana"
            Font-Size="8pt"
            HeaderStyle-BackColor="#aaaadd"
            EnableViewState="false"
          />

        </td>
        <td valign="top">

          <table style="font: 8pt verdana">
            <tr>
              <td colspan="2" bgcolor="#aaaadd" style="font:10pt verdana">Add a New Author:</td>
            </tr>
            <tr>
              <td nowrap>Author ID: </td>
              <td>
                <input type="text" id="au_id" value="000-00-0000" runat="server">
                <asp:RequiredFieldValidator id="au_idReqVal"
                    ControlToValidate="au_id"
                    Display="Static"
                    Font-Name="Verdana" Font-Size="12"
                    runat=server>
                        &nbsp;*
                </asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td nowrap>Last Name: </td>
              <td>
                <input type="text" id="au_lname" value="Doe" runat="server">
                <asp:RequiredFieldValidator id="au_lnameReqVal"
                    ControlToValidate="au_lname"
                    Display="Static"
                    Font-Name="Verdana" Font-Size="12"
                    runat=server>
                        &nbsp;*
                </asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td nowrap>First Name: </td>
              <td>
                <input type="text" id="au_fname" value="John" runat="server">
                <asp:RequiredFieldValidator id="au_fnameReqVal"
                    ControlToValidate="au_fname"
                    Display="Static"
                    Font-Name="Verdana" Font-Size="12"
                    runat=server>
                        &nbsp;*
                </asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td>Phone: </td>
              <td><nobr>
                <input type="text" id="phone" value="808 555-5555" runat="server">
                <asp:RequiredFieldValidator id="phoneReqVal"
                    ControlToValidate="phone"
                    Display="Static"
                    Font-Name="Verdana" Font-Size="12"
                    runat=server>
                        &nbsp;*
                </asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td>Address: </td>
              <td><input type="text" id="address" value="One Microsoft Way" runat="server"></td>
            </tr>
            <tr>
              <td>City: </td>
              <td><input type="text" id="city" value="Redmond" runat="server"></td>
            </tr>
            <tr>
              <td>State: </td>
              <td>
                <select id="state" runat="server">
                  <option>CA</option>
                  <option>IN</option>
                  <option>KS</option>
                  <option>MD</option>
                  <option>MI</option>
                  <option>OR</option>
                  <option>TN</option>
                  <option>UT</option>
                </select>
              </td>
            </tr>
            <tr>
              <td nowrap>Zip Code: </td>
              <td><input type="text" id="zip" value="98005" runat="server"></td>
            </tr>
            <tr>
              <td>Contract: </td>
              <td>
                <select id="contract" runat="server">
                  <option value="0">False</option>
                  <option value="1">True</option>
                </select>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="padding-top:15">
                <input type="submit" OnServerClick="AddAuthor_Click" value="Add Author" runat="server">
              </td>
            </tr>
            <tr>
              <td colspan="2" style="padding-top:15" align="center">
                <span id="Message" EnableViewState="false" style="font: arial 11pt;" runat="server"/>

                <asp:RegularExpressionValidator id="au_lnameValidator"
                  ControlToValidate="au_lname"
                  ValidationExpression='<%# InputValidator.AnsiNameExpressionString %>'
                  Display="Dynamic"
                  Font-Name="Arial" Font-Size="11"
                  runat="server">
                    * Last Name: <%# InputValidator.AnsiNameErrorString %><br>
                </asp:RegularExpressionValidator>

                <asp:RegularExpressionValidator id="au_fnameValidator"
                  ControlToValidate="au_fname"
                  ValidationExpression='<%# InputValidator.AnsiNameExpressionString %>'
                  Display="Dynamic"
                  Font-Name="Arial" Font-Size="11"
                  runat="server">
                    * First Name: <%# InputValidator.AnsiNameErrorString %><br>
                </asp:RegularExpressionValidator>

                <asp:RegularExpressionValidator id="addressValidator"
                  ControlToValidate="address"
                  ValidationExpression='<%# InputValidator.AnsiAddressExpressionString %>'
                  Display="Dynamic"
                  Font-Name="Arial" Font-Size="11"
                  runat="server">
                    * Address: <%# InputValidator.AnsiAddressErrorString %><br>
                </asp:RegularExpressionValidator>

                <asp:RegularExpressionValidator id="cityValidator"
                  ControlToValidate="city"
                  ValidationExpression='<%# InputValidator.AnsiCityStateExpressionString %>'
                  Display="Dynamic"
                  Font-Name="Arial" Font-Size="11"
                  runat="server">
                    * City: <%# InputValidator.AnsiCityStateErrorString %><br>
                </asp:RegularExpressionValidator>

                <asp:RegularExpressionValidator id="stateValidator"
                  ControlToValidate="state"
                  ValidationExpression='<%# InputValidator.AnsiTwoCharacterStateExpressionString %>'
                  Display="Dynamic"
                  Font-Name="Arial" Font-Size="11"
                  runat="server">
                    * State: <%# InputValidator.AnsiTwoCharacterStateErrorString %><br>
                </asp:RegularExpressionValidator>

                <asp:RegularExpressionValidator id="contractValidator"
                  ControlToValidate="contract"
                  ValidationExpression="^[01]$"
                  Display="Dynamic"
                  Font-Name="Arial" Font-Size="11"
                  runat="server">
                    * Contract should be either 0 or 1<br>
                </asp:RegularExpressionValidator>
                  
                <asp:RegularExpressionValidator id="RegularExpressionValidator1"
                     ASPClass="RegularExpressionValidator" ControlToValidate="zip"
                     ValidationExpression="[0-9]{5}"
                     Display="Dynamic"
                     Font-Name="Arial" Font-Size="11"
                     runat=server>
                         * Zip Code must be 5 numeric digits <br>
                </asp:RegularExpressionValidator>
                
                <asp:RegularExpressionValidator id="phoneRegexVal"
                    ControlToValidate="phone"
                    ValidationExpression="[0-9]{3} [0-9]{3}-[0-9]{4}"
                    Display="Dynamic"
                    Font-Name="Arial" Font-Size="11"
                    runat=server>
                        * Phone must be in form: XXX XXX-XXXX <br>
                </asp:RegularExpressionValidator>
                
                <asp:RegularExpressionValidator id="au_idRegexVal"
                    ControlToValidate="au_id"
                    ValidationExpression="[0-9]{3}-[0-9]{2}-[0-9]{4}"
                    Display="Dynamic"
                    Font-Name="Arial" Font-Size="11"
                    runat=server>
                        * Author ID must be digits: XXX-XX-XXXX <br>
                </asp:RegularExpressionValidator>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

  </form>

</body>
</html>