<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/cryptographyheader.inc" -->

<h4>How Do I...Generate and compare a hash value?</h4>

<p>It is easy to generate and compare hash values using the cryptographic resources contained 
in the <b>System.Security.Cryptography</b> namespace. Because all hash functions take input of 
type <b>Byte[]</b>, it might be necessary to convert the source into a byte array before it is 
hashed.</p>

<p>To generate a hash value, create an instance of a hash algorithm and call 
<b>ComputeHash()</b> on it. The following code creates an instance of the <b>MD5</b> hash 
algorithm and calls <b>ComputeHash()</b> on it. The hash function returns a byte array
containing the hash value of the byte array <b>Input</b></p>

<Acme:TabControl runat="server">
<Tab Name="C#">
Byte[] HashVal = (new MD5CryptoServiceProvider()).ComputeHash(Input);
</Tab>
<Tab Name="VB">
Dim HashVal As Byte() = New MD5CryptoServiceProvider().ComputeHash(Input)
</Tab>
<Tab Name="C++">
Byte hashvalue[] = (new MD5CryptoServiceProvider)->ComputeHash(Input);
</Tab>
</Acme:TabControl>

<p>Note that <b>ComputeHash()</b> is the final operation performed on an instance of a hash 
object. If another hash value needs to be generated, a new instance of a hash algorithm must 
be created.</p>

<p><b>System.Security.Cryptography</b> contains implementations of <b>MD5</b>, <b>SHA1</b>, 
<b>SHA256</b>, <b>SHA384</b>, and <b>SHA512</b>. The following code computes a <b>SHA1</b> hash value.</p>

<Acme:TabControl runat="server">
<Tab Name="C#">
Byte[] HashVal = (new SHA1CryptoServiceProvider()).ComputeHash(Input);
</Tab>
<Tab Name="VB">
Dim HashVal As Byte() = New SHA1CryptoServiceProvider().ComputeHash(Input)
</Tab>
<Tab Name="C++">
Byte hashvalue[] = (new SHA1CryptoServiceProvider)->ComputeHash(Input);
</Tab>
</Acme:TabControl>

<p>To compare hash values, perform an element-by-element comparison of the hash value byte 
arrays.</p>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/cryptography/hash/CS"
        ViewSource="/quickstart/howto/samples/cryptography/hash/hash.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# hash.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/cryptography/hash/VB"
        ViewSource="/quickstart/howto/samples/cryptography/hash/hash.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB hash.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/cryptography/hash/CP"
        ViewSource="/quickstart/howto/samples/cryptography/hash/hash.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ hash.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
