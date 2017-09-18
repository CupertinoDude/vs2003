<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>

<script language="VB" runat=server>

Sub Page_Load(Source As Object, e As EventArgs)
    output.Text = ExceptionTest.Go()
End Sub

Class ExceptionTest

    Public shared Function Go() As String
	Dim strWriter As New StringWriter()
	Console.SetOut(strWriter)

	' This code shows how to catch an exception
	Dim d() As Decimal = {1.02, 2.34, 2.99, 3.76, 4.99, 5.99}
	Dim intCount as Integer

	' loop through the array, attempting each
	For intCount = 0 to d.Length - 1

	    Try

	        Console.WriteLine()
	        Console.WriteLine("{0}. Trying to call the method with an argument of '{1}'...<br>", intCount + 1, d(intCount))
	        ResetBurgerPrice(d(intCount))

		' if you get to this line, then everything worked for that value!
		Console.WriteLine("The value {0} was successfully assigned as the new burger price.<p>", d(intCount))
	        Console.WriteLine()

	    Catch aoe As ArgumentOutOfRangeException ' catch the out of range exceptions...

	        Console.WriteLine("The following Out Of Range Exception occurred:<br>")
	        Console.WriteLine(aoe.Message & "<p>")

	    Catch mue As MyMadeUpException ' catch the made up exception. Unnecessary to do this seperately, but a good demonstration

	        Console.WriteLine("The following Made Up Exception occurred:<br>")
	        Console.WriteLine(mue.Message & "<p>")

	    Finally

	        Console.WriteLine()
	        Console.WriteLine("Move to the Next Value...<p>")
	    End Try

	Next intCount

	Console.WriteLine("Finished processing the Decimal Array.")

	Go = strWriter.ToString()
    End Function

    Public shared Sub ResetBurgerPrice(d As Decimal)

	' it should be noted that these exceptions do not utilize the runtime's resource
	' system which would make the text of the exception easily localizable.
	' For examples of using resources, see the Resources section of Quickstart.

	If d < 2 Then

		' let anyone using this method know that charging too little for a burger is no good...
		' the type of the exception thrown is an out of range exception
		throw new ArgumentOutOfRangeException("NewPrice", "Disallowed: Charging less than $2.00 will mean we lose money!")

	Else If d > 5 Then

		' let anyone using this method know that charging too much for a burger is no good either!
		' the type of the exception thrown is an out of range exception
		Throw New ArgumentOutOfRangeException("NewPrice", "Disallowed: Charging more than $5.00 will scare people away!")

	Else If d = 2.99 Then

		' let anyone using this method know that we don't like 2.99!
		' the type of the exception thrown is a 'my made up' exception
		Throw New MyMadeUpException("Disallowed: If you're going to make it $2.99, make it $3.00!")
	Else

		' reset the internal burger price to that specified. e.g.
		' _BurgerPrice = d
		' update a database if necessary, etc.
		' ...
	End If
    End Sub

End Class ' end class ExceptionTest

' making your own exception...
public Class MyMadeUpException
		Inherits System.Exception

    Sub New ()
	    MyBase.New ' pass control to the parent constructor of the same signature
    End Sub

    Sub New(message As String)
	    MyBase.New(message) ' pass control to the parent constructor of the same signature
    End Sub

    Sub New(message As String, inner As Exception)
	    MyBase.New(message, inner) ' pass control to the parent constructor of the same signature
    End Sub
End Class

</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align=left><th><span>The following example demonstrates throwing an exception, and how to catch that exception, from within a method. It also briefly demonstrates making your own exceptions.
		<hr>
    </span></th></tr>
    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>