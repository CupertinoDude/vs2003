#
# DxVBLib.mak : Makefile to generate DirectX metadata wrapper.
#


DxVBLib.DLL:
	tlbimp dx7vb.dll /silent /out:$*.DLL

