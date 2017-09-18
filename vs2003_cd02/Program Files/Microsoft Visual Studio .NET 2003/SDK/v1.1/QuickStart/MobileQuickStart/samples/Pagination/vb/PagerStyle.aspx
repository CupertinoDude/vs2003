<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Protected Sub Page_Load(sender As Object, e As EventArgs)

    If (Not IsPostBack)

        ' Find all primes between 1 and 500, using a sieve and
        ' ignoring even numbers greater than 2.

        Dim item As new MobileListItem("2")
        Primes.Items.Add(item)

        Dim isCounted(501) As Boolean
        Dim i As Integer = 3

        Do While (i <= 500)

            If (isCounted(i) = False)

                Dim newItem As New MobileListItem(i.ToString())
                Primes.Items.Add(newItem)

                Dim multiple As Integer = i * 3
                Do While (multiple <= 500)
                    
                    isCounted(multiple) = True
                    multiple = multiple + i * 2

                Loop
            End If

            i = i + 2

        Loop

    End If

End Sub

</script>

<mobile:Form runat="server" Paginate="true"
            PagerStyle-Font-Size="Small" 
            PagerStyle-Font-Bold="True" 
            PagerStyle-NextPageText="Forward to Page {0}" 
            PagerStyle-PreviousPageText="Back to Page {0}">
    <DeviceSpecific><Choice>
        <HeaderTemplate>
            <mobile:Label runat="server" StyleReference="title" Text="Prime Numbers" />
        </HeaderTemplate>
    </Choice></DeviceSpecific>
    <mobile:List runat="server" id="Primes" />
</mobile:Form>


