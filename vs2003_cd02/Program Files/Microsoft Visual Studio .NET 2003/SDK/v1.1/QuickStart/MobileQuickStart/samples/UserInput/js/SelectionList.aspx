<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script runat="server" language="JScript">

protected function GoCommand_OnClick(sender:Object , e:EventArgs)
{
    ActiveForm = SecondForm;
}

protected function SecondForm_OnActivate(sender:Object, e:EventArgs)
{
    SecondForm.DataBind ();
}

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server" StyleReference="title">Company Directory Lookup</mobile:Label>
    <mobile:Label runat="server">Enter company name:</mobile:Label>
    <mobile:TextBox runat="server" id="Company" />
    <mobile:Label runat="server">Choose an industry:</mobile:Label>
    <mobile:SelectionList runat="server" id="IndustryList" >
        <Item Text="Communications" Value="COMM" />
        <Item Text="Energy" Value="ENGY" />
        <Item Text="Finance" Value="FNCE" />
    </mobile:SelectionList>
    <mobile:Command runat="server" OnClick="GoCommand_OnClick" Text="Go" />
</mobile:Form>

<mobile:Form runat="server" id="SecondForm" OnActivate="SecondForm_OnActivate">
    <mobile:Label runat="server" StyleReference="title" Text="You Selected:" />
    <mobile:Label runat="server">Name: <%# Company.Text %></mobile:Label>
    <mobile:Label runat="server">Industry: <%# IndustryList.Selection.Value %></mobile:Label>
</mobile:Form>



