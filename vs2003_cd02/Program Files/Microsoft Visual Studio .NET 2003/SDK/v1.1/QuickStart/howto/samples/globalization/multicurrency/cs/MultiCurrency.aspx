<%@ Page language="C#" debug="true" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Threading" %>


<html>
<head>
<SCRIPT runat="server">


	void Page_Load(){
		String OutString = "";


		CultureInfo DeCulture = new CultureInfo("de-DE", false);

		Thread.CurrentThread.CurrentCulture = DeCulture;

		NumberFormatInfo LocalFormat = (NumberFormatInfo)NumberFormatInfo.CurrentInfo.Clone();
		LocalFormat.CurrencySymbol = "DM";	// Replace currency symbol with DM sign.

		Decimal myCurrency = new Decimal( 123456 );

		myCurrency.ToString( "C", LocalFormat );

		OutString = "Euro : " + myCurrency.ToString( "C", NumberFormatInfo.CurrentInfo );
		OutString += "<br>" + "German Mark : " + myCurrency.ToString( "C", LocalFormat );
		CultureInfo EnUSCulture = new CultureInfo("en-US");
		Thread.CurrentThread.CurrentCulture = EnUSCulture;
		OutString += "<br>" + "US Dollar : " + myCurrency.ToString( "C", NumberFormatInfo.CurrentInfo );

		Response.Write( OutString );

	}
</SCRIPT>
</head>

<body>
</body>
</html>

