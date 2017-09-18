<%@ Page language="c#" Codebehind="xmlgen.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.xmlgen" %>
<HTML>
	<body>
		<form method="post" runat="server">
			<h3><font face="Verdana">SQL to XML Generator</font></h3>
			<table style="FONT: 10pt verdana" height="376" cellPadding="5" border="0">
				<tr>
					<td colSpan="2">
						<P><b>Connect String:</b><br>
							<asp:label id="connect" runat="server" Width="100%"></asp:label></P>
					</td>
				</tr>
				<tr>
					<td><b>Table Properties:</b><br>
						Database:<br>
						Table:<br>
					</td>
					<td><br>
						<asp:dropdownlist id="database" runat="server" AutoPostBack="True">
							<asp:ListItem Value="Pubs" Selected="True">Pubs</asp:ListItem>
							<asp:ListItem Value="Northwind">Northwind</asp:ListItem>
							<asp:ListItem Value="GrocerToGo">GrocerToGo</asp:ListItem>
							<asp:ListItem Value="Portal">Portal</asp:ListItem>
						</asp:dropdownlist><br>
						<asp:dropdownlist id="table" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
				</tr>
				<TR>
					<TD colSpan="2"><b></b>Query:</B>
						<asp:label id="query" runat="server" Width="100%"></asp:label></TD>
				</TR>
				<tr>
					<td><input id="GetSchema" type="radio" name="Mode" runat="server">Get XML Schema<br>
						<input id="GetData" type="radio" CHECKED name="Mode" runat="server">Get XML 
						Schema and XML Data<br>
					</td>
					<td vAlign="top"><input id="Submit1" type="submit" value="Submit Query" name="Submit1" runat="server">
					</td>
				</tr>
				<tr>
					<td colSpan="2"><ASP:LABEL id="lblXML" runat="server"></ASP:LABEL></td>
				</tr>
				<tr>
					<td colspan="2">
						<ASP:label id="lblData" runat="server"></ASP:label>
						<ASP:DataGrid id="MyDataGrid" BackColor="#EDBE7B" BorderColor="black" ShowFooter="false" CellPadding="3" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" HeaderStyle-BackColor="#DC6035" EnableViewState="false" runat="server" />
					</td>
				<tr>
				</tr>
			</table>
		</form>
	</body>
</HTML>
