<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="VB" runat=server>

Sub Page_load(src As Object, e As EventArgs)

	CloneTest.MakeList()

	lblClone.Text = "<pre>" & CloneTest.DoClone() & "</pre>"

	lblCopy.Text = "<pre>" & CloneTest.DoCopy() & "</pre>"
End Sub

Class CloneTest

	Shared al As ArrayList = New ArrayList()

	Public Shared Sub MakeList()
		al.Add(new Employee (7182, "Mary Greerson"))
		al.Add(new Employee (2183, "Abdul Hania"))
		al.Add(new Employee (7162, "Brenda Simons"))
		al.Add("String Entry 1")
		al.Add("String Entry 2")
	End Sub

	Public Shared Function DoCopy() As String
		Dim o As Object

		Dim strWriter As StringWriter = New StringWriter()
		Console.SetOut(strWriter)

		Console.WriteLine("Performing a COPY of the array.")
		Console.WriteLine("Modifications in the copy will not affect the original.")
		Console.WriteLine("--------------------------------------------------------")

		Console.WriteLine("The entries in the original ArrayList")
		Console.WriteLine("---------------------------------------------")
		For Each o In al
			Console.WriteLine(o.ToString())
		Next o

		Console.WriteLine()

		Dim nl As ArrayList = New ArrayList()

		Dim i As Integer

		For i = 0 to al.Count - 1
			If (al(i)).GetType().Equals(GetTYpe(Employee)) Then
				nl.Add(new Employee(CType(al(i), Employee).ID, CType(al(i), Employee).Name))
			Else
				nl.Add(al(i))
			End If
		Next i

		Console.WriteLine("The entries in the copied ArrayList")
		Console.WriteLine("---------------------------------------------")
		For Each o In nl
			Console.WriteLine(o.ToString())
		Next o

		Console.WriteLine()

		CType(nl(0), Employee).Name = "Mary van der Beer"
		CType(nl(1), Employee).Name = "Alexei Vyernov"
		CType(nl(2), Employee).Name = "Chris Hayfield"
		CType(nl(1), Employee).ID = 2637
		CType(nl(2), Employee).ID = 4921
		nl(3) = "Repeated Modify of String Entry 1"
		nl(4) = "Repeated Modify of String Entry 2"

		Console.WriteLine("The entries in the modified, copied ArrayList")
		Console.WriteLine("---------------------------------------------")
		For Each o In nl
			Console.WriteLine(o.ToString())
		Next o

		Console.WriteLine()

		Console.WriteLine("The entries in the original ArrayList")
		Console.WriteLine("---------------------------------------------")
		For Each o In al
			Console.WriteLine(o.ToString())
		Next o

		return strWriter.ToString()
	End Function

	Public Shared Function DoClone() As String
		Dim o As Object

		Dim strWriter As StringWriter = New StringWriter()
		Console.SetOut(strWriter)

		Console.WriteLine("Performing a CLONE of the ArrayList.")
		Console.WriteLine("Modifications in the copy will also affect the original.")
		Console.WriteLine("--------------------------------------------------------")

		Console.WriteLine("The entries in the original ArrayList")
		Console.WriteLine("---------------------------------------------")
		For Each o In al
			Console.WriteLine(o.ToString())
		Next o

		Dim nl As ArrayList = CType(al.Clone(), ArrayList)
		Console.WriteLine()

		Console.WriteLine("The entries in the copied ArrayList")
		Console.WriteLine("---------------------------------------------")
		For Each o In nl
			Console.WriteLine(o.ToString())
		Next o

		Console.WriteLine()

		CType(nl(0), Employee).Name = "Mary Smith"
		CType(nl(1), Employee).Name = "Francoi Michaels"
		CType(nl(2), Employee).Name = "Francesca Davies"
		CType(nl(1), Employee).ID = 1827
		CType(nl(2), Employee).ID = 9912
		nl(3) = "Modified String Entry 1"
		nl(4) = "Modified String Entry 2"

		Console.WriteLine("The entries in the modified, copied ArrayList")
		Console.WriteLine("---------------------------------------------")
		For Each o In nl
			Console.WriteLine(o.ToString())
		Next o

		Console.WriteLine()

		Console.WriteLine("The entries in the original ArrayList")
		Console.WriteLine("---------------------------------------------")
		For Each o In al
			Console.WriteLine(o.ToString())
		Next o

		return strWriter.ToString()
	End Function
End Class

Class Employee

	Dim _name As String
	Dim _id As Integer

	Public Sub New( id As Integer, name As String )
		MyBase.New()
		_name = name
		_id = id

	End Sub

	public Property Name() As String
		Get
			Return _name
		End Get
		Set
			_name = value
		End Set
	End Property

	public Property ID() As String
		Get
			Return _id
		End Get
		Set
			_id = value
		End Set
	End Property

	Overrides Public Function ToString () As String
		return _id & ", " & _name
	End Function
End Class
</script>


<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">

<form runat="server">
    <p>

<table>
    <tr><td><b>The following example demonstrates cloning collections</b>. In this example, the first three entries in the collection are object references to Employee objects, while the third and fourth entries are literal strings. If you follow through the example, you can see that the cloned ArrayList refers to the same objects as the original ArrayList, but the Strings are unique to each list since they are not reference-copies but are instead, value copies. In contrast, when we copy the ArrayList, both of the ArrayLists are completely unique such that modifications made to one will not affect the other.
		<hr>
    </td></tr>
</table>

<table border=1>
    <tr><td><h4><asp:label id="lblClone" runat="server"/></h4></td>
	<td><h4><asp:label id="lblCopy" runat="server"/></h4></td>
    </tr>
</table>


</form>
</body>
</html>
