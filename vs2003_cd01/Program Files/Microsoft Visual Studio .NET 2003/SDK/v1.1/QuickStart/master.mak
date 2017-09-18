#Master Make file for QuickStart Samples
#-------------------------------------------

#Contains general rules and other setup info

!IFNDEF NETSAMPLEPATH
!ERROR Env Variable NETSAMPLEPATH must be defined: Parent directory of QuickStart Samples
!ENDIF

#NOTE: this file should be in $(NETSAMPLEPATH)\QuickStart!!
#--------------------------------------------------------------------------
#needed so we can say foo.dll: foo.cpp and it will just work
.SUFFIXES: .tlb .il .dll .cpp .js .cs .vb .rc .ocx .reg .resources .txt .resX .wsdl .asmx

#--------------------------------------------------------------------------
#define the names of the compilers we ship
_BC=vbc.exe
_CL=cl.exe
_C1=C1.dll
_CX=c1xx.dll
_C2=c2.dll
_CS=csc.exe
_JS=jsc.exe
_ASSEM=ilasm.exe

# Comment this line out to turn debug mode off
DEBUG=TRUE

#--------------------------------------------------------------------------
#Setup Standard Windows Forms Imports
# One for C# and one for VB
_CS_WINFORMS_IMPORTS=/R:System.DLL /R:System.Windows.Forms.DLL \
    /R:System.Drawing.DLL
_VB_WINFORMS_IMPORTS=/R:System.DLL /R:System.Windows.Forms.DLL \
    /R:System.Drawing.DLL
_JS_WINFORMS_IMPORTS=/R:System.DLL /R:System.Windows.Forms.DLL \
    /R:System.Drawing.DLL

_CS_XML_IMPORTS=/R:System.dll /R:System.Data.dll /R:System.XML.dll
_VB_XML_IMPORTS=/R:System.dll /R:System.Data.dll /R:System.XML.dll
_JS_XML_IMPORTS=/R:System.dll /R:System.Data.dll /R:System.XML.dll

_WINFORM_BIN = $(NETSAMPLEPATH)\QuickStart\WinForms\Bin

#--------------------------------------------------------------------------
#Use the _MAKE_STOP environment variable if you want NMAKE to stop on error
# if not defined (default), NMAKE will IGNORE errors and continue
!IFNDEF _MAKE_STOP
.IGNORE :
!ENDIF
#---------------------------------------------------------------------------

#Allow builds with custom compiler path
!IFDEF CUST_CS
_CS=$(CUST_CS)
!ENDIF

#define the names of some common tools
_TLBIMP=tlbimp.exe
_TLBEXP=tlbexp.exe
_REGASM=regasm.exe
_REGSVR=regsvr32.exe
_RSC=rc.exe
_RESGEN=resgen.exe
_AL=al.exe
_SHAREDNAME=sn.exe

#IFDEF OS

_MAKE_IN_DIR = $(NETSAMPLEPATH)\QuickStart\MakInDir.bat

#ELSE

_MAKE_IN_DIR = call $(NETSAMPLEPATH)\QuickStart\MakInDir.bat

#ENDIF

_GACUTIL=gacutil.exe
_WSDL=wsdl.exe
_XSD=xsd.exe

#define our basic link line for managed code
_LINK=link.exe /entry:main

#define our basic core lib
_LIBS=mscoree.lib

#this is used for compiling C# samples
#reset this in individual sample makefile to your imports if required
_IMPORTS=

#this is used for compiling C# samples, that use Resources
#reset this in individual sample makefile to your resource imports if required
_WIN32RES=

#This is used for compiling C# samples that use Assembly and key files
#reset this in individual sample makefile to your resource imports if required
_KEYFILE=

#this is used for compiling C# samples
#set the default out directory to .
_OUTDIR=.

#Set what to clean by default
!IFNDEF _CLEANFILES
_CLEANFILES=*.obj *.tlb *.reg
!ENDIF

#set some command C++ flags
_CCFLAGS=/clr
_CFLAGS=$(_CCFLAGS) /c

#set debug as the default for c++
_CDFLAGS=$(_CFLAGS) /Zi

#set some command link flags
_LFLAGS=-noentry -assemblydebug
_LDFLAGS=-noentry -assemblydebug -dll

!IFDEF DEBUG

_CS_DLL_FLAGS=/nologo /t:library /debug+ $(TRACE)
_CS_EXE_FLAGS=/nologo /t:exe /debug+  $(TRACE)

_VB_DLL_FLAGS=/nologo /t:library /debug+ $(TRACE)
_VB_EXE_FLAGS=/nologo /t:exe /debug+  $(TRACE)

_JS_DLL_FLAGS=/nologo /t:library /debug+ $(TRACE)
_JS_EXE_FLAGS=/nologo /t:exe /debug+ $(TRACE)
_RESGEN_FLAGS=

!ELSE

_CS_DLL_FLAGS=/nologo /t:library $(TRACE)
_CS_EXE_FLAGS=/nologo $(TRACE)
_VB_DLL_FLAGS=/nologo /t:library $(TRACE)
_VB_EXE_FLAGS=/nologo /t:exe $(TRACE)
_JS_DLL_FLAGS=/nologo $(TRACE)
_JS_EXE_FLAGS=/nologo /exe $(TRACE)
_RESGEN_FLAGS=

!ENDIF

!IFDEF OS

_RMDIR=rd /s /q

!ELSE

_RMDIR=deltree /y

!ENDIF

#default compile and link for c++ files building a dll
#note: name.cpp and name.dll must match
.cpp.dll:
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CDFLAGS) $*.cpp
  $(_LINK) $(_LDFLAGS) $(_LIBS) $*.obj

#default compile and link for c++ files building a exe
#note: name.cpp and name.dll must match
.cpp.exe:
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CL) $(_CDFLAGS) $*.cpp
  $(_LINK) $(_LFLAGS) $(_LIBS) $*.obj

#default compile and link for c++ files building an obj
#note: name.cpp and name.obj must match
.cpp.obj:
  $(_CL) $(_CDFLAGS) $*.cpp

#default compile and link for c++ files building an exe
#note: name.obj and name.exe must match
.obj.exe:
  $(_LINK) $(_LFLAGS) $(_LIBS) $**

#default compile and link for c++ files building a dll
.obj.dll:
  $(_LINK) $(_LDFLAGS) $(_LIBS) $*.obj

#default compiling vb files
.vb.dll:
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_DLL_FLAGS) $(_IMPORTS)  /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.vb $(_WIN32RES) $(_KEYFILE)

.vb.exe:
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_BC) $(_VB_EXE_FLAGS) $(_IMPORTS)  /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.vb $(_WIN32RES) $(_KEYFILE)

#default compiling C# files
.cs.dll:
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_DLL_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_WIN32RES) $(_KEYFILE)


#default compiling C# files
.cs.exe:
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_CS) $(_CS_EXE_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.cs $(_WIN32RES) $(_KEYFILE)


#default compiling C# files
.js.dll:
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_DLL_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.js $(_WIN32RES) $(_KEYFILE)


#default compiling C# files
.js.exe:
  if not exist $(_OUTDIR) md $(_OUTDIR)
  $(_JS) $(_JS_EXE_FLAGS) $(_IMPORTS) /out:$(_OUTDIR)\$@ $** $(NETSAMPLEPATH)\QuickStart\QSVersion.js $(_WIN32RES) $(_KEYFILE)

#default for registering an ocx

.ocx.reg:
  $(_REGSVR) /s $*.ocx

#define for compiling il to an exe
.il.exe:
  $(_ASSEM) $*.il

#define for compiling il to a dll
.il.dll:
  $(_ASSEM) $*.il /DLL

#define for compiling asm to an exe
.asm.exe:
  $(_ASSEM) $*.asm

#define for compiling asm to an exe
.asm.dll:
  $(_ASSEM) $*.asm /DLL

#define for compiling Service Desc Language to C# (names must match (files & classes))
.wsdl.cs:
!IFDEF _NAMESPACE
!IFDEF _SDLPATH
        $(_WSDL) /l:CS /n:$(_NAMESPACE) /out:$*.cs $(_SDLPATH)
!ELSE
        $(_WSDL) /l:CS /n:$(_NAMESPACE) /out:$*.cs $**
!ENDIF
!ELSE
!IFDEF _SDLPATH
        $(_WSDL) /l:CS /n:$* /out:$*.cs $(_SDLPATH)
!ELSE
        $(_WSDL) /l:CS /n:$* /out:$*.cs $**
!ENDIF
!ENDIF

#define for compiling Service Desc Language to JScript (names must match (files & classes))
.wsdl.js:
!IFDEF _NAMESPACE
!IFDEF _SDLPATH
        $(_WSDL) /l:JS /n:$(_NAMESPACE) /out:$*.js $(_SDLPATH)
!ELSE
        $(_WSDL) /l:JS /n:$(_NAMESPACE) /out:$*.js $**
!ENDIF
!ELSE
!IFDEF _SDLPATH
        $(_WSDL) /l:JS /n:$*JS /out:$*.js $(_SDLPATH)
!ELSE
        $(_WSDL) /l:JS /n:$*JS /out:$*.js $**
!ENDIF
!ENDIF

#define for compiling Service Desc Language to VB (names must match (files & classes))
.wsdl.vb:
!IFDEF _NAMESPACE
!IFDEF _SDLPATH
        $(_WSDL) /l:VB /n:$(_NAMESPACE) /out:$*.vb $(_SDLPATH)
!ELSE
        $(_WSDL) /l:VB /n:$(_NAMESPACE) /out:$*.vb $**
!ENDIF
!ELSE
!IFDEF _SDLPATH
        $(_WSDL) /l:VB /n:$*VB /out:$*.vb $(_SDLPATH)
!ELSE
        $(_WSDL) /l:VB /n:$*VB /out:$*.vb $**
!ENDIF
!ENDIF

#define for compiling Service Desc Language from Web Service to JS
.asmx.js:
!IFDEF _NAMESPACE
!IFDEF _SDLPATH
        $(_WSDL) /l:JS /n:$(_NAMESPACE) /out:$*.js $(_SDLPATH)
!ELSE
        $(_WSDL) /l:JS /n:$(_NAMESPACE) /out:$*.js $**
!ENDIF
!ELSE
!IFDEF _SDLPATH
        $(_WSDL) /l:JS /n:$*JS /out:$*.js $(_SDLPATH)
!ELSE
        $(_WSDL) /l:JS /n:$*JS /out:$*.js $**
!ENDIF
!ENDIF

#define for compiling Service Desc Language from Web Service to CSharp
.asmx.cs:
!IFDEF _NAMESPACE
!IFDEF _SDLPATH
        $(_WSDL) /l:CS /n:$(_NAMESPACE) /out:$*.cs $(_SDLPATH)
!ELSE
        $(_WSDL) /l:CS /n:$(_NAMESPACE) /out:$*.cs $**
!ENDIF
!ELSE
!IFDEF _SDLPATH
        $(_WSDL) /l:CS /n:$* /out:$*.cs $(_SDLPATH)
!ELSE
        $(_WSDL) /l:CS /n:$* /out:$*.cs $**
!ENDIF
!ENDIF

#define for compiling Service Desc Language from Web Service to VB
.asmx.vb:
!IFDEF _NAMESPACE
!IFDEF _SDLPATH
        $(_WSDL) /l:VB /n:$(_NAMESPACE) /out:$*.vb $(_SDLPATH)
!ELSE
        $(_WSDL) /l:VB /n:$(_NAMESPACE) /out:$*.vb $**
!ENDIF
!ELSE
!IFDEF _SDLPATH
        $(_WSDL) /l:VB /n:$*VB /out:$*.vb $(_SDLPATH)
!ELSE
        $(_WSDL) /l:VB /n:$*VB /out:$*.vb $**
!ENDIF
!ENDIF

#define for compiling RESX files to resource files using Resgen
.resX.resources:
  $(_RESGEN) $(_RESGEN_FLAGS) $*.resX $*.resources

#define for compiling .TXT files to resource files using Resgen
.txt.resources:
  $(_RESGEN) $(_RESGEN_FLAGS) $*.txt $*.resources