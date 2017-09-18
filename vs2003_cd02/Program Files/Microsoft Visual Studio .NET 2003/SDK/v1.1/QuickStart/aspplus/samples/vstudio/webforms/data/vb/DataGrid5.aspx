<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid5.aspx.vb" Inherits="Data.Vb.DataGrid5"%>
<%@ Import Namespace="Acme" %>
<html>
    <head>
        <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
        <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
    </head>
<body style="font: 10pt verdana">

  <form runat="server" ID="Form1">

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
                <input type="text" id="au_id" value="000-00-0000" runat="server" NAME="au_id">
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
                <input type="text" id="au_lname" value="Doe" runat="server" NAME="au_lname">
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
                <input type="text" id="au_fname" value="John" runat="server" NAME="au_fname">
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
                <input type="text" id="phone" value="808 555-5555" runat="server" NAME="phone">
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
              <td><input type="text" id="address" value="One Microsoft Way" runat="server" NAME="address"></td>
            </tr>
            <tr>
              <td>City: </td>
              <td><input type="text" id="city" value="Redmond" runat="server" NAME="city"></td>
            </tr>
            <tr>
              <td>State: </td>
              <td>
                <select id="state" runat="server" NAME="state">
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
              <td><input type="text" id="zip" value="98005" runat="server" NAME="zip"></td>
            </tr>
            <tr>
              <td>Contract: </td>
              <td>
                <select id="contract" runat="server" NAME="contract">
                  <option value="0">False</option>
                  <option value="1">True</option>
                </select>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="padding-top:15">
                <input type="submit" OnServerClick="AddAuthor_Click" value="Add Author" runat="server" ID="Submit1" NAME="Submit1">
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
