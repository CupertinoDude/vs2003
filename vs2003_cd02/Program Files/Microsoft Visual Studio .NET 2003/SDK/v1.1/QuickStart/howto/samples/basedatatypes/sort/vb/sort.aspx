<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="VB" runat=server>

Sub Page_Load(source As Object, e As EventArgs) 

	output.Text = "<pre>" & SortExample.Go() & "</pre>"
End Sub

  class SortExample 
    
    public shared Function Go() As String
    
	Dim strWriter As New StringWriter()
	Console.SetOut(strWriter)

        ' Array.Sort works on any object that implements IComparable such as ints, doubles and strings
        
        Dim intArray() As Integer = {43, 12, 1, 17, 23, 36, 11}
	Console.WriteLine( "The unsorted int array: ")
        PrintArray(intArray)

	Console.WriteLine()

        ' Sort and print the array
        Array.Sort(intArray)
        Console.WriteLine("The sorted int array: ")
        PrintArray(intArray)

	Console.WriteLine()

	' reverse the array
	Array.Reverse(intArray)
        Console.WriteLine("The sorted int array, in descending order (after a Sort and Reverse): ")
        PrintArray(intArray)

	Console.WriteLine("------------------------------------")
	Console.WriteLine()

        Dim doubleArray() As Double ={1.5, 4.3, 2.5, 006.9, 2.01, 0.04}
        Console.WriteLine( "The unsorted double array: ")
        PrintArray(doubleArray)

	Console.WriteLine()

        ' Sort and print the array
        Array.Sort(doubleArray)
        Console.WriteLine("The sorted double array: ")
        PrintArray(doubleArray)

	Console.WriteLine("------------------------------------")
	Console.WriteLine()

	Dim stringArray() As String ={"Michael", "mary", "Robert", "Abigail", "lorne", "Therese", "terrence", "Samantha"}
        Console.WriteLine("The unsorted string array: ")
        PrintArray(stringArray)
	Console.WriteLine()

        ' Sort and print the array
        Array.Sort(stringArray)
        Console.WriteLine("The sorted string array: ")
        PrintArray(stringArray)

	Console.WriteLine()

	' reverse the array
	Array.Reverse(stringArray)
        Console.WriteLine("The sorted string array, in descending order: ")
        PrintArray(stringArray)

	Console.WriteLine("------------------------------------")
	Console.WriteLine()

        ' And even your own objects, such as MyType
	Dim myTypeArray() As MyType = New MyType() { New MyType("Max",23), New MyType("Lisa",47), New MyType("Andrea",35), _
            New MyType("Mel",29), New MyType("Andrew",32), New MyType("Ahmed",35) }

	' a temporary object to hold the MyType...
	Dim t As MyType

        Console.WriteLine("The unsorted MyType array: ")
	For Each t in myTypeArray
		Console.WriteLine( "Name = {0,-7}, Age = {1}", t.Name, t.Age)
	Next t
 
	Console.WriteLine()

        ' Sort and print the array
        Array.Sort(myTypeArray)
        Console.WriteLine( "The MyType array, sorted by age (default sort): ")
	For Each t in myTypeArray
		Console.WriteLine( "Name = {0,-7}, Age = {1}", t.Name, t.Age)
	Next t

	Console.WriteLine()

        ' You can even compare objects that don't implement IComparable (or ones you want to custom compare).

        ' Sort the array using MyTypeNameComparer
        Array.Sort(myTypeArray, new MyTypeNameComparer())
        Console.WriteLine( "The MyType array, sorted by Name (separately defined comparer): ")

	For Each t in myTypeArray
		Console.WriteLine( "Name = {0,-7}, Age = {1}", t.Name, t.Age)
	Next t

	return strWriter.ToString()

    End Function ' end Go

    public shared Sub PrintArray(arr As Array)
    
	Dim bEntered As boolean = false
        Dim o As Object

	Console.Write("{")	

        For Each o in arr

	    if bEntered Then
		Console.Write(", ")
	    Else
		bEntered = true
	    End If

	    Console.Write(o.ToString())
	Next o

	Console.WriteLine( "}")  
    End Sub

  End Class ' End class sortExample

  class MyType: Implements IComparable
  
    private _age As Integer
    private _name As String

    Public Sub New(ByVal incName As String, incAge as Integer)
        MyBase.New()
        _name = incName
        _age = incAge
    End Sub

    public ReadOnly Property Name As String
    Get
	Name = _name
    End Get
    End Property

    public ReadOnly Property Age As String
    Get
	Age = _age
    End Get
    End Property

    public Function CompareTo (ByVal o as Object) As Integer Implements IComparable.CompareTo
    
        if (Not(TypeOf o is MyType)) Then throw new ArgumentException ("o must be of type 'MyType'")

        Dim v As MyType = CType( o, MyType )
        CompareTo = _age - v._age
    End Function

  End Class ' End class MyType

  class MyTypeNameComparer: Implements IComparer
 
     Public Function CompareTo(ByVal x As Object, ByVal y As Object) As Integer Implements IComparer.Compare 
    
        if (Not(TypeOf x is MyType Or TypeOf y is MyType)) Then throw new ArgumentException ("The objects to compare must be of type 'MyType'")

        Dim tempObj1 As String = CType(x, MyType).Name
        Dim tempObj2 As String = CType(y, MyType).Name
        
        CompareTo = tempObj1.ToString().CompareTo (tempObj2.ToString ())

    End Function
  End Class

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