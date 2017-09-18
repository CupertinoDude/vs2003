<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Globalization" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e){

	output.Text = "<pre>" + parseExample.Go() + "</pre>";
}

class parseExample {

    public static String Go() {

    	StringWriter strWriter = new StringWriter();
    	Console.SetOut(strWriter);

    	int intExample = 76;
    	string strExample = intExample.ToString();

    	Console.WriteLine("Converting an integer value to a string");
    	Console.WriteLine("---------------------------------------");

    	//example one, having put the value in a string
    	Console.WriteLine("The string value is " + strExample);

    	//example two, converting the integer to a string on the fly
    	Console.WriteLine("The string value is " + intExample.ToString());

    	//example three, not converting the integer to a string at all???
    	Console.WriteLine("The string value is " + intExample) ;

    	Console.WriteLine();

    	Console.WriteLine("Using The Convert object's methods");
    	Console.WriteLine("------------------------------");

    	//the methods inside convert...
    	Console.WriteLine("Using Convert.ToString, result = {0}", Convert.ToString(intExample));//   'String conversion, displays 76
    	Console.WriteLine("Using Convert.ToBoolean, result = {0}", Convert.ToBoolean(intExample));// 'Boolean conversion, displays True
    	Console.WriteLine("Using Convert.ToByte, result = {0}", Convert.ToByte(intExample));//       'Byte conversion, displays 76
    	Console.WriteLine("Using Convert.ToChar, result =  {0}", Convert.ToChar(intExample));//      'Char conversion, displays L (char value of 76)
    	Console.WriteLine("Using Convert.ToDouble, result = {0}", Convert.ToDouble(intExample));//   'Double conversion, displays 76

    	Console.WriteLine();

    	Console.WriteLine("Using the non-instantiated Parse method");
    	Console.WriteLine("---------------------------------------");

    	string strExample1 = "true";
    	string strExample2 = "00.987";
    	string strExample3 = "127";
    	string strExample4 = "42";

    	Console.WriteLine( "Parsing {0} = {1}", strExample1, Boolean.Parse(strExample1) );// ' convert to a boolean
    	Console.WriteLine( "Parsing {0} = {1}", strExample2, Double.Parse(strExample2) );//  ' convert to a double value
    	Console.WriteLine( "Parsing {0} = {1}", strExample3, Int32.Parse( strExample3) );//  ' convert to an Int
    	Console.WriteLine( "Parsing {0} = {1}", strExample4, Byte.Parse(strExample4) );//    ' convert to a byte

    	Console.WriteLine();

    	Console.WriteLine("Using Exception Handling when converting");
    	Console.WriteLine("----------------------------------------");

    	string strExample5 = "three";

    	// catching any exceptions...
    	try {
    	     Console.WriteLine("The integer value is " + Int32.Parse(strExample5));
    	} catch(Exception e) {
    	     Console.WriteLine("The value '{0}' cannot be converted to a integer value.", strExample5);
    	}

    	Console.WriteLine();

    	Console.WriteLine("Attempting an illegal, implicit conversion");
    	Console.WriteLine("------------------------------------------");
    	intExample = 76;

    	Console.WriteLine("Adding the following code to a program would cause a compiler error in C#");
    	Console.WriteLine("String strExample = intExample;");
    	Console.Write("The error received will be: ");
    	Console.WriteLine("cannot implicitly convert type 'int' to 'string'");

    	Console.WriteLine();

    	Console.WriteLine("Converting Strings to Dates");
    	Console.WriteLine("---------------------------");


            /* This variable forces the data parsing to succeed.  If you'd like
               to see the parsing work in your own locale, you can remove this
               call and then replace all dates with ones that are formatted in
               your locale specific manner.
            */
            System.Threading.Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");

            string strDate = "03/17/77";

            // Simple DateTime parsing
            Console.WriteLine("Parsing {0}, using the Parse method.", strDate);
            DateTime d = DateTime.Parse(strDate);
            Console.WriteLine("The date parsed as {0}",d);

            // DateTime parsing using ParseExact
            Console.WriteLine();
            string strDate2 = "Thursday, March 17, 1977";
            Console.WriteLine("Parsing {0}, using the ParseExact method.", strDate2);
            DateTime d2 = DateTime.ParseExact(strDate2,"D", null);
            Console.WriteLine("The date parsed as {0}",d2);

    	Console.WriteLine();

    	Console.WriteLine("Converting String information to other datatypes");
    	Console.WriteLine("------------------------------------------------");
    	strExample = "123456";

    	//using Parse to convert strings to other datatypes...
    	Console.WriteLine("The Double value when using Double.Parse is {0}", Double.Parse(strExample));//	'converting a string to an Double
    	Console.WriteLine("The Int32 value when using Int32.Parse is {0}", Int32.Parse(strExample));//	'converting a string to an int

    	Console.WriteLine();

    	Console.WriteLine("Extending the use of the Parse method");
    	Console.WriteLine("-------------------------------------");

        // Parsing using NumberStyles
        string toBeParsed = "   (555)   ";

        Console.WriteLine("Parsing the string \t{0}\t which contains leading/trailing white space and parentheses", toBeParsed);
        int j = Int32.Parse(toBeParsed, NumberStyles.AllowParentheses | NumberStyles.AllowLeadingWhite | NumberStyles.AllowTrailingWhite);
        Console.WriteLine("The string parsed to {0}.",j);// 'note that the output may well be negative, because of the parentheses

	    return strWriter.ToString();
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
    <tr align="left"><td><b>The following examples show various way to convert datatypes from one form to another.</b> These conversions were achieved with either the Parse or ToString methods, or through the methods provided inside the Convert class.
		<hr>
    </td></tr>

    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>