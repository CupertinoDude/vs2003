!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
TARGETS = SaveXMLDocument.exe
CLEANUP = *.exe *.pdb UpdateBooks.xml
#--------------------------------------------------
_IMPORTS=$(_CS_XML_IMPORTS)

#--------------------------------------------------
all : $(TARGETS)
  rem Sample $(MAKEDIR)
  
clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
#--------------------------------------------------
