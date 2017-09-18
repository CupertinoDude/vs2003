
<script language="C#" runat="server">

    void Session_Start(Object sender, EventArgs e) {
    
      Session["BackColor"] = "beige";
      Session["ForeColor"] = "black";
      Session["LinkColor"] = "blue";
      Session["FontSize"] = "8pt";
      Session["FontName"] = "verdana";
    }

</script>