!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#Define Imported Libraries
OUTDIR1=$(NETSAMPLEPATH)\QuickStart\howto\bin
OUTDIR2=$(NETSAMPLEPATH)\QuickStart\howto\samples\adoplus\typeddata\CS
OUTDIR3=$(NETSAMPLEPATH)\QuickStart\howto\samples\adoplus\typeddata\VB
OUTDIR4=$(NETSAMPLEPATH)\QuickStart\howto\samples\adoplus\typeddata\CP

TARGETS = $(OUTDIR1)\TypedData.dll \
          $(OUTDIR2)\TypedData.dll \
          $(OUTDIR3)\TypedData.dll \
          $(OUTDIR4)\TypedData.dll

CLEANUP = CustDS.cs \
          $(OUTDIR1)\TypedData.dll \
          $(OUTDIR1)\TypedData.pdb \
          $(OUTDIR2)\TypedData.dll \
          $(OUTDIR2)\TypedData.pdb \
          $(OUTDIR3)\TypedData.dll \
          $(OUTDIR3)\TypedData.pdb \
          $(OUTDIR4)\TypedData.dll \
          $(OUTDIR4)\TypedData.pdb

_IMPORTS=/r:System.data.dll /r:System.Data.dll /r:System.dll /r:System.Xml.dll


all: $(TARGETS)
  rem Sample $(MAKEDIR)

CustDS.cs : custds.xsd
  xsd.exe /namespace:customerDataSet /d /l:C# $**

$(OUTDIR1)\TypedData.dll : CustDS.cs
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $**

$(OUTDIR2)\TypedData.dll : CustDS.cs
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $**

$(OUTDIR3)\TypedData.dll : CustDS.cs
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $**

$(OUTDIR4)\TypedData.dll : CustDS.cs
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$@ $**

clean :
  for %i in ( $(CLEANUP) ) do if exist %i del %i
