<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Protected Sub MenuList_OnItemCommand(sender As Object, e As ListCommandEventArgs)

    Dim text As String = e.ListItem.Text
    MenuList.Decoration = CType(System.Enum.Parse(GetType(ListDecoration), text, True), ListDecoration)

End Sub

</script>

<mobile:Form runat="server" id="MenuListForm">
    <mobile:Label runat="server" StyleReference="title" Text="Menu List" />
    <mobile:List runat="server" id="MenuList" OnItemCommand="MenuList_OnItemCommand">
        <Item Text="None" />
        <Item Text="Bulleted" />
        <Item Text="Numbered" />
    </mobile:List>
</mobile:Form>



