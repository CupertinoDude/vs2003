<%@ Page language="c#" Codebehind="DataGrid9.aspx.cs" AutoEventWireup="false" Inherits="Data.Cs.DataGrid9" %>
<%@ Import Namespace="System.Data" %>
<html>
	<head>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
		<meta name="CODE_LANGUAGE" Content="C#">
	</head>
	<body>
		<form method="post" runat="server">
			<h3><font face="Verdana">Updating a Row of Data w/ Validation</font></h3>
			<span id="Message" EnableViewState="false" runat="server"></span><p></p>
			<ASP:DataGrid id="MyDataGrid" runat="server" Width="800" BackColor="#ccccff" BorderColor="black" ShowFooter="false" CellPadding="3" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" HeaderStyle-BackColor="#aaaadd" OnEditCommand="MyDataGrid_Edit" OnCancelCommand="MyDataGrid_Cancel" OnUpdateCommand="MyDataGrid_Update" DataKeyField="au_id" AutoGenerateColumns="false">
				<columns>
					<asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" ItemStyle-Wrap="false" />
					<asp:BoundColumn HeaderText="au_id" SortExpression="au_id" ReadOnly="True" DataField="au_id" ItemStyle-Wrap="false" />
					<asp:TemplateColumn HeaderText="au_lname" SortExpression="au_lname">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>' ID=Label1/>
						</itemtemplate>
						<edititemtemplate>
							<nobr>
								<asp:TextBox runat="server" id="edit_LName" Text='<%# DataBinder.Eval(Container.DataItem, "au_lname") %>'/>
								<asp:RequiredFieldValidator id="au_lnameReqVal" ControlToValidate="edit_LName" Display="Dynamic" Font-Name="Verdana" Font-Size="12" runat="server">
										&nbsp;*
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator id="au_lnameRegEx"
									ASPClass="RegularExpressionValidator" ControlToValidate="edit_LName"
									ValidationExpression="[\w\s-']+"
									Display="Dynamic"
									Font-Name="Arial" Font-Size="11"
									runat=server>
										* names may contain only alphanumeric characters and limited punctuation <br>
								</asp:RegularExpressionValidator>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="au_fname" SortExpression="au_fname">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>' ID=Label2/>
						</itemtemplate>
						<edititemtemplate>
							<nobr>
								<asp:TextBox runat="server" id="edit_FName" Text='<%# DataBinder.Eval(Container.DataItem, "au_fname") %>'/>
								<asp:RequiredFieldValidator id="au_fnameReqVal" ControlToValidate="edit_FName" Display="Dynamic" Font-Name="Verdana" Font-Size="12" runat="server">
										&nbsp;*
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator id="au_fnameRegEx"
									ASPClass="RegularExpressionValidator" ControlToValidate="edit_FName"
									ValidationExpression="[\w\s-']+"
									Display="Dynamic"
									Font-Name="Arial" Font-Size="11"
									runat=server>
										* names may contain only alphanumeric characters and limited punctuation <br>
								</asp:RegularExpressionValidator>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="phone" SortExpression="phone">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>' ID=Label3/>
						</itemtemplate>
						<edititemtemplate>
							<nobr>
								<asp:TextBox runat="server" id="edit_Phone" Text='<%# DataBinder.Eval(Container.DataItem, "phone") %>'/>
								<asp:RequiredFieldValidator id="phoneReqVal" ControlToValidate="edit_Phone" Display="Dynamic" Font-Name="Verdana" Font-Size="12" runat="server">
										&nbsp;*
								</asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator id="phoneRegexVal" ControlToValidate="edit_Phone" ValidationExpression="[0-9]{3} [0-9]{3}-[0-9]{4}" Display="Dynamic" Font-Name="Arial" Font-Size="11" runat="server">
										* Phone must be in form: XXX XXX-XXXX <br>
								</asp:RegularExpressionValidator>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="address" SortExpression="address">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "address") %>' ID=Label4/>
						</itemtemplate>
						<edititemtemplate>
							<asp:TextBox runat="server" id="edit_Address" Text='<%# DataBinder.Eval(Container.DataItem, "address") %>'/>
							<asp:RegularExpressionValidator id="au_addressRegEx"
								ASPClass="RegularExpressionValidator" ControlToValidate="edit_Address"
								ValidationExpression="[\w\s-()#\.]+"
								Display="Dynamic"
								Font-Name="Arial" Font-Size="11"
								runat=server>
									* addresses may only contain alphanumeric values and limited punctuation <br>
							</asp:RegularExpressionValidator>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="city" SortExpression="city">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "city") %>' ID=Label5/>
						</itemtemplate>
						<edititemtemplate>
							<asp:TextBox runat="server" id="edit_City" Text='<%# DataBinder.Eval(Container.DataItem, "city") %>'/>
							<asp:RegularExpressionValidator id="au_cityRegEx"
								ASPClass="RegularExpressionValidator" ControlToValidate="edit_City"
								ValidationExpression="[\w\s]+"
								Display="Dynamic"
								Font-Name="Arial" Font-Size="11"
								runat=server>
									* city names may only contain alphanumeric values <br>
							</asp:RegularExpressionValidator>
						</edititemtemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="state" SortExpression="state">
						<itemtemplate>
							<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "state") %>' ID=Label6/>
						</itemtemplate>
						<edititemtemplate>
							<asp:DropDownList runat="server" SelectedIndex='<%# StateIndex[(String)((DataRowView)Container.DataItem)["state"]] %>' id="edit_State">
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
							<asp:RegularExpressionValidator id="RegularExpressionValidator1" ASPClass="RegularExpressionValidator" ControlToValidate="edit_Zip" ValidationExpression="[0-9]{5}" Display="Dynamic" Font-Name="Arial" Font-Size="11" runat="server">
									* Zip Code must be 5 numeric digits <br>
							</asp:RegularExpressionValidator>
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