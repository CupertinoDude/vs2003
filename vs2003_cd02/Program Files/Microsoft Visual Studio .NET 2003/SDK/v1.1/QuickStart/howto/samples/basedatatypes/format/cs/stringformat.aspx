<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Globalization" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e) {

	output.Text = "<pre>" + StringFormat.Go() + "</pre>";
}

class StringFormat
{

    public static string Go()
    {
	StringWriter strWriter = new StringWriter();
	Console.SetOut(strWriter);

        // Formatting a table
        Console.WriteLine("Formatting in a table");
        string [] names = {"Mary-Beth", "Aunt Alma", "Sue", "My Really Long Name", "Matt"};
        for (int k = 0; k < 5; k++)
        {
	  Console.WriteLine ("| {0,-4}{1,-20} |", k, names[k]);

        }
        Console.WriteLine();


        // Enum formatting
        Console.WriteLine("Enum Formatting");
        Console.WriteLine ("Name: {0}, Value: {1}", Color.Red.ToString("G"), Color.Red.ToString ("D"));
        Console.WriteLine();


        // DateTime built in formats


        Console.WriteLine("DateTime Formatting:  Predefined formats");
        Console.WriteLine("");
        Console.WriteLine ("{0}\t{1}" ,"Code", "Format");
        Console.WriteLine ("{0}\t{1}" ,"----", "------");

        DateTime d = DateTime.Now;

        PrintFormat (d, "d");
        PrintFormat (d, "D");
        PrintFormat (d, "f");
        PrintFormat (d, "F");
        PrintFormat (d, "g");
        PrintFormat (d, "G");
        PrintFormat (d, "m");
        PrintFormat (d, "r");
        PrintFormat (d, "s");
        PrintFormat (d, "t");
        PrintFormat (d, "T");
        PrintFormat (d, "u");
        PrintFormat (d, "U");
        Console.WriteLine();

        // DateTime picture  formats

        Console.WriteLine("DateTime Formatting:  Picture formats");
        Console.WriteLine ("{0}\t{1}" ,"Code", "Format");
        Console.WriteLine ("{0}\t{1}" ,"----", "------");
        PrintFormat (d, "ddd");
        PrintFormat (d, "MMMM dd, yyyy");

        Console.WriteLine();

        // Number standard formats
        double num = 12.9625;

        Console.WriteLine("Numeric Formatting:  Predefined formats");
        Console.WriteLine ("{0}\t{1}" ,"Code", "Format");
        Console.WriteLine ("{0}\t{1}" ,"----", "------");
        PrintFormat (num, "c");
        PrintFormat (103, "d");
        PrintFormat (num, "e");
        PrintFormat (num, "f");
        PrintFormat (num, "g");
        PrintFormat (num, "n");
        PrintFormat (1102, "x");

        Console.WriteLine ();


        // Number custom formats
        int i = 25;

        Console.WriteLine("Numeric Formatting:  Picture formats");
        Console.WriteLine ("{0}\t{1}" ,"Code", "Format");
        Console.WriteLine ("{0}\t{1}" ,"----", "------");
        PrintFormat (i, "#");
        PrintFormat (i, "###");
        PrintFormat (i, "#.00");
        PrintFormat (i/100.0, "%#");
        PrintFormat (i, "D4");

        Console.WriteLine ();

        // User defined types can specify their own formatting that works in exactly the same way.
        // See the definition of MyType below

        Console.WriteLine ("Formatting Custom Types");
        Console.WriteLine ("{0}\t{1}" ,"Code", "Format");
        Console.WriteLine ("{0}\t{1}" ,"----", "------");

        MyType t = new MyType (43);

        PrintFormat (t, "b");
        PrintFormat (t, "o");
        PrintFormat (t, "d");
        PrintFormat (t, "h");

        // It is also possible to add new formatting codes to existing types (such as Int32 in this example).
        // See the definition for BaseFormatter below
        int j = 100;

        Console.WriteLine (String.Format (new BaseFormatter(), "{0} in the custom B8 format is {1:B8}", j, j));
        Console.WriteLine (String.Format (new BaseFormatter(), "{0} in the custom B16 format is {1:B16}", j, j));
        Console.WriteLine (String.Format (new BaseFormatter(), "{0} in the non-custom format 'c' is {1:c}", j, j));
        Console.WriteLine (String.Format (new BaseFormatter(), "{0} with no formatting is {1}", j, j));

	return strWriter.ToString();
    } //  end Go


    public static void PrintFormat (IFormattable value, string formatString)
    {
        Console.WriteLine ("{0}\t{1}", formatString, value.ToString (formatString, null));
    }
} //  End class stringformat


// This is my own custom type that implements IFormattable and respects the "b" format for binary
// as well as all the formatting codes for Int32.
// Console.WriteLine, String.Format, etc will call the Format method to get the string form of an
// instance of this type
public class MyType : IFormattable
{

    private int _value;// to store the value internal
    public MyType (int value)
    {
        _value = value;
    }
    // This is the formatting method called by String.Format.  In it, we look for the "b" format
    // which we respect  and then fall through to Int32's format for anything else we don't know about.
    public string Format (string format, IFormatProvider provider)
    {
        if (format.Equals ("b"))
            return Convert.ToString (_value, 2);
	else if (format.Equals ("o"))
            return Convert.ToString (_value, 8);
	else if (format.Equals ("d"))
            return Convert.ToString (_value, 10);
	else if (format.Equals ("h"))
            return Convert.ToString (_value, 16);

	return _value.ToString (format, provider);
    }

    public string ToString (string format, IFormatProvider provider) // included via requirements
    {
        if (format.Equals ("b"))
            return Convert.ToString (_value, 2);
	else if (format.Equals ("o"))
            return Convert.ToString (_value, 8);
	else if (format.Equals ("d"))
            return Convert.ToString (_value, 10);
	else if (format.Equals ("h"))
            return Convert.ToString (_value, 16);

	return _value.ToString (format, provider);
    }
}

public enum Color
{
	Red,
        Blue,
        Green
}


// This class provides a new formatting code: Bn where n is any number between 2 and 64. This
// Formatting code allows numbers to be printed out in any base.
// To get access to the formatting code, a user needs to pass BaseFormatter to String.Format()

public class BaseFormatter : IFormatProvider, ICustomFormatter
{

    // String.Format calls this method to get an instance of a ICustomFormatter to handle the formatting.
    // In our case, we just return the same instance (this), but it would be possible return an instance
    // of a different type.
    public object GetFormat(Type format)
    {
        if (format == typeof (ICustomFormatter)) return this;
        else return null;
    }

    // Once String.Format gets the ICustomFormatter it calls this format method on each argument.

    public string Format (string format, object arg, IFormatProvider provider)
    {
        if (format == null)
        {
		if (arg is IFormattable)
			return ((IFormattable)arg).ToString(format, provider);
		else
	        	return arg.ToString(); // fall through to standard string formatting
        }


        if (!format.StartsWith("B"))  // if it's not one of our codes
        {
		if (arg is IFormattable)
			return ((IFormattable)arg).ToString(format, provider);
		else
	        	return arg.ToString(); // fall through to standard string formatting
        }

        // otherwise, get the base out of the format string and use it to form the output string
        format = format.Trim (new char [] {'B'});
        int b = Convert.ToInt32 (format);
        return Convert.ToString ((int)arg, b);
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
    <tr align="left"><th><span>The following example makes four arrays of types int, double, string, and MyType.
		The arrays are displayed unsorted, sorted (ascending), sorted (descending where displayed), and
		in the case of MyType, sorted by Age, and by Name.
		<hr>
    </span></th></tr>
    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>
