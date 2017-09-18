<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e) {

	output.Text = "<pre>" + SortExample.Go() + "</pre>";
}

  class SortExample 
  {    
    public static string Go()
    {
	StringWriter strWriter = new StringWriter();
	Console.SetOut(strWriter);

        //Array.Sort works on any object that implements IComparable such as ints, doubles and strings
        
        int []intArray={43, 12, 1, 17, 23, 36, 11};
	Console.WriteLine( "The unsorted int array: ");
        PrintArray(intArray);

	Console.WriteLine();

        //Sort and print the array
        Array.Sort(intArray);
        Console.WriteLine("The sorted int array: ");
        PrintArray(intArray);

	Console.WriteLine();

	//reverse the array
	Array.Reverse(intArray);
        Console.WriteLine("The sorted int array, in descending order (after a Sort and Reverse): ");
        PrintArray(intArray);

	Console.WriteLine("------------------------------------");
	Console.WriteLine();

        double []doubleArray={1.5, 4.3, 2.5, 006.9, 2.01, 0.04};
        Console.WriteLine( "The unsorted double array: ");
        PrintArray(doubleArray);

	Console.WriteLine();

        //Sort and print the array
        Array.Sort(doubleArray);
        Console.WriteLine("The sorted double array: ");
        PrintArray(doubleArray);

	Console.WriteLine("------------------------------------");
	Console.WriteLine();

	string [] stringArray={"Michael", "mary", "Robert", "Abigail", "lorne", "Therese", "terrence", "Samantha"};	
        Console.WriteLine("The unsorted string array: ");
        PrintArray(stringArray);

	Console.WriteLine();

        //Sort and print the array
        Array.Sort(stringArray, Comparer.Default);
        Console.WriteLine("The sorted string array: ");
        PrintArray(stringArray);

	Console.WriteLine();

	//reverse the array
	Array.Reverse(stringArray);
        Console.WriteLine("The sorted string array, in descending order: ");
        PrintArray(stringArray);

	Console.WriteLine("------------------------------------");
	Console.WriteLine();

        //And even your own objects, such as MyType
	MyType[] myTypeArray = new MyType [] {new MyType("Max",23), new MyType("Lisa",47), new MyType("Andrea",35), 
            new MyType("Mel",29), new MyType("Andrew",32), new MyType("Ahmed",35)};

        Console.WriteLine("The unsorted MyType array: ");
	foreach( MyType t in myTypeArray)
		Console.WriteLine("Name = {0,-7}, Age = {1}", t.Name, t.Age);
 
	Console.WriteLine();

        //Sort and print the array
        Array.Sort(myTypeArray);
        Console.WriteLine( "The MyType array, sorted by age (default sort): ");
	foreach( MyType t in myTypeArray)
		Console.WriteLine("Name = {0,-7}, Age = {1}", t.Name, t.Age);

	Console.WriteLine();

        //You can even compare objects that don't implement IComparable (or ones you want to custom compare).

        //Sort the array using MyTypeNameComparer
        Array.Sort(myTypeArray, new MyTypeNameComparer());
        Console.WriteLine( "The MyType array, sorted by Name (separately defined comparer): ");

	foreach( MyType t in myTypeArray)
		Console.WriteLine("Name = {0,-7}, Age = {1}", t.Name, t.Age);

	return strWriter.ToString();

    } // end Go

    public static void PrintArray(Array arr)
    {
	bool bEntered = false;

	Console.Write("{");	

        foreach (object o in arr) {

	    if (bEntered)
		Console.Write(", ");
	    else
		bEntered = true;

	    Console.Write(o.ToString());
	}

	Console.WriteLine( "}");   
    }

  } // End class sortExample

  class MyType : IComparable
  {
    private int _age;
    private string _name;

    public MyType (string incName, int incAge)
    {
        _name = incName;
        _age = incAge;
    }

    public string Name { get { return( _name ); } }
    public int Age { get { return( _age ); } }

    public int CompareTo (object o) 
    {
        if (!(o is MyType)) throw new ArgumentException ("o must be of type 'MyType'");

        MyType v = (MyType) o;
        return _age - v._age;
    }
  }

  class MyTypeNameComparer: IComparer
  {
    public int Compare (object x, object y) 
    {
        if (!(x is MyType || y is MyType)) throw new ArgumentException ("The objects to compare must be of type 'MyType'");

        string tempObj1 = ((MyType)x).Name;
        string tempObj2 = ((MyType)y).Name;
        
        return tempObj1.ToString().CompareTo (tempObj2.ToString ());
    }
  } //End class MyTypeNameComparer

</script>


<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align=left><td><b>The following example demonstrates how to sort datatypes using the Array.Sort method</b>. Different arrays of datatypes are created, and the arrays are displayed unsorted, sorted (ascending), sorted (descending where displayed), and in the case of the MyType class, sorted by Age, and by Name. Being able to sort MyType in different ways demonstrates how to define your own comparers for sorting objects.
		<hr>
    </td></tr>

    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>