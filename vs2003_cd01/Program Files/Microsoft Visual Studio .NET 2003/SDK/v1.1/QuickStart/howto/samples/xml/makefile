!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

#------------------------------------------------------------------
#The master rules for building .NET QuickStart Sample applications
# NETSAMPLEPATH Env Variable must be defined

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#------------------------------------------------------------------
SUB_DIRS = DataSetMapXMLData \
DataSetMapXSDSchema \
DOMInterfaceXmlDocument \
LoadDataSetXMLData \
LoadXmlDocument \
NavigateXmlDocument \
QueryXmlDocumentXPath \
ReadXmlFile \
ReadXmlStream \
SaveDataSetMapXSDSchema \
SaveDataSetXMLData \
SaveXmlDocument \
SchemaCollection \
StreamXmlDocument \
TransformXml \
ValidationReadingXML \
WriteXmlFile \
XmlDocumentEvent \
XmlNameSpace \
MultipleXmlReader \
XmlNodeReader \
XmlReadFromUrl \
XmlReadWriteSchema \
XPathExpression \
XmlSchemaObjectModel

all :
  rem Sample $(MAKEDIR)
  for %i in ( $(SUB_DIRS) ) do $(_MAKE_IN_DIR) %i all

clean :
  for %i in ( $(SUB_DIRS) ) do $(_MAKE_IN_DIR) %i clean
