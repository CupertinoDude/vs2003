
ComputerInfops.dll: dlldata.obj ComputerInfo_p.obj ComputerInfo_i.obj
	link /dll /out:ComputerInfops.dll /def:ComputerInfops.def /entry:DllMain dlldata.obj ComputerInfo_p.obj ComputerInfo_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del ComputerInfops.dll
	@del ComputerInfops.lib
	@del ComputerInfops.exp
	@del dlldata.obj
	@del ComputerInfo_p.obj
	@del ComputerInfo_i.obj
