<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/globalizationheader.inc" -->

<h4>How Do I...Use different text encodings?</h4>

<div class="indent" style="width:660">
This sample illustrates how to use multiple encoding formats available
from the <b>System.Text</b> namespace.  A <b>StreamWriter</b> object is created
and passed a <b>Stream</b> object along with an <b>Encoding</b> object
from the <b>System.Text</b> namespace.  Once created, any output method calls
on the <b>StreamWriter</b> object will be written in the specified encoding.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
FileStream fs = new FileStream("text.txt", FileMode.OpenOrCreate);
 ...
StreamWriter t = new StreamWriter (fs, Encoding.UTF8);
t.Write("This is in UTF8");
</Tab>
<Tab Name="VB">
Dim Fs As FileStream = New FileStream("text.txt", FileMode.OpenOrCreate)
 ...
Dim T As StreamWriter = New StreamWriter (Fs, Encoding.UTF8)
T.Write("This is in UTF8")
</Tab>
<Tab Name="C++">
FileStream* fs = new FileStream("text.txt", FileMode::OpenOrCreate);
 ...
StreamWriter* t = new StreamWriter (fs, Encoding::UTF8);
T.Write("This is in UTF8");
</Tab>
</Acme:TabControl>

<p>
A <b>StreamReader</b> object is used to read text in a given encoding and is
constructed in the same manner as a <b>StreamWriter</b> object.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
FileStream fs = new FileStream("text.txt", FileMode.Open);
 ...
StreamReader t = new StreamReader(fs, Encoding.UTF8);
String s = t.ReadLine();
</Tab>
<Tab Name="VB">
Dim Fs As FileStream = New FileStream("text.txt", FileMode.Open)
 ...
Dim T As StreamReader = New StreamReader(Fs, Encoding.UTF8)
Dim S As String = T.ReadLine()
</Tab>
<Tab Name="C++">
FileStream* fs = new FileStream("text.txt", FileMode::OpenOrCreate);
 ...
StreamWriter* t = new StreamWriter (fs, Encoding::UTF8);
String* s = t->ReadLine();
</Tab>
</Acme:TabControl>

<p>
The following example illustrates creating <b>StreamWriter</b> objects
of different encodings and using each object to write to a text file.
</div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/globalization/encoding/CS"
        ViewSource="/quickstart/howto/samples/globalization/encoding/encoding.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Encoding.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/globalization/encoding/VB"
        ViewSource="/quickstart/howto/samples/globalization/encoding/encoding.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Encoding.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/globalization/encoding/CP"
        ViewSource="/quickstart/howto/samples/globalization/encoding/encoding.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Encoding.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
