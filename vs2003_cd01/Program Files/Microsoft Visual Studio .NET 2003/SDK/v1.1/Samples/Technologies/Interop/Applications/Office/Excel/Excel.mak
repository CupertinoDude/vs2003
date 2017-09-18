#
#  Import the Excel typelibary to metadata.
#

!ifndef EXCELTLB
!error ExcelTlb environment variable undefined.  Please refer to readme.htm instructions.
!endif

$(_XLDIR)\Excel.DLL:
	tlbimp /silent "$(EXCELTLB)" /keyfile:$*.Key /out:$*.DLL
	gacutil -i $*.DLL

RemoveDLL:
	-gacutil -u $(_XLDIR)\Excel.DLL
	-@erase $(_XLDIR)\*.DLL
