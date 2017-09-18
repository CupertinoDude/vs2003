.SUFFIXES: .cs 

#define the names of the compilers we ship
_CS=csc.exe

#set some common c# flags, default is debug
_CS_DLL_FLAGS=/t:library /debug+
_CS_EXE_FLAGS=/debug+

#note: name.cs and name.exe must match
.cs.exe:
	$(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$@ $** $(_WIN32RES) $(_KEYFILE)	

default:	
	nmake all
clean : 
	@-del /Q *.obj *.tlb *.reg

clobber :	clean
        @-del /Q *.exe *.dll


all: Clisp.exe

Clisp.exe: clisp.cs CodeGen.cs Exp.cs Lexer.cs LispRuntime.cs Parser.cs Token.cs TypeCheck.cs
