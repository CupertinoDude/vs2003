<%@ Page language="c#" Codebehind="DataGrid8.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid8" %>
<html>
	<head>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
		<meta name="CODE_LANGUAGE" Content="C#">
	</head>
	<body>
		<form method="post" runat="server">
			<h3><font face="Verdana">Updating a Row of Data w/ Templated Column</font></h3>
			<span id="Message" EnableViewState="false" runat="server"></span><p id="P1" runat="server"></p>
			<ASP:DataGrid id="MyDataGrid" runat="server" Width="800" BackColor="#ccccff" BorderColor="black" ShowFooter="false" CellPadding="3" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" HeaderStyle-BackColor="#aaaadd" OnEditCommand="MyDataGrid_Edit" OnCancelCommand="MyDataGrid_Cancel" OnUpdateCommand="MyDataGrid_Update" DataKeyField="au_id" AutoGenerateColumns="false">
				<columns>
					<asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" ItemStyle-Wrap="false" />
					<asp:BoundColumn HeaderText="au_id" SortExpression="au_id" ReadOnly="True" DataField="au_id" ItemStyle-Wrap="false" />
					<asp:TemplateColumn HeaderText="au_lname" SortExpression="au_lname">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>' ID=Label1/>
						</itemtemplate>
						<edititemtemplate>
							<asp:TextBox runat="server" id="edit_LName" Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>'/>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="au_fname" SortExpression="au_fname">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>' ID=Label2/>
						</itemtemplate>
						<edititemtemplate>
							<asp:TextBox runat="server" id="edit_FName" Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>'/>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="phone" SortExpression="phone">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>' ID=Label3/>
						</itemtemplate>
						<edititemtemplate>
							<asp:TextBox runat="server" id="edit_Phone" Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>'/>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="address" SortExpression="address">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "address") %>' ID=Label4/>
						</itemtemplate>
						<edititemtemplate>
							<asp:TextBox runat="server" id="edit_Address" Text='<%# DataBinder.Eval(Container.DataItem, "address") %>'/>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="city" SortExpression="city">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "city") %>' ID=Label5/>
						</itemtemplate>
						<edititemtemplate>
							<asp:TextBox runat="server" id="edit_City" Text='<%# DataBinder.Eval(Container.DataItem, "city") %>'/>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="state" SortExpression="state">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "state") %>' ID=Label6/>
						</itemtemplate>
						<edititemtemplate>
							<asp:DropDownList runat="server" SelectedIndex='<%# GetStateIndex(DataBinder.Eval(Container.DataItem, "state").ToString()) %>' id="edit_State">
								<asp:ListItem>CA</asp:ListItem>
								<asp:ListItem>IN</asp:ListItem>
								<asp:ListItem>KS</asp:ListItem>
								<asp:ListItem>MD</asp:ListItem>
								<asp:ListItem>MI</asp:ListItem>
								<asp:ListItem>OR</asp:ListItem>
								<asp:ListItem>TN</asp:ListItem>
								<asp:ListItem>UT</asp:ListItem>
							</asp:DropDownList>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="zip" SortExpression="zip">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "zip") %>' ID=Label7/>
						</itemtemplate>
						<edititemtemplate>
							<asp:TextBox runat="server" id="edit_Zip" Text='<%# DataBinder.Eval(Container.DataItem, "zip") %>'/>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="contract" SortExpression="contract">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "contract", "{0}") %>' ID=Label8/>
						</itemtemplate>
						<edititemtemplate>
							<asp:CheckBox runat="server" id="edit_Contract" Checked='<%# DataBinder.Eval(Container.DataItem, "contract") %>'/>
						</edititemtemplate>
					</asp:TemplateColumn>
				</columns>
			</ASP:DataGrid>
		</form>
	</body>
</html>
