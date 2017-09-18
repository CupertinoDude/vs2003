!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
#Define what we are building from what
TARGET = SimpleBinding.exe
SOURCE = SimpleBinding.VB Customer.VB

CLEANUP = *.exe *.dll *.pdb CustomersDataSet.vb
#--------------------------------------------------

#since we want the compiler to import from some dll's, let's specify it here
_IMPORTS=$(_VB_WINFORMS_IMPORTS) /R:System.Data.DLL

#--------------------------------------------------
all : $(TARGET)
  rem Sample $(MAKEDIR)

$(TARGET) : $(EXE_SOURCES) $(DLL_TARGET)
        $(_BC) $(_VB_EXE_FLAGS) $(_IMPORTS) /out:$@ $(SOURCE) $(NETSAMPLEPATH)\QuickStart\QSVersion.vb

clean :
  for %i in ( $(CLEANUP) ) do del %i
  if exist obj $(_RMDIR) obj
