<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>
<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="System.Web.Mobile" %>

<script runat="server" language="VB">

Protected Sub Page_Load(sender As Object, e As EventArgs)

    If (Not IsPostBack)

        ' Add all property names found in the device capabilities class.

        Dim properties As PropertyDescriptorCollection = TypeDescriptor.GetProperties(Request.Browser)
        If (Not (properties Is Nothing))

            ' Bind directly to list, which can extract Name property from
            ' each property.
            CapabilityList.DataSource = properties
            CapabilityList.DataBind()

        End If

    End If

End Sub

Protected Sub CapabilityList_OnClick(sender As Object, e As ListCommandEventArgs)

    Dim propertyName As String = e.ListItem.Text
    CapabilityName.Text = propertyName
    CapabilityValue.Text = DataBinder.Eval(Request.Browser, propertyName, "{0}")

    ActiveForm = SecondForm

End Sub

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



