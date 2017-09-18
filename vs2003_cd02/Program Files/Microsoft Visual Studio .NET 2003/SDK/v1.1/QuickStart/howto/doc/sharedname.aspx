<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/assembliesheader.inc" -->

<h4>How Do I...Create an assembly with a strong name?</h4>


<P>
Assemblies can be assigned a cryptographic signature, called a strong name, which provides name uniqueness for the assembly and prevents someone from taking over the name of your assembly (name spoofing). If you are deploying an assembly that will be shared among many applications on the same machine, it must have a strong name. Even if you only use the assembly within your application, using a strong name ensures that the correct version of the assembly gets loaded</P>

<P>
The first step in building an assembly with a strong name is to obtain a cryptographic key pair. 
The .NET Framework SDK includes a Strong Name tool (Sn.exe) that can be used to generate a key pair. The key pair that is generated by the Strong Name tool can be kept in a file or you can store it in your local machine's Cryptographic Service Provider (CSP). The following command uses the Strong Name tool to generate a new key pair and store it in a file called TestKey.snk:</P>

<div class="code"><pre>
sn -k Testkey.snk
</pre></div>

<P>Once you have obtained the key pair, you need to add the proper custom attribute to your source in order for the compiler to emit the assembly with a strong name. Choosing the correct attribute depends on whether the key pair used for the signing is contained in a file or in a key container within the CSP.  For keys stored in a file, use System.Reflection.AssemblyKeyFileAttribute. For keys stored in the CSP use
System.Reflection.AssemblyKeyNameAttribute.</P>

<P> The following example uses <b>AssemblyKeyFileAttribute</b> to specify the name of the file containing the key pair. In Visual Basic, the assembly level attributes must be the first statements in the file.</P>

<Acme:TabControl runat="server">
<Tab Name="C#">
using System;
using System.Reflection;

[assembly:AssemblyKeyFileAttribute("TestKey.snk")]
</Tab>
<Tab Name="VB">
Imports System
Imports System.Reflection

&lt;assembly:AssemblyKeyFileAttribute("TestKey.snk")&gt
</Tab>
<Tab Name="C++">
using namespace System;
using namespace System::Reflection;

[assembly:AssemblyKeyFileAttribute("TestKey.snk")];
</Tab>
</Acme:TabControl>

<P>You can also choose to delay sign your assembly. This means that the
space for the signature is reserved in the PE file, but the signing itself is
not done until later. This approach is typically used if you do not have
access to the private key you need to generate the strong name. For more details, see <a href="Delaysign.aspx">How do I... Use Delay Signing</a>.</P>

<P>The makefile included with this sample uses the Strong Name Tool to generate a key pair,
then builds a strong-named assembly with C# or Visual Basic. If you look at the assembly with MSIL Disassembler (Ildasm.exe) after the build is complete, you can
see the public key as part of the assembly's identity in the manifest. The signature
itself is stored elsewhere in the PE file. You do not need to use the Strong Name tools to generate a new key-pair for each build. Since the public key is part of the assembly's name, you can generate one key-pair and never change it for the lifetime of the assembly.</P>


<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/sharedname/CS"
        ViewSource="/quickstart/howto/samples/assemblies/sharedname/sharedname.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Strong Names"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>

    <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/sharedname/VB"
        ViewSource="/quickstart/howto/samples/assemblies/sharedname/sharedname.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Strong Names"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>

   <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/assemblies/sharedname/CP"
        ViewSource="/quickstart/howto/samples/assemblies/sharedname/sharedname.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Strong Names"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>

</Acme:LangSwitch>

<p>
For more information regarding strong names, see the topic "Working with Strongly-Named Assemblies" in the core SDK documentation.
<p>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
