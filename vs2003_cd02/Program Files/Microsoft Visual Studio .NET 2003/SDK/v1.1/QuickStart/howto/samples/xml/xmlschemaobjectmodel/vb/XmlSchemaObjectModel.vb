'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports Microsoft.VisualBasic
Imports System
Imports System.IO
Imports System.Xml
Imports System.Xml.Schema

namespace HowTo.Samples.XML

public class XmlSchemaObjectModelSample

    Dim myXmlSchema as XmlSchema 
    Dim myXmlTextWriter as XmlTextWriter 

    'Schemas to read
    private const sampleSchema1 as String = "books.xsd"
    private const sampleSchema2 as String = "poschema.xsd"

    public shared sub Main()
        Dim args As String() = {sampleSchema1, sampleSchema2}
        Dim MyXmlSchemaObjectModelSample as XmlSchemaObjectModelSample
        MyXmlSchemaObjectModelSample = new XmlSchemaObjectModelSample ()
        MyXmlSchemaObjectModelSample.Run(args)
    end sub

    public sub Run(args As String())
        try
            Console.WriteLine ("Creating Schema in the Schema Object Model...")
 
            myXmlTextWriter = new XmlTextWriter(Console.Out)
            myXmlTextWriter.Formatting = Formatting.Indented
            myXmlTextWriter.Indentation = 2
            'Create an XmlNameTable
            Dim myXmlNameTable as XmlNameTable  = new NameTable()
            'Add the nametable to the XmlSchemaCollection
            Dim myXmlSchemaCollection as XmlSchemaCollection  = new XmlSchemaCollection(myXmlNameTable)
            'Add some schemas to the XmlSchemaCollection
            Console.WriteLine ("Reading and adding {0} schema.", args(0))
            myXmlSchemaCollection.Add(nothing, args(0))
            Console.WriteLine ("Reading and adding {0} schema.", args(1))
            myXmlSchemaCollection.Add(nothing, args(1))
            Console.WriteLine ("Added schemas successfully ...")

            Console.WriteLine ("Showing added schemas")
            
            Dim myTempXmlSchema as XmlSchema
            for each myTempXmlSchema in myXmlSchemaCollection 
                myXmlSchema = myTempXmlSchema
                Console.WriteLine()
                Console.WriteLine("Schema from: {0}", myTempXmlSchema.SourceUri)
                Console.WriteLine()
                Console.WriteLine("=== Start of Schema ===")
                Console.WriteLine()

                ' Write out the various schema parts
                WriteXSDSchema()

                Console.WriteLine()
                Console.WriteLine()
                Console.WriteLine("=== End of Schema ===")
                Console.WriteLine()
                Console.WriteLine("Example of possible XML contents for: {0}", myTempXmlSchema.SourceUri)
                Console.WriteLine()
                Console.WriteLine("=== Start of Example ===")

                ' Write out an example of the XML for the schema
                WriteExample()

                Console.WriteLine()
                Console.WriteLine()
                Console.WriteLine("=== End of Example ===")
            next

        catch e as Exception
            Console.WriteLine ("Exception: {0}", e.ToString())
        end try
    end sub

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

    'XmlSchemaAttribute
    private sub WriteXmlSchemaAttribute(attribute as XmlSchemaAttribute ) 

        myXmlTextWriter.WriteStartElement("attribute", XmlSchema.Namespace)
        if not attribute.Name is nothing 
            myXmlTextWriter.WriteAttributeString("name", attribute.Name)
        end if
        if (not attribute.RefName.IsEmpty) 
            myXmlTextWriter.WriteStartAttribute("ref", nothing)
            myXmlTextWriter.WriteQualifiedName(attribute.RefName.Name, attribute.RefName.Namespace)
            myXmlTextWriter.WriteEndAttribute()
        end if
        if (not attribute.SchemaTypeName.IsEmpty) 
            myXmlTextWriter.WriteStartAttribute("type", nothing)
            myXmlTextWriter.WriteQualifiedName(attribute.SchemaTypeName.Name, attribute.SchemaTypeName.Namespace)
            myXmlTextWriter.WriteEndAttribute()
        end if
        if not attribute.SchemaType is nothing 
            WriteXmlSchemaSimpleType(attribute.SchemaType)
        end if
        myXmlTextWriter.WriteEndElement()
    end sub

    'XmlSchemaComplexType
    private sub WriteXmlSchemaComplexType(complexType as XmlSchemaComplexType ) 

        myXmlTextWriter.WriteStartElement("complexType", XmlSchema.Namespace)
        if not complexType.Name is nothing 
            myXmlTextWriter.WriteAttributeString("name", complexType.Name)
        end if
        if not complexType.ContentModel is nothing 
            Console.WriteLine("Not Implemented for this ContentModel.")
        else 
            if not complexType.Particle is nothing 
                WriteXmlSchemaParticle(complexType.Particle)
            end if
            Dim o as object
            for each o in complexType.Attributes
                if (TypeOf o is XmlSchemaAttribute) 
                    WriteXmlSchemaAttribute(CType(o, XmlSchemaAttribute))
                end if
            next
        end if
        myXmlTextWriter.WriteEndElement()
    end sub

    'XmlSchemaSimpleType
    private sub WriteXmlSchemaSimpleType(simpleType as XmlSchemaSimpleType ) 

        myXmlTextWriter.WriteStartElement("simpleType", XmlSchema.Namespace)
        if not simpleType.Name is nothing
            myXmlTextWriter.WriteAttributeString("name", simpleType.Name)
        end if
        if (TypeOf simpleType.Content is XmlSchemaSimpleTypeRestriction) 
            myXmlTextWriter.WriteStartElement("restriction", XmlSchema.Namespace)
        else if (TypeOf simpleType.Content is XmlSchemaSimpleTypeList) 
            myXmlTextWriter.WriteStartElement("list", XmlSchema.Namespace)
        else 
            myXmlTextWriter.WriteStartElement("union", XmlSchema.Namespace)
        end if
        myXmlTextWriter.WriteEndElement()
        myXmlTextWriter.WriteEndElement()
    end sub

    'XmlSchemaParticle
    private sub WriteXmlSchemaParticle(particle as XmlSchemaParticle ) 
        if (TypeOf particle is XmlSchemaElement) 
            WriteXmlSchemaElement(CType(particle, XmlSchemaElement))
        else if (TypeOf particle is XmlSchemaSequence) 
            myXmlTextWriter.WriteStartElement("sequence", XmlSchema.Namespace)
            Dim particle1 as XmlSchemaParticle
            for each particle1 in CType(particle, XmlSchemaSequence).Items
                WriteXmlSchemaParticle(particle1)
            next
            myXmlTextWriter.WriteEndElement()
        else 
            Console.WriteLine("Not Implemented for this type: {0}", particle.ToString())
        end if
    end sub

    ' XmlSchemaElement
    private sub WriteXmlSchemaElement(element as XmlSchemaElement ) 
        myXmlTextWriter.WriteStartElement("element", XmlSchema.Namespace)
        if not element.Name is nothing 
            myXmlTextWriter.WriteAttributeString("name", element.Name)
        end if
        if (not element.RefName.IsEmpty) 
            myXmlTextWriter.WriteStartAttribute("ref", nothing)
            myXmlTextWriter.WriteQualifiedName(element.RefName.Name, element.RefName.Namespace)
            myXmlTextWriter.WriteEndAttribute()
        end if
        if (not element.SchemaTypeName.IsEmpty) 
            myXmlTextWriter.WriteStartAttribute("type", nothing)
            myXmlTextWriter.WriteQualifiedName(element.SchemaTypeName.Name, element.SchemaTypeName.Namespace)
            myXmlTextWriter.WriteEndAttribute()
        end if
        if not element.SchemaType is nothing
            if (TypeOf element.SchemaType is XmlSchemaComplexType) 
                WriteXmlSchemaComplexType(CType(element.SchemaType, XmlSchemaComplexType))
            else 
                WriteXmlSchemaSimpleType(CType(element.SchemaType, XmlSchemaSimpleType))
            end if
        end if
        myXmlTextWriter.WriteEndElement()
    end sub

    'XmlSchemaAnnotation 
    private sub WriteXmlSchemaAnnotation(annotation as XmlSchemaAnnotation ) 
        ' Not a complete implementation
        myXmlTextWriter.WriteStartElement("annotation", XmlSchema.Namespace)
        myXmlTextWriter.WriteEndElement()
    end sub

    'XmlSchemaAttributeGroup
    private sub WriteXmlSchemaAttributeGroup(attributeGroup as XmlSchemaAttributeGroup ) 
        ' Not a complete implementation
        myXmlTextWriter.WriteStartElement("attributeGroup", XmlSchema.Namespace)
        myXmlTextWriter.WriteEndElement()
    end sub

    'XmlSchemaGroup
    private sub WriteXmlSchemaGroup(group as XmlSchemaGroup ) 
        ' Not a complete implementation
        myXmlTextWriter.WriteStartElement("group", XmlSchema.Namespace)
        myXmlTextWriter.WriteEndElement()
    end sub

    'XmlSchemaNotation
    private sub WriteXmlSchemaNotation(notation as XmlSchemaNotation ) 
        ' Not a complete implementation
        myXmlTextWriter.WriteStartElement("notation", XmlSchema.Namespace)
        myXmlTextWriter.WriteEndElement()
    end sub

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

    ' Write some example attributes
    private sub WriteExampleAttributes(attributes as XmlSchemaObjectCollection )
        Dim o as object 
        for each o in attributes
            if (TypeOf o is XmlSchemaAttribute) 
                 WriteExampleAttribute(CType(o, XmlSchemaAttribute))
            else 
                Dim group as XmlSchemaAttributeGroup
                Dim oTemp as XmlSchemaAttributeGroupRef 
                oTemp = CType(o, XmlSchemaAttributeGroupRef)
                group = CType(myXmlSchema.Groups(oTemp.RefName), XmlSchemaAttributeGroup)
                WriteExampleAttributes(group.Attributes)
            end if
        next
    end sub

    ' Write a single example attribute
    private sub WriteExampleAttribute(attribute as XmlSchemaAttribute ) 
        myXmlTextWriter.WriteStartAttribute(attribute.QualifiedName.Name, attribute.QualifiedName.Namespace)
        ' The examples value
        WriteExampleValue(attribute.AttributeType)
        myXmlTextWriter.WriteEndAttribute()
    end sub

    ' Write example particles
    private sub WriteExampleParticle(particle as XmlSchemaParticle ) 

        Dim max as long  
        if (particle.MaxOccurs = -1 OR particle.MaxOccurs > 10000)
            max = 5
        else
            max = particle.MaxOccurs
        end if

        Dim i as integer
        for i = 0 to CInt(max) - 1 
            if (TypeOf particle is XmlSchemaElement) 
                WriteExampleElement(CType(particle, XmlSchemaElement))
            else if (TypeOf particle is XmlSchemaSequence) 
                Dim particle1 as XmlSchemaParticle
                for each particle1 in CType(particle, XmlSchemaSequence).Items
                    WriteExampleParticle(particle1)
                next
            else 
                Console.WriteLine("Not Implemented for this type: {0}", particle.ToString())
            end if
        next i
    end sub

    ' Write the examples text values
    private sub WriteExampleValue(schemaType as object ) 
        Dim datatype as XmlSchemaDatatype 
        if (TypeOf schemaType is XmlSchemaSimpleType)
            datatype = (CType(schemaType, XmlSchemaSimpleType)).Datatype 
        else
            datatype = CType(schemaType, XmlSchemaDatatype)
        end if

        ' Consult the XSD to CLR conversion table for the correct type mappings
        Dim type as Type  = datatype.ValueType

        if (type is GetType(Boolean)) 
            myXmlTextWriter.WriteString("true")
        else if ((type is GetType(integer)) or (type is GetType(long))) 
            myXmlTextWriter.WriteString("12345")
        else if ((type is GetType(single)) or (type is GetType(decimal))) 
            myXmlTextWriter.WriteString("10.99")
        else if (type is GetType(System.Xml.XmlQualifiedName)) 
            myXmlTextWriter.WriteString("qualified_name")
        else if (type is GetType(System.DateTime)) 
            myXmlTextWriter.WriteString("12-12-2001")
        else if (type is GetType(string)) 
            myXmlTextWriter.WriteString("ExampleString")
        ' Handle the 'xsd:positiveInteger' XSD type in the SOMsample.xsd
        else if (type is GetType(System.UInt64)) 
            'positiveInteger
            myXmlTextWriter.WriteString("10")
        else 
            myXmlTextWriter.WriteString("Not Implemented for this datatype: " + datatype.ToString())
            myXmlTextWriter.WriteString(type.FullName)

        end if
    end sub

end Class 'End class XmlSchemaObjectModel
end Namespace 'End namespace HowTo.Samples.XML
