<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Globalization" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e) {

	output.Text = "<pre>" + ObjectsEqual.Go() + "</pre>";
}

public class ObjectsEqual {

	public static String Go()
	{
		//declare the StreamReader, for accessing the file
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		compareStrings();

		Console.WriteLine();
		Console.WriteLine();

		compareBooleans();

		Console.WriteLine();
		Console.WriteLine();

		compareCultures();

		Console.WriteLine();
		Console.WriteLine();

		Console.WriteLine("Object Reference Example");
		Console.WriteLine("------------------------");


		Car MyCar = new Car("Red");       // My Car, red!

		Console.WriteLine("I just made a Car. Its color is " + MyCar.Color);

		Car YourCar = MyCar;               // Your Car, referring to the SAME car...

		Console.WriteLine("YourCar and MyCar refer to the same car. YourCar's color is therefore " + MyCar.Color);

		YourCar.Color = "Pink";           // change the Color of YourCar...

		Console.WriteLine("If you change the color of YourCar to {0}, MyCar's color also changes to {1}.", 
							YourCar.Color, MyCar.Color);

		String MyName = "Kayleen";        // make MyName

		Console.WriteLine();

		Console.WriteLine("In contrast, Strings are different. MyName is " + MyName);

		String YourName = MyName;         // Make yourName, which appears to reference the same string?

		Console.WriteLine("Initially, I can set YourName to MyName, so YourName is " + YourName);

		YourName = "Mary";                // change YourName...

		Console.WriteLine("But if I change YourName to {0}, MyName ({1}) remains the same.", YourName, MyName);

		return strWriter.ToString();
	}

	static void compareStrings()
	{

		String firstVal = "hello";
		String secondVal = "goodbye";
		String thirdVal = "hello";
		String fourthVal = firstVal;

		Console.WriteLine("Comparing Strings");
		Console.WriteLine("-----------------");

		Console.WriteLine("Does the String {0} {1} the String {2}? {3}",
					firstVal, "==", secondVal, (firstVal == secondVal ? "Yes" : "No"));
		Console.WriteLine("Does the String {0} {1} the String {2} (Different Reference)? {3}",
					firstVal, "==", thirdVal, (firstVal == thirdVal ? "Yes" : "No"));
		Console.WriteLine("Does the String {0} {1} the String {2} (Same Reference)? {3}",
					firstVal, "==", fourthVal, (firstVal == fourthVal ? "Yes" : "No"));

		Console.WriteLine();

		Console.WriteLine("Does the String {0} {1} the String {2}? {3}",
					firstVal, ".Equals", secondVal, (firstVal.Equals (secondVal) ? "Yes" : "No"));
		Console.WriteLine("Does the String {0} {1} the String {2} (Different Reference)? {3}",
					firstVal, ".Equals", thirdVal, (firstVal.Equals (thirdVal) ? "Yes" : "No"));
		Console.WriteLine("Does the String {0} {1} the String {2} (Same Reference)? {3}",
					firstVal, ".Equals", fourthVal, (firstVal.Equals (fourthVal) ? "Yes" : "No"));
	}

	static void compareBooleans()
	{

		Boolean firstVal = false;
		Boolean secondVal = true;
		Boolean thirdVal = false;
		Boolean fourthVal = firstVal;

		Console.WriteLine("Comparing base Boolean datatypes");
		Console.WriteLine("--------------------------------");

		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2}? {3}", 
					firstVal, "==", secondVal, (firstVal == secondVal ? "Yes" : "No"));
		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2} (Different Reference)? {3}", 
					firstVal, "==", thirdVal, (firstVal == thirdVal ? "Yes" : "No"));
		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2} (Same Reference)? {3}", 
					firstVal, "==", fourthVal, (firstVal == fourthVal ? "Yes" : "No"));

		Console.WriteLine();

		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2}? {3}",
					firstVal, ".Equals", secondVal, (firstVal.Equals (secondVal) ? "Yes" : "No"));
		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2} (Different Reference)? {3}",
					firstVal, ".Equals", thirdVal, (firstVal.Equals (thirdVal) ? "Yes" : "No"));
		Console.WriteLine("Does the Boolean {0} {1} the Boolean {2} (Same Reference)? {3}",
					firstVal, ".Equals", fourthVal, (firstVal.Equals (fourthVal) ? "Yes" : "No"));
	}

	static void compareCultures()
	{

		CultureInfo firstVal = new CultureInfo("en-NZ");
		CultureInfo secondVal = new CultureInfo("en-US");
		CultureInfo thirdVal = new CultureInfo("en-NZ");
		CultureInfo fourthVal = firstVal;

		Console.WriteLine("Comparing Culture object References");
		Console.WriteLine("-----------------------------------");

		Console.WriteLine("Does the CultureInfo {0} {1} the CultureInfo {2}? {3}", 
					firstVal, "==", secondVal, (firstVal == secondVal ? "Yes" : "No"));
		Console.WriteLine("Does the CultureInfo {0} {1} the CultureInfo {2} (Different Reference)? {3}", 
					firstVal, "==", thirdVal, (firstVal == thirdVal ? "Yes" : "No"));
		Console.WriteLine("Does the CultureInfo {0} {1} the CultureInfo {2} (Same Reference)? {3}", 
					firstVal, "==", fourthVal, (firstVal == fourthVal ? "Yes" : "No"));

		Console.WriteLine();

		Console.WriteLine("Does the cultureInfo {0} {1} the CultureInfo {2}? {3}",
					firstVal, ".Equals", secondVal, (firstVal.Equals (secondVal) ? "Yes" : "No"));
		Console.WriteLine("Does the cultureInfo {0} {1} the CultureInfo {2} (Different Reference)? {3}",
					firstVal, ".Equals", thirdVal, (firstVal.Equals (thirdVal) ? "Yes" : "No"));
		Console.WriteLine("Does the cultureInfo {0} {1} the CultureInfo {2} (Same Reference)? {3}",
					firstVal, ".Equals", fourthVal, (firstVal.Equals (fourthVal) ? "Yes" : "No"));
	}

}

class Car {

	String _color;

	public Car(String color)
	{
		_color = color;
	}

	public String Color
	{

		get { return _color; }
		set { _color = value; }
	}

}


</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align="left"><td><b>The following example demonstrates using the == operator, and the Equals method, to compare objects, and primitive (base) types to eachother</b>. When using the == operator, objects will be compared for referential consistency, while using the Equals method, objects will be compared for value equality. Strings and other base datatypes are always compared for value equality, using either method of comparison.
		<hr>
    </td></tr>

    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>