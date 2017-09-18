<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.IO" %>

<script language="C#" runat=server>

public void Page_Load(Object sender, EventArgs E) {
    // have to load the information into the display textarea...
    txtOutput.Text = FileTest.ReadFile();
}

public class FileTest {
    public static void WriteFile(String input) {
        // Write to a temp directory which ASPNET has access to
        string fname = Environment.GetEnvironmentVariable("TEMP") + "\\qslogfileCS.txt";
        FileInfo finfo = new FileInfo(fname);
        
        // Only allow a file length of 2k
        if ( finfo.Exists && finfo.Length > 2048 )
        {
            finfo.Delete();
        }
        
        using(FileStream fs = finfo.OpenWrite())
        {
            StreamWriter w = new StreamWriter(fs);
            w.BaseStream.Seek(0, SeekOrigin.End);

            w.Write("\nLog Entry : ");
            w.Write("{0} {1} \n\n", DateTime.Now.ToLongTimeString(),
                DateTime.Now.ToLongDateString());

            w.Write(input + "\n");
            w.Write("------------------------------------\n");

            w.Flush();

            w.Close();
        }
    }

    public static String ReadFile() {
        // Read the log file from the temp directory
        FileStream fs  = new FileStream(Environment.GetEnvironmentVariable("TEMP") + 
            "\\qslogfileCS.txt", FileMode.OpenOrCreate, FileAccess.Read);

        StringBuilder output = new StringBuilder();

        output.Length = 0;

        StreamReader r = new StreamReader(fs);
        r.BaseStream.Seek(0, SeekOrigin.Begin);

        while (r.Peek() > -1) {
            output.Append(r.ReadLine() + "\n");
        }

        r.Close();
        return output.ToString();
    }
}

void btnUpdate_Click(Object src, EventArgs E) {
    FileTest.WriteFile(txtInput.Text);      // write out the file
    txtOutput.Text = FileTest.ReadFile();   // read back in, the display information...
}
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