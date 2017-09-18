<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script runat="server" language="JScript">

protected function Page_Load(sender:Object , e:EventArgs )
{
    if (!IsPostBack)
    {
        LoadSelectionList();
    }
    Session.Abandon();
}

protected function LoadSelectionList()
{
    VacationDestinations.Items.Add(new MobileListItem("Hawaii", "surfing"));
    VacationDestinations.Items.Add(new MobileListItem("Paris", "shopping"));
    VacationDestinations.Items.Add(new MobileListItem("Sydney", "opera"));
    VacationDestinations.Items.Add(new MobileListItem("London", "theatre"));
}

protected override function OnViewStateExpire( e:EventArgs)
{
    LoadSelectionList();
}

</script>

<mobile:Form id="OnViewStateExpiresForm" runat="server">
    <mobile:Label runat="server" Text="Session has ended" />
    <mobile:SelectionList id="VacationDestinations" runat="server" SelectType="Radio"/>
    <mobile:Command runat="server" text="Handle OnViewStateExpire "/>
</mobile:Form>


