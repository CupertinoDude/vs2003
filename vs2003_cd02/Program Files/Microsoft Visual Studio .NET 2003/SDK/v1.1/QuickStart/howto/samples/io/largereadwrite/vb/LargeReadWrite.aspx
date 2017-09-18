<%@ Page Language="VB" Debug="true" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>

<script language="VB" runat=server>

Public class ReadWrite


    Public Shared Function Go ( fileSize aS double ) As String

	'declare the StreamReader, for accessing the file
	Dim strWriter As StringWriter = New StringWriter()
	Console.SetOut(strWriter)

	Dim origTestSize As double = fileSize

        Dim testSize As double = origTestSize * 1024

        Dim fs As FileStream = New FileStream(Environment.GetEnvironmentVariable("TEMP") & _
            "\\data.bin", FileMode.OpenOrCreate)
        fs.SetLength(0)

        Dim w As BinaryWriter = New BinaryWriter(fs)  ' create a BinaryWriter

        w.BaseStream.Seek(0,SeekOrigin.Begin)  ' seek the beginning of the file

        Console.Write ("Writing file...")

        Dim beginWrite As Integer = Environment.TickCount ' get the start time

    	Dim intCount As Integer

        For intCount = 0 To testSize - 1       ' loop through the file, writing the bytes
            w.Write( CType(1, byte))                 ' do the write
    	Next intCount


        Console.WriteLine ()

        fs.Flush()

        Dim endWrite As Integer = Environment.TickCount   ' get the end time

        Console.WriteLine ("For the Write...")
        Console.WriteLine ("Start Time: {0}", beginWrite.ToString())
        Console.WriteLine ("End Time: {0}", endWrite.ToString())
        Console.WriteLine ("Elapsed Time: {0} ms", endWrite-beginWrite) ' the time span in ms
        Dim thruputWrite As double = (CType(origTestSize, double) / _
			((CType(endWrite, double) - CType(beginWrite, double))) * 1000)
        Console.WriteLine ("Data Thruput: {0} mb/sec", thruputWrite)

        Dim r As BinaryReader = New BinaryReader(fs) ' create a BinaryReader

        w.BaseStream.Seek(0,SeekOrigin.Begin)	'set the file pointer to the beginning
        Dim dummyInt As Integer

        Dim beginRead As Integer = Environment.TickCount ' get the start time

        For intCount = 0 To testSize - 1      ' loop through, reading the bytes
            dummyInt = r.ReadByte()           ' do the read
        Next intCount

        fs.Flush()

        Dim endRead As Integer = Environment.TickCount   ' determine the end time

        Console.WriteLine ()
        Console.WriteLine ("For the Read...")
        Console.WriteLine ("Start Time: {0}", beginRead.ToString())
        Console.WriteLine ("End Time: {0}", endRead.ToString())
        Console.WriteLine ("Elapsed Time: {0}", endRead-beginRead) ' the time span in ms
        Dim thruputRead As double = (CType(origTestSize, double) / _
			((CType(endRead, double) - CType(beginRead, double))) * 1000)
        Console.WriteLine ("Data Thruput: {0} mb/sec", thruputRead)

        fs.Close()                            ' close the file

        System.IO.File.Delete(Environment.GetEnvironmentVariable("TEMP") & "\\data.bin")     ' delete the file

	return strWriter.ToString()
    End Function
End Class

Sub btnCreate_Click(Src As Object, E As EventArgs)

	If Convert.ToDouble( txtFileSize.Text ) > 10000 Then
		lblOutput.Text = "The upper limit on the number you can specify is 10000"
	Else
	    If Convert.ToDouble( txtFileSize.Text ) < 1
	        lblOutput.Text = "The lower limit on the number you can specify is 1"
        Else
		    lblOutput.Text = "<pre>" + ReadWrite.Go( Double.Parse(txtFileSize.Text) ) + "</pre>"
	    End If
	End If
End Sub

</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<form method=post runat=server>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align=left><td colspan=3><b>The following example asks the user to specify a size, measured in Kilobytes, of a file to create on disk. The file is then made, and the time taken to create, and subsequently read the file, is measured. This process demonstrates many useful techniques for dealing with file input and output.
<hr>
    </b></td></tr>
    <tr><td width=250>Please specify a file size (in Kilobytes):</td>
	<td><asp:TextBox id="txtFileSize" Width="80px" runat="server"/>KB</td>
	<td><asp:button text="Create File" id="btnCreate" OnClick="btnCreate_Click" runat=server/></td>
    </tr>
    <tr><td colspan=3><b><font color="#FF0000">
		Although the upper limit on the size you can specify is large, we don't allow an entry of more than 10000 (10 Megabytes).</font></b></td>
    </tr>

    <tr><td colspan=3><h4><asp:label id="lblOutput" runat="server"/></h4></td></tr>
    </table>
</body>
</form>
</html>