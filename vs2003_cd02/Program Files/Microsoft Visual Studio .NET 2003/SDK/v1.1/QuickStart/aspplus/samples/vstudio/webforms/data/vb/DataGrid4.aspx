<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid4.aspx.vb" Inherits="Data.Vb.DataGrid4"%>
<%@ Import Namespace="Acme" %>
<html>
    <head>
        <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
        <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
    </head>
<body style="font: 10pt verdana">

  <form runat="server" ID="Form1">

    <h3><font face="Verdana">Inserting a Row of Data</font></h3>

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
                <input type="text" id="au_id" value="000-00-0000" runat="server" NAME="au_id"><br>
                <!-- Use a custom regular expression since this is truly a custom format -->
                <asp:RegularExpressionValidator id="au_idValidator"
                  ControlToValidate="au_id"
                  ValidationExpression="\d{3}\-\d{2}\-\d{4}"
                  Display="Dynamic"
                  ErrorMessage="Input should be 000-00-0000 where 0's represent valid digits."
                  runat="server"/>
              </td>
            </tr>
            <tr>
              <td nowrap>Last Name: </td>
              <td>
                <input type="text" id="au_lname" value="Doe" runat="server" NAME="au_lname"><br>
                <asp:RegularExpressionValidator id="au_lnameValidator"
                  ControlToValidate="au_lname"
                  ValidationExpression='<%# InputValidator.AnsiNameExpressionString %>'
                  Display="Dynamic"
                  ErrorMessage='<%# InputValidator.AnsiNameErrorString %>'
                  runat="server"/>
              </td>
            </tr>  
            <tr nowrap>
              <td>First Name: </td>
              <td>
                <input type="text" id="au_fname" value="John" runat="server" NAME="au_fname"><br>
                <asp:RegularExpressionValidator id="au_fnameValidator"
                  ControlToValidate="au_fname"
                  ValidationExpression='<%# InputValidator.AnsiNameExpressionString %>'
                  Display="Dynamic"
                  ErrorMessage='<%# InputValidator.AnsiNameErrorString %>'
                  runat="server"/>
              </td>
            </tr>
            <tr>
              <td>Phone: </td>
              <td>
                <input type="text" id="phone" value="808 555-5555" runat="server" NAME="phone"><br>
                <asp:RegularExpressionValidator id="phoneValidator"
                  ControlToValidate="phone"
                  ValidationExpression='<%# InputValidator.AnsiPhoneExpressionString %>'
                  Display="Dynamic"
                  ErrorMessage='<%# InputValidator.AnsiPhoneErrorString %>'
                  runat="server"/>
              </td>
            </tr>
            <tr>
              <td>Address: </td>
              <td>
                <input type="text" id="address" value="One Microsoft Way" runat="server" NAME="address"><br>
                <asp:RegularExpressionValidator id="addressValidator"
                  ControlToValidate="address"
                  ValidationExpression='<%# InputValidator.AnsiAddressExpressionString %>'
                  Display="Dynamic"
                  ErrorMessage='<%# InputValidator.AnsiAddressErrorString %>'
                  runat="server"/>
              </td>
            </tr>
            <tr>
              <td>City: </td>
              <td>
                <input type="text" id="city" value="Redmond" runat="server" NAME="city"><br>
                <asp:RegularExpressionValidator id="cityValidator"
                  ControlToValidate="city"
                  ValidationExpression='<%# InputValidator.AnsiCityStateExpressionString %>'
                  Display="Dynamic"
                  ErrorMessage='<%# InputValidator.AnsiCityStateErrorString %>'
                  runat="server"/>
              </td>
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
                </select><br>
                <asp:RegularExpressionValidator id="stateValidator"
                  ControlToValidate="state"
                  ValidationExpression='<%# InputValidator.AnsiTwoCharacterStateExpressionString %>'
                  Display="Dynamic"
                  ErrorMessage='<%# InputValidator.AnsiTwoCharacterStateErrorString %>'
                  runat="server"/>
              </td>
            </tr>
            <tr>
              <td nowrap>Zip Code: </td>
              <td>
                <input type="text" id="zip" value="98005" runat="server" NAME="zip">
                <asp:RegularExpressionValidator id="zipValidator"
                  ControlToValidate="zip"
                  ValidationExpression='<%# InputValidator.AnsiBasicZipCodeExpressionString %>'
                  Display="Dynamic"
                  ErrorMessage='<%# InputValidator.AnsiBasicZipCodeErrorString %>'
                  runat="server"/>
              </td>
            </tr>
            <tr>
              <td>Contract: </td>
              <td>
                <select id="contract" runat="server" NAME="contract">
                  <option value="0">False</option>
                  <option value="1">True</option>
                </select><br>
                <asp:RegularExpressionValidator id="contractValidator"
                  ControlToValidate="contract"
                  ValidationExpression="^[01]$"
                  Display="Dynamic"
                  ErrorMessage="Contract should be either 0 or 1"
                  runat="server"/>
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
              </td>
            </tr>
          </table>

        </td>
      </tr>
    </table>

  </form>

</body>
</html>
