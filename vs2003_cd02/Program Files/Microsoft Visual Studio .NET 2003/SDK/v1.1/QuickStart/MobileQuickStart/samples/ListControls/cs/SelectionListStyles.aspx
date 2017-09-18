<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

protected void ListStyle_OnSelect(Object sender, ListCommandEventArgs e)
{
    String text = e.ListItem.Text;
    CityList.SelectType = 
        (ListSelectType)Enum.Parse(typeof(ListSelectType), text, true);
    CityFormLabel.Text = String.Format("SelectType = {0}", text);
    ActiveForm = CityForm;
}

protected void CityForm_OnSubmit(Object sender, EventArgs e)
{
    ActiveForm = ChoiceForm;
}


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


