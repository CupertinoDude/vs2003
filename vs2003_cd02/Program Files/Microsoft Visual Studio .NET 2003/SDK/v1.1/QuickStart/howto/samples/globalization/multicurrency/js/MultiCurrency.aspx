<%@ Page language="JScript" debug="true" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Threading" %>


<html>
<head>
<SCRIPT runat="server">


	function Page_Load(){
		var OutString : String = "";


		var DeCulture : CultureInfo = new CultureInfo("de-DE", false);

		Thread.CurrentThread.CurrentCulture = DeCulture;

		var LocalFormat : NumberFormatInfo = NumberFormatInfo(NumberFormatInfo.CurrentInfo.Clone());
		LocalFormat.CurrencySymbol = "DM";	// Replace currency symbol with Euro sign.

		var myCurrency : Decimal = new Decimal( 123456 );

		myCurrency.ToString( "C", LocalFormat );

		OutString = "Euro : " + myCurrency.ToString( "C", NumberFormatInfo.CurrentInfo );
		OutString += "<br>" + "German Mark : " + myCurrency.ToString( "C", LocalFormat );
		var EnUSCulture : CultureInfo = new CultureInfo("en-US");
		Thread.CurrentThread.CurrentCulture = EnUSCulture;
		OutString += "<br>" + "US Dollar : " + myCurrency.ToString( "C", NumberFormatInfo.CurrentInfo );

		Response.Write( OutString );

	}
</SCRIPT>
</head>

<body>
</body>
</html>

