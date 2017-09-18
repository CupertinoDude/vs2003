<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" EnableViewState="false" %>

<script runat="server" language="VB">

Protected Sub Page_Load(sender As Object, e As EventArgs)

    Dim customerID As String = Request.QueryString("cid")
    If (Not(customerID Is Nothing))
        customerID = Server.HtmlEncode(customerID)

        ' A customer ID was found. Here, you would normally look
        ' up the customer's profile in a database. 
        ' This code simulates such a lookup by converting the client ID
        ' back to a user.

        Dim underscore As Integer = customerID.IndexOf(Chr(95))
        If (underscore <> -1)
        
            ' If visiting the first time, prompt the user to bookmark.

            If (Not(Session("FirstTime") Is Nothing))

                Session("FirstTime") = Nothing
                WelcomeLabel.Text = _
                    String.Format("Welcome to the site, {0}", customerID.Substring(0, underscore))
                ActiveForm = WelcomeForm
            
            Else
            
                ReturnLabel.Text = String.Format("Welcome back, {0}", customerID.Substring(0, underscore))
                ActiveForm = ReturnForm
            
            End If
        
        End If

    End If

End Sub

Protected Sub LoginForm_OnSubmit(sender As Object, e As EventArgs)

    ' Generate a customer ID. Here, you would normally create
    ' a new customer profile.
                                                            
    Dim customerID As String = CustomerName.Text & Chr(95) & System.Guid.NewGuid().ToString()
    Dim path As String = AbsoluteFilePath & "?cid=" & Server.UrlEncode(customerID)
    Session("FirstTime") = True
    Me.RedirectToMobilePage(path)

End Sub

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server" StyleReference="title">Welcome to the site. Please register to continue.</mobile:Label>
    <mobile:TextBox runat="server" id="CustomerName" />
    <mobile:Command runat="server" OnClick="LoginForm_OnSubmit" Text="Register" />
</mobile:Form>

<mobile:Form id="WelcomeForm" runat="server">
    <mobile:Label runat="server" id="WelcomeLabel" />
    Please bookmark this page for future access.
</mobile:Form>

<mobile:Form id="ReturnForm" runat="server">
    <mobile:Label runat="server" id="ReturnLabel" />
</mobile:Form>


