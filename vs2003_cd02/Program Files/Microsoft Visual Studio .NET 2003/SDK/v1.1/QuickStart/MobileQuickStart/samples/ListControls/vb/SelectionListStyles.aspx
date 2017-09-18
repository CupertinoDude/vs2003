<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Protected Sub ListStyle_OnSelect(sender As Object, e As ListCommandEventArgs)

    Dim text As String = e.ListItem.Text
    CityList.SelectType = CType(System.Enum.Parse(GetType(ListSelectType), text, True), ListSelectType)
    CityFormLabel.Text = String.Format("SelectType = {0}", text)
    ActiveForm = CityForm

End Sub

Protected Sub CityForm_OnSubmit(sender As Object, e As EventArgs)

    ActiveForm = ChoiceForm

End Sub

</script>

<mobile:Form id="ChoiceForm" runat="server">
    <mobile:Label runat="server" StyleReference="title" Text="Selection List Styles" />
    <mobile:List runat="server" OnItemCommand="ListStyle_OnSelect">
        <Item Text="DropDown" />
        <Item Text="ListBox" />
        <Item Text="Radio" />
        <Item Text="MultiSelectListBox" />
        <Item Text="CheckBox" />
    </mobile:List>
</mobile:Form>

<mobile:Form id="CityForm" runat="server" Wrapping="NoWrap">
    <mobile:Label runat="server" id="CityFormLabel" StyleReference="title"  />
    <mobile:SelectionList runat="server" id="CityList" SelectType="CheckBox">
        <Item Text="Sydney" />
        <Item Text="Tel Aviv" />
        <Item Text="New York" />
        <Item Text="Madrid" />
        <Item Text="Tokyo" />
    </mobile:SelectionList>
    <mobile:Command runat="server" OnClick="CityForm_OnSubmit" Text="Back" />
</mobile:Form>


