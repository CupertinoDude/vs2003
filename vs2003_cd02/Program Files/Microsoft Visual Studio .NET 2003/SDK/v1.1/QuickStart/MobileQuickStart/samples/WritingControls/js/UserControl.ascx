<%@ Control Inherits="System.Web.UI.MobileControls.MobileUserControl" Language="JScript" %>

<script runat="server" language="JScript">

private var _forms : Form[] = null;

public function get Forms(): Form[]
{
	return _forms;
}
public function set Forms(value : Form[])
{
    _forms = value;
}

protected function Page_Load(sender:Object , e:EventArgs )
{
    if (Forms != null)
    {
        MenuList.DataSource = Forms;
        MenuList.DataBind();
    }
}

protected function MenuList_OnDataBind(sender:Object , e:ListDataBindEventArgs )
{
    var form : Form = Form(e.DataItem);
    var formTitle : String = form.Title;
    if (formTitle.Length > 0)
    {
        e.ListItem.Text = form.Title;
    }
    else
    {
        e.ListItem.Text = form.ID;
    }
    e.ListItem.Value = form.UniqueID;
}

protected function MenuList_OnClick(sender:Object , e:ListCommandEventArgs )
{
    var form : Form = Form(Page.FindControl(e.ListItem.Value));
    if (form != null)
    {
        // There is no MobilePage property, because this is not a mobile control!
        (MobilePage(Page)).ActiveForm = form;
    }
}

</script>

<mobile:List id="MenuList" runat="server" OnItemCommand="MenuList_OnClick" OnItemDataBind="MenuList_OnDataBind">

    <DeviceSpecific><Choice Filter="IsScriptableHtml32">
    
        <HeaderTemplate>
            <table width="90%" height="80%" align="center" border="0" cellspacing="4">
        </HeaderTemplate>
        <ItemTemplate>
            <tr><td bgcolor="#ccffff" align="center">
            <b><asp:LinkButton runat="server" Text="<%# (MobileListItem(Container)).Text %>" /></b>
            </td></tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr><td bgcolor="#eeeeee" align="center">
            <b><asp:LinkButton runat="server" Text="<%# (MobileListItem(Container)).Text %>" /></b>
            </td></tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            <table width="80%" align="center" border="0" cellspacing="0">
        </FooterTemplate>
    
    </Choice></DeviceSpecific>

</mobile:List>
