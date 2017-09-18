<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

protected void MenuList_OnItemCommand(Object sender, ListCommandEventArgs e)
{
    MenuList.Decoration =
        (ListDecoration)Enum.Parse(typeof(ListDecoration), e.ListItem.Text, true);

}

</script>

<mobile:Form runat="server" id="MenuListForm">
    <mobile:Label runat="server" StyleReference="title" Text="Menu List" />
    <mobile:List runat="server" id="MenuList" OnItemCommand="MenuList_OnItemCommand">
        <Item Text="None" />
        <Item Text="Bulleted" />
        <Item Text="Numbered" />
    </mobile:List>
</mobile:Form>



