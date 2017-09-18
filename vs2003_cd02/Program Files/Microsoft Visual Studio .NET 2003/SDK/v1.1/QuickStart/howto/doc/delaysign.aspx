<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/assembliesheader.inc" -->

<h4>How Do I...Create a delay signed shared assembly?</h4>


<P>
Giving an assembly a strong name requires two cryptographic keys: a public key and a private key.  This key pair is passed to the compiler at build time, as described in <a href="sharedname.aspx">How Do I... Create an assembly with a Strong Name?</a>, to create the strong name.
</P>

<P>
However, the person building the assembly does not always have access to the private key
required for strong naming. This is most common in corporations that have a central signing entity closely guards private keys. Only a few select people have access to these keys.  Also, the process of assigning a strong name cannot be done after building because the public key is part of the assembly's identity and must be supplied at build time so that clients of the assembly can compile against the full assembly identity.
</P>

<P>
The .NET Framework offers delay signing, which effectively splits the process of assigning the strong name into two
steps:
<ul>
  <li>1. At build time, the public key is given to the compiler so it can be recorded in the <b>PublicKey</b> field in the assembly manifest.  Also, space is reserved in the file for the signature, although the actual signature is not generated at this time.
  <li>2. At a later time, the actual signature is generated and stored in the file.  Signature generation is done with the -R switch
  to the Strong Named tool (Sn.exe).
</ul>
</P>

<P>
When you include the System.Reflection.AssemblyDelaySignAttribute in your source code, it indicates to the compiler that the assembly needs to be
created with delay signing.  You also need to include the public key, using <b>AssemblyKeyFileAttribute</b>.  Typically, the signing entity will use the SN -k to generate a key pair and store it in a file. Next, it pulls the public key out of the file using SN -p. The public key can then be given out, with the private key still secret.
</P>

<div class="code"><pre>
sn -k Testkey.snk
sn -p Testkey.snk TestPublicKey.snk
</pre></div>

<P> The following example uses <b>AssemblyKeyFileAttribute</b> and <b>AssemblyDelaySignAttribute</b> to create a delay signed assembly. In Visual Basic, the assembly level attributes must be the first statements in the file.</P>

<Acme:TabControl runat="server">
<Tab Name="C#">
using System;
using System.Reflection;

[assembly:AssemblyKeyFileAttribute("TestPublicKey.snk")]
[assembly:AssemblyDelaySignAttribute(true)]
</Tab>
<Tab Name="VB">
Imports System
Imports System.Reflection

&lt;assembly:AssemblyKeyFileAttribute("TestPublicKey.snk")&gt
&ltassembly:AssemblyDelaySignAttribute(true)&gt
</Tab>
<Tab Name="C++">
using namespace System;
using namespace System::Reflection;

[assembly:AssemblyKeyFileAttribute("TestPublicKey.snk")];
[assembly:AssemblyDelaySignAttribute(true)];
</Tab>
</Acme:TabControl>

<P> Since the assembly in the example does not have a valid signature, the signature validation performed
by the common language runtime will fail when you try to install the assembly into the global assembly cache or load it from
an application directory.  However, the Strong Name tool can be used to disable signature verification of a particular
assembly by using the -Vr option:
</P>

<div class="code"><pre>
sn -Vr DelaySign.dll
</pre></div>

<P>A valid signature must be generated before the assembly is shipped to customers using <b>sn -R</b>.  This is typically done
by the company signing entity.  You must supply the full key pair to create a valid signature.</P>

<div class="code"><pre>
sn -R DelaySign.dll Testkey.snk
</pre></div>

<P> The makefile included with this sample performs the following steps:
<ul>
<li>1. Creates a key-pair using <b>sn -K</b>.
<li>2. Separates the public key from the private key and stores the public key in its own file.
<li>3. Creates a delay signed assembly in either Visual Basic or C#.
<li>4. Uses the Strong Name tool to request that signature verification be skipped for the assembly just generated.
<li>5. Generates a valid signature using the Strong Name tool.  This typically happens just before you ship the assembly.
</ul>
</P>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/delaysign/CS"
        ViewSource="/quickstart/howto/samples/assemblies/delaysign/delaysign.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Delay Signing"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/delaysign/VB"
        ViewSource="/quickstart/howto/samples/assemblies/delaysign/delaysign.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Delay Signing"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>

    <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/delaysign/CP"
        ViewSource="/quickstart/howto/samples/assemblies/delaysign/delaysign.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Delay Signing"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
For more information regarding delay signing, see the topic "Delayed Signing an Assembly" in the core SDK documentation.
<p>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
