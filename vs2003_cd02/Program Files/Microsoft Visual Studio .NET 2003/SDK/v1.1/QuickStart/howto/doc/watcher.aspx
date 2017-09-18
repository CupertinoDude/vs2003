<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/inputoutputheader.inc" -->

<h4>How Do I...Watch file system changes?</h4>


<p>Use the <b>FileSystemWatcher</b> component
to monitor a file system and react when changes to it occur. This makes it
possible for you to quickly and easily launch business processes when certain
files or directories are created, modified, or deleted. For example, suppose you
and a group of coworkers are collaborating on a document that is stored on a
shared directory on your server. Using the <b>FileSystemWatcher</b> component, you can
easily program your application to watch for changes to the shared directory.
When a change is detected, the component can run processing that notifies each
of the group members through email.</p>

<p>This sample illustrates how to
use a <b>FileSystemWatcher</b> to watch for any changes, renaming, creation, and
deletion of any files in the specified directory. The application takes the
directory that you wish to watch as the only argument.</p>

<p>Try running the sample as follows:</p>

<div class="code"><pre>
&gt; Watcher.exe c:\
</pre></div>

<p>Now, open the c:\ directory and try creating, modifying and deleting a file in the
directory. Observe the sample application printing an appropriate message to the
console window.</p>

<p>In its simplest form, using a FileSystemWatcher involves:</p>

<ol>

<li>Creating a new instance of the component and specifing the directory to watch:

<p>
<table cellpadding="0" cellspacing="0" width="95%">
<tr>
<td>
<p><Acme:TabControl runat="server">
<Tab Name="C#">
FileSystemWatcher watcher = new FileSystemWatcher();
watcher.Path= &quot;c:\Foo&quot;;
</Tab>

<Tab Name="VB">
Dim watcher As FileSystemWatcher = New FileSystemWatcher()
watcher.Path= &quot;c:\Foo&quot;
</Tab>

<Tab Name="C++">
FileSystemWatcher* watcher = new FileSystemWatcher();
watcher->Path= &quot;c:\Foo&quot;;
</Tab>
</Acme:TabControl>
</td>
</tr>
</table>
<p>

<li>Adding event handler[s]:

<p>
<table cellpadding="0" cellspacing="0" width="95%">
<tr>
<td>
<Acme:TabControl runat="server">
<Tab Name="C#">
watcher.Changed += new FileSystemEventHandler(OnChanged);
watcher.Created += new FileSystemEventHandler(OnChanged);
</Tab>

<Tab Name="VB">
AddHandler watcher.Changed, AddressOf OnChanged
AddHandler watcher.Created, AddressOf OnChanged
</Tab>

<Tab Name="C++">
watcher->Changed += new FileSystemEventHandler(OnChanged);
watcher->Created += new FileSystemEventHandler(OnChanged);
</Tab>
</Acme:TabControl>
</td>
</tr>
</table>
<p>

<li>Specifying what the application should do when a change occurs:

<p>
<table cellpadding="0" cellspacing="0" width="95%">
<tr>
<td>
<Acme:TabControl runat="server">
<Tab Name="C#">
public void OnChanged(object source, FileSystemEventArgs e) {
  Console.Write(&quot;File: {0} {1}&quot;, e.FullPath, e.ChangeType);
}
</Tab>

<Tab Name="VB">
Public Sub OnChanged(source As Object, e As FileSystemEventArgs)
  Console.Write(&quot;File: {0} {1}&quot;, e.FullPath, e.ChangeType)
End Sub
</Tab>

<Tab Name="C++">
void OnChanged (Object* source, FileSystemEventArgs* e)
{
	WatcherChangeTypes   watchtypes= e->ChangeType;
	Console::WriteLine( S"File: {0} {1}", e->FullPath, __box( watchtypes));
}
</Tab>

</Acme:TabControl>
</td>
</tr>
</table>
<p>

<li>Enabling the component:

<p>
<table cellpadding="0" cellspacing="0" width="95%">
<tr>
<td>
<Acme:TabControl runat="server">
<Tab Name="C#">
watcher.EnableRaisingEvents = true;
</Tab>

<Tab Name="VB">
watcher.EnableRaisingEvents = True
</Tab>

<Tab Name="C++">
watcher->EnableRaisingEvents = true;
</Tab>
</Acme:TabControl>
</td>
</tr>
</table>
<p>

</ol>


<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/FileSystemWatcher/Watcher/CS/"
        ViewSource="/quickstart/howto/samples/Services/FileSystemWatcher/Watcher/Watcher.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Watcher.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/FileSystemWatcher/Watcher/VB"
        ViewSource="/quickstart/howto/samples/Services/FileSystemWatcher/Watcher/Watcher.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Watcher.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/FileSystemWatcher/Watcher/CP"
        ViewSource="/quickstart/howto/samples/Services/FileSystemWatcher/Watcher/Watcher.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Watcher.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->