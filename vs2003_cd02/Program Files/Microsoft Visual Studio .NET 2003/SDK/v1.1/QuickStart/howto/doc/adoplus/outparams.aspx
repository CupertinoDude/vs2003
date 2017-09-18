    <%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
    <%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
    
    <!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->
    
    <h4>ADO.NET: Get Out Parameters from a Stored Procedure</h4>
    
    Some stored procedures return values through parameters. When a parameter in a SQL statement or stored procedure is declared as "out", the value of the parameter is returned back to the caller; the value is stored in a parameter in the Parameters collection on the <b>OleDbCommand</b> or <b>SqlCommand</b> objects.
    <P>
    Unlike the sample below, if the connection and command name are not set, you can still establish the parameters, but you have to create the collection of parameters and expected types.
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    workParam = myCommand.Parameters.Add("@CustomerID", SQLDataType.NChar, 5);
    workParam.Value = "CUSTID";
    </Tab>
    <Tab Name="VB">
    workParam = myCommand.Parameters.Add("@CustomerID", SQLDataType.NChar, 5)
    workParam.Value = "CUSTID"
    </Tab>
    <Tab Name="C++">
    workParam = myCommand->Parameters->Add("@CustomerID", SQLDataType.NChar, 5);
    workParam->Value = "CUSTID";
    </Tab>
    </Acme:TabControl>
    <p>
    
    The following sample shows how to use a stored procedure that returns output parameters. The command is executed to create a stored procedure in the Northwind database.
    <p>
    
    <Acme:LangSwitch runat="server">
      <CsTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/outparamswithacommand/cs/outparamswithacommand.aspx"
      ViewSource="/quickstart/howto/samples/adoplus/outparamswithacommand/outparamswithacommand.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="C# OutParamsWithACommand.aspx"
      runat="server" />
      </CsTemplate>
      <VbTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/outparamswithacommand/vb/outparamswithacommand.aspx"
      ViewSource="/quickstart/howto/samples/adoplus/outparamswithacommand/outparamswithacommand.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="VB OutParamsWithACommand.aspx"
      runat="server" />
      </VbTemplate>
      <CpTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/outparamswithacommand/CP"
      ViewSource="/quickstart/howto/samples/adoplus/outparamswithacommand/outparamswithacommand.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="C++ OutParamsWithACommand.exe"
      MapRunSamplePath=true
      runat="server" />
      </CpTemplate>
    </Acme:LangSwitch>
    <p>
    <!-- #include virtual="/quickstart/include/footer.inc" -->
    
    
    

