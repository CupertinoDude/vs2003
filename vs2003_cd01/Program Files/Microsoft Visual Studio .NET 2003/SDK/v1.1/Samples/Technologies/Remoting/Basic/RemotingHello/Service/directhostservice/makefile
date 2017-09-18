all: Hello.dll DirectHost.exe 

Hello.dll: 
  cd ..
  csc /debug+ /t:library /out:Hello.dll HelloService.cs
  cd DirectHostService
  copy ..\..\bin\Hello.dll 
  

DirectHost.exe: DirectHost.cs
  csc /debug+ /r:System.Runtime.Remoting.dll DirectHost.cs

run:
  DirectHost -cfg RemotingHello.cfg

