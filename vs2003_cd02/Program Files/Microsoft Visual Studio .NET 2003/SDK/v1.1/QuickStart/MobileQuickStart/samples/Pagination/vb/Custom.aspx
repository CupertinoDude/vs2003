<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Private Function TestPrimes(from As Integer, howMany As Integer) As Boolean()

    ' Test a range of numbers to determine which ones are prime.

    Dim isPrime(howMany) As Boolean

    Dim endAt As Integer = from + howMany - 1
    Dim i As Integer
    
    For i = from To endAt

        isPrime(i - from) = True

        Dim sqrt As Integer
        sqrt = Int(Math.Sqrt(i))

        Dim factor As Integer
        For factor = 2 To sqrt

            If ((i Mod factor) = 0)

                isPrime(i - from) = False
                Exit For

            End If

        Next

    Next

    TestPrimes = isPrime

End Function

Protected Sub Page_Load(sender As Object, e As EventArgs)

    ' Whereas this method would normally load items into the list, nothing
    ' is necessary here. Items will be loaded through the OnLoadItems event 
    ' handler on demand. 

End Sub

Protected Sub Primes_OnLoadItems(sender As Object, args As LoadItemsEventArgs)

    Primes.Items.Clear()

    ' Start the list at 2.
    Dim startNumber as Integer = args.ItemIndex + 2
    Dim isPrime As Boolean()
    isPrime = TestPrimes(startNumber, args.ItemCount)

    Dim i As Integer
    For i = 0 To args.ItemCount - 1

        Dim message As String
        If (isPrime(i) = True)

            message = String.Format("{0} is prime", i + startNumber)

        Else

            message = String.Format("{0} is not prime", i + startNumber)

        End If

        Primes.Items.Add(new MobileListItem(message))

    Next

End Sub

</script>

<mobile:Form runat="server" Paginate="true">
    <mobile:List runat="server" id="Primes" ItemCount="20000" OnLoadItems="Primes_OnLoadItems" />
</mobile:Form>


