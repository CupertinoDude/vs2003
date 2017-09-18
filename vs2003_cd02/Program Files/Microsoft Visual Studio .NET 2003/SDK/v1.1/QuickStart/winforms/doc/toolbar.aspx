<html>
  <head>
    <title>TOOLBAR</TITLE>
    <script>
        //Need to handle the contents page not loaded yet
        function refreshContent() {
            for (i=0; i<window.parent.frames.length; i++) {
                if (window.parent.frames[i].document.title != "TOOLBAR") {
                    window.parent.frames[i].document.location.reload(true);
                }
            }
        }
    </script>
    <script language="C#" runat=server>
        public bool ShowCS = true;
        public bool ShowVB = false;

        public void Page_Load(Object sender, EventArgs e) {

            Label1.EnableViewState=false;

            if (!Page.IsPostBack) {

                //Set initial state based on Cookie value
                HttpCookie codeCookie = Request.Cookies["langpref"];
                HttpCookie codeTOC = Request.Cookies["tocpref"];

                String cookie = "VB";
                String toc = "No";

                if (codeCookie != null) {
                    cookie = codeCookie.Value;
                }
                if (codeTOC != null ) {
                    toc = codeTOC.Value;
                }

                for (int i=0; i<LanguageSelect.Items.Count; i++) {
                    if (LanguageSelect.Items[i].Value == cookie) {
                        LanguageSelect.SelectedIndex = i;
                    }
                }
                if ( toc == "No" ) {
                    TOCSelect.CommandName = "Yes";
                    TOCSelect.Text = "<FONT Color=\"#ffffff\">Hide TOC</FONT>";
                } else {
                    TOCSelect.CommandName = "No";
                    TOCSelect.Text = "<FONT Color=\"#ffffff\">Show TOC</FONT>";
                }
            }
        }

        private void TOC_Select(Object sender, EventArgs e) {
            HttpCookie cookie = new HttpCookie("tocpref", ((LinkButton)sender).CommandName);
            cookie.Path = "/";
            Response.SetCookie (cookie);

            switch (((LinkButton)sender).CommandName) {
                case "No":
                    TOCSelect.CommandName = "Yes";
                    TOCSelect.Text = "<FONT Color=\"#ffffff\">Hide TOC</FONT>";
                    break;
                case "Yes":
                    TOCSelect.CommandName = "No";
                    TOCSelect.Text = "<FONT Color=\"#ffffff\">Show TOC</FONT>";
                    break;
            }

            Label1.Text="<SCRIPT Language=\"Javascript1.2\">refreshContent()</" ;
            Label1.Text += "SCRIPT>" ;
        }

        private void Language_Select(Object sender, EventArgs e) {

            String value = LanguageSelect.SelectedItem.Value;

            HttpCookie cookie = new HttpCookie("langpref", value);
            cookie.Path = "/";
            Response.SetCookie (cookie);

            Label1.Text="<SCRIPT Language=\"Javascript1.2\">refreshContent()</" ;
            Label1.Text += "SCRIPT>" ;
        }

    </script>
    <link rel="stylesheet" href="/quickstart/include/qsstyle.css">
  </head>
<body TOPMARGIN="0" LEFTMARGIN="0" MARGINWIDTH="0" 
    MARGINHEIGHT="0" BGCOLOR="darkred">
<form method="POST" action="toolbar.aspx" runat=server>
<DIV ID="TBDownLevelDiv">

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0 BORDER=0 BGCOLOR='#ffffff'>
<TR>
    <TD VALIGN="TOP" HEIGHT="60" WIDTH="*" ROWSPAN="2">
        <img src="/quickstart/winforms/images/winforms.gif" width="288" 
        height="60" alt="" border="0"></TD>

    <TD VALIGN=TOP HEIGHT="20" WIDTH="*" ALIGN=RIGHT>
        <IMG SRC='/quickstart/images/curve.gif' BORDER="0" 
        WIDTH="18" HEIGHT="20"></TD>

    <TD class="mstoolbar" NOWRAP COLSPAN=2>
    &nbsp;&nbsp;Links to the Web: &nbsp; &nbsp; <A class="mstoolbar"
        HREF='http://www.microsoft.com/support/' TARGET='_top'>Support</A>
        &nbsp;&nbsp;|
    &nbsp;&nbsp;<A class="mstoolbar"
        HREF='http://search.microsoft.com/' TARGET='_top'>Search</A>
        &nbsp;&nbsp;|
    &nbsp;&nbsp;<A class="mstoolbar"
        HREF='http://www.microsoft.com/' TARGET='_top'>microsoft.com</A>
        &nbsp;&nbsp;
    </TD>
</TR>

<TR>
    <TD VALIGN=TOP HEIGHT=40 WIDTH=19>&nbsp</TD>

    <TD VALIGN=TOP HEIGHT=40 ALIGN=RIGHT NOWRAP COLSPAN=2>
        <A HREF="http://www.microsoft.com/" TARGET="_top">
        <IMG SRC='/quickstart/images/mslogo.gif' BORDER=0 
        WIDTH=112 HEIGHT=40></A></TD>
</TR>

<TR>
    <TD BGCOLOR="#8B0000" HEIGHT=23 VALIGN=MIDDLE NOWRAP COLSPAN=4>
    <TABLE width="100%" CELLPADDING=0 CELLSPACING=0 BORDER=0>
    <TR>

    <TD class="toolbar" nowrap>&nbsp;&nbsp;
        <A class="toolbar" HREF='/quickstart' TARGET='_top'>Welcome</A>
        &nbsp;&nbsp;|&nbsp;&nbsp;

        <A class="toolbar" HREF='/quickstart/aspplus' TARGET='_top'>ASP.NET</A>
        &nbsp;&nbsp;|&nbsp;&nbsp;

        <A class="toolbar" HREF='/MobileQuickstart' TARGET='_top'>ASP.NET Mobile Controls</A>
        &nbsp;&nbsp;|&nbsp;&nbsp;

        <A class="toolbar" HREF='/quickstart/winforms' TARGET='_top'>Windows 
        Forms</A>
        &nbsp;&nbsp;|&nbsp;&nbsp;

        <A class="toolbar" HREF='/quickstart/howto' TARGET='_top'>How Do I...?</A>
        &nbsp;&nbsp;
    </TD>

    <TD class="toolbar" WIDTH="*" ALIGN="RIGHT" nowrap>
        <style>
            .Select { font-family: verdana;font-size: 7.5pt;
                      font-weight: bold;background-color: darkred;
                      color:white;margin-top:2; }
        </style>
        <asp:LinkButton id="TOCSelect" OnClick="TOC_Select" CommandName="Yes"
            Text="Hide TOC" runat="server" style="color:#ffffff;
            text-decoration:none;font-size: 7.5pt;vertical-align:middle;
            font-family:Verdana, Arial, Helvetica, sans-serif;font-weight:bold;" />

        &nbsp;|&nbsp;

        I want my samples in...&nbsp;</td>

    <TD class="toolbar" width="80" align="right" valign="middle" nowrap>
        <asp:DropDownList class="Select" id="LanguageSelect" 
            OnSelectedIndexChanged="Language_Select" AutoPostBack runat="server">
            <asp:ListItem value="C#" runat="server">C#</asp:ListItem>
            <asp:ListItem value="VB" runat="server">VB</asp:ListItem>
            <asp:ListItem value="JScript" runat="server">JScript</asp:ListItem>
        </asp:DropDownList>

        &nbsp;&nbsp;
    </TD>
</TR>
</TABLE>

</TD>
<asp:Label  runat=server id=Label1 Text="" />
</TR>
</TABLE>

</DIV>
</form>
</body>
</html>