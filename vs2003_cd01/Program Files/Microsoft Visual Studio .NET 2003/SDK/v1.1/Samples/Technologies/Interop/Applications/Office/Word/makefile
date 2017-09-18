# Update the location of Microsoft Office for your machine
#MSWORDTLB=%ProgramFiles%\Microsoft Office\Office\msword9.olb   #OFFICE 2000
#MSWORDTLB=%ProgramFiles%\Microsoft Office\Office10\msword.OLB  #OFFICE XP

# Edit this to identify the installed location of msword9.olb / msword.olb
!ifndef MSWORDTLB
!error Set MSWORDTLB environment variable to point to the location of msword9.olb / msword.olb
!endif


!IFDEF DEBUG
_CS_DBG_FLAGS=/debug+
!ENDIF
_CS_EXE_FLAGS=$(_CS_DBG_FLAGS)

all:	Word.dll wordapp.exe

clean:
	-@if exist *.dll erase *.dll
	-@if exist WordApp.exe erase WordApp.exe
	-@if exist buildd.log erase buildd.log
	 

Word.dll :
	tlbimp "$(MSWORDTLB)" /silent /out:Word.dll


WordApp.exe : wordapp.cs Word.dll
	csc.exe $(_CS_EXE_FLAGS) /out:$@ wordapp.cs /r:Word.DLL /r:System.dll;
