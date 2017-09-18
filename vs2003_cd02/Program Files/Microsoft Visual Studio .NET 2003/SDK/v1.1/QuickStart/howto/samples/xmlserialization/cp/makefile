!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SOURCES = ReadWriteXML.cpp
TARGETS1 = PurchaseOrder.cs
TARGETS2 = PurchaseOrder.dll
TARGETS3 = ReadWriteXML.exe

CLEANUP = *.exe *.pdb *.dll *.xml
#--------------------------------------------------
_IMPORTS=$(_CS_XML_IMPORTS) /r:system.xml.dll

#--------------------------------------------------
all : $(TARGETS1) $(TARGETS2) $(TARGETS3)
  rem Sample $(MAKEDIR)

$(TARGETS1) :
  xsd /namespace:XmlSerializationHowTo /c /l:C# ..\purchaseorder.xsd

$(TARGETS3) : $(TARGETS2)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi $(SOURCES)


clean :
  for %i in ( $(CLEANUP) ) do del %i
  if exist purchaseorder.cpp del purchaseorder.cpp
#--------------------------------------------------
