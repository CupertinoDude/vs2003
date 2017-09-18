<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...Apply validation when reading XML?</h4>

<p>
This sample illustrates how to apply validation when reading and parsing XML data using the XmlValidatingReader class. Validation is the process of enforcing rules on the XML content either via a Document Type Definition (DTD) or a schema. At it's simplest, a schema is an XML representation of a DTD, but it can also infer relationships within the XML data and type information. The XmlValidatingReader class layers validation support onto the XmlTextReader.
<p>
Note: This sample follows on from the <a href="/quickstart/howto/doc/Xml/ReadXmlFile.aspx">How do I...Read XML from a file?</a> topic.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/ValidationReadingXml/CS/ValidationReadingXML.aspx"
ViewSource="/quickstart/howto/samples/Xml/ValidationReadingXml/ValidationReadingXML.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# ValidationReadingXML.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/ValidationReadingXml/VB/ValidationReadingXML.aspx"
ViewSource="/quickstart/howto/samples/Xml/ValidationReadingXml/ValidationReadingXML.src"
Icon = "/quickstart/images/genicon.gif"
Caption="VB ValidationReadingXML.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/ValidationReadingXml/CP"
ViewSource="/quickstart/howto/samples/Xml/ValidationReadingXml/ValidationReadingXML.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ ValidationReadingXML.aspx"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>


<p>
An XmlValidatingReader can provide validation of a DTD, XML Schema Definition language (XSD) schema, or <A target=_top href="http://www.ltg.ed.ac.uk/~ht/XMLData-Reduced.htm">XML-Data Reduced</A> Language (XDR) schema when parsing the document. You can use the ValidationType property to request which of these validation options to use, as shown in the following table.
<p>

<DIV class=indent>
<TABLE class=table2
width="509">
<TBODY>
<TR>
  <TH width="179">Validation Type</TH>
  <TH width="308">Description</TH>
</TR>
  <tr>
    <td width="179" height="17"><font size="1">Auto</font></td>
    <td width="308" height="17"><font size="1">This is the default.</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">None</font></td>
    <td width="308" height="19"><font size="1">No parse time validation.</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">DTD</font></td>
    <td width="308" height="19"><font size="1">Validate according to DTD.</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">Schema</font></td>
    <td width="509" height="19"><font size="1">Validate according to XSD schemas.</font></td>
  </tr>
  <tr>
    <td width="179" height="19"><font size="1">XDR</font></td>
    <td width="509" height="19"><font size="1">Validate according to XDR schemas.</font></td>
  </tr>
  </TBODY></TABLE></DIV>

<p>


Setting the ValidationType to Auto does the following:
<UL>
<LI>If there is no DTD or schema, it will parse the XML without validation.
<LI>If there is a DTD defined in a &lt!DOCTYPE ...&gt declaration, it will load the DTD and process the DTD declarations such that default attributes and general entities will be made available. General entities are only loaded and parsed if they are used (expanded).
<LI>If there is no &lt!DOCTYPE ...&gt declaration but there is an XSD "schemaLocation" attribute, it will load and process those XSD schemas and it will return any default attributes defined in those schemas.
<LI>If there is no &lt!DOCTYPE ...&gt declaration and no XSD or XDR schema information then the parser is a non-validating parser (i.e. ValidationType=ValidationType.None)
<LI>If there is no &lt!DOCTYPE ...&gt declaration and no XSD "schemaLocation" attribute but there are some namespaces using the MSXML "x-schema:" URN prefix, it will load and process those schemas and it will return any default attributes defined in those schemas.
<LI>If there is no &lt!DOCTYPE ...&gt declaration but there is a schema declaration &ltschema&gt, it will validate using the in-line schema.
</LI>

</UL>

<p>
The sample code (see <a href="/quickstart/util/srcview.aspx?path=/quickstart/howto/samples/Xml/ValidationReadingXml/ValidationReadingXML.src">View Source</a>) validates four files. The first file, BooksDTD.xml, validates against the books.dtd. The second file, BooksDTDFail.xml, fails validation against the books.dtd. The third file, BooksSchema.xml, validates against the schema.xml file. The fourth file, BooksFailSchema.xml, fails validation against the schema.xml. Schema.xml is an XSD schema. The sample code sets the required type of validation by setting the ValidationType property with either the value of DTD or Schema, as shown in the following code.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
XmlTextReader myXmlTextReader = new XmlTextReader(document1);
XmlValidatingReader myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader);
myXmlValidatingReader.ValidationType = ValidationType.DTD;
</Tab>
<Tab Name="VB">
Dim myXmlTextReader As XmlTextReader = New XmlTextReader(document1)
Dim myXmlValidatingReader As XmlValidatingReader = New XmlValidatingReader(myXmlTextReader)
myXmlValidatingReader.ValidationType = ValidationType.DTD
</Tab>
<Tab Name="C++">
static XmlValidatingReader* myXmlValidatingReader = 0;
static XmlTextReader* myXmlTextReader = 0;

myXmlTextReader = new XmlTextReader (document1);
myXmlValidatingReader = new XmlValidatingReader(myXmlTextReader);
myXmlValidatingReader->ValidationType = ValidationType::DTD;
</Tab>
</Acme:TabControl>

<p>
The parser does not stop for any kind of validation error and only stops if the parser finds data that is not well-formed. By not stopping for validation errors, you are able to find all the validation errors in one pass without having to repeatedly parse the XML document.
<p>
As shown in the following code, a validation error results in the sample calling the handler method that was set by a ValidationEventHandler class before reading the XML document. If this method is not provided, then the XmlValidatingReader throws an XmlSchemaException upon encountering the first validation error. In this code sample, the success variable indicates the validation state.
<p>
The parser does not stop for any kind of validation error and only stops if the parser finds data that is not well-formed. By not stopping for validation errors, you are able to find all the validation errors in one pass without having to repeatedly parse the XML document.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
private void Validate()
{
    try
    {
        // Set the validation event handler
        myXmlValidatingReader.ValidationEventHandler += new ValidationEventHandler (this.ValidationEventHandle);

        // Read XML data
        while (myXmlValidatingReader.Read()){}
        Console.WriteLine ("Validation finished. Validation {0}", (Success==true ? "successful" : "failed"));
    }
    catch (XmlException e)
    {
        Console.WriteLine ("XmlException: " + e.ToString());
    }

    catch (Exception e)
    {
        Console.WriteLine ("Exception: " + e.ToString());
    }
}

public void ValidationEventHandle (object sender, ValidationEventArgs args)
{
    Console.Write("\r\n\tValidation error: " + args.Message);
}
</Tab>
<Tab Name="VB">
private sub Validate()
    try
        ' Set the validation event handler
        Dim valdel as ValidationEventHandler = new ValidationEventHandler(addressof ValidationEvent)

        AddHandler myXmlValidatingReader.ValidationEventHandler, valdel

        ' Read XML data
        while myXmlValidatingReader.Read()
        end While

        Dim s as String
        if (success = true)
            s = "successful"
        else
            s = "failed"
        end if
        Console.WriteLine ("Validation finished. Validation {0}", s)

    catch e as XmlException
        Console.WriteLine ("XmlException: {0} ", e.ToString())

    catch e as Exception
        Console.WriteLine ("Exception: {0} ", e.ToString())
    end try
end sub

public sub ValidationEvent (errorid as object, args as ValidationEventArgs)
    Console.Write(Strings.chr(9) & "Validation error: " & args.Message)
end sub
</Tab>
<Tab Name="C++">
void Validate()
{
	try
	{
	    // Set the validation event handler
	    myXmlValidatingReader->ValidationEventHandler += new ValidationEventHandler (this, &ValidationReadingXMLSample::ValidationEventHandle);
	
	    // Read XML data
	    while (myXmlValidatingReader->Read()){}
	    String* validationSuccess = (Success==true ? S"successful" : S"failed");
	    Console::WriteLine (S"Validation finished. Validation {0}", validationSuccess);
	}
	catch (XmlException* e)
	{
	    Console::WriteLine (S"XmlException: {0}", e->ToString());
	}
	
	catch (Exception* e)
	{
	    Console::WriteLine (S"Exception: {0}", e->ToString());
	}
}

void ValidationEventHandle (Object* sender, ValidationEventArgs* args)
{
    Console::WriteLine(String::Concat(S"\tValidation error: ", args->Message));
}
</Tab>
</Acme:TabControl>
<p>

<p>
You can use the callback handler to guarantee that the XmlSeverityType enumeration validates an XML instance document against a schema. For all validation errors, this has the value of XmlSeverityType.Error, which indicates a fatal error. However, it is possible that there is simply no schema information available with which to validate the elements and attibutes. In these cases (usually with ErrorCodes, NoElementSchemaFound and NoAttributeSchemaFound) the XmlSeverityType has the value XmlSeverityType.Warning.
<p>
<H4>Summary</H4>
<OL>
<LI>Validation can either be against a DTD, an XSD or XDR schema, the type required being set by the Validation property.
<LI>Validation is performed during the read and parsing operations.
<LI>The ValidationEventHandler property must be set to receive notification of validation errors.
<LI>Validation errors do not stop parsing. Parsing only stops if there is a well-formedness error. This enables all errors to be discovered in a single pass.
</LI></OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->









































