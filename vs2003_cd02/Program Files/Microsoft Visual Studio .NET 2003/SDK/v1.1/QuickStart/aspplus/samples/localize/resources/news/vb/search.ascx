<%@Import Namespace="System.Globalization" %>

<script runat="server" language="VB">

Overrides Protected Sub Render(Writer As HtmlTextWriter)
    LocalizeSearchText()
    MyBase.Render(writer)
End Sub

Sub SearchButton_Clicked(Sender As Object, E As EventArgs)
    If Page.IsPostBack And SearchText.Text.Length > 0 Then
	Page.Response.Redirect("http://search.msn.com/results.asp?q=" & Server.UrlEncode(SearchText.Text) )
    Else
	LocalizeSearchText()
    End If
End Sub

Public Sub LocalizeSearchText()
    Select Case CultureInfo.CurrentUICulture.Name
        Case "en-US"
            SearchText.Text = "Computer"
            SearchButton.Text = "Search"
        Case "de-DE"
            SearchText.Text = "Netz"
            SearchButton.Text = "Suchen"
        Case "ja-JP"
            SearchText.Text = "ソフトウエア"
            SearchButton.Text = "検索"
        Case Else
            SearchButton.Text = "Search"
    End Select
End Sub
</script>



<asp:Panel runat="server" BackColor="Wheat">
	<asp:TextBox runat="server" id="SearchText" Columns="30" />
	<asp:Button runat="server" id="SearchButton" Text="Search" OnClick="SearchButton_Clicked"/>
</asp:Panel>

