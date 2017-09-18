<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->

<h4>ADO.NET: Work with Typed Data</h4>

ADO classic code provides late-bound access to values within its
recordset through weakly typed variables. ADO.NET code enables you to access the data held in the DataSet through a "strongly typed"
metaphor. This means you can access tables and columns that are part of
the DataSet with user-friendly names and strongly typed variables.
Therefore, rather than writing the ADO classic code shown below:
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
AdoRecordset.Find("CustomerID = 'ALFKI'");
AdoRecordSet.Fields["FirstName"].Value  = "Bob";
</Tab>
<Tab Name="VB">
AdoRecordset.Find("CustomerID = 'ALFKI'")
AdoRecordSet.Fields("FirstName").Value  = "Bob"
</Tab>
<Tab Name="C++">
AdoRecordset->Find("CustomerID = 'ALFKI'");
AdoRecordSet->Fields->Item["FirstName"]->Value  = "Bob";
</Tab>
</Acme:TabControl>

<p>
with a strongly typed DataSet, you write the following ADO.NET code:</p>
<p>


<Acme:TabControl runat="server">
<Tab Name="C#">
CustomerDataSet.Customers["ALFKI"].CustomerName = "Bob";
</Tab>
<Tab Name="VB">
CustomerDataSet.Customers("ALFKI").CustomerName = "Bob"
</Tab>
<Tab Name="C++">
CustomerDataSet->Customers->Item["ALFKI"]->CustomerName = "Bob";
</Tab>
</Acme:TabControl>


<p>Additionally, the strongly typed DataSet provides access to row values
as the correct, strongly typed value. With ADO, variant types are used
when assigning and retrieving data. If the value that you assigned was of
the wrong type, ADO would give you a run-time error. With ADO.NET, if the
value is of type integer and you attempt to assign a string, you will get
a compile-time error.</p>

<p>Given an XML schema that complies with the XSD standard, you can
generate a strongly typed DataSet using the XSD.exe tool provided with the .NET Framework
SDK. The syntax for generating a DataSet using this tool is:</p>

<div class="code"><pre>
xsd.exe /d /l:CS {XSDSchemaFileName.xsd}
</pre></div>

<p> The /d directive directs the tool to generate a DataSet; the /l: directive
specifies the language to use -- either "C#" or "VB."</p>

<p>The following example uses a strongly typed DataSet called "myCustDS" to
load a list of customers from the Northwind database. Once the data is loaded
using the <b>Fill</b> method, the code loops through each customer in the
"Customers" table using the typed <b>myDataRow</b> object. Note the direct access to 
the "CustomerID" field, as opposed to accessing it through the <b>Fields</b> collection.</p>

<p>Before running the following sample, you must run "nmake /a" in the "..\typeddata\DllSrc" 
directory from a console window to create the TypedData.dll file.</p>
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
    <Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/TypedData/cs/TypedData.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/TypedData/TypedData.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# TypedData.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
    <Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/TypedData/vb/TypedData.aspx"
  ViewSource="/quickstart/howto/samples/adoplus/TypedData/TypedData.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB TypedData.aspx"
  runat="server" />
  </VbTemplate>
  <CpTemplate>
    <Acme:SourceRef
  RunSample="/quickstart/howto/samples/adoplus/TypedData/CP"
  ViewSource="/quickstart/howto/samples/adoplus/TypedData/TypedData.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C++ TypedData.exe"
  MapRunSampleData=true
  runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
<!-- #include virtual="/quickstart/include/footer.inc" -->

