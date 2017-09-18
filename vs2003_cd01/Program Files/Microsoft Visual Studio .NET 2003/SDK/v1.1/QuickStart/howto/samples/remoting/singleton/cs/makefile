!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
OBJECT = Object.dll
SERVER = Server.exe
CLIENT =  Client.exe

SRC_CLIENT = Client.cs
SRC_SERVER = Server.cs

CLEANUP = *.exe *.pdb *.dll
#--------------------------------------------------
_IMPORTS=/r:System.Runtime.Remoting.dll
_CIMPORTS=/r:System.Runtime.Remoting.dll /r:Object.dll

#--------------------------------------------------
all : $(CLIENT) $(SERVER)
  rem Sample $(MAKEDIR)

$(SERVER) : $(SRC_SERVER) $(OBJECT)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_EXE_FLAGS) $(_CIMPORTS) /out:$(_OUTDIR)\$@ $(SRC_SERVER) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_WIN32RES) $(_KEYFILE)

$(CLIENT) : $(SRC_CLIENT) $(OBJECT)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_EXE_FLAGS) $(_CIMPORTS) /out:$(_OUTDIR)\$@ $(SRC_CLIENT) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
