<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/serializationheader.inc" -->

<h4>How Do I...Use ISerializable to Customize the Serialization of a Class?</h4>

<div class="indent" style="width:660">
This sample illustrates how to use the <b>ISerializable</b> interface to customize
the serialization of your own objects. This sample serializes objects based
on the mscorlib assembly namespace tree structure. Each object contains a
property as the name of the item and a list of children as per the real
object in the mscorlib assembly. To demonstrate the customization possible
with <b>ISerializable</b>, "(SAVED)" is appended to the namespace name to indicate
that the values are not live. When the data is read back in, this tag could
be modified or removed. Note: This sample requires the
System.Runtime.Serialization.Formatters.Soap.dll.
</div>

<h4>Example</h4>
<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Serialization/ISerializable/CS"
        ViewSource="/quickstart/howto/samples/Serialization/ISerializable/ISerializable.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# ISerializable.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Serialization/ISerializable/VB"
        ViewSource="/quickstart/howto/samples/Serialization/ISerializable/ISerializable.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB ISerializable.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Serialization/ISerializable/CP"
        ViewSource="/quickstart/howto/samples/Serialization/ISerializable/ISerializable.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ ISerializable.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
