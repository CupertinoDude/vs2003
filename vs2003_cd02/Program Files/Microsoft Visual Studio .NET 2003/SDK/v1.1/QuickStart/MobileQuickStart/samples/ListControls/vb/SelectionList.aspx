<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Protected Sub CityForm_OnSubmit(sender As Object, e As EventArgs)

    Dim citiesChosen As String = ""
    Dim separator As String = ", "
    Dim item As MobileListItem
    For Each item in CityList.Items

        If (item.Selected)

            If (citiesChosen.Length > 0)
                citiesChosen = citiesChosen & separator
            End If
            citiesChosen = citiesChosen & item.Text

        End If

    Next

    If (citiesChosen.Length = 0)

        citiesChosen = "none"

    End If

    CityLabel.Text = citiesChosen
    ActiveForm = SecondForm

End Sub

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


