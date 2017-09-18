all: Hello.dll HelloNew.exe HelloNew2.exe HelloNew3.exe HelloGetObject.exe HelloGetObject2.exe HelloAsync.exe HelloAsync2.exe 

Hello.dll: 
  copy ..\..\bin\Hello.dll 

HelloNew.exe: Hello.dll HelloNew.cs
  csc /debug+ /r:Hello.dll /out:HelloNew.exe HelloNew.cs

HelloNew2.exe: Hello.dll HelloNew2.cs
  csc /debug+ /r:Hello.dll /out:HelloNew2.exe HelloNew2.cs

HelloNew3.exe: Hello.dll HelloNew3.cs
  csc /debug+ /r:System.Runtime.Remoting.dll /r:Hello.dll /out:HelloNew3.exe HelloNew3.cs

HelloGetObject.exe: Hello.dll HelloGetObject.cs
  csc /debug+ /r:System.Runtime.Remoting.dll /r:Hello.dll /out:HelloGetObject.exe HelloGetObject.cs

HelloGetObject2.exe: Hello.dll HelloGetObject2.cs
  csc /debug+ /r:System.Runtime.Remoting.dll /r:Hello.dll /out:HelloGetObject2.exe HelloGetObject2.cs
  
HelloAsync.exe: Hello.dll HelloAsync.cs
  csc /debug+ /r:Hello.dll /out:HelloAsync.exe HelloAsync.cs

HelloAsync2.exe: Hello.dll HelloAsync2.cs
  csc /debug+ /r:Hello.dll /out:HelloAsync2.exe HelloAsync2.cs

run:
  HelloNew.exe
  HelloNew2.exe
  HelloNew3.exe
  HelloGetObject.exe
  HelloGetObject2.exe
  HelloAsync.exe
  HelloAsync2.exe


