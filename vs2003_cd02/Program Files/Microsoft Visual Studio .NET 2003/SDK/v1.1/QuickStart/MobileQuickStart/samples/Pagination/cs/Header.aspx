<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

protected void Page_Load(Object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        // Find all primes between 1 and 500, using a sieve and
        // ignoring even numbers greater than 2.

        Primes.Items.Add (new MobileListItem ("2"));

        bool[] isCounted = new bool[501];
        int i = 3;
        while (i <= 500)
        {
            if (!isCounted[i])
            {
                Primes.Items.Add (new MobileListItem (i.ToString()));
                for (int multiple = i * 3; multiple <= 500; multiple += i * 2)
                {
                    isCounted[multiple] = true;
                }
            }

            i += 2;
        }
    }
}

</script>

<mobile:Form runat="server" Paginate="true">
    <DeviceSpecific><Choice>
        <HeaderTemplate>
            <mobile:Label runat="server" StyleReference="title" Text="Prime Numbers" />
        </HeaderTemplate>
    </Choice></DeviceSpecific>
    <mobile:List runat="server" id="Primes" />
</mobile:Form>


