<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>

<script language="C#" runat=server>

public class ReadWrite
{

    public static String Go ( Double fileSize )
    {
	//declare the StreamReader, for accessing the file
	StringWriter strWriter = new StringWriter();
	Console.SetOut(strWriter);

	Double origTestSize = fileSize;

        double testSize = origTestSize * 1024 ;

        using (FileStream fs = new FileStream(Environment.GetEnvironmentVariable("TEMP") + 
            "\\data.bin", FileMode.OpenOrCreate)) {
            fs.SetLength(0);

            BinaryWriter w = new BinaryWriter(fs);  // create a BinaryWriter

            w.BaseStream.Seek(0,SeekOrigin.Begin);  // seek the beginning of the file

            Console.Write  ("Writing file..");

            int beginWrite = Environment.TickCount; // get the start time

            for (int i = 0; i < testSize; i++) {     // loop through the file, writing the bytes
                w.Write( (byte) 1);                 // do the write
            }

            Console.WriteLine ();

            fs.Flush();

            int endWrite = Environment.TickCount;   // get the end time

            Console.WriteLine ("For the Write...");
            Console.WriteLine ("Start Time: {0}", beginWrite.ToString());
            Console.WriteLine ("End Time: {0}", endWrite.ToString());
            Console.WriteLine ("Elapsed Time: {0} ms", endWrite-beginWrite); // the time span in ms
            double thruputWrite = ((double)origTestSize / (((double)endWrite-(double)beginWrite)) * 1000);
            Console.WriteLine ("Data Thruput: {0} mb/sec", thruputWrite);

            BinaryReader r = new BinaryReader(fs); // create a BinaryReader

            w.BaseStream.Seek(0,SeekOrigin.Begin);	//set the file pointer to the beginning
            int dummyInt;

            int beginRead = Environment.TickCount; // get the start time

            for (int i = 0; i < testSize; i++) {    // loop through, reading the bytes
                dummyInt = r.ReadByte();           // do the read
            }

            fs.Flush();

            int endRead = Environment.TickCount;   // determine the end time

            Console.WriteLine ();
            Console.WriteLine ("For the Read...");
            Console.WriteLine ("Start Time: {0}", beginRead.ToString());
            Console.WriteLine ("End Time: {0}", endRead.ToString());
            Console.WriteLine ("Elapsed Time: {0}", endRead-beginRead); // the time span in ms
            double thruputRead = ((double)origTestSize / (((double)endRead-(double)beginRead)) * 1000);
            Console.WriteLine ("Data Thruput: {0} mb/sec", thruputRead);
    
            fs.Close();                            // close the file
        }

        // delete the file
        System.IO.File.Delete(Environment.GetEnvironmentVariable("TEMP") + "\\data.bin");
    
	return strWriter.ToString();
    }
}

void btnCreate_Click(Object Src, EventArgs E) {

	if (Convert.ToDouble( txtFileSize.Text ) > 10000)
		lblOutput.Text = "The upper limit on the number you can specify is 10000";
	else
	    if ( Convert.ToDouble( txtFileSize.Text ) < 1 )
	        lblOutput.Text = "The lower limit on the number you can specify is 1";
        else
		    lblOutput.Text = "<pre>" + ReadWrite.Go( Double.Parse(txtFileSize.Text) ) + "</pre>";
}

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