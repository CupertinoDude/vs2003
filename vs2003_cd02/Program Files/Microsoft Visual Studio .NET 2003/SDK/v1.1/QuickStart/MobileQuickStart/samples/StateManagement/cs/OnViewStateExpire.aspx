<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

protected void Page_Load(Object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        LoadSelectionList();
    }
    Session.Abandon();
}

protected void LoadSelectionList()
{
    VacationDestinations.Items.Add(new MobileListItem("Hawaii", "surfing"));
    VacationDestinations.Items.Add(new MobileListItem("Paris", "shopping"));
    VacationDestinations.Items.Add(new MobileListItem("Sydney", "opera"));
    VacationDestinations.Items.Add(new MobileListItem("London", "theatre"));
}

protected override void OnViewStateExpire(EventArgs e)
{
    LoadSelectionList();
}

</script>

<mobile:Form id="OnViewStateExpiresForm" runat="server">
    <mobile:Label runat="server" Text="Session has ended" />
    <mobile:SelectionList id="VacationDestinations" runat="server" SelectType="Radio"/>
    <mobile:Command runat="server" text="Handle OnViewStateExpire "/>
</mobile:Form>


