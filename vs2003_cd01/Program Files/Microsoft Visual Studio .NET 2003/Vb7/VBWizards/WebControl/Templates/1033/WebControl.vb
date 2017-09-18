Imports System.ComponentModel
Imports System.Web.UI

<DefaultProperty("Text"), ToolboxData("<{0}:[!output SAFE_ITEM_NAME] runat=server></{0}:[!output SAFE_ITEM_NAME]>")> Public Class [!output SAFE_ITEM_NAME]
    Inherits System.Web.UI.WebControls.WebControl

    Dim _text As String

    <Bindable(True), Category("Appearance"), DefaultValue("")> Property [Text]() As String
        Get
            Return _text
        End Get

        Set(ByVal Value As String)
            _text = Value
        End Set
    End Property

    Protected Overrides Sub Render(ByVal output As System.Web.UI.HtmlTextWriter)
        output.Write([Text])
    End Sub

End Class
