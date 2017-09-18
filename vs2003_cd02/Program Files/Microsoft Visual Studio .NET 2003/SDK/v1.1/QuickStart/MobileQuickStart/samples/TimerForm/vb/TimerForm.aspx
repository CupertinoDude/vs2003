<%@ Page Language="VB" Inherits="System.Web.UI.MobileControls.MobilePage" %>
<%@ Register TagPrefix="acme" Namespace="Acme" Assembly="Acme.TimerFormVB" %>

<script language="VB" runat="server">

    Sub Page_Load(sender As Object, e As EventArgs)

        If Not IsPostBack

            Form1.DataBind()

        End If

    End Sub

    Sub Form_OnTimer(sender As Object, e As EventArgs)

        Form1.DataBind()
    
    End Sub

</script>

<acme:TimerFormVB Title="Need a title?" runat="server" id="Form1" OnTimer="Form_OnTimer" Delay="5">
    The current time is <%# DateTime.Now.ToString() %>&nbsp;<br>
    This form will refresh in 5 seconds.<br>
    <mobile:Link runat="server" NavigateUrl="#Form2" Text="Click here to go to a different form" />
</acme:TimerFormVB>

<acme:TimerFormVB runat="server" id="Form2" AutoNavigateUrl="#Form3" Delay="5">
    This is Form 2.<br>
    In 5 seconds, this form will automatically navigate to Form 3. 
</acme:TimerFormVB>

<acme:TimerFormVB runat="server" id="Form3" AutoNavigateUrl="#Form2" Delay="5">
    This is Form 3.<br>
    In 5 seconds, this form will automatically navigate back to Form 2. 
</acme:TimerFormVB>


