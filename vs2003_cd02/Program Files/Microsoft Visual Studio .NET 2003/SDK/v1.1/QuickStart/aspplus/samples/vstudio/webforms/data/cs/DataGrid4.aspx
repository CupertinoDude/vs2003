<%@ Page language="c#" Codebehind="DataGrid4.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid4" %>
<%@ Import Namespace="Acme" %>
<HTML>
	<HEAD>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
		<meta name="CODE_LANGUAGE" Content="C#">
	</HEAD>
	<body>
		<form method="post" runat="server">
			<h3><font face="Verdana">Inserting a Row of Data</font></h3>
			<table width="95%">
				<tr>
					<td valign="top">
						<ASP:DataGrid id="MyDataGrid" runat="server" Width="700" BackColor="#ccccff" BorderColor="black" ShowFooter="false" CellPadding="3" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" HeaderStyle-BackColor="#aaaadd" EnableViewState="false" />
					</td>
					<td valign="top">
						<table style="FONT: 8pt verdana">
							<tr>
								<td colspan="2" bgcolor="#aaaadd">Add a New Author:</td>
							</tr>
							<tr>
								<td nowrap>Author ID:
								</td>
								<td><input type="text" id="au_id" value="000-00-0000" runat="server"><br>
									<asp:RegularExpressionValidator id="au_idValidator" runat="server" ErrorMessage="Input should be 000-00-0000 where 0's represent valid digits." ValidationExpression="\d{3}\-\d{2}\-\d{4}" Display="Dynamic" ControlToValidate="au_id"></asp:RegularExpressionValidator></td>
							</tr>
							<tr>
								<td nowrap>Last Name:
								</td>
								<td><input type="text" id="au_lname" value="Doe" runat="server"><br>
									<asp:RegularExpressionValidator id=au_lnameValidator runat="server" ErrorMessage="<%# InputValidator.AnsiNameErrorString %>" ValidationExpression="<%# InputValidator.AnsiNameExpressionString %>" Display="Dynamic" ControlToValidate="au_lname">
									</asp:RegularExpressionValidator></td>
							</tr>
							<tr nowrap>
								<td>First Name:
								</td>
								<td><input type="text" id="au_fname" value="John" runat="server"><br>
									<asp:RegularExpressionValidator id=au_fnameValidator runat="server" ErrorMessage="<%# InputValidator.AnsiNameErrorString %>" ValidationExpression="<%# InputValidator.AnsiNameExpressionString %>" Display="Dynamic" ControlToValidate="au_fname">
									</asp:RegularExpressionValidator></td>
							</tr>
							<tr>
								<td>Phone:
								</td>
								<td><input type="text" id="phone" value="808 555-5555" runat="server"><br>
									<asp:RegularExpressionValidator id=phoneValidator runat="server" ErrorMessage="<%# InputValidator.AnsiPhoneErrorString %>" ValidationExpression="<%# InputValidator.AnsiPhoneExpressionString %>" Display="Dynamic" ControlToValidate="phone">
									</asp:RegularExpressionValidator></td>
							</tr>
							<tr>
								<td>Address:
								</td>
								<td><input type="text" id="address" value="One Microsoft Way" runat="server"><br>
									<asp:RegularExpressionValidator id=addressValidator runat="server" ErrorMessage="<%# InputValidator.AnsiAddressErrorString %>" ValidationExpression="<%# InputValidator.AnsiAddressExpressionString %>" Display="Dynamic" ControlToValidate="address">
									</asp:RegularExpressionValidator></td>
							</tr>
							<tr>
								<td>City:
								</td>
								<td><input type="text" id="city" value="Redmond" runat="server"><br>
									<asp:RegularExpressionValidator id=cityValidator runat="server" ErrorMessage="<%# InputValidator.AnsiCityStateErrorString %>" ValidationExpression="<%# InputValidator.AnsiCityStateExpressionString %>" Display="Dynamic" ControlToValidate="city">
									</asp:RegularExpressionValidator></td>
							</tr>
							<tr>
								<td>State:
								</td>
								<td>
									<select id="state" runat="server">
										<option selected>CA</option>
										<option>IN</option>
										<option>KS</option>
										<option>MD</option>
										<option>MI</option>
										<option>OR</option>
										<option>TN</option>
										<option>UT</option>
									</select><br>
									<asp:RegularExpressionValidator id=stateValidator runat="server" ErrorMessage="<%# InputValidator.AnsiTwoCharacterStateErrorString %>" ValidationExpression="<%# InputValidator.AnsiTwoCharacterStateExpressionString %>" Display="Dynamic" ControlToValidate="state">
									</asp:RegularExpressionValidator>
								</td>
							</tr>
							<tr>
								<td nowrap>Zip Code:
								</td>
								<td><input type="text" id="zip" value="98005" runat="server"><br>
									<asp:RegularExpressionValidator id=zipValidator runat="server" ErrorMessage="<%# InputValidator.AnsiBasicZipCodeErrorString %>" ValidationExpression="<%# InputValidator.AnsiBasicZipCodeExpressionString %>" Display="Dynamic" ControlToValidate="zip">
									</asp:RegularExpressionValidator></td>
							</tr>
							<tr>
								<td>Contract:
								</td>
								<td>
									<select id="contract" runat="server">
										<option value="0" selected>False</option>
										<option value="1">True</option>
									</select><br>
									<asp:RegularExpressionValidator id="contractValidator" runat="server" ErrorMessage="Contract should be either 0 or 1" ValidationExpression="^[01]$" Display="Dynamic" ControlToValidate="contract"></asp:RegularExpressionValidator>
								</td>
							</tr>
							<tr>
								<td></td>
								<td id="TD1" runat="server">
									<input type="submit" OnServerClick="AddAuthor_Click" value="Add Author" runat="server" ID="Submit1" NAME="Submit1">
								</td>
							</tr>
							<tr>
								<td colspan="2" align="middle">
									<span id="Message" EnableViewState="false" runat="server"></span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
