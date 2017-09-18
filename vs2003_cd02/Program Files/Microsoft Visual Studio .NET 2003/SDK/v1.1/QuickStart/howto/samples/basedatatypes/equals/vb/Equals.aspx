<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Reflection" %>

<script language="VB" runat=server>

Sub Page_Load(Source As Object, E As EventArgs)

	output.Text = "<pre>" & ObjectsEqual.Go() & "</pre>"
End Sub

Public Class ObjectsEqual

	public Shared Function Go() As String

		'declare the StreamReader, for accessing the file
		Dim strWriter As StringWriter = new StringWriter()
		Console.SetOut(strWriter)

		compareStrings()

		Console.WriteLine()
		Console.WriteLine()

		compareBooleans()

		Console.WriteLine()
		Console.WriteLine()

		compareCultures()

		Console.WriteLine()
		Console.WriteLine()

		Console.WriteLine("Object Reference Example")
		Console.WriteLine("------------------------")


		Dim MyCar as Car = new Car("Red")       ' My Car, red!

		Console.WriteLine("I just made a Car. Its color is {0}.", MyCar.Color)

		Dim YourCar As Car = MyCar      ' Your Car, referring to the SAME car...

		Console.WriteLine("YourCar and MyCar refer to the same car. YourCar's color is therefore {0}.", _
				MyCar.Color)

		YourCar.Color = "Pink"           ' change the Color of YourCar...

		Console.WriteLine("If you change the color of YourCar to {0}, MyCar's color also changes to {1}.", _
							YourCar.Color, MyCar.Color)

		Dim MyName as String = "Kayleen"        ' make MyName

		Console.WriteLine()

		Console.WriteLine("In contrast, Strings are different. MyName is {0}.", MyName)

		Dim YourName As String = MyName         ' Make yourName, which appears to reference the same string?

		Console.WriteLine("Initially, I can set YourName to MyName, so YourName is {0}.", YourName)

		YourName = "Mary"                ' change YourName...

		Console.WriteLine("But if I change YourName to {0}, MyName ({1}) remains the same.", YourName, MyName)

		Go = strWriter.ToString()
	End Function

	Shared Function CompareVals( firstVal As Object, secondVal as Object) As String

		If firstVal = secondVal Then
			CompareVals = "Yes"
		Else
			CompareVals = "No"
		End If

	End Function

	Shared Function CompareObjectVals( firstVal As Object, secondVal As Object) As String

		If firstVal Is secondVal Then
			CompareObjectVals = "Yes"
		Else
			CompareObjectVals = "No"
		End If

    End Function


	Shared Function CompareRefs( firstVal As Object, secondVal as Object) As String

		If firstVal.Equals(secondVal) Then
			CompareRefs = "Yes"
		Else
			CompareRefs = "No"
		End If

	End Function

	Shared Sub compareStrings()

		Dim firstVal As String = "hello"
		Dim secondVal As String = "goodbye"
		Dim thirdVal As String = "hello"
		Dim fourthVal As String = firstVal

		Console.WriteLine("Comparing Strings")
		Console.WriteLine("-----------------")

		Console.WriteLine("Does the String {0} {1} the String {2}? {3}", _
					firstVal, "=", secondVal, CompareVals(firstVal, secondVal))
		Console.WriteLine("Does the String {0} {1} the String {2} (Different Reference)? {3}", _
					firstVal, "=", thirdVal, CompareVals(firstVal, thirdVal))
		Console.WriteLine("Does the String {0} {1} the String {2} (Same Reference)? {3}", _
					firstVal, "=", fourthVal, CompareVals(firstVal, fourthVal))

		Console.WriteLine()

		Console.WriteLine("Does the String {0} {1} the String {2}? {3}", _
					firstVal, ".Equals", secondVal, CompareRefs(firstVal, secondVal))
		Console.WriteLine("Does the String {0} {1} the String {2} (Different Reference)? {3}", _
					firstVal, ".Equals", thirdVal, CompareRefs(firstVal, thirdVal))
		Console.WriteLine("Does the String {0} {1} the String {2} (Same Reference)? {3}", _
					firstVal, ".Equals", fourthVal, CompareRefs(firstVal, fourthVal))
	End Sub

	Shared Sub compareBooleans()

		Dim firstVal As Boolean = false
		Dim secondVal As Boolean = true
		Dim thirdVal As Boolean = false
		Dim fourthVal As Boolean = firstVal

		Console.WriteLine("Comparing base Boolean datatypes")
		Console.WriteLine("--------------------------------")

		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2}? {3}", _
					firstVal, "=", secondVal, CompareVals(firstVal, secondVal))
		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2} (Different Reference)? {3}", _
					firstVal, "=", thirdVal, CompareVals(firstVal, thirdVal))
		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2} (Same Reference)? {3}", _
					firstVal, "=", fourthVal, CompareVals(firstVal, fourthVal))

		Console.WriteLine()

		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2}? {3}", _
					firstVal, ".Equals", secondVal, CompareRefs(firstVal, secondVal))
		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2} (Different Reference)? {3}", _
					firstVal, ".Equals", thirdVal, CompareRefs(firstVal, thirdVal))
		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2} (Same Reference)? {3}", _
					firstVal, ".Equals", fourthVal, CompareRefs(firstVal, fourthVal))
	End Sub

	Shared Sub compareCultures()

		Dim firstVal As CultureInfo = new CultureInfo("en-NZ")
		Dim secondVal As CultureInfo = new CultureInfo("en-US")
		Dim thirdVal As CultureInfo = new CultureInfo("en-NZ")
		Dim fourthVal As CultureInfo = firstVal

		Console.WriteLine("Comparing CultureInfo object references")
		Console.WriteLine("-----------------------------------")

		Console.WriteLine("Is the CultureInfo {0} Equal to the CultureInfo {1}, using Is? {2}", _
					firstVal, secondVal, CompareObjectVals(firstVal, secondVal))
		Console.WriteLine( _
			"Is the CultureInfo {0} Equal to the CultureInfo {1}, using Is (Different Reference)? {2}", _
					firstVal, thirdVal, CompareObjectVals(firstVal, thirdVal))
		Console.WriteLine( _
			"Is the CultureInfo {0} Equal to the CultureInfo {1}, using Is (Same Reference)? {2}", _
					firstVal, fourthVal, CompareObjectVals(firstVal, fourthVal))

		Console.WriteLine()

		Console.WriteLine("Is the cultureInfo {0} Equal to the CultureInfo {1}, using .Equals? {2}", _
					firstVal, secondVal, CompareRefs(firstVal, secondVal))
		Console.WriteLine( _
			"Is the cultureInfo {0} Equal to the CultureInfo {1}, using .Equals (Different Reference)? {2}", _
					firstVal, thirdVal, CompareRefs(firstVal, thirdVal))
		Console.WriteLine( _
			"Is the cultureInfo {0} Equal to the CultureInfo {1}, using .Equals (Same Reference)? {2}", _
					firstVal, fourthVal, CompareRefs(firstVal, fourthVal))
	End Sub

End Class

Class Car

	Dim _color As String

	Public Sub New(color As String)
		MyBase.New()
		_color = color
	End Sub

	public Property Color () As String
		Get
			Return _color
		End Get
		Set
			_color = value
		End Set
	End Property
End Class

</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align="left"><td><b>The following example demonstrates using the Is keyword, the = operator, and the Equals method to compare objects, and primitive (base) types to eachother</b>. When using the Is keyword, objects will be compared for referential consistency, while using the Equals method, objects will be compared for value equality. Strings and other base datatypes should be compared for value equality using the = operator or the Equals method only, in which case the results will be the same.
		<hr>
    </td></tr>

    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>