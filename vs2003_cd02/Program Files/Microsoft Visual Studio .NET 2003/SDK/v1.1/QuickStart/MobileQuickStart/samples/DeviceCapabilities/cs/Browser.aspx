<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>
<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="System.Web.Mobile" %>

<script runat="server" language="c#">

protected void Page_Load(Object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        // Add all property names found in the device capabilities class.

        PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(Request.Browser);
        if (properties != null)
        {
            // Bind directly to list, which can extract Name property from
            // each property.
            CapabilityList.DataSource = properties;
            CapabilityList.DataBind();
        }
    }
}

protected void CapabilityList_OnClick(Object sender, ListCommandEventArgs e)
{
    String propertyName = e.ListItem.Text;
    CapabilityName.Text = propertyName;
    CapabilityValue.Text = DataBinder.Eval(Request.Browser, propertyName, "{0}");

    ActiveForm = SecondForm;
}

</script>

<mobile:Form runat="server" Wrapping="NoWrap" Paginate="True">
    <mobile:Label runat="server" StyleReference="title" Text="Mobile Capabilities" />
    <mobile:List runat="server" id="CapabilityList" DataTextField="Name" 
        OnItemCommand="CapabilityList_OnClick"  />
</mobile:Form>

<mobile:Form runat="server" id="SecondForm">
    <mobile:Label runat="server" id="CapabilityName" StyleReference="title" />
    <mobile:Label runat="server" id="CapabilityValue" />
</mobile:Form>



