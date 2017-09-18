
ModuleColps.dll: dlldata.obj ModuleCol_p.obj ModuleCol_i.obj
	link /dll /out:ModuleColps.dll /def:ModuleColps.def /entry:DllMain dlldata.obj ModuleCol_p.obj ModuleCol_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del ModuleColps.dll
	@del ModuleColps.lib
	@del ModuleColps.exp
	@del dlldata.obj
	@del ModuleCol_p.obj
	@del ModuleCol_i.obj
