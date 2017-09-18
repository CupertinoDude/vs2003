<%@ Control Inherits="System.Web.UI.MobileControls.MobileUserControl" Language="VB" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>

<script runat="server" language="VB">

Dim _forms As Form() = Nothing

Public Property Forms As Form()

    Get
        Return _forms
    End Get
    Set
        _forms = value 
    End Set
   
End Property

Protected Sub Page_Load(sender As Object, e As EventArgs)

    If (Not (Forms Is Nothing))
    
        MenuList.DataSource = Forms
        MenuList.DataBind()
        
    End If
    
End Sub

Protected Sub MenuList_OnDataBind(sender As Object, e As ListDataBindEventArgs)

    Dim theForm As Form = CType(e.DataItem, Form)
    Dim formTitle As String = theForm.Title
    If (formTitle.Length > 0)
        e.ListItem.Text = theForm.Title
    Else
        e.ListItem.Text = theForm.ID
    End If
    e.ListItem.Value = theForm.UniqueID
End Sub

Protected Sub MenuList_OnClick(sender As Object, e As ListCommandEventArgs)
    Dim ctl As Control = Page.FindControl(e.ListItem.Value)
    If (Not (ctl Is Nothing))
        Dim theForm As Form = CType(ctl, Form)
        Dim thePage As MobilePage = CType(Page, MobilePage)
        ' There is no MobilePage property, because this is not a mobile control!
        thePage.ActiveForm = theForm
    End If

End Sub

</script>

<mobile:List id="MenuList" runat="server" OnItemCommand="MenuList_OnClick" OnItemDataBind="MenuList_OnDataBind">

    <DeviceSpecific><Choice Filter="IsScriptableHtml32">
    
        <HeaderTemplate>
            <table width="90%" height="80%" align="center" border="0" cellspacing="4">
        </HeaderTemplate>
        <ItemTemplate>
            <tr><td bgcolor="#ccffff" align="center">
            <b><asp:LinkButton runat="server" Text="<%# CType(Container, MobileListItem).Text %>" /></b>
            </td></tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr><td bgcolor="#eeeeee" align="center">
            <b><asp:LinkButton runat="server" Text="<%# CType(Container, MobileListItem).Text %>" /></b>
            </td></tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            <table width="80%" align="center" border="0" cellspacing="0">
        </FooterTemplate>
    
    </Choice></DeviceSpecific>

</mobile:List>
