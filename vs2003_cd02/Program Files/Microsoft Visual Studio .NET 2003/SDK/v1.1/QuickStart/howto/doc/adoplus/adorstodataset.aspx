<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->

<h4>ADO.NET: Loading a native ADO recordset into a DataSet</h4>

This sample illustrates using ADO recordsets with managed Datasets.

To provide access to ADO Recordset and Record objects from ADO.NET, the OLE DB .NET 
Data Provider overloads the Fill method of the OleDbDataAdapter to accept an ADO 
Recordset object or an ADO Record object. Filling a DataSet with the contents of an 
ADO object is a one-way operation. That is, data can be imported from the ADO Recordset 
or Record into the DataSet, but any updates to the data must be handled explicitly by 
either ADO.NET or ADO.

<p>The Fill operation will append rows to the existing DataTables in the DataSet if no 
primary key information is available. If primary key information is available for the 
DataTable, then the Fill operation will update rows with matching primary keys. 

<p>In this sample the same basic procedures that were used with old ADO Recordset method 
of getting data are followed. First a connection to the database is created and then 
a SQL command is executed on the connection or the Recordset.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/adoplus/adorstodataset/CS/adorstodataset.aspx"
ViewSource="/quickstart/howto/samples/adoplus/adorstodataset/adorstodataset.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# adorstodataset.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/adoplus/adorstodataset/adorstodataset.src"
RunSample="/quickstart/howto/samples/adoplus/adorstodataset/VB/adorstodataset.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB adorstodataset.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>
<p>

<p>To consume a COM component that returns an ADO Recordset or Record object using .NET 
COM Interop services and ADO.NET, it is required to first import the type library 
information for the COM component and ADO using TlbImp.exe.

For example, an existing COM component with a ProgId of ADOComponent.DataClass is compiled 
into ADOComponent.dll. It has methods that return objects of type ADODB.Recordset. To 
consume this object from .NET, both ADOComponent.dll, and msado15.dll would have to be imported, 
which contain the ADODB.Recordset and ADODB.Record objects. The following commands would need to 
be issued to import the COM type libraries to .NET:

<p>TlbImp "C:\Program Files\Common Files\System\Ado\msado15.dll" /out:ADODB.dll
TlbImp ADOComponent.dll /out:ADOCOM.dll

<p>The resulting .NET libraries, ADODB.dll and ADOCOM.dll, would then be passed as library 
references when compiling a .NET program as shown below. 
<p>
<Acme:TabControl runat="server" >
<Tab Name="C#">
csc MyCS.cs /r:system.dll /r:system.data.dll /r:system.xml.dll /r:ADODB.dll /r:ADOCOM.dll
</Tab>
<Tab Name="VB">
vbc MyVB.vb /r:system.dll /r:system.data.dll /r:system.xml.dll /r:ADODB.dll /r:ADOCOM.dll
</Tab>
</Acme:TabControl>

<p>

<H4>Summary</H4>
<OL>
<LI>The Fill method on the OleDbDataAdapter provides access to ADO Recordset and Record objects.</LI>
<LI>Filling a DataSet with the contents of an ADO object is a one-way operation.</LI>
<LI>ADO.NET provides access to ADO via the .NET COM Interop services.</LI>
</OL>
<p>
<!-- #include virtual="/quickstart/include/footer.inc" -->


































































































