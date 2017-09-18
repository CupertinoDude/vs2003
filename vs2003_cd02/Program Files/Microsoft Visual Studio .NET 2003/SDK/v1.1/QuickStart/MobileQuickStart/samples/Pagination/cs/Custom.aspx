<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

private bool[] TestPrimes(int from, int howMany)
{
    // Test a range of numbers to determine which ones are prime.

    bool[] isPrime = new bool[howMany];

    int to = from + howMany - 1;
    for (int i = from; i <= to; i++)
    {
        isPrime[i - from] = true;

        int sqrt = (int)Math.Sqrt((float)i);
        for (int factor = 2; factor <= sqrt; factor++)
        {
            if (i % factor == 0)
            {
                isPrime[i - from] = false;
                break;
            }
        }
    }

    return isPrime;
}

protected void Page_Load(Object sender, EventArgs e)
{
    // Whereas this method would normally load items into the list, nothing
    // is necessary here. Items will be loaded through the OnLoadItems event 
    // handler on demand. 
}

protected void Primes_OnLoadItems(Object sender, LoadItemsEventArgs args)
{
    Primes.Items.Clear();

    // Start the list at 2.
    int startNumber = args.ItemIndex + 2;
    bool[] isPrime = TestPrimes(startNumber, args.ItemCount);
    for (int i = 0; i < args.ItemCount; i++)
    {
        String message;
        if (isPrime[i])
        {
            message = String.Format("{0} is prime", i + startNumber);
        }
        else
        {
            message = String.Format("{0} is not prime", i + startNumber);
        }

        Primes.Items.Add(new MobileListItem(message));
    }
}

</script>

<mobile:Form runat="server" Paginate="true">
    <mobile:List runat="server" id="Primes" ItemCount="20000" OnLoadItems="Primes_OnLoadItems" />
</mobile:Form>


