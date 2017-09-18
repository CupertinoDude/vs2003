<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<!-- #include virtual="/quickstart/howto/include/inputoutputheader.inc" -->
<h4>
    How Do I...Create a log file?
</h4>
This sample illustrates how to create a basic log file using the <b>IO</b> classes. 
This demonstration introduces many useful concepts such as writing to a file, 
and opening a file, even if the file does not yet exist. Since the information 
written to the file needs to be shown to the user, this example also 
demonstrates reading a file.
<p>
    <Acme:LangSwitch runat="server" id="LangSwitch1">
        <CsTemplate>
            <Acme:SourceRef ViewSource="/quickstart/howto/samples/IO/logfile/logfile.src" RunSample="/quickstart/howto/samples/IO/logfile/cs/logfile.aspx" Icon="/quickstart/images/genicon.gif" Caption="C# Logfile.aspx" runat="server" />
        </CsTemplate>
        <VbTemplate>
            <Acme:SourceRef ViewSource="/quickstart/howto/samples/IO/logfile/logfile.src" RunSample="/quickstart/howto/samples/IO/logfile/VB/logfile.aspx" Icon="/quickstart/images/genicon.gif" Caption="VB Logfile.aspx" runat="server" />
        </VbTemplate>
        <CpTemplate>
            <Acme:SourceRef ViewSource="/quickstart/howto/samples/IO/logfile/logfile.src" RunSample="/quickstart/howto/samples/IO/logfile/CP" Icon="/quickstart/images/genicon.gif" Caption="C++ Logfile.exe" MapRunSamplePath=true runat="server" />
        </CpTemplate>
    </Acme:LangSwitch>
<p>
Reading and writing information to and from a file is a common task, which you 
will no doubt come across when programming. Many programs regularly deal with 
reading and writing (Microsoft Excel, Microsoft Word, or Microsoft Powerpoint 
are a few examples). This example shows how to create log file that is a text 
file (as opposed to a binary file), so you can open and read the file.
<p>
    The example shows you how to create a <b>FileStream</b> object. A <b>FileStream</b>
    holds a reference to a file that you can manipulate. There are a few things 
    that the <b>FileStream</b> needs to be given when making a reference to our 
    file. First, it needs the name of the file. Next, you have to designate to the <b>FileStream</b>
    the mode in which you want to refer to our file. We could ask it to only open 
    an existing file, but that means if the file does not exist, it will cause a 
    problem. Therefore, we are going to tell the <b>FileStream</b> to open the 
    existing file if it is there, or create a new file if it is not. Finally, you 
    have to designate to the <b>FileStream</b>
the kind of access you want to the file (read, or write). This example will 
demonstrate reading and writing.
<p>
    <Acme:TabControl runat="server" id="TabControl1">
        <Tab Name="C#">
            // make a new FileStream object, ready for read and write steps. 
            FileStream fs = new FileStream(Environment.GetEnvironmentVariable("TEMP") + 
            "\\qslogfileCS.txt", FileMode.OpenOrCreate, FileAccess.ReadWrite);
        </Tab>
        <Tab Name="VB">
            ' make a new FileStream object, ready for read and write steps. 
            Dim fs As FileStream = New FileStream(Environment.GetEnvironmentVariable("TEMP") & _ 
            "\\qslogfileVB.txt", FileMode.OpenOrCreate, FileAccess.ReadWrite)
        </Tab>
        <Tab Name="C++">
            // make a new FileStream object, ready for read and write steps. 
            FileStream* fs = new FileStream("log.txt", FileMode::OpenOrCreate, FileAccess::ReadWrite);
        </Tab>
    </Acme:TabControl>
<p>
    Now that you have a reference to your file, the next step is to write some log 
    information into it. To do this, you need to create a <b>StreamWriter</b>, an 
    object that can write a string into a <b>Stream</b> object. If you are familiar 
    with the <b>FileStream</b> object, you might be wondering why we do not use its <b>Write</b>
    method. Why make the <b>StreamWriter</b> object at all? Because a <b>FileStream</b>
    can only write an array of bytes to a file, and many times (as in this example) 
    you might want to write other kinds of data, such as strings. A <b>StreamWriter</b>
can write strings to our file, while our </B>FileStream</B> cannot. This is 
going to make your job a lot easier.
<p>
    The following segment demonstrates how to create a new <b>StreamWriter</b>. 
    Notice that the <b>StreamWriter</b> is made with a reference to the stream. 
    Having made the stream, you can use the <b>Seek</b> method to get to the end of 
    the file (if you do not do this, and the file already exists, you would be 
    putting your new information in the wrong place), then use the <b>Write</b> method 
    to write your strings into the file. Note that <b>Write</b> itself does not 
    guarantee that the strings get into the file, therefore to force the 
    information through the <b>FileStream</b>, invoke the <b>Flush</b> method on 
    your <b>Writer</b>
.
<p>
    <Acme:TabControl runat="server" id="TabControl2">
        <Tab Name="C#">
            StreamWriter w = new StreamWriter(fs); // create a stream writer 
            w.BaseStream.Seek(0, SeekOrigin.End); // set the file pointer to the end of 
            file w.Write("Log Entry : \r\n"); w.Write("{0} {1} \r\n", 
            DateTime.Now.ToLongTimeString(), DateTime.Now.ToLongDateString()); 
            w.WriteLine("--Log entry goes here--"); w.Flush(); // update underlying file
        </Tab>
        <Tab Name="VB">
            Dim w As StreamWriter = New StreamWriter(fs) ' create a stream writer 
            w.BaseStream.Seek(0, SeekOrigin.End) ' set the file pointer to the end of file 
            w.Write("Log Entry : {0}", vbcrlf) w.WriteLine("{0} {1}{2}", 
            DateTime.Now.ToLongTimeString(), DateTime.Now.ToLongDateString(), vbcrlf) 
            w.WriteLine("--Log Entry goes here--") w.Flush() ' update underlying file
        </Tab>
        <Tab Name="C++">
            StreamWriter* w = new StreamWriter(fs);
	    w->BaseStream->Seek(0, SeekOrigin::End);
	    w->Write("\r\nLog Entry : ");
	    w->Write("{0} {1} \r\n\r\n", DateTime::Now.ToLongTimeString(),
		DateTime::Now.ToLongDateString());	
	    w->WriteLine("--Log Entry goes here--"); w->Flush(); ' update underlying file
        </Tab>
    </Acme:TabControl>
<p>
    At this point, you have finished updating your log file. Normally, you would 
    shut the file so anyone can open it and see the log entries. To read the file, 
    you have to make a <b>StreamReader</b>. Again, the <b>FileStream</b> does have 
    a <b>Read method</b>, although creating a <b>StreamReader</b> makes this 
    easier. Having made the <b>StreamReader</b>
, you need to point it to some place in your file, although this time you are 
going to move to the beginning of the file and move from there.
<p>
    In order to determine when you have reached the end of the file, you have to 
    'peek' at the file from the current position of the <b>StreamReader</b> current 
    position. If you have reached the end of the file (signified by a value less 
    than zero), it does not keep reading the file since there is no information 
    left. However, if there is still some information to read, you can instruct 
    your reader to get the next line of information, using its <b>ReadLine</b> method. 
    Once finished, you can close the <b>Stream</b>, the <b>Reader</b>, and the <b>Writer</b>
.
<p>
    <Acme:TabControl runat="server" id="TabControl3">
        <Tab Name="C#">
            StreamReader r = new StreamReader(fs); // create a stream reader 
            r.BaseStream.Seek(0, SeekOrigin.Begin); // set the file pointer to the 
            beginning While (r.Peek() > -1) { // while not at the end of the file 
            output.Append(r.ReadLine()); // get the next line of information from the file 
            output.Append("\n"); // a newline } w.Close(); // close the writer and 
            underlying file r.Close(); // close the read
        </Tab>
        <Tab Name="VB">
            Dim r As StreamReader = New StreamReader(fs) ' create a Char reader 
            r.BaseStream.Seek(0, SeekOrigin.Begin) ' set the file pointer to the beginning 
            While r.Peek() > -1 ' while not at the end of the file 
            output.Append(r.ReadLine()) ' get the next line of information from the file 
            output.Append( chr(13) ) ' a newline End While w.Close() ' close the writer and 
            underlying file r.Close() ' close the read
        </Tab>
        <Tab Name="C++">
            StreamReader* r = new StreamReader(fs); // create a stream reader 
            r->BaseStream->Seek(0, SeekOrigin::Begin); // set the file pointer to the 
	    while (r->Peek() > -1) { // while not at the end of the file 
	    	output->Append(String::Concat(r->ReadLine() , "\r\n")); // get the next line of information from the file 
	    }
	    r->Close();
	    return output->ToString();
        </Tab>
    </Acme:TabControl>
<p>
The result is a readable file. This functionality is ideal for server 
administrators as well as those who maintain websites. You can track 
performance information, the number of hits for a site, as well as numerous 
other logging tasks that do not require a database.
<p>
    <!-- #include virtual="/quickstart/howto/include/footer.inc" -->
</p>
