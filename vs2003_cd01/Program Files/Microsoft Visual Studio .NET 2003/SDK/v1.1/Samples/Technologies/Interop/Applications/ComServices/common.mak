_OUTDIR=output
_COMMON=common 
_REGSVCS=RegSvcs
_KEY=$(_COMMON)\testkey.snk

.vb.dll:
	vbc /t:library $(_IMPORTS) /out:$(_OUTDIR)\$@

.cs.dll:
	csc /t:library $(_IMPORTS) /out:$(_OUTDIR)\$@

.cpp.dll:
	cl -c -CLR -GX -I$(_OUTDIR) $*.cpp
	link /nod:libcpmt.lib $(_IMPORTS) /out:$(_OUTDIR)\$@ $*.obj

