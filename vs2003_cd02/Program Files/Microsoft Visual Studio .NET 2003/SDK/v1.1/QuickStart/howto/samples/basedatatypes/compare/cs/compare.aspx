<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Globalization" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e) {

	output.Text = "<pre>" + compareExample.Go() + "</pre>";
}

class compareExample
{
    
    public static string Go()
    {
	StringWriter strWriter = new StringWriter();
	Console.SetOut(strWriter);

	Console.WriteLine("\r\n");

        //this example will compare some ints
        Console.WriteLine ("We have defined a Max method, that works on any types which implement the IComparable interface....\r\n");


        Console.WriteLine ("{0,-55} {1}", "Comparing Integers:     Max (5, 10) =", Max (5, 10));
	Console.WriteLine();

        Console.WriteLine ("{0,-55} {1}", "Comparing Doubles:      Max (4.3, 2.5) =", Max (4.3, 2.5));
	Console.WriteLine();

        decimal d1 = 1235698;
        decimal d2 = -234238;
        Console.WriteLine ("{0,-55} {1}", "Comparing Decimals:     Max (" + d1 + ", " + d2 + ") =", Max (d1, d2));
	Console.WriteLine();

        String s1 = "Mathew";
        String s2 = "Mark";
        Console.WriteLine ("{0,-55} {1}", "Comparing Strings:      Max (" + s1 + ", " + s2 + ") =", Max (s1, s2));
	Console.WriteLine();

        Char c1 = 't';
        Char c2 = 'a';
        Console.WriteLine ("{0,-55} {1}", "Comparing Chars:        Max (" + c1 + ", " + c2 + ") =", Max (c1, c2));
	Console.WriteLine();

        MyType t1 = new MyType (12);
        MyType t2 = new MyType (17);
        Console.WriteLine ("{0,-55} {1}", "Comparing Custom Types: Max (" + t1 + ", " + t2 + ") =", Max (t1,  t2));

	return strWriter.ToString();        
    } // end Go

    public static IComparable Max (IComparable val1, IComparable val2)
    {
        if (val1.CompareTo(val2) > 0) return val1; //val1 > val2
        if (val1.CompareTo(val2) < 0) return val2; //val1 < val2
        if (val1.CompareTo(val2) == 0) return val1; //val1 == val2, return val1 by definition
        return null;
    }
} // End class 

class MyType : IComparable
{
    private int _value;
    public MyType (int value)
    {
        _value = value;
    }
    public int CompareTo (object o)
    {
        if (!(o is MyType)) throw new ArgumentException ("o must be of type 'MyType'");
        MyType v = (MyType) o;
        return _value - v._value;
    }
    override public string ToString ()
    {
        return String.Format ("MyType({0})", _value);
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
    <tr align=left><td><b>The following example shows what happens when you implement the IComparable interface to compare objects to one another.</b> You can compare base datatypes, or define your own objects for comparison, so long as they implement IComparable. In this example, we define a Max method to compare any two objects that implement IComparable.
		<hr>
    </td></tr>

    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>

