#
#  ASPXToADO makefile
# 

# Edit this to identify the installed location of msado15.dll
!ifndef ADOLOCATION
!ifndef COMMONPROGRAMFILES
!error Set ADOLOCATION environment variable to point to the location of msado15.dll
!else
ADOLOCATION=$(COMMONPROGRAMFILES)\System\ado
!endif
!endif

# Set bin directory.
_BIN=.\bin
_ADODB=$(_BIN)\ADODB.DLL
#

all:	$(_ADODB)

$(_ADODB):
    cscript CreateVRoot.vbs -q	
    if not exist $(_BIN) md $(_BIN)
    tlbimp "$(ADOLOCATION)\msado15.dll" /silent /out:$@
 

clean:
    -@if exist $(_ADODB) erase $(_ADODB) /S /Q
    cscript CreateVRoot.vbs -u -q
