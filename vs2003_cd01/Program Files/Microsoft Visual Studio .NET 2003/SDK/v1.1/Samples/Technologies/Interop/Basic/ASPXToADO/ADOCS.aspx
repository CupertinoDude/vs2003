<%@ Assembly Name ="ADODB"%>
<%@ Import Namespace="ADODB"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>  


<html>
<script language="C#" src="InteropADOCS.cs" runat="server"/>

<body BGCOLOR="aquamarine" topmargin="10" leftmargin="10"> 
<font size="4" face="Arial, Helvetica">

This page imports the unmanaged msado15.dll using TITLES table from the pubs database
    


<form runat="server" Name="myForm">


<span id = "Message1" MaintainState="false" style="font:arial 11pt;" runat="server"/><p>
<asp:DataGrid
	ID="MyDataGrid"
	BorderColor = "black"
	BorderWidth = "1"
	GridLines = "both"
	
	CellSpacing = "0"
	Font-Name = "Verdana"
	Font-Size = "8pt"
	MaintainState = "false"
	runat="server"
	OnEditCommand="MyDataGrid_Edit"
      	OnCancelCommand="MyDataGrid_Cancel"
      	OnUpdateCommand="MyDataGrid_Update"
	OnDeleteCommand = "MyDataGrid_Delete"

      	DataKeyField="title_id"


        AutoGenerateColumns="false">
        
	<Columns>
	
	<asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update"  ItemStyle-Wrap="false"/>
	<asp:ButtonColumn HeaderText = "Delete Item"
ButtonType = "LinkButton"
Text = "Delete"
CommandName = "Delete">
</asp:ButtonColumn >
        <asp:BoundColumn HeaderText="Title ID" ReadOnly="True" DataField="title_id" ItemStyle-Wrap="false"/>
	
	<asp:TemplateColumn HeaderText="Title" >
                <ItemTemplate>
                    <asp:Label id=txtTitle runat="server" 
                        Text='<%# DataBinder.Eval(Container.DataItem, "title") %>'
                        
                        />
                </ItemTemplate>
		<EditItemTemplate>
	   		<asp:TextBox id ="edit_title" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "title") %>' Wrap="false"/>
           		</asp:TextBox>
          	</EditItemTemplate>
	</asp:TemplateColumn>


	<asp:TemplateColumn HeaderText="Type" >
                <ItemTemplate>
                    <asp:Label id=txtType runat="server" 
                        Text='<%# DataBinder.Eval(Container.DataItem, "type") %>'
                        
                        />
                </ItemTemplate>
		<EditItemTemplate>
	   		<asp:TextBox id ="edit_type" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "type") %>' Wrap="false"/>
           		</asp:TextBox>
          	</EditItemTemplate>
	</asp:TemplateColumn>

	<asp:TemplateColumn HeaderText="Pub ID" >
                <ItemTemplate>
                    <asp:Label id=txtPub_iD runat="server" 
                        Text='<%# DataBinder.Eval(Container.DataItem, "pub_id") %>'
                        
                        />
                </ItemTemplate>
		<EditItemTemplate>
			<asp:DropDownList runat="server" DataSource="<%# PublisherID %>" SelectedIndex='<%# GetPubIndex((String)((DataRowView)Container.DataItem)["pub_id"]) %>' id="edit_pubID">
           		</asp:DropDownList>
          	</EditItemTemplate>
	</asp:TemplateColumn>
	
	<asp:TemplateColumn HeaderText="Price" >
                <ItemTemplate>
                    <asp:Label id=txtPrice runat="server" 
                        Text='<%# DataBinder.Eval(Container.DataItem, "price") %>'
                        
                        />
                </ItemTemplate>
		<EditItemTemplate>
	   		<asp:TextBox id ="edit_price" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "price") %>' Wrap="false"/>
           		</asp:TextBox>
          	</EditItemTemplate>
	</asp:TemplateColumn>


	
	<asp:TemplateColumn HeaderText="Advance" >
                <ItemTemplate>
                    <asp:Label id=txtAdvance runat="server" 
                        Text='<%# DataBinder.Eval(Container.DataItem, "advance") %>'
                        
                        />
                </ItemTemplate>
		<EditItemTemplate>
	   		<asp:TextBox id ="edit_advance" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "advance") %>'/>
           		</asp:TextBoxt>
          	</EditItemTemplate>
	</asp:TemplateColumn>

	
	<asp:TemplateColumn HeaderText="Royalty" >
                <ItemTemplate>
                    <asp:Label id=txtRoyalty runat="server" 
                        Text='<%# DataBinder.Eval(Container.DataItem, "royalty") %>'
                        
                        />
                </ItemTemplate>
		<EditItemTemplate>
	   		<asp:TextBox id ="edit_royalty" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "royalty") %>' />
           		</asp:TextBox>
          	</EditItemTemplate>
	</asp:TemplateColumn>

	
	<asp:TemplateColumn HeaderText="YearToDateSale" >
                <ItemTemplate>
                    <asp:Label id=txtYtdSale runat="server" 
                        Text='<%# DataBinder.Eval(Container.DataItem, "ytd_sales") %>'
                        
                        />
                </ItemTemplate>
		<EditItemTemplate>
	   		<asp:TextBox id ="edit_ytd_sales" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ytd_sales") %>'/>
           		</asp:TextBox>
          	</EditItemTemplate>
	</asp:TemplateColumn>
	
	<asp:TemplateColumn HeaderText="Notes" >
                <ItemTemplate>
                    <asp:Label id=txtNotes runat="server" 
                        Text='<%# DataBinder.Eval(Container.DataItem, "notes") %>'
                        
                        />
                </ItemTemplate>
		<EditItemTemplate>
	   		<asp:TextBox id ="edit_notes" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "notes") %>' />
           		</asp:TextBox>
          	</EditItemTemplate>
	</asp:TemplateColumn>
	
	
	<asp:TemplateColumn HeaderText="PubDate" >
                <ItemTemplate>
                    <asp:Label id=txtPubdate runat="server" 
                        Text='<%# DataBinder.Eval(Container.DataItem, "pubdate") %>'
                        
                        />
                </ItemTemplate>
		<EditItemTemplate>
	   		<asp:TextBox id ="edit_pubdate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "pubdate") %>' />
           		</asp:TextBox>
          	</EditItemTemplate>
	</asp:TemplateColumn>
		
            
         </Columns>



</asp:DataGrid>


</form>
</Body> 

</html>

