!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SHARE = Share.dll
SERVER = Server.exe
CLIENT =  Client.exe

SRC_CLIENT = Client.cs
SRC_SERVER = Server.cs

CLEANUP = *.exe *.pdb *.dll
#--------------------------------------------------
_IMPORTS=/r:System.Runtime.Remoting.dll
_SIMPORTS=/r:System.Runtime.Remoting.dll /r:Share.dll
_CIMPORTS=/r:System.Runtime.Remoting.dll /r:Server.exe /r:Share.dll

#--------------------------------------------------
all : $(CLIENT)
  rem Sample $(MAKEDIR)

$(CLIENT) : $(SRC_CLIENT) $(SERVER) $(SHARE)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_EXE_FLAGS) $(_CIMPORTS) /out:$(_OUTDIR)\$@ $(SRC_CLIENT) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_WIN32RES) $(_KEYFILE)

$(SERVER) : $(SRC_SERVER) $(SHARE)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_EXE_FLAGS) $(_SIMPORTS) /out:$(_OUTDIR)\$@ $(SRC_SERVER) $(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_WIN32RES) $(_KEYFILE)

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
