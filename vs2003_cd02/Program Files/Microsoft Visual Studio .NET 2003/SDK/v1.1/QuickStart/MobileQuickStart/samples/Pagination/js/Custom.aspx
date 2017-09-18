<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script runat="server" language="JScript">

private function TestPrimes( from : int, howMany : int) : boolean[]
{
    // Test a range of numbers to determine which ones are prime.

    var isPrime : boolean[] = new boolean[howMany];

    var to : int = from + howMany - 1;
    for (var i : int = from; i <= to; i++)
    {
        isPrime[i - from] = true;

        var sqrt : int;
        sqrt = Convert.ToInt32( Math.sqrt( Convert.ToDouble(i) ) );
        for (var factor : int = 2; factor <= sqrt; factor++)
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

protected function Page_Load( sender:Object, e:EventArgs )
{
    // Whereas this method would normally load items into the list, nothing
    // is necessary here. Items will be loaded through the OnLoadItems event 
    // handler on demand. 
}

protected function Primes_OnLoadItems(sender:Object , args:LoadItemsEventArgs )
{
    Primes.Items.Clear();

    // Start the list at 2.
    var startNumber : int = args.ItemIndex + 2;
    var isPrime : boolean[] = TestPrimes(startNumber, args.ItemCount);
    for (var i : int = 0; i < args.ItemCount; i++)
    {
        var message : String;
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


