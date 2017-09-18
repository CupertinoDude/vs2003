all: Hello.dll HelloNew.exe

Hello.dll: 
  copy ..\..\bin\Hello.dll 

HelloNew.exe: Hello.dll HelloNew.cs
  csc /debug+ /r:Hello.dll /out:HelloNew.exe HelloNew.cs

run:
  HelloNew.exe

