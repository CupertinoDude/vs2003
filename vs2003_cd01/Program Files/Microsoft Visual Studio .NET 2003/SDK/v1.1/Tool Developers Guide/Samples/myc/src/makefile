BIN = ..\bin
TEST = ..\tests
SRC = ..\src
#CSFLAGS = /debug /d:DEBUG 
CSFLAGS = 
#IMPORTS = /r:System.Text.RegularExpressions.dll

.SUFFIXES : .exe .dll .cs .lex .txt .myc

.lex.cs:
	$(LEXBIN) $(SRC)\$**

.cs.dll:
	csc $(CSFLAGS) $(IMPORTS) /t:dll /out:$*.dll $*.cs

.cs.exe:
	csc $(CSFLAGS) $(IMPORTS) /t:exe /out:$*.exe $*.cs

OUTFILES = "$(BIN)" $(BIN)\myc.exe $(BIN)\tflow.exe

all : $(OUTFILES)

SRCLIST = myc.cs io.cs asm.cs iasm.cs var.cs varlist.cs emit.cs tok.cs parse.cs exe.cs

"$(BIN)" :
	if not exist "$(BIN)" mkdir "$(BIN)"

$(BIN)\myc.exe : $(SRCLIST) makefile
	csc $(CSFLAGS) $(IMPORTS) /t:exe /out:$*.exe $(SRCLIST)

$(BIN)\tflow.exe : $(TEST)\tflow.myc
	$(BIN)\myc /outdir:$(BIN) $(TEST)\tflow.myc 
