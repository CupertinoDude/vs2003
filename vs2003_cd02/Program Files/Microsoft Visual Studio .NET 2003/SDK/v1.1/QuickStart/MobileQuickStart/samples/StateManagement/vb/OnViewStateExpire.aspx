<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Protected Sub Page_Load(sender As Object, e As EventArgs)
    If Not IsPostBack
        LoadSelectionList()
    End If
    Session.Abandon()
End Sub

Protected Sub LoadSelectionList
    VacationDestinations.Items.Add(New MobileListItem("Hawaii", "surfing"))
    VacationDestinations.Items.Add(New MobileListItem("Paris", "shopping"))
    VacationDestinations.Items.Add(New MobileListItem("Sydney", "opera"))
    VacationDestinations.Items.Add(New MobileListItem("London", "theatre"))
End Sub

Protected Overrides Sub OnViewStateExpire(e As EventArgs)
    LoadSelectionList()
End Sub

</script>

<mobile:Form id="OnViewStateExpiresForm" runat="server">
    <mobile:Label runat="server" Text="Session has ended" />
    <mobile:SelectionList id="VacationDestinations" runat="server" SelectType="Radio" />
    <mobile:Command runat="server" text="Handle OnViewStateExpire "/>
</mobile:Form>


