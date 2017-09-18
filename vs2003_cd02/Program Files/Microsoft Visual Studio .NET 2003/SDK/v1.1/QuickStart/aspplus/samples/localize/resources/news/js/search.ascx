<%@Import Namespace="System.Globalization" %>

<script runat="server" language="JScript">

protected function Render(writer:HtmlTextWriter) : void {
    LocalizeSearchText();
	super.Render(writer);
}

function SearchButton_Clicked(sender:Object, e:EventArgs) : void {
    if(Page.IsPostBack && SearchText.Text.Length > 0) {
    	Page.Response.Redirect("http://search.msn.com/results.asp?q="
    	    + Server.UrlEncode(SearchText.Text) );
    } else {
	    LocalizeSearchText();
    }
}

public function LocalizeSearchText() : void {
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

