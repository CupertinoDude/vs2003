<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.IO" %>

<script language="VB" runat=server>

public Sub Page_Load (sender As Object, E As EventArgs)
    ' have to load the information into the display textarea...
    txtOutput.Text = FileTest.ReadFile()
End Sub

Public Class FileTest
    Public Shared Sub WriteFile( input As String )
        ' Write to a temp directory which ASPNET has access to
        Dim fname As String = Environment.GetEnvironmentVariable("TEMP") & "\qslogfileVB.txt"
        Dim finfo As FileInfo = new FileInfo(fname)


        ' Only allow a file length of 2k
        If finfo.Exists AndAlso finfo.Length > 2048 Then
            finfo.Delete()
        End If

        Dim fs As FileStream = finfo.OpenWrite()
        Dim w As StreamWriter = new StreamWriter(fs)  '  create a Char writer 
        w.BaseStream.Seek(0, SeekOrigin.End)   '  set the file pointer to the end

        w.Write( chr(13) & "Log Entry : ")
        w.Write("{0} {1} " &  chr(13) &  chr(13), DateTime.Now.ToLongTimeString(), _
            DateTime.Now.ToLongDateString())

        w.Write(input & chr(13))
        w.Write("------------------------------------" & chr(13))

        w.Flush()                              '  update underlying file

        w.Close()                              '  close the writer and underlying file
    End Sub

    Public Shared Function ReadFile() As String
        ' Read the log file from the temp directory
        Dim fs As FileStream = new FileStream(Environment.GetEnvironmentVariable("TEMP") & _
            "\\qslogfileVB.txt", FileMode.OpenOrCreate, FileAccess.Read)

        Dim output As StringBuilder = new StringBuilder()

        ' clear the buffer...
        output.Length = 0

        Dim r As StreamReader = new StreamReader(fs)   '  create a Char reader
        r.BaseStream.Seek(0, SeekOrigin.Begin)  '  set the file pointer to the beginning

        Do while r.Peek() > -1                   '  while not at the end of the file    
            output.Append(r.ReadLine() &  chr(13))
        Loop

        r.Close()                               '  close the read

        ReadFile = output.ToString()
    End Function
End Class

Sub btnUpdate_Click(src As Object, E As EventArgs) 
    FileTest.WriteFile(txtInput.Text)     ' write out the file
    txtOutput.Text = FileTest.ReadFile()  ' read back in, the display information...
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
    <td><b>The following example creates a log file in the temp directory, which can be viewed by users directly</b>.
This example reads the file, in order to print the information to the screen, and also updates the file by
writing to it when you click the update button. Note that if the file does not exist, it will be created.  When the
file exceeds 2KB in size, it will be deleted to prevent overgrowth.
        <hr>
    </td>
</tr>
</table>

<asp:Table id="basetable" runat="server" border="0" cellspacing="0" cellpadding="5">

<asp:tablerow>
      <asp:tablecell verticalalign="top">
    Please Enter a message to Add to the log file.
      </asp:tablecell>

      <asp:tablecell verticalalign="top">
    <asp:button id="btnUpdate" onclick="btnUpdate_Click" Text="Update File" runat="server"/>
      </asp:tablecell>
</asp:tablerow>

<asp:tablerow>
      <asp:tablecell columnspan="2" verticalalign="top">
    <asp:textbox id="txtInput" 
            TextMode="MultiLine" 
            Columns="80" 
            Rows="5" 
            runat="server"/>
      </asp:tablecell>
</asp:tablerow>

<asp:tablerow>
      <asp:tablecell columnspan="2" verticalalign="top">
    The following textbox displays the entries in the file.
      </asp:tablecell>
</asp:tablerow>

<asp:tablerow>
      <asp:tablecell columnspan="2" verticalalign="top">
    <asp:textbox id="txtOutput" 
            TextMode="MultiLine"  
            Columns="80" 
            Rows="20" 
            runat="server" />
      </asp:tablecell>
</asp:tablerow>
</asp:Table>

</form>
</body>
</html>