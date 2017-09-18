<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/assembliesheader.inc" -->

<h4>How Do I...Use Assembly Version Policy?</h4>

<P>
A primary goal of the deployment system in the .NET Framework is to eliminate conflicts between applications caused by
shared components and shared states (or DLL conflicts).  A key solution to this problem is a robust
versioning system.  The .NET Framework records information about an application's dependencies
in the assembly manifest.  This dependency information includes a version number that is used at runtime to load the proper
version of a dependency.
</P>

<P>By default, the common language runtime will load the version of a dependency that is specified in the manifest.  This is
preferred in the majority of scenarios. However, there are cases where running an application with
a different version of a dependency can be useful.  In order to accomplish this, version policies can be included
in an application's configuration file.  For example, the following XML code fragment redirects references to version 5.0.0.0 of a shared
assembly called "CalcR" up to version 6.0.0.0 of that assembly:
</P>

<div class="code"><pre>
<div class="code"><pre>
&lt;configuration&gt;   
    &lt;runtime&gt;
        &lt;assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1"&gt;


            &lt;dependentAssembly&gt;
                &lt;assemblyIdentity name="calcR" 
                                  publicKeyToken="a1690a5ea44bab32" 
                                  culture=""/&gt;
              
                
                &lt;bindingRedirect oldVersion="5.0.0.0"
                                 newVersion="6.0.0.0"/&gt;


            &lt;/dependentAssembly&gt;
        &lt;/assemblyBinding&gt;
    &lt;/runtime&gt;
&lt;/configuration&gt; 
</pre></div>
</pre></div>

<P>In addition to policies specified at the application level, the .NET Framework also provides two other policy levels: publisher and administrator.
A Publisher policy statement describes the compatibility of an assembly issued by the publisher of that shared assembly.  See
<a href="pubpolicy.aspx">How Do I ... Create Publisher Policy</a> for details.  Administrator level policy is a machine version
policy that affects all applications.  Administrator policy is created using the same XML syntax as application level policy.  The
administrator policy file is called machine.config, and resides in the common language runtime install directory.  The three policy levels are evaluated
in the following order:

<ul>
  <li>Application Policy
  <li>Publisher Policy
  <li>Administrator Policy
</ul>

</P>
<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/version/CS"
        ViewSource="/quickstart/howto/samples/assemblies/version/version.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Math.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/version/CP"
        ViewSource="/quickstart/howto/samples/assemblies/version/version.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Math.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->