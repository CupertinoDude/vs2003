<%@Import Namespace="System.Globalization" %>

<script runat="server" language="C#">

override protected void Render(HtmlTextWriter writer) {
    LocalizeSearchText();
	base.Render(writer);
}

void SearchButton_Clicked(Object sender, EventArgs e) {
    if(Page.IsPostBack && SearchText.Text.Length > 0) {
	Page.Response.Redirect("http://search.msn.com/results.asp?q="
	    + Server.UrlEncode(SearchText.Text) );
    } else {
	LocalizeSearchText();
    }
}

public void LocalizeSearchText() {
    switch(CultureInfo.CurrentUICulture.Name) {
    case "en-US":
    	SearchText.Text = "Computer";
    	SearchButton.Text = "Search";
    	break;
    case "de-DE":
    	SearchText.Text = "Netz";
    	SearchButton.Text = "Suchen";
    	break;
    case "ja-JP":
    	SearchText.Text = "ソフトウエア";
    	SearchButton.Text = "検索";
    	break;
    default:
        SearchButton.Text = "Search";
        break;
    }
}

</script>



<asp:Panel runat="server" BackColor="Wheat">
	<asp:TextBox runat="server" id="SearchText" Columns="30" />
	<asp:Button runat="server" id="SearchButton" Text="Search" OnClick="SearchButton_Clicked"/>
</asp:Panel>

