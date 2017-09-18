<%@ Register TagPrefix="Acme" TagName="BookList" Src="pagelet7.ascx" %>

<html>

    <script language="JScript" runat="server">

        function Page_Load(sender : Object, E : EventArgs) : void {

            Page.Controls.Add(new HtmlGenericControl("hr"));

            var c1 : Control = LoadControl("pagelet7.ascx");
            Pagelet7JS(c1).Category = "business";
            Page.Controls.Add(c1);

            Page.Controls.Add(new HtmlGenericControl("hr"));

            var c2 : Control = LoadControl("pagelet7.ascx");
            Pagelet7JS(c2).Category = "trad_cook";
            Page.Controls.Add(c2);

            Page.Controls.Add(new HtmlGenericControl("hr"));

            var c3 : Control = LoadControl("pagelet7.ascx");
            Pagelet7JS(c3).Category = "mod_cook";
            Page.Controls.Add(c3);
        }

    </script>

<body style="font: 10pt verdana">

  <h3>Creating User Controls Programmatically</h3>

</body>
</html>
