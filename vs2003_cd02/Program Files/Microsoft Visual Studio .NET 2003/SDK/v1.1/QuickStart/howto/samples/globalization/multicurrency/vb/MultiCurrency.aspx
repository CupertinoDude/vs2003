<%@ Page language="VB" debug="true" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Threading" %>


<html>
<head>
<SCRIPT runat="server">

	Sub Page_Load()
        	Dim OutString As [String] = ""
        	Dim DeCulture As New CultureInfo("de-DE", False)



        	Thread.CurrentThread.CurrentCulture = DeCulture
        	Dim LocalFormat As NumberFormatInfo = CType(NumberFormatInfo.CurrentInfo.Clone(), NumberFormatInfo)

        	LocalFormat.CurrencySymbol = "DM" ' Replace currency symbol with DM sign.
        	Dim myCurrency As New [Decimal](123456)

        	myCurrency.ToString("C", LocalFormat)

        	OutString = "Euro : " + myCurrency.ToString("C", NumberFormatInfo.CurrentInfo)
        	OutString += ChrW(60) + "br" + ChrW(62) + "German Mark : " + myCurrency.ToString("C", LocalFormat)
        	Dim EnUSCulture As New CultureInfo("en-US")
        	Thread.CurrentThread.CurrentCulture = EnUSCulture
        	OutString += ChrW(60) + "br" + ChrW(62) + "US Dollar : " + myCurrency.ToString("C", NumberFormatInfo.CurrentInfo)

        	Response.Write(OutString)

	End Sub 'Page_Load
</SCRIPT>
</head>

<body>
</body>
</html>

