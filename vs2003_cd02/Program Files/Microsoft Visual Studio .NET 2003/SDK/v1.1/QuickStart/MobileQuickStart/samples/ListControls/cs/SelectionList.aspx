<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

protected void CityForm_OnSubmit(Object sender, EventArgs e)
{
    string citiesChosen = "";
    string separator = ", ";
    foreach (MobileListItem item in CityList.Items)
    {
        if (item.Selected)
        {
            if (citiesChosen.Length > 0)
            {
                citiesChosen += separator;
            }
            citiesChosen += item.Text;
        }
    }

    if (citiesChosen.Length == 0)
    {
        citiesChosen = "none";
    }

    CityLabel.Text = citiesChosen;
    ActiveForm = SecondForm;
}


</script>

<mobile:Form runat="server" Wrapping="NoWrap">
    <mobile:Label runat="server" StyleReference="title" Text="Choose One or More Cities" />
    <mobile:SelectionList runat="server" id="CityList" SelectType="CheckBox">
        <Item Text="Sydney" />
        <Item Text="Tel Aviv" />
        <Item Text="New York" />
        <Item Text="Madrid" />
        <Item Text="Tokyo" />
    </mobile:SelectionList>
    <mobile:Command runat="server" OnClick="CityForm_OnSubmit" Text="Go" />
</mobile:Form>

<mobile:Form id="SecondForm" runat="server">
    <b>Cities chosen: </b><mobile:Label runat="server" id="CityLabel" />
</mobile:Form>


