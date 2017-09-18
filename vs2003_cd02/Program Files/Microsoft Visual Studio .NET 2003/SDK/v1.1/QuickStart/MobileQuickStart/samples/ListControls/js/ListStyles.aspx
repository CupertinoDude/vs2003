<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" Debug="true"%>

<script runat="server" language="JScript">

protected function MenuList_OnItemCommand( sender:Object, e:ListCommandEventArgs)
{
    MenuList.Decoration = ListDecoration(Enum.Parse( ListDecoration, e.ListItem.Text, true));
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



