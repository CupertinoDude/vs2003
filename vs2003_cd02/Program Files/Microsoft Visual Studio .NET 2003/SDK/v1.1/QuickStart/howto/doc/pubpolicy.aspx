<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/assembliesheader.inc" -->

<h4>How Do I...Create a Publisher Policy Assembly?</h4>

<P>A Publisher policy statement describes the compatibility of an assembly issued by the publisher of that shared assembly.  See <a href="version.aspx">
How Do I...Use Version Policy"</a> to see how a publisher's policy statement fits into the overall .NET Framework version policy scheme.
Publisher policy is commonly used in service pack scenarios.  For example, a publisher may produce a number
of small releases that enhances certain features for a particular customer. For maintenance reasons, the publisher may wish to collect
all of these fixes into a single service pack release and have all existing customers upgrade to the new service pack.
</P>

<P>A publisher policy statement is an XML configuration file wrapped as a separate assembly.  There are three reasons that publisher policies are shipped as assemblies.  The first is to ensure that the policy statement comes from the author of the assembly that the policy is making the compatibility statement about. This is accomplished by requiring that the policy assembly has a strong name generated with the same key-pair as the original assembly.  The second
reason is ease of deployment. Publishers or administrators can ship policy statements using
the assembly deployment mechanisms provided by the .NET Framework, including the Windows Installer and code download. Using
the Windows Installer is particularly convenient because all policy assemblies must be installed in the global assembly cache. Finally, assemblies ship policy statements so that they can be versioned. This allows a publisher to ship a subsequent statement
if a previous policy is found not to work in some scenarios. In effect, this allows a publisher to change his mind about the compatibility of his assembly independent of when it was shipped. The flexibility enabled by decoupling the compatibility statements from the
code makes it much easier to fix broken applications in the .NET Framework. If multiple versions of a given policy assembly are found in the assembly cache, the .NET Framework will use the policy assembly with the highest version number.
</P>

<P>
In general, there are two steps required to create a publisher policy assembly:
<ul>
  <li>1. Create the XML file containing the compatibility statement.  You will have to use an XML editor to create this file.
  <li>2. Use the Assembly Generation tool (Al.exe) to create an assembly containing the XML file.
</ul>
The format of the xml file, along with rules about how the elements relate, is described in detail in
the .NET Framework SDK Guide.  Here is an example file:
</P>
<div class="code"><pre>
&lt;configuration&gt;
    &lt;runtime&gt;
        &lt;assemblyBinding&gt;

            &lt;dependentAssembly&gt;
                &lt;assemblyIdentity name="myasm"
                                  publicKeyToken="e9b4c4996039ede8"
                                  culture="en-us"/&gt;

                &lt;bindingRedirect oldVersion="1.0.0.0-1.0.9.9"
                                 newVersion="2.0.0.0"/&gt;

                &lt;codeBase version="2.0.0.0"
                          href="http://www.foo.com/bar.dll"/&gt;
            &lt;/dependentAssembly&gt;
        &lt;/assemblyBinding&gt;
    &lt;/runtime&gt;
&lt;/configuration&gt;
</pre></div>

<P>
After the xml file is created, use the Assembly Generation tool to create a policy assembly.  The following switches to the Assembly Generation tool are required:
</P>
<ol>
  <li><strong>/link: </strong>links the xml file into the assembly.
  <li><strong>/out: </strong>gives the resulting policy assembly a name.  Policy assemblies are found in the global assembly cache by naming convention.
Therefore, their names must be:
<P><strong>policy.&lt;major number&gt;.&lt;minor number&gt;.&lt;main assembly name&gt;</strong></P>
<P>For example, <b>policy.1.0.myasm</b></P>
  <li><strong>/keyfile: </strong>The key pair used to give the assembly a strong name (or at least the public key if delay signing is used).  As described earlier, this key
pair must be the same key pair used to sign the assembly to which this policy statement applies.
   <li><strong>/version: </strong>The version number of the policy assembly.
</ol>

<P>The following example shows a command line that uses the Assembly Generation tool:</P>

<div class="code"><pre>
Al /link:publisher.cfg /out:policy.1.0.myasm /keyfile:myasm.snk /version:2.0.0.0
</pre></div>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/pubpolicy"
        ViewSource="/quickstart/howto/samples/assemblies/pubpolicy/pubpolicy.src"
        Icon = "/quickstart/images/console.gif"
        Caption="Publisher.cfg"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->