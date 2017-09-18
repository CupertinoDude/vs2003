
LoanLibps.dll: dlldata.obj LoanLib_p.obj LoanLib_i.obj
	link /dll /out:LoanLibps.dll /def:LoanLibps.def /entry:DllMain dlldata.obj LoanLib_p.obj LoanLib_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del LoanLibps.dll
	@del LoanLibps.lib
	@del LoanLibps.exp
	@del dlldata.obj
	@del LoanLib_p.obj
	@del LoanLib_i.obj
