!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS1 = PurchaseOrder.vb
TARGETS2 = PurchaseOrder.dll
TARGETS3 = ReadWriteXML.exe

CLEANUP = *.exe *.pdb *.dll *.xml
#--------------------------------------------------
_IMPORTS=$(_VB_XML_IMPORTS) /r:system.xml.dll
_RIMPORTS=$(_VB_XML_IMPORTS) /r:system.xml.dll /r:PurchaseOrder.dll

#--------------------------------------------------
all : $(TARGETS1) $(TARGETS2) $(TARGETS3) 
  rem Sample $(MAKEDIR)

$(TARGETS1) :
  xsd -c -l:VB -n:XmlSerializationHowTo ..\purchaseorder.xsd

$(TARGETS3) : $(TARGETS2)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_EXE_FLAGS) $(_RIMPORTS) /out:$(_OUTDIR)\$@ $*.vb $(NETSAMPLEPATH)\QuickStart\QSVersion.vb $(_WIN32RES) $(_KEYFILE)
  
clean :
  for %i in ( $(CLEANUP) ) do del %i
  if exist purchaseorder.vb del purchaseorder.vb
#--------------------------------------------------
