<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/serializationheader.inc" -->

<h4>How Do I...Serialize an Object Graph</h4>

This sample shows how to serialize a graph of objects using the serialization infrastructure.

<h4>Example</h4>

<p>


<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Serialization/Serialize/CS"
        ViewSource="/quickstart/howto/samples/serialization/serialize/serialize.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Serialize.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Serialization/Serialize/VB"
        ViewSource="/quickstart/howto/samples/serialization/serialize/serialize.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Serialize.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Serialization/Serialize/CP"
        ViewSource="/quickstart/howto/samples/serialization/serialize/serialize.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Serialize.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
