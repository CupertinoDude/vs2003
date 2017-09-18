
<script language="JScript" runat="server">

    function Session_Start(sender:String, e:EventArgs) : void {
    
      Session["BackColor"] = "beige";
      Session["ForeColor"] = "black";
      Session["LinkColor"] = "blue";
      Session["FontSize"] = "8pt";
      Session["FontName"] = "verdana";
    }

</script>