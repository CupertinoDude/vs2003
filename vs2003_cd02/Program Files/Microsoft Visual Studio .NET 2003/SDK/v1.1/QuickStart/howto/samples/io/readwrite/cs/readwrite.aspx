<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.IO" %>

<script language="C#" runat=server>

class TestBinary {
    public static String ReadFile(String selection) {

        StringBuilder output = new StringBuilder();

        using (FileStream fs = new FileStream(Environment.GetEnvironmentVariable("TEMP") +
            "\\data.bin", FileMode.OpenOrCreate)) {
            BinaryReader r = new BinaryReader(fs);

            r.BaseStream.Seek(0,SeekOrigin.Begin);	//set the file pointer to the beginning
                //because many of the translations between different datatypes are uninterpretable
                //when converting to and from binary data, we have to catch any potential
                //exceptions that may be raised...
                //Reading the data correctly is contingent upon HOW the information was written...
                //This is not the same as when writing log files.
                while (r.BaseStream.Position < r.BaseStream.Length) {    // while not at the end of the file
                    switch ( selection ) {
                        case "Boolean":
                            output.Append( r.ReadBoolean().ToString() );
                            break;
                        case "String":
                            output.Append( r.ReadString() );
                            break;
                        case "Integer":
                            output.Append( r.ReadInt32().ToString() );
                            break;
                    }
                }
            fs.Close();
            return output.ToString();
        }
    }

    public static String WriteFile(Object output, String selection)
    {
        using (FileStream fs = new FileStream(Environment.GetEnvironmentVariable("TEMP") +
            "\\data.bin", FileMode.Create)) {
            BinaryWriter w = new BinaryWriter(fs);
            String strOutput = "";

            w.BaseStream.Seek(0, SeekOrigin.End);        // set the file pointer to the end
                //because the information we are writing may not be appropriate for the particular
                //style chosen to write (Eg: the word "Hello" as an integer?), we have to catch
                //write errors, and informa the user that we could not perform the task
            try {
                switch ( selection ) {
                    case "Boolean":
                        bool b = Convert.ToBoolean(output);
                        w.Write( b );
                        break;
                    case "String":
                        String s = Convert.ToString(output);
                        w.Write( s );
                        break;
                    case "Integer":
                        Int32 i = Convert.ToInt32(output);
                        w.Write( i );
                        break;
                }
            }
            catch (Exception) {
                //let the user know that the information could not be written
                strOutput = "WRITE EXCEPTION: \n" +
                    "The information you want to write cannot be written in the format requested. " +
                    "\nPlease enter a valid value for the datatype you are trying to write";
            }

            fs.Close();
            return strOutput;
        }
    }
}

void btnAction_Click(Object src, EventArgs e) {
    String s = "";

    //write out the file
    s = TestBinary.WriteFile(txtInput.Text, lstDataIn.SelectedItem.Text);

    if (s == "") {
        //read back in, the display information...
        txtOutput.Text = TestBinary.ReadFile(lstDataIn.SelectedItem.Text);
    }
    else {
        txtOutput.Text = s;
    }
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
	<td><b>
The following example creates a binary file using the BinaryWriter object, and subsequently reads that
information using a BinaryReader.</b> You can select different to write the information you want,
to file

This demonstration is meant to highlight that you need to know how to read a binary file you have
written. Once you have written data in one format, you can only read that information in the same
format. However, you can write a lot of different datatypes to file. In this demonstration, enter
any strings and read them as strings, enter only integer numeric entries for Integers (try floating
point numbers and see what happens...), or the words 'false' and 'true' for boolean entries.
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
