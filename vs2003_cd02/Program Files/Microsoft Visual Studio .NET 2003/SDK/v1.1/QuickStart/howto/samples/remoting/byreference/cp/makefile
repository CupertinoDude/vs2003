!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

!include $(NETSAMPLEPATH)\QuickStart\master.mak


#--------------------------------------------------
SHARE = Share.dll
SERVER = Server.exe
CLIENT =  Client.exe

SRC_OBJECT = share.cpp
SRC_CLIENT = Client.cpp
SRC_SERVER = Server.cpp

CLEANUP = *.exe *.pdb *.dll
#--------------------------------------------------

#--------------------------------------------------
all : $(CLIENT) $(SERVER)
  rem Sample $(MAKEDIR)

$(SHARE) : $(SOURCES)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi /LD $(SRC_OBJECT)

$(CLIENT) : $(SRC_CLIENT) $(SHARE)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi $(SRC_CLIENT)

$(SERVER) : $(SRC_SERVER) $(SHARE)
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CCFLAGS) /Zi $(SRC_SERVER)

clean :
  for %i in ( $(CLEANUP) ) do del %i
#--------------------------------------------------
