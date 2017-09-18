//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

namespace HowTo.Samples.XML
{

using System;
using System.IO;
using System.Xml;
using System.Xml.Schema;

public class XmlSchemaObjectModelSample
{
    Random random = new Random();
    XmlSchema myXmlSchema;
    XmlTextWriter myXmlTextWriter;

    //Schemas to read
    private const String sampleSchema1 = "books.xsd";
    private const String sampleSchema2 = "poschema.xsd";

    public static void Main()
    {
        String[] args = {sampleSchema1, sampleSchema2};
        XmlSchemaObjectModelSample MyXmlSchemaObjectModelSample = new XmlSchemaObjectModelSample();
        MyXmlSchemaObjectModelSample.Run(args);
    }

    public void Run(String[] args)
    {
        try
        {
            Console.WriteLine ("Creating Schema in the Schema Object Model...");

            myXmlTextWriter = new XmlTextWriter(Console.Out);
            myXmlTextWriter.Formatting = Formatting.Indented;
            myXmlTextWriter.Indentation = 2;
            //Create an XmlNameTable
            XmlNameTable myXmlNameTable = new NameTable();
            //Add the nametable to the XmlSchemaCollection
            XmlSchemaCollection myXmlSchemaCollection = new XmlSchemaCollection(myXmlNameTable);
            //Add some schemas to the XmlSchemaCollection
            Console.WriteLine ("Reading and adding {0} schema.", args[0]);
            myXmlSchemaCollection.Add(null, args[0]);
            Console.WriteLine ("Reading and adding {0} schema.", args[1]);
            myXmlSchemaCollection.Add(null, args[1]);
            Console.WriteLine ("Added schemas successfully ...");

            Console.WriteLine ("Showing added schemas");

            foreach(XmlSchema myTempXmlSchema in myXmlSchemaCollection)
            {
                myXmlSchema = myTempXmlSchema;
                Console.WriteLine();
                Console.WriteLine("Schema from: {0}", myTempXmlSchema.SourceUri);
                Console.WriteLine();
                Console.WriteLine("=== Start of Schema ===");
                Console.WriteLine();

                // Write out the various schema parts
                WriteXSDSchema();

                Console.WriteLine();
                Console.WriteLine();
                Console.WriteLine("=== End of Schema ===");
                Console.WriteLine();
                Console.WriteLine("Example of possible XML contents for: {0}", myTempXmlSchema.SourceUri);
                Console.WriteLine();
                Console.WriteLine("=== Start of Example ===");

                // Write out an example of the XML for the schema
                WriteExample();

                Console.WriteLine();
                Console.WriteLine();
                Console.WriteLine("=== End of Example ===");
            }

        }
        catch (Exception e)
        {
            Console.WriteLine ("Exception: {0}", e.ToString());
        }
    }

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

    //XmlSchemaAttribute
    void WriteXmlSchemaAttribute(XmlSchemaAttribute attribute)
    {
        myXmlTextWriter.WriteStartElement("attribute", XmlSchema.Namespace);
        if (attribute.Name != null)
            myXmlTextWriter.WriteAttributeString("name", attribute.Name);

        if (!attribute.RefName.IsEmpty)
        {
            myXmlTextWriter.WriteStartAttribute("ref", null);
            myXmlTextWriter.WriteQualifiedName(attribute.RefName.Name, attribute.RefName.Namespace);
            myXmlTextWriter.WriteEndAttribute();
        }

        if (!attribute.SchemaTypeName.IsEmpty)
        {
            myXmlTextWriter.WriteStartAttribute("type", null);
            myXmlTextWriter.WriteQualifiedName(attribute.SchemaTypeName.Name, attribute.SchemaTypeName.Namespace);
            myXmlTextWriter.WriteEndAttribute();
        }

        if (attribute.SchemaType != null)
            WriteXmlSchemaSimpleType(attribute.SchemaType);

        myXmlTextWriter.WriteEndElement();
    }

    //XmlSchemaComplexType
    void WriteXmlSchemaComplexType(XmlSchemaComplexType complexType)
    {
        myXmlTextWriter.WriteStartElement("complexType", XmlSchema.Namespace);
        if (complexType.Name != null)
            myXmlTextWriter.WriteAttributeString("name", complexType.Name);

        if (complexType.ContentModel != null)
            Console.WriteLine("Not Implemented for this ContentModel.");
        else
        {
            if (complexType.Particle != null)
                WriteXmlSchemaParticle(complexType.Particle);
            foreach(object o in complexType.Attributes)
            {
                if (o is XmlSchemaAttribute)
                    WriteXmlSchemaAttribute((XmlSchemaAttribute)o);
            }
        }
        myXmlTextWriter.WriteEndElement();
    }

    //XmlSchemaSimpleType
    void WriteXmlSchemaSimpleType(XmlSchemaSimpleType simpleType)
    {
        myXmlTextWriter.WriteStartElement("simpleType", XmlSchema.Namespace);
        if (simpleType.Name != null)
            myXmlTextWriter.WriteAttributeString("name", simpleType.Name);

        if (simpleType.Content is XmlSchemaSimpleTypeRestriction)
            myXmlTextWriter.WriteStartElement("restriction", XmlSchema.Namespace);
        else if (simpleType.Content is XmlSchemaSimpleTypeList)
            myXmlTextWriter.WriteStartElement("list", XmlSchema.Namespace);
        else
            myXmlTextWriter.WriteStartElement("union", XmlSchema.Namespace);

        myXmlTextWriter.WriteEndElement();
        myXmlTextWriter.WriteEndElement();
    }

    //XmlSchemaParticle
    void WriteXmlSchemaParticle(XmlSchemaParticle particle)
    {
        if (particle is XmlSchemaElement)
            WriteXmlSchemaElement((XmlSchemaElement)particle);
        else if (particle is XmlSchemaSequence)
        {
            myXmlTextWriter.WriteStartElement("sequence", XmlSchema.Namespace);
            foreach(XmlSchemaParticle particle1 in ((XmlSchemaSequence)particle).Items)
                WriteXmlSchemaParticle(particle1);

            myXmlTextWriter.WriteEndElement();
        }
        else
            Console.WriteLine("Not Implemented for this type: {0}", particle.ToString());
    }

    // XmlSchemaElement
    void WriteXmlSchemaElement(XmlSchemaElement element)
    {
        myXmlTextWriter.WriteStartElement("element", XmlSchema.Namespace);
        if (element.Name != null)
            myXmlTextWriter.WriteAttributeString("name", element.Name);

        if (!element.RefName.IsEmpty)
        {
            myXmlTextWriter.WriteStartAttribute("ref", null);
            myXmlTextWriter.WriteQualifiedName(element.RefName.Name, element.RefName.Namespace);
            myXmlTextWriter.WriteEndAttribute();
        }

        if (!element.SchemaTypeName.IsEmpty)
        {
            myXmlTextWriter.WriteStartAttribute("type", null);
            myXmlTextWriter.WriteQualifiedName(element.SchemaTypeName.Name, element.SchemaTypeName.Namespace);
            myXmlTextWriter.WriteEndAttribute();
        }

        if (element.SchemaType != null)
        {
            if (element.SchemaType is XmlSchemaComplexType)
                WriteXmlSchemaComplexType((XmlSchemaComplexType)element.SchemaType);
            else
                WriteXmlSchemaSimpleType((XmlSchemaSimpleType)element.SchemaType);
        }
        myXmlTextWriter.WriteEndElement();
    }

    //XmlSchemaAnnotation
    void WriteXmlSchemaAnnotation(XmlSchemaAnnotation annotation)
    {
        // Not a complete implementation
        myXmlTextWriter.WriteStartElement("annotation", XmlSchema.Namespace);
        myXmlTextWriter.WriteEndElement();
    }

    //XmlSchemaAttributeGroup
    void WriteXmlSchemaAttributeGroup(XmlSchemaAttributeGroup attributeGroup)
    {
        // Not a complete implementation
        myXmlTextWriter.WriteStartElement("attributeGroup", XmlSchema.Namespace);
        myXmlTextWriter.WriteEndElement();
    }

    //XmlSchemaGroup
    void WriteXmlSchemaGroup(XmlSchemaGroup group)
    {
        // Not a complete implementation
        myXmlTextWriter.WriteStartElement("group", XmlSchema.Namespace);
        myXmlTextWriter.WriteEndElement();
    }

    //XmlSchemaNotation
    void WriteXmlSchemaNotation(XmlSchemaNotation notation)
    {
        // Not a complete implementation
        myXmlTextWriter.WriteStartElement("notation", XmlSchema.Namespace);
        myXmlTextWriter.WriteEndElement();
    }

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

    // Write some example attributes
    void WriteExampleAttributes(XmlSchemaObjectCollection attributes)
    {
        foreach(object o in attributes)
        {
            if (o is XmlSchemaAttribute)
                 WriteExampleAttribute((XmlSchemaAttribute)o);
            else
            {
                XmlSchemaAttributeGroup group = (XmlSchemaAttributeGroup)myXmlSchema.Groups[((XmlSchemaAttributeGroupRef)o).RefName];
                WriteExampleAttributes(group.Attributes);
            }
        }
    }

    // Write a single example attribute
    void WriteExampleAttribute(XmlSchemaAttribute attribute)
    {
        myXmlTextWriter.WriteStartAttribute(attribute.QualifiedName.Name, attribute.QualifiedName.Namespace);
        // The examples value
        WriteExampleValue(attribute.AttributeType);
        myXmlTextWriter.WriteEndAttribute();
    }

    // Write example particles
    void WriteExampleParticle(XmlSchemaParticle particle)
    {
        Decimal max;

        if (particle.MaxOccurs == -1 || particle.MaxOccurs > 10000)
            max = 5;
        else
            max = particle.MaxOccurs;

        for (int i = 0; i < max; i ++)
        {
            if (particle is XmlSchemaElement)
                WriteExampleElement((XmlSchemaElement)particle);
            else if (particle is XmlSchemaSequence)
            {
                foreach(XmlSchemaParticle particle1 in ((XmlSchemaSequence)particle).Items)
                    WriteExampleParticle(particle1);
            }
            else
                Console.WriteLine("Not Implemented for this type: {0}", particle.ToString());
        }
    }

    // Write the examples text values
    void WriteExampleValue(object schemaType)
    {
        XmlSchemaDatatype datatype = (schemaType is XmlSchemaSimpleType) ? ((XmlSchemaSimpleType)schemaType).Datatype : (XmlSchemaDatatype)schemaType;

        // Consult the XSD to CLR conversion table for the correct type mappings
        Type type = datatype.ValueType;
        if (type == typeof(bool))
            myXmlTextWriter.WriteString("true");
        else if (type == typeof(int) || type == typeof(long))
            myXmlTextWriter.WriteString(random.Next(100).ToString());
        else if (type == typeof(float) || type == typeof(decimal))
            myXmlTextWriter.WriteString(((float)random.Next(100)/(float)random.Next(10, 20)).ToString("#.00"));
        else if (type == typeof(System.Xml.XmlQualifiedName))
            myXmlTextWriter.WriteString("qualified_name" + random.Next(100).ToString());
        else if (type == typeof(DateTime))
            myXmlTextWriter.WriteString("12-12-2001");
        else if (type == typeof(string))
            myXmlTextWriter.WriteString("ExampleString" + random.Next(100).ToString());
        // Handle the 'xsd:positiveInteger' XSD type in the SOMsample.xsd
        else if (type == typeof(System.UInt64))
            //positiveInteger
            myXmlTextWriter.WriteString(random.Next(100).ToString());
        else
            myXmlTextWriter.WriteString("Not Implemented for this datatype: " + datatype.ToString());
    }

} // End class XmlSchemaObjectModel
} // End namespace HowTo.Samples.XML