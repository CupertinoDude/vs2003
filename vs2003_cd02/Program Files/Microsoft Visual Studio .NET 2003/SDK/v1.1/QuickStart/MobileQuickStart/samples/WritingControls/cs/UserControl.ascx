<%@ Control Inherits="System.Web.UI.MobileControls.MobileUserControl" Language="C#" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>

<script runat="server" language="c#">

private Form[] _forms = null;

public Form[] Forms
{
    get
    {
        return _forms;
    }
    set
    {
        _forms = value;
    }
}

protected void Page_Load(Object sender, EventArgs e)
{
    if (Forms != null)
    {
        MenuList.DataSource = Forms;
        MenuList.DataBind();
    }
}

protected void MenuList_OnDataBind(Object sender, ListDataBindEventArgs e)
{
    Form form = (Form)e.DataItem;
    String formTitle = form.Title;
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

protected void MenuList_OnClick(Object sender, ListCommandEventArgs e)
{
    Form form = Page.FindControl(e.ListItem.Value) as Form;
    if (form != null)
    {
        // There is no MobilePage property, because this is not a mobile control!
        ((MobilePage)Page).ActiveForm = form;
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
            <b><asp:LinkButton runat="server" Text="<%# ((MobileListItem)Container).Text %>" /></b>
            </td></tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr><td bgcolor="#eeeeee" align="center">
            <b><asp:LinkButton runat="server" Text="<%# ((MobileListItem)Container).Text %>" /></b>
            </td></tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            <table width="80%" align="center" border="0" cellspacing="0">
        </FooterTemplate>
    
    </Choice></DeviceSpecific>

</mobile:List>
