<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/doc/xml/header.inc" -->

<h4>How Do I...use the Xml Schema Object Model?</h4>

<p>
This sample illustrates how to read two XML Schema Definition language (XSD) schemas into a SchemaCollection, navigate through the schemas that they represent, and create a fictious XML output that is representative of the schema's.
<p>
This sample shows how to use the XmlSchemaCollection to cache and retrieve multiple schemas, as well as demonstrates that the Schema Object Model (SOM) loads and saves valid XSD schemas. You can also use the SOM to create in-memory schemas using strongly typed classes.
<p>
To demonstrate how to navigate the SOM, this sample outputs a formatted version of the two XSD schemas that were loaded into the SchemaCollection. Then, the sample creates an XML stream to give an example of what the given schema usage might look like.

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/Xml/XmlSchemaObjectModel/CS/XmlSchemaObjectModel.aspx"
ViewSource="/quickstart/howto/samples/Xml/XmlSchemaObjectModel/XmlSchemaObjectModel.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# XmlSchemaObjectModel.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/Xml/XmlSchemaObjectModel/XmlSchemaObjectModel.src"
RunSample="/quickstart/howto/samples/Xml/XmlSchemaObjectModel/VB/XmlSchemaObjectModel.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB XmlSchemaObjectModel.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<p>
This sample first creates an XmlTextWriter that eventually writes out to the screen. The sample does this to take advantage of the various methods of the XmlTextWriter that produce well-formed XML. Some examples of these methods are the WriteStartElement, WriteEndElement, and WriteAttributeString. Then, the sample creates an XmlNameTable and adds the name table to the XmlSchemaCollection. Into the XmlSchemaCollection, the sample read two unique XSD schemas. Finally, the sample writes each schema in the XmlSchemaCollection to the screen, followed by an example of that schema would be used against some example XML.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
...
myXmlTextWriter = new XmlTextWriter(Console.Out);
myXmlTextWriter.Formatting = Formatting.Indented;
myXmlTextWriter.Indentation = 2;
...
XmlNameTable myXmlNameTable = new NameTable();
...
XmlSchemaCollection myXmlSchemaCollection = new XmlSchemaCollection(myXmlNameTable);
...
myXmlSchemaCollection.Add(null, args[0]);
...
myXmlSchemaCollection.Add(null, args[1]);
...
foreach(XmlSchema myTempXmlSchema in myXmlSchemaCollection)
{
    myXmlSchema = myTempXmlSchema;
...
    // Write out the various schema parts
    WriteXSDSchema();
...
    // Write out an example of the XML for the schema
    WriteExample();
...
}
</Tab>
<Tab Name="VB">
...
myXmlTextWriter = new XmlTextWriter(Console.Out)
myXmlTextWriter.Formatting = Formatting.Indented
myXmlTextWriter.Indentation = 2
...
Dim myXmlNameTable as XmlNameTable  = new NameTable()
...
Dim myXmlSchemaCollection as XmlSchemaCollection  = new XmlSchemaCollection(myXmlNameTable)
...
myXmlSchemaCollection.Add(nothing, args(0))
...
myXmlSchemaCollection.Add(nothing, args(1))
...

Dim myTempXmlSchema as XmlSchema
for each myTempXmlSchema in myXmlSchemaCollection
    myXmlSchema = myTempXmlSchema
...
    ' Write out the various schema parts
    WriteXSDSchema()
...
    ' Write out an example of the XML for the schema
    WriteExample()
...
next
</Tab>
</Acme:TabControl>
<p>
The functions in the following code write the XSD schema to the screen. Essentially, these functions loop through each item in the XmlSchema and, after determining its type, format the item for output to the screen.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
    // Write out the XSD
    void WriteXSDSchema()
    {
        myXmlTextWriter.WriteStartElement("schema", XmlSchema.Namespace);
        myXmlTextWriter.WriteAttributeString("targetNamespace", myXmlSchema.TargetNamespace);
        foreach(XmlSchemaInclude include in myXmlSchema.Includes)
        {
            myXmlTextWriter.WriteStartElement("include", XmlSchema.Namespace);
            myXmlTextWriter.WriteAttributeString("schemaLocation", include.SchemaLocation);
            myXmlTextWriter.WriteEndElement();
        }

        foreach(object item in myXmlSchema.Items)
        {
            if (item is XmlSchemaAttribute)
                WriteXmlSchemaAttribute((XmlSchemaAttribute)item);      //attribute
            else if (item is XmlSchemaComplexType)
                WriteXmlSchemaComplexType((XmlSchemaComplexType)item);  //complexType
            else if (item is XmlSchemaSimpleType)
                WriteXmlSchemaSimpleType((XmlSchemaSimpleType)item);    //simpleType
            else if (item is XmlSchemaElement)
                WriteXmlSchemaElement((XmlSchemaElement)item);          //element
            else if (item is XmlSchemaAnnotation)
                WriteXmlSchemaAnnotation((XmlSchemaAnnotation)item);    //annotation
            else if (item is XmlSchemaAttributeGroup)
                WriteXmlSchemaAttributeGroup((XmlSchemaAttributeGroup)item); //attributeGroup
            else if (item is XmlSchemaNotation)
                WriteXmlSchemaNotation((XmlSchemaNotation)item);        //notation
            else if (item is XmlSchemaGroup)
                WriteXmlSchemaGroup((XmlSchemaGroup)item);              //group
            else
                Console.WriteLine("Not Implemented.");
        }
        myXmlTextWriter.WriteEndElement();
    }
</Tab>
<Tab Name="VB">
    ' Write out the XSD
    private sub WriteXSDSchema()
        myXmlTextWriter.WriteStartElement("schema", XmlSchema.Namespace)
        myXmlTextWriter.WriteAttributeString("targetNamespace", myXmlSchema.TargetNamespace)
        Dim include as XmlSchemaInclude
        for each include in myXmlSchema.Includes
            myXmlTextWriter.WriteStartElement("include", XmlSchema.Namespace)
            myXmlTextWriter.WriteAttributeString("schemaLocation", include.SchemaLocation)
            myXmlTextWriter.WriteEndElement()
        next

        Dim item as object
        for each item in myXmlSchema.Items

            if (TypeOf item is XmlSchemaAttribute)
                WriteXmlSchemaAttribute(CType(item, XmlSchemaAttribute)) 'attribute
            else if (TypeOf item is XmlSchemaComplexType)
                WriteXmlSchemaComplexType(CType(item, XmlSchemaComplexType)) 'complexType
            else if (TypeOf item is XmlSchemaSimpleType)
                WriteXmlSchemaSimpleType(CType(item, XmlSchemaSimpleType)) 'simpleType
            else if (TypeOf item is XmlSchemaElement)
                WriteXmlSchemaElement(CType(item, XmlSchemaElement)) 'element
            else if (TypeOf item is XmlSchemaAnnotation)
                WriteXmlSchemaAnnotation(CType(item, XmlSchemaAnnotation)) 'annotation
            else if (TypeOf item is XmlSchemaAttributeGroup)
                WriteXmlSchemaAttributeGroup(CType(item, XmlSchemaAttributeGroup)) 'attributeGroup
            else if (TypeOf item is XmlSchemaNotation)
                WriteXmlSchemaNotation(CType(item, XmlSchemaNotation)) 'notation
            else if (TypeOf item is XmlSchemaGroup)
                WriteXmlSchemaGroup(CType(item, XmlSchemaGroup)) 'group
            else
                Console.WriteLine("Not Implemented.")
            end if
        next
        myXmlTextWriter.WriteEndElement()
    end sub
</Tab>
</Acme:TabControl>
<p>
The functions in the following code write out what the XML that is validated to the schema might look like. Essentially, these functions loop through each item in the XmlSchema and, after determining its type, format the item with some sample data for output to the screen.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
    // Write out the example of the XSD usage
    void WriteExample()
    {
        foreach(XmlSchemaElement element in myXmlSchema.Elements.Values)
            WriteExampleElement(element);
    }

    // Write some example elements
    void WriteExampleElement(XmlSchemaElement element)
    {
        myXmlTextWriter.WriteStartElement(element.QualifiedName.Name, element.QualifiedName.Namespace);
        if (element.ElementType is XmlSchemaComplexType)
        {
            XmlSchemaComplexType type = (XmlSchemaComplexType)element.ElementType;
            if (type.ContentModel != null)
                Console.WriteLine("Not Implemented for this ContentModel");
            WriteExampleAttributes(type.Attributes);
            WriteExampleParticle(type.Particle);
        }
        else
            WriteExampleValue(element.ElementType);

        myXmlTextWriter.WriteEndElement();
    }
</Tab>
<Tab Name="VB">
    ' Write out the example of the XSD usage
    private sub WriteExample()
        Dim element as XmlSchemaElement
        for each element in myXmlSchema.Elements.Values
            WriteExampleElement(element)
        next
    end sub

    ' Write some example elements
    private sub WriteExampleElement(element as XmlSchemaElement )
        myXmlTextWriter.WriteStartElement(element.QualifiedName.Name, element.QualifiedName.Namespace)
        if (TypeOf element.ElementType is XmlSchemaComplexType)
            Dim type as XmlSchemaComplexType  = CType(element.ElementType, XmlSchemaComplexType)
            if not type.ContentModel is nothing
                Console.WriteLine("Not Implemented for this ContentModel")
            end if
            WriteExampleAttributes(type.Attributes)
            WriteExampleParticle(type.Particle)
        else
            WriteExampleValue(element.ElementType)
        end if
        myXmlTextWriter.WriteEndElement()
    end sub
</Tab>
</Acme:TabControl>
<p>

<H4>Summary</H4>
<OL>
<LI>The Schema Object Model (SOM) loads and saves valid XSD schemas.
<LI>The SOM provides an easy way to create in-memory schemas using strongly typed classes.
<LI>You can use the XmlSchemaCollection object to cache and retrieve multiple schemas.
<LI>The SOM works with the XmlValidatingReader through the XmlSchemaCollection.
</OL>

<p>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->










































































































