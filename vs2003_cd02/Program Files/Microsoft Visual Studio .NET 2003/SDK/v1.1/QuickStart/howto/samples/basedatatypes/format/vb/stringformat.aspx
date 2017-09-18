<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Globalization" %>

<script language="VB" runat=server>


Sub Page_Load(source As Object, E As EventArgs )

	output.Text = "<pre>" & StringFormat.Go() & "</pre>"
End Sub

Public Class StringFormat


    Public shared Function Go() As String

	Dim strWriter As StringWriter = new StringWriter()
	Console.SetOut(strWriter)

        ' Formatting a table
        Console.WriteLine("Formatting in a table")
        Dim names() as String = {"Mary-Beth", "Aunt Alma", "Sue", "My Really Long Name", "Matt"}

	    Dim intCount as Integer

	    For intCount = 0 to 4 Step 1

            Console.WriteLine ("| {0,-4}{1,-20} |", intCount, names(intCount))

        Next intCount

        Console.WriteLine()


        ' Enum formatting
        Console.WriteLine("Enum Formatting")
        Console.WriteLine ("Name: {0}, Value: {1}", Color.Red.ToString("G"), Color.Red.ToString ("D"))
        Console.WriteLine()


        ' DateTime built in formats


        Console.WriteLine("DateTime Formatting:  Predefined formats")
        Console.WriteLine("")
        Console.WriteLine ("{0}" & chr(9) & "{1}" ,"Code", "Format")
        Console.WriteLine ("{0}" & chr(9) & "{1}" ,"----", "------")

	    Dim d As DateTime = DateTime.Now

        PrintFormat (d, "d")
        PrintFormat (d, "D")
        PrintFormat (d, "f")
        PrintFormat (d, "F")
        PrintFormat (d, "g")
        PrintFormat (d, "G")
        PrintFormat (d, "m")
        PrintFormat (d, "r")
        PrintFormat (d, "s")
        PrintFormat (d, "t")
        PrintFormat (d, "T")
        PrintFormat (d, "u")
        PrintFormat (d, "U")
        Console.WriteLine()

        ' DateTime picture  formats

        Console.WriteLine("DateTime Formatting:  Picture formats")
        Console.WriteLine ("{0}" & chr(9) & "{1}" ,"Code", "Format")
        Console.WriteLine ("{0}" & chr(9) & "{1}" ,"----", "------")
        PrintFormat (d, "ddd")
        PrintFormat (d, "MMMM dd, yyyy")

        Console.WriteLine()

        ' Number standard formats
        Dim num As double = 12.9625
        Console.WriteLine("Numeric Formatting:  Predefined formats")
        Console.WriteLine ("{0}" & chr(9) & "{1}" ,"Code", "Format")
        Console.WriteLine ("{0}" & chr(9) & "{1}" ,"----", "------")
        PrintFormat (num, "c")
        PrintFormat (103, "d")
        PrintFormat (num, "e")
        PrintFormat (num, "f")
        PrintFormat (num, "g")
        PrintFormat (num, "n")
        PrintFormat (1102, "x")

        Console.WriteLine ()

        ' Number custom formats
        Dim i As Integer = 25

        Console.WriteLine("Numeric Formatting:  Picture formats")
        Console.WriteLine ("{0}" & chr(9) & "{1}" ,"Code", "Format")
        Console.WriteLine ("{0}" & chr(9) & "{1}" ,"----", "------")
        PrintFormat (i, "#")
        PrintFormat (i, "###")
        PrintFormat (i, "#.00")
        PrintFormat (i/100.0, "%#")
        PrintFormat (i, "D4")

        Console.WriteLine ()

        ' User defined types can specify their own formatting that works in exactly the same way.
        ' See the definition of MyType below

        Console.WriteLine ("Formatting Custom Types")
        Console.WriteLine ("{0}" & chr(9) & "{1}" ,"Code", "Format")
        Console.WriteLine ("{0}" & chr(9) & "{1}" ,"----", "------")

        Dim t As MyType = new MyType (43)

        PrintFormat (t, "b")
        PrintFormat (t, "o")
        PrintFormat (t, "d")
        PrintFormat (t, "h")

        ' It is also possible to add new formatting codes to existing types (such as Int32 in this example).
        ' See the definition for BaseFormatter below
        Dim j As Integer = 100

        Console.WriteLine (String.Format (new BaseFormatter(), "{0} in the custom B8 format is {1:B8}", j, j))
        Console.WriteLine (String.Format (new BaseFormatter(), "{0} in the custom B16 format is {1:B16}", j, j))
        Console.WriteLine (String.Format (new BaseFormatter(), "{0} in the non-custom format 'c' is {1:c}", j, j))
        Console.WriteLine (String.Format (new BaseFormatter(), "{0} with no formatting is {1}", j, j))

	Go = strWriter.ToString()
    End Function '  end Go


    Public shared Sub PrintFormat (value As IFormattable, formatString As String)

        Console.WriteLine ("{0}" & chr(9) & "{1}", formatString, value.ToString (formatString, Nothing))
    End Sub

End Class '  End class stringformat


' This is my own custom type that implements IFormattable and respects the "b" format for binary
' as well as all the formatting codes for Int32.
' Console.WriteLine, String.Format, etc will call the Format method to get the string form of an
' instance of this type
public class MyType : Implements IFormattable


    Private _value As Integer ' to store the value internal

    Public Sub New(value As Integer)
      MyBase.New()
      _value = value
    End Sub

    ' This is the formatting method called by String.Format.  In it, we look for the "b" format
    ' which we respect  and then fall through to Int32' s format for anything else we don' t know about.
    Function Format(ByVal formatString As String, ByVal sop As IFormatProvider) As String

        If (formatString.Equals ("b")) Then
            Format = Convert.ToString (_value, 2)
	    Else If (formatString.Equals ("o")) Then
            Format = Convert.ToString (_value, 8)
	    Else If (formatString.Equals ("d")) Then
            return Convert.ToString (_value, 10)
	    Else If (formatString.Equals ("h"))
            Format = Convert.ToString (_value, 16)
	    Else
    	    Format = _value.ToString (formatString, sop)
	    End If

    End Function

    Overloads Public Function ToString (ByVal formatString As String, _
		ByVal sop As IFormatProvider) As String Implements IFormattable.ToString

        If (formatString.Equals ("b")) Then
            ToString = Convert.ToString (_value, 2)
	    Else If (formatString.Equals ("o")) Then
            ToString = Convert.ToString (_value, 8)
	    Else If (formatString.Equals ("d")) Then
            ToString = Convert.ToString (_value, 10)
	    Else If (formatString.Equals ("h")) Then
            ToString = Convert.ToString (_value, 16)
        Else
	        _value.ToString (formatString, sop)
	    End If
    End Function
End Class

Public Enum Color
	Red
        Blue
        Green
End Enum


' This class provides a new formatting code: Bn where n is any number between 2 and 64. This
' Formatting code allows numbers to be printed out in any base.
' To get access to the formatting code, a user needs to pass BaseFormatter to String.Format()

Public class BaseFormatter : Implements IFormatProvider, ICustomFormatter


    ' String.Format calls this method to get an instance of a ICustomFormatter to handle the formatting.
    ' In our case, we just return the same instance (this), but it would be possible return an instance
    ' of a different type.
    Public Function GetFormat(format as Type) As Object Implements IFormatProvider.GetFormat

	If format.ToString() = GetType(ICustomFormatter).ToString() Then

	        GetFormat = Me

        Else
	        GetFormat = Nothing
	    End If
    End Function

    ' Once String.Format gets the ICustomFormatter it calls this format method on each argument.

    Public Function Format (formatString as String, arg As Object, _
		provider As IFormatProvider)  as string implements _
		ICustomFormatter.Format

        If (formatString = Nothing) Then
	    ' call the IFormattable interface, IF it's supported
	    if TypeOf arg Is IFormattable Then
		Format = CType(arg, IFormattable).ToString(formatString, provider)
	    Else
	        Format = arg.ToString() ' fall through to default ToString formatting
	    End If
            Exit Function
        End If

        If Not formatString.StartsWith("B") Then  ' if it's not one of our codes

	    ' call the IFormattable interface, IF it's supported
	    if TypeOf arg Is IFormattable Then
		Format = CType(arg, IFormattable).ToString(formatString, provider)
	    Else
	        Format = arg.ToString() ' fall through to default ToString formatting
	    End If

	    Exit Function
        End If

        ' otherwise, get the base out of the format string and use it to form the output string
        formatString = formatString.Trim (new char () {"B"})

        Dim b As Integer = Convert.ToInt32 (formatString)

	Format = Convert.ToString(Convert.ToInt32(arg), b)

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
    <tr align="left"><th><span>The following example makes four arrays of types int, double, string, and MyType.
		The arrays are displayed unsorted, sorted (ascending), sorted (descending where displayed), and
		in the case of MyType, sorted by Age, and by Name.
		<hr>
    </span></th></tr>
    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>
