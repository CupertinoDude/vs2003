<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script runat="server" language="JScript">

protected function Page_Load( sender:Object, e:EventArgs )
{
    if (!IsPostBack)
    {
        // Find all primes between 1 and 500, using a sieve and
        // ignoring even numbers greater than 2.

        Primes.Items.Add(new MobileListItem("2"));

        var isCounted : boolean[] = new boolean[501];
        var i : int = 3;
        while (i <= 500)
        {
            if (!isCounted[i])
            {
                Primes.Items.Add(new MobileListItem(i.ToString()));
                for (var multiple : int = i * 3; multiple <= 500; multiple += i * 2)
                {
                    isCounted[multiple] = true;
                }
            }

            i += 2;
        }
    }
}

</script>

<mobile:Form runat="server" Wrapping="NoWrap" Paginate="true">
    <mobile:Label runat="server" StyleReference="title" Text="Prime Numbers" />
    <mobile:List runat="server" id="Primes" />
</mobile:Form>


