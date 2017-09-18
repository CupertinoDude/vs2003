<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="VB" runat=server>

Sub Page_load(src As Object, ea As EventArgs)

	Dim strWriter As StringWriter = New StringWriter()
	Console.SetOut(strWriter)

	Dim ec As EmployeeCollection = New EmployeeCollection()

	Console.WriteLine("Adding elements to the EmployeeCollection")
	Console.WriteLine("---------------------------------------------------------------")
	ec.AddEmployee( 1234, "John" )
	ec.AddEmployee( 5678, "Lisa" )
	ec.AddEmployee( 3283, "Max" )
	ec.AddEmployee( 1928, "Regina" )
	ec.AddEmployee( 4019, "Clarence" )

	'a temporary emlpoyee object, used in our For Each statements
	Dim e As Employee

	For Each e in ec
		Console.WriteLine(ec.GetEmployee(e.ID))
	Next e

	Console.WriteLine()

	' AddEmployee is set to return a value indicating if the item already existed
	' all employees must be unique...
	Console.WriteLine("Attempting to add a duplicate employee id...")
	Console.WriteLine("---------------------------------------------------------------")
	If ec.AddEmployee(5678, "Katherine") Then
		Console.WriteLine("Sorry, the employee id {0} already existed in the collection.", 5678)
	End If

	Console.WriteLine()
	Console.WriteLine("Setting the name of existing employee with id 5678...")
	Console.WriteLine("---------------------------------------------------------------")
	ec.SetName(5678, "Katherine")

	For Each e in ec
		Console.WriteLine(ec.GetEmployee(e.ID))
	Next e

	' getting a particular employee
	Console.WriteLine()
	Console.WriteLine("Retrieving the employee with id 4019...")
	Console.WriteLine("---------------------------------------------------------------")
	Console.WriteLine(ec.GetEmployee(4019).ToString())

	' clearing the collection...
	ec.Clear()
	Console.WriteLine()
	Console.WriteLine("Clearing the collection...displaying the elements (no elements left...)")
	Console.WriteLine("---------------------------------------------------------------")
	For Each e in ec
		Console.WriteLine(ec.GetEmployee(e.ID))
	Next e

	lblOut.Text = "<pre>" & strWriter.ToString() & "</pre>"
End Sub

Class EmployeeCollection : Implements ICollection

        Private _array() As Employee
	Private _size As Integer
        Private _capacity As Integer       '  Last valid element in the collection

        Private const _MinimumGrow As Integer = 4

        Public Sub New()
	    MyBase.New()

            Redim _array(16)
            _capacity = 0
            _size = 0
        End Sub

' These are the set of methods which must be provided through the implementation...
' ----------------------------
    	Public Sub CopyTo(arr As Array, index as Integer) Implements ICollection.CopyTo

		' not supported in this demonstration...
                Throw New Exception("This method is not supported in this implementation")
	End Sub

	public ReadOnly Property Count As Integer Implements ICollection.Count
		Get
			return _size
		End Get
	End Property

	public ReadOnly Property SyncRoot As Object Implements ICollection.SyncRoot
		Get
			return me
		End Get
	End Property

	public ReadOnly Property IsSynchronized As Boolean Implements ICollection.IsSynchronized
		Get
			return false
		End Get
	End Property

	Public Function GetEnumerator() As IEnumerator Implements ICollection.GetEnumerator
    		return New EmployeeEnumerator(me)
	End Function
' ----------------------------

	' returns a true if the value already existed...
        Public Function AddEmployee(id As Integer, name As String) As Boolean
	    Dim e As Employee

	    ' ensure the element does not already exist...
	    For Each e In _array
		If Not e Is Nothing Then

			If id = e.ID Then
				' indicate the person already existed...
				return true
			End If
		End If
	    Next e

	    Dim emp As Employee = New Employee(id, name)

            If _size = _array.Length Then
                Dim newcapacity As Integer = _array.Length * 2

                If newcapacity < _array.Length + _MinimumGrow Then
                    newcapacity = _array.Length + _MinimumGrow
                End If

                SetCapacity(newcapacity)
            End If

            _array(_capacity) = emp
            _capacity = (_capacity + 1) Mod _array.Length
            _size = _size + 1

	    return false
        End Function

        Public Sub Clear()
            If _capacity > 0 Then
                Array.Clear(_array, 0, _size)
            Else
                Array.Clear(_array, 0, _array.Length)
                Array.Clear(_array, 0, _capacity)
            End If

            _capacity = 0
            _size = 0
        End Sub

        Public Function GetEmployee(id As Integer) As Employee
            If _size = 0 Then
                Throw New InvalidOperationException("You cannot get an employee when the collection is empty.")
	    End If

	    Dim e As Employee

	    For Each e in _array
		If id = e.ID Then
			' this is the one...
			return e
		End if
	    Next e

	    return Nothing
        End Function

	Public Function SetName(id As Integer, name As String) As Boolean
	    Dim e as Employee

	    For Each e in _array

		If id = e.ID Then
			' update this one!

			e.Name = name
			return true
		End If
	    Next e

	    return false
	End Function

        Private Sub SetCapacity(capacity As Integer)
            Dim newArray(capacity) As Employee

            If _size > 0 Then
                If _capacity > 0 Then
                    Array.Copy(_array, 0, newarray, 0, _size)
                Else
                    Array.Copy(_array, 0, newarray, 0, _array.Length)
                    Array.Copy(_array, 0, newarray, _array.Length, _capacity)
                End If
            End If

            _array = newarray
            _capacity = _size
        End Sub

        Friend Function GetElement(i As Integer) As Object

            return _array(i Mod _array.Length)
        End Function

	Class EmployeeEnumerator : Implements IEnumerator

		Private _ec As EmployeeCollection
		Private _index As Integer
		Private currentElement As Object

		Friend Sub New(ec As EmployeeCollection)

			_ec = ec

			_index = 0
			currentElement = CType(_ec._array, Object)

			If _ec._size = 0 Then
				_index = -1
			End If
		End Sub

		Public Function MoveNext() As Boolean Implements IEnumerator.MoveNext

			If _index < 0 Then
				currentElement = _ec._array

				return false
			End If

			currentElement = _ec.GetElement(_index)
			_index = _index + 1

			If _index = _ec._size
				_index = -1
			End If

			return true
		End Function

		Public Sub Reset() Implements IEnumerator.Reset

			If _ec._size = 0 Then
				_index = -1
			Else
				_index = 0
			End If

			currentElement = _ec._array
		End Sub

		Public ReadOnly Property Current() As Object Implements IEnumerator.Current
			Get
				If currentElement Is CType(_ec._array, Object) Then

					If _index = 0 Then
						Throw New InvalidOperationException("Invalid Operation")
                	        	Else
						Throw New InvalidOperationException("Invalid operation")
					End If
				End If

				return currentElement
			End Get
		End Property
	End Class
End Class


Class Employee

	Dim _name As String
	Dim _id As Integer

	Public Sub New(id as Integer, name As String)
		_name = name
		_id = id
	End Sub

	public Property Name() As String
		Get
			return _name
		End Get

		Set
			_name = value
		End Set
	End Property

	public Property ID() As Integer
		Get
			return _id
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
    <tr><td><b>The following example demonstrates implementing the ICollection interface</b>. In this example we make a fictitious EmployeeCollection, for a company which likes employing people, but doesn't like them leaving. Therefore, we allow elements to be added and modified, but you can't actually remove any elements from the collection unless you clear the entire collection. If you have a look at the code, you will see that we can use a For Each loop to parse the information in the collection, a reflection of the fact we have included an IEnumerator for the collection.
		<hr>
    </td></tr>
</table>

<table>
    <tr><td><h4><asp:label id="lblOut" runat="server"/></h4></td>
    </tr>
</table>


</form>
</body>
</html>
