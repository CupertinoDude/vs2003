<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/assembliesheader.inc" -->

<h4>How Do I...Change the search path for private assemblies?</h4>

<P>Private assemblies are assemblies that are visible to only one application. The .NET Framework enables
developers to build applications that are isolated from changes made to the system by other applications.
Private assemblies must be deployed in the directory structure of the containing application and are found
during runtime through a process called probing, which is simply a mapping from an assembly's identity to
a file on disk that contains the manifest.
</P>

<P>
By default, probing for private assemblies is done in the application base (the root directory of the
application) and the subdirectories that follow naming conventions based on assembly name and culture. You can customize this behavior by specifying a privatePath in your application's configuration file.
The privatePath is a semi-colon delimited list of directories in which the common language runtime will search for private assemblies.
These directory names are relative to the application base - they cannot point outside the
application base.  The directories on privatePath will be searched after the application base itself.

The following configuration file adds a bin directory to the assembly search path:
</P>

<div class="code"><pre>
&lt;configuration&gt;   
    &lt;runtime&gt;
        &lt;assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1"&gt;
        
            &lt;probing privatePath="bin"/&gt;

        &lt;/assemblyBinding&gt;
    &lt;/runtime&gt;
&lt;/configuration&gt;
</pre></div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/searchpath/CS"
        ViewSource="/quickstart/howto/samples/assemblies/searchpath/searchpath.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Config Example"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/searchpath/CP"
        ViewSource="/quickstart/howto/samples/assemblies/searchpath/searchpath.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Config Example"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" --></BODY></HTML>
