<%@ Page Language="C#" Inherits="System.Web.UI.MobileControls.MobilePage" %>
<%@ Register TagPrefix="acme" Namespace="Acme" Assembly="Acme.TimerFormCS" %>

<script language="C#" runat="server">

    void Page_Load(Object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Form1.DataBind();
        }
    }

    void Form_OnTimer(Object sender, EventArgs e)
    {
        Form1.DataBind();
    }

</script>

<acme:TimerFormCS Title="Need a title?" runat="server" id="Form1" OnTimer="Form_OnTimer" Delay="5">
    The current time is <%# DateTime.Now.ToString() %>&nbsp;<br>
    This form will refresh in 5 seconds.<br>
    <mobile:Link runat="server" NavigateUrl="#Form2" Text="Click here to go to a different form" />
</acme:TimerFormCS>

<acme:TimerFormCS runat="server" id="Form2" AutoNavigateUrl="#Form3" Delay="5">
    This is Form 2.<br>
    In 5 seconds, this form will automatically navigate to Form 3. 
</acme:TimerFormCS>

<acme:TimerFormCS runat="server" id="Form3" AutoNavigateUrl="#Form2" Delay="5">
    This is Form 3.<br>
    In 5 seconds, this form will automatically navigate back to Form 2. 
</acme:TimerFormCS>


