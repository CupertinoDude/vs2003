!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak

#--------------------------------------------------
OBJECT = Object.dll
SERVER = Server.exe
CLIENT =  Client.exe

SRC_OBJECT = object.cpp
SRC_CLIENT = Client.cpp
SRC_SERVER = Server.cpp

CLEANUP = *.exe *.pdb *.dll
#--------------------------------------------------

#--------------------------------------------------
all : $(CLIENT) $(SERVER)
  rem Sample $(MAKEDIR)

$(OBJECT) : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi /LD $(SRC_OBJECT)

$(SERVER) : $(SRC_SERVER) $(OBJECT)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi $(SRC_SERVER)

$(CLIENT) : $(SRC_CLIENT) $(OBJECT)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi $(SRC_CLIENT)

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
