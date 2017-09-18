<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.IO" %>

<script language="VB" runat=server>

Class TestBinary

	Public Shared Function ReadFile(selection As String) As String
		Dim output As StringBuilder = New StringBuilder()

		Dim fs As FileStream = New FileStream(Environment.GetEnvironmentVariable("TEMP") & _
                    "\\data.bin", FileMode.OpenOrCreate)
		Dim r As BinaryReader = New BinaryReader(fs)

        Try
    		r.BaseStream.Seek(0,SeekOrigin.Begin)	' set the file pointer to the beginning

    		' because many of the translations between different datatypes are uninterpretable
    		' when converting to and from binary data, we have to catch any potential
    		' exceptions that may be raised...
    		' Reading the data correctly is contingent upon HOW the information was written...
    		' This is not the same as when writing log files.
    		Do While r.BaseStream.Position < r.BaseStream.Length   	'  while not at the end of the file

    			Select Case selection

    			Case "Boolean"
    				output.Append( r.ReadBoolean().ToString() )

    			Case "String"
    				output.Append( r.ReadString() )

    			Case "Integer"
    				output.Append( r.ReadInt32().ToString() )
    			End Select
    		Loop
    	Finally
    		fs.Close()
    	End Try

		return output.ToString()
	End Function

	Public Shared Function WriteFile(output As Object, selection As String) As String
		Dim fs As FileStream = New FileStream(Environment.GetEnvironmentVariable("TEMP") & _
                    "\\data.bin", FileMode.Create)
		Dim w As BinaryWriter = New BinaryWriter(fs)
		Dim strOutput As String = ""

		w.BaseStream.Seek(0, SeekOrigin.End)        '  set the file pointer to the end

		' because the information we are writing may not be appropriate for the particular
		' style chosen to write (Eg: the word "Hello" as an integer?), we have to catch
		' write errors, and inform the user that we could not perform the task
		Try
			Select Case selection

			Case "Boolean"
				Dim b As Boolean = Convert.ToBoolean(output)
				w.Write( b )

			Case "String"
				Dim s As String = Convert.ToString(output)
				w.Write( s )

			Case "Integer"
				Dim i As Int32 = Convert.ToInt32(output)
				w.Write(i)
			End Select

		Catch E As Exception
			' let the user know that the information could not be written
			strOutput = "WRITE EXCEPTION: " & chr(13) & _
				"The information you want to write cannot be written in the format requested. " & _
				chr(13) & "Please enter a valid value for the datatype you are trying to write"
		End Try

		fs.Close()

		return strOutput
	End Function
End Class

Sub btnAction_Click(src As Object, E As EventArgs)

	Dim s As String = ""

	' write out the file
	s = TestBinary.WriteFile(txtInput.Text, lstDataIn.SelectedItem.Text)

	If s = "" Then
	    Try
    		' read back in, the display information...
    		txtOutput.Text = TestBinary.ReadFile(lstDataIn.SelectedItem.Text)
        Catch Exc As Exception
			' let the user know that the information could not be written
			s = "READ EXCEPTION: " & chr(13) & _
				"The information you want to write cannot be read in the format requested. " & _
				chr(13) & "Please enter a valid value for the datatype you are trying to write"

        End Try

	Else
		txtOutput.Text = s
	End If
End Sub
</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
<form method=post runat="server">
<p>

<table>
<tr>
	<td><b>
The following example creates a binary file using the BinaryWriter object, and subsequently reads that information using a BinaryReader.</b> You can select different to write the information you want to file

This demonstration is meant to highlight that you need to know how to read a binary file you have written. Once you have written data in one format, you can only read that information in the same format. However, you can write a lot of different datatypes to file. In this demonstration, enter any strings and read them as strings, enter only integer numeric entries for Integers (try floating point numbers and see what happens...), or the words 'false' and 'true' for boolean entries.
<p>
	<hr>
	</td>
</tr>
</table>

<asp:Table id="basetable" runat="server" border="0" cellspacing="0" cellpadding="5">

<asp:tablerow>
      <asp:tablecell verticalalign="top">
	Please Select the type of data to save to a binary file...
      </asp:tablecell>
      <asp:tablecell verticalalign="top">
	<asp:listbox id="lstDataIn" runat="server">
	  <asp:listitem>Boolean</asp:listitem>
	  <asp:listitem selected="true">String</asp:listitem>
	  <asp:listitem>Integer</asp:listitem>
	</asp:listbox>
      </asp:tablecell>

      <asp:tablecell verticalalign="top">
	<asp:button id="btnAction" onclick="btnAction_Click" Text="Write/Read File" runat="server"/>
      </asp:tablecell>
</asp:tablerow>

<asp:tablerow>
      <asp:tablecell columnspan="3" verticalalign="top">
	Enter a single value to write to file in the following text box.
      </asp:tablecell>
</asp:tablerow>

<asp:tablerow>
      <asp:tablecell columnspan="3" verticalalign="top">
	<asp:textbox id="txtInput"
			TextMode="MultiLine"
			Columns="80"
			Rows="2"
			runat="server"/>
      </asp:tablecell>
</asp:tablerow>

<asp:tablerow>
      <asp:tablecell columnspan="3" verticalalign="top">
	The following textbox displays the entries in the binary file, or the exception information returned.
      </asp:tablecell>
</asp:tablerow>

<asp:tablerow>
      <asp:tablecell columnspan="3" verticalalign="top">
	<asp:textbox id="txtOutput"
			TextMode="MultiLine"
			Columns="80"
			Rows="4"
			runat="server" />
      </asp:tablecell>
</asp:tablerow>
</asp:Table>

</form>
</body>
</html>
