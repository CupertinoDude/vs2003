
!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
#Define what we are building from what
TARGET = SimpleBinding.exe
SOURCE = SimpleBinding.cs Customer.cs 

CLEANUP = *.exe *.dll *.pdb CustomersDataSet.cs
#--------------------------------------------------

#since we want the compiler to import from some dll's, let's specify it here
_IMPORTS=$(_CS_WINFORMS_IMPORTS) /R:System.Data.DLL

#--------------------------------------------------
all : $(TARGET)
  rem Sample $(MAKEDIR)

$(TARGET) : $(SOURCE)
        $(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$@ $(SOURCE) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs

clean :
  for %i in ( $(CLEANUP) ) do del %i
  if exist obj $(_RMDIR) obj