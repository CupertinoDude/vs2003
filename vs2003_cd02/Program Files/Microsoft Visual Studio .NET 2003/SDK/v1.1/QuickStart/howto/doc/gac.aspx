<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/assembliesheader.inc" -->

<h4>How Do I...Work with the global assembly cache?</h4>

<P>The global assembly cache is a machine-wide store used to
hold assemblies that are intended to be shared by several applications on
the machine.  The .NET Framework provides two tools for working with the cache.  One is a Windows shell extension that allows you
to work with the cache using a Graphical User Interface (GUI). The other is a command line tool, called the Global Assembly tool (Gacutil.exe), that is typically used in build and test scripts.  The
command line tool is called the Global Assembly Cache tool (Gacutil.exe).
</P>

<P>All assemblies in the global cache must have strong names.<P>

<h5>Viewing the Contents of the Assembly Cache</h5>
<P> Navigate to %winnt%\assembly using the Windows Explorer to activate the shell extension.  The default view shows the contents of the assembly cache.
You can also view the contents of the cache with the /l option of the Global Assembly Cache tool:

<div class="code"><pre>
gacutil /l
</pre></div>

</P>

<h5>Installing Assemblies</h5>
<P> To install an assembly using the shell extension simply drag and drop the file containing the assembly's
manifest into the global assembly cache directory. To install an assembly using the Global Assembly Cache tool, use the /i option:

<div class="code"><pre>
gacutil /i math.dll
</pre></div>

</P>

<h5>Uninstalling Assemblies</h5>
<P> To delete an assembly with the shell extension, right click on it and select Delete.  The /u option of the Global Assembly Cache tool can also be used:

<div class="code"><pre>
gacutil /u math,ver=1.0.0.0
</pre></div>

</P>

<P>The version of Windows Installer (1.5) that will ship in the Visual Studio .NET timeframe has native support for the assembly cache.  When creating an Installer
package with the Visual Studio Deployment tool or another setup tool, you can specify which assemblies you'd like installed in the cache.  Using the
Windows Installer to work with the assembly cache gives you the standard Installer benefits like install-on-demand, advertisement, publishing, and so on.
</P>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->